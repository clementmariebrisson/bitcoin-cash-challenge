{{ config(materialized='table', table_name='STG_bitcoin_cASh_transactions_3M') }}
-- THIS REQUEST CREATES THE STAGING TABLE
SELECT
	`hASh`,
	size,
	virtual_size,
	version,
	lock_time,
	block_hASh,
	block_number,
	block_timestamp,
	block_timestamp_month,
	input_count,
	output_count,
	input_value,
	output_value,
	is_coinbASe,
	fee,
	unnested_inputs.`index` AS inputs_index,
	unnested_inputs.spent_transaction_hASh AS inputs_spent_transaction_hASh,
	unnested_inputs.spent_output_index AS inputs_spent_output_index,
	unnested_inputs.script_ASm AS inputs_script_ASm,
	unnested_inputs.script_hex AS inputs_script_hex,
	unnested_inputs.sequence AS inputs_sequence,
	unnested_inputs.required_signatures AS inputs_required_signatures,
	unnested_inputs.type AS inputs_type,
	unnested_inputs.addresses AS inputs_addresses,
	unnested_inputs.value AS inputs_value,
	unnested_outputs.`index` AS outputs_index,
	unnested_outputs.script_ASm AS outputs_script_ASm,
	unnested_outputs.script_hex AS outputs_script_hex,
	unnested_outputs.required_signatures AS outputs_required_signatures,
	unnested_outputs.type AS outputs_type,
	unnested_outputs.addresses AS outputs_addresses,
	unnested_outputs.value AS outputs_value
FROM `bigquery-public-data.crypto_bitcoin_cASh.transactions` AS bitcoin_cASh
LEFT JOIN UNNEST(bitcoin_cASh.inputs) AS unnested_inputs
LEFT JOIN UNNEST(bitcoin_cASh.outputs) AS unnested_outputs
WHERE DATE(bitcoin_cASh.block_timestamp) > DATE_SUB( DATE( CURRENT_TIMESTAMP() ), INTERVAL 3 MONTH)