## 💰 Crypto Dashboard: Monitoramento do Mercado de Criptomoedas

### ✨ Visão Geral do Projeto

[cite_start]Este projeto consiste no desenvolvimento de um **Dashboard interativo no Power BI** [cite: 6] [cite_start]destinado ao monitoramento em tempo real do mercado de criptomoedas[cite: 6, 7].

[cite_start]O objetivo principal é fornecer uma visão clara e atualizada de indicadores-chave[cite: 7], como:
* [cite_start]Preço atual [cite: 7]
* [cite_start]Variação [cite: 7]
* [cite_start]Histórico de desempenho das principais criptomoedas do mercado [cite: 7]

---

### 👤 Autores

* [cite_start]**Bruno Salles** [cite: 2]
* [cite_start]**Clara Cecilía** [cite: 2]

---

### ⚙️ Arquitetura da Solução (ETL)

[cite_start]A solução foi desenvolvida com uma arquitetura robusta e escalável [cite: 9][cite_start], utilizando três componentes principais para a coleta, armazenamento e visualização dos dados[cite: 9]:

| Componente | Função |
| :--- | :--- |
| **Python** | [cite_start]Responsável por coletar os dados brutos da fonte[cite: 10]. |
| **MySQL** | [cite_start]Serve como o banco de dados centralizado para armazenar os dados de forma estruturada[cite: 11]. |
| **Power BI** | [cite_start]Utilizado para se conectar ao banco de dados e criar visualizações interativas e dinâmicas[cite: 12]. |

#### Fluxo de Dados

[cite_start]O fluxo de dados do projeto segue a seguinte lógica[cite: 13]:

[cite_start]$$\text{CoinGecko API} \rightarrow \text{Script Python} \rightarrow \text{Banco de Dados MySQL} \rightarrow \text{Power BI Desktop}$$ [cite: 14]

---

### 🛠️ Tecnologias Utilizadas

| Tecnologia | Finalidade |
| :--- | :--- |
| **Python** | [cite_start]Linguagem utilizada para a extração, transformação e carga (ETL) dos dados[cite: 26]. |
| **MySQL** | [cite_start]Sistema de gerenciamento de banco de dados relacional (SGBD) para armazenamento persistente dos dados[cite: 27]. |
| **Power BI** | [cite_start]Ferramenta de Business Intelligence para visualização de dados, relatórios e dashboards[cite: 28]. |
| **CoinGecko API** | [cite_start]Interface de programação de aplicações que fornece dados de mercado de criptomoedas em tempo real[cite: 29]. |

---
