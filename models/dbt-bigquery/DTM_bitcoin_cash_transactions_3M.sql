{{ config(materialized='table', table_name='DTM_bitcoin_cash_transactions_3M') }}

-- THIS REQUEST CREATES THE STAGING TABLE


SELECT
	ARRAY_TO_STRING(inputs_addresses, ",") as inputs_addresses,
	ARRAY_TO_STRING(outputs_addresses, ",") as outputs_addresses,
	SUM(input_value) as input_balance,
	SUM(output_value) as output_balance,
	DATE(block_timestamp) as block_date
FROM `bitcoin-cash-challenge.dbt_cmariebrisson.STG_bitcoin_cash_transactions_3M`
WHERE is_coinbase = FALSE
GROUP by 
	inputs_addresses,
	outputs_addresses,
	block_date
ORDER by 
	input_balance desc,
	output_balance desc,
	block_date desc	
	