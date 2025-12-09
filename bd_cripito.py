import requests
import mysql.connector
from mysql.connector import Error
import time

# Configurações do Banco de Dados
DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = "2904"  # Verifique se esta é a sua senha correta do MySQL
DB_NAME = "criptomoedas_bi"

# Lista de criptomoedas para monitorar
MOEDAS_IDS = ['bitcoin', 'ethereum', 'dash', 'binancecoin', 'solana', 'dogecoin']

def criar_banco_de_dados(conexao):
    """Cria o banco de dados se ele não existir."""
    try:
        cursor = conexao.cursor()
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DB_NAME} DEFAULT CHARACTER SET 'utf8mb4'")
        print(f"Banco de dados '{DB_NAME}' verificado/criado.")
    except Error as e:
        print(f"Erro ao criar o banco de dados: {e}")

def criar_tabelas(conexao):
    """Cria as tabelas se elas não existirem."""
    cursor = conexao.cursor()
    try:
        # Tabela para cotações atuais - VERSÃO CORRIGIDA
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS cotacoes_atuais (
            id INT AUTO_INCREMENT PRIMARY KEY,
            nome_ativo VARCHAR(50) UNIQUE,
            preco_usd DECIMAL(20, 8),
            market_cap_usd DECIMAL(30, 8),
            volume_24h_usd DECIMAL(30, 8),
            data_hora DATETIME
        )""")
        print("Tabela 'cotacoes_atuais' verificada/criada.")

        # Tabela para histórico de preços - VERSÃO CORRIGIDA
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS cotacoes_historico (
            id INT AUTO_INCREMENT PRIMARY KEY,
            nome_ativo VARCHAR(50),
            data DATE,
            preco_usd DECIMAL(20, 8),
            UNIQUE(nome_ativo, data)
        )""")
        print("Tabela 'cotacoes_historico' verificada/criada.")
    except Error as e:
        print(f"Erro ao criar tabelas: {e}")
    finally:
        cursor.close()

def buscar_dados_atuais():
    """Busca os dados atuais na API da CoinGecko."""
    # (Esta função já está correta, não precisa de alterações)
    url = "https://api.coingecko.com/api/v3/simple/price"
    params = {
        'ids': ",".join(MOEDAS_IDS),
        'vs_currencies': 'usd',
        'include_market_cap': 'true',
        'include_24hr_vol': 'true',
        'include_last_updated_at': 'true'
    }
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erro ao buscar dados da API: {e}")
        return None

def inserir_dados_atuais(conexao, dados):
    """Insere ou atualiza os dados na tabela de cotações atuais."""
    # (Esta função já está correta, não precisa de alterações)
    cursor = conexao.cursor()
    try:
        for moeda, info in dados.items():
            query = """
            INSERT INTO cotacoes_atuais (nome_ativo, preco_usd, market_cap_usd, volume_24h_usd, data_hora)
            VALUES (%s, %s, %s, %s, NOW())
            ON DUPLICATE KEY UPDATE
            preco_usd = VALUES(preco_usd),
            market_cap_usd = VALUES(market_cap_usd),
            volume_24h_usd = VALUES(volume_24h_usd),
            data_hora = NOW()
            """
            valores = (moeda, info['usd'], info['usd_market_cap'], info['usd_24h_vol'])
            cursor.execute(query, valores)
        conexao.commit()
        print("Dados atuais atualizados com sucesso!")
    except Error as e:
        print(f"Erro ao inserir/atualizar dados atuais: {e}")
    finally:
        cursor.close()

def buscar_dados_historicos(moeda_id):
    """Busca o histórico de preços de uma moeda para os últimos 30 dias."""
    # (Esta função já está correta, não precisa de alterações)
    url = f"https://api.coingecko.com/api/v3/coins/{moeda_id}/market_chart"
    params = {'vs_currency': 'usd', 'days': '30'}
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        return response.json()['prices']
    except requests.exceptions.RequestException as e:
        print(f"Erro ao buscar dados históricos da API para {moeda_id}: {e}")
        return None

def inserir_dados_historicos(conexao, moeda_id, historico):
    """Insere os dados históricos no banco."""
    cursor = conexao.cursor()
    # VERSÃO CORRIGIDA: trocando 'data_registro' por 'data'
    query = """
    INSERT INTO cotacoes_historico (nome_ativo, data, preco_usd)
    VALUES (%s, FROM_UNIXTIME(%s/1000, '%Y-%m-%d'), %s)
    ON DUPLICATE KEY UPDATE preco_usd = VALUES(preco_usd)
    """
    try:
        dados_para_inserir = [(moeda_id, item[0], item[1]) for item in historico]
        cursor.executemany(query, dados_para_inserir)
        conexao.commit()
        print(f"Histórico de preços de {moeda_id.capitalize()} inserido com sucesso!")
    except Error as e:
        print(f"Erro ao inserir dados históricos para {moeda_id}: {e}")
    finally:
        cursor.close()

def main():
    """Função principal que orquestra a execução."""
    # (Esta função já está correta, não precisa de alterações)
    conexao_inicial = None
    conexao_db = None
    try:
        conexao_inicial = mysql.connector.connect(host=DB_HOST, user=DB_USER, password=DB_PASSWORD)
        criar_banco_de_dados(conexao_inicial)
        conexao_inicial.close()

        conexao_db = mysql.connector.connect(host=DB_HOST, user=DB_USER, password=DB_PASSWORD, database=DB_NAME)
        criar_tabelas(conexao_db)

        dados_atuais = buscar_dados_atuais()
        if dados_atuais:
            inserir_dados_atuais(conexao_db, dados_atuais)

            print("\n--- Coletando dados históricos (30 dias) ---")
            for moeda_id in MOEDAS_IDS:
                dados_historicos = buscar_dados_historicos(moeda_id)
                if dados_historicos:
                    inserir_dados_historicos(conexao_db, moeda_id, dados_historicos)
                else:
                    print(f"Não foi possível coletar dados históricos de {moeda_id}.")
                time.sleep(5)

    except Error as e:
        print(f"Ocorreu um erro na execução principal: {e}")
    finally:
        if 'conexao_inicial' in locals() and conexao_inicial and conexao_inicial.is_connected():
            conexao_inicial.close()
        if 'conexao_db' in locals() and conexao_db and conexao_db.is_connected():
            conexao_db.close()
        print("\nProcesso de coleta e inserção de dados finalizado.")

if __name__ == "__main__":
    main()