{{ config(materialized='table', table_name='DTM_bitcoin_cASh_transactions_3M') }}
-- THIS REQUEST CREATES THE STAGING TABLE
SELECT
	ARRAY_TO_STRING(inputs_addresses, ",") AS inputs_addresses,
	ARRAY_TO_STRING(outputs_addresses, ",") AS outputs_addresses,
	SUM(input_value) AS input_balance,
	SUM(output_value) AS output_balance,
	DATE(block_timestamp) AS block_date
FROM `bitcoin-cASh-challenge.dbt_cmariebrisson.STG_bitcoin_cASh_transactions_3M`
WHERE is_coinbASe = FALSE
GROUP by 
	inputs_addresses,
	outputs_addresses,
	block_date
ORDER by 
	input_balance desc,
	output_balance desc,
	block_date desc