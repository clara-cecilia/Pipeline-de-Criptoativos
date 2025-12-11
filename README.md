# 💰 Crypto Dashboard: Monitoramento do Mercado de Criptomoedas

### ✨ Visão Geral

Este projeto consiste no desenvolvimento de um **Dashboard interativo no Power BI** destinado ao monitoramento em tempo real do mercado de criptomoedas.

O objetivo principal é fornecer uma visão clara e atualizada de indicadores-chave, como:
*   Preço atual
*   Variação percentual
*   Histórico de desempenho das principais criptomoedas

---

### 👥 Autores

*   **Bruno Salles**
*   **Clara Cecília**

---

### ⚙️ Arquitetura da Solução (ETL)

A solução foi desenvolvida com uma arquitetura robusta e escalável, utilizando três componentes principais para a coleta, armazenamento e visualização dos dados:

| Componente | Função |
| :--- | :--- |
| **Python** | Responsável por coletar os dados brutos da fonte via API. |
| **MySQL** | Serve como o banco de dados centralizado para armazenar os dados de forma estruturada. |
| **Power BI** | Utilizado para se conectar ao banco de dados e criar visualizações interativas e dinâmicas. |

#### 🔁 Fluxo de Dados

O pipeline de dados do projeto segue a seguinte lógica:

**`CoinGecko API` → `Script Python (ETL)` → `Banco de Dados MySQL` → `Dashboard Power BI`**

---

### 🛠️ Tecnologias Utilizadas

| Tecnologia | Finalidade |
| :--- | :--- |
| **Python** | Linguagem de programação utilizada para a extração, transformação e carga (ETL) dos dados. |
| **MySQL** | Sistema de gerenciamento de banco de dados relacional (SGBD) para armazenamento persistente. |
| **Power BI** | Ferramenta de Business Intelligence para criação de relatórios e dashboards visuais. |
| **CoinGecko API** | Fonte de dados que fornece informações de mercado de criptomoedas em tempo real. |
