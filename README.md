<h1 align=center> Bitcoin Cash Challenge - Astrafy</h1>

Bitcoin Cash is a cryptocurrency that allows more bytes to be included in each block relative to its common ancestor Bitcoin. 
There is a public dataset on BigQuery that contains the blockchain data in their entirety (dataset ID: <a href="https://console.cloud.google.com/marketplace/product/bitcoin-cash/crypto-bitcoin-cash">bigquery-public-data.crypto_bitcoin_cash</a>) with data pre-processed to be human-friendly and to support common use cases such as auditing, investigating, and researching the economic and financial properties of the system.


https://console.cloud.google.com/bigquery?project=bitcoin-cash-challenge

<h2>Project Overview</h2>

In this project, we will create  staging table from the raw table "transactions" that only selects the last three months of data from this raw table. 
Then we will, materialize a datamart table that gives the current balance for all addresses and exclude addresses that had at least one transaction on Coinbase.
Finally we will display a graph of daily transactions. 
We will use dbt cloud to materialize the two tables aforementioned and a Google colab notebook using Python to plot the chart of daily transactions from last 3 months. 


<h2>Prerequisites</h2>

- A Google Cloud account with access to BigQuery and Cloud Storage.
- A dbt Cloud account.


<h2>Getting Started</h2>

To get started with this project, follow these steps:

1. Create a new Google Cloud project.
2. Configure your Google Cloud and dbt Cloud
3. Use dbt Cloud to materialize the staging and datamart tables.
4. Create a notebook to plot the transactions of last 3 months.

To Run staging table model on DBT Cloud
```
dbt run --models STG_bitcoin_cash_transactions_3M
```

To Run datamart model
```
dbt run --models DTM_bitcoin_cash_transactions_3M
```

<h2>References</h2>

<ul>
  <li><a href="https://console.cloud.google.com/marketplace/product/bitcoin-cash/crypto-bitcoin-cash">BigQuery 
      Public Data: Bitcoin Cash Blockchain</a></li>
  <li><a href="https://cloud.google.com/">Google Cloud</a></li>
  <li><a href="https://docs.getdbt.com/">DBT Documentation</a></li>
  <li><a href="https://colab.research.google.com/notebooks/intro.ipynb">Google Colab</a></li>
</ul>