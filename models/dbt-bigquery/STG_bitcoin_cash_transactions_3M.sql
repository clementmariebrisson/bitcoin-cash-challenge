{{ config(materialized='table', 
          table_name='STG_bitcoin_cash_transactions_3M') }}

-- THIS REQUEST CREATES THE STAGING TABLE

SELECT
	`hash`,
	size,
	virtual_size,
	version,
	lock_time,
	block_hash,
	block_number,
	block_timestamp,
	block_timestamp_month,
	input_count,
	output_count,
	input_value,
	output_value,
	is_coinbase,
	fee,
	unnested_inputs.`index` as inputs_index,
	unnested_inputs.spent_transaction_hash as inputs_spent_transaction_hash,
	unnested_inputs.spent_output_index as inputs_spent_output_index,
	unnested_inputs.script_asm as inputs_script_asm,
	unnested_inputs.script_hex as inputs_script_hex,
	unnested_inputs.sequence as inputs_sequence,
	unnested_inputs.required_signatures as inputs_required_signatures,
	unnested_inputs.type as inputs_type,
	unnested_inputs.addresses as inputs_addresses,
	unnested_inputs.value as inputs_value,
	unnested_outputs.`index` as outputs_index,
	unnested_outputs.script_asm as outputs_script_asm,
	unnested_outputs.script_hex as outputs_script_hex,
	unnested_outputs.required_signatures as outputs_required_signatures,
	unnested_outputs.type as outputs_type,
	unnested_outputs.addresses as outputs_addresses,
	unnested_outputs.value as outputs_value
FROM `bigquery-public-data.crypto_bitcoin_cash.transactions` as bitcoin_cash
LEFT JOIN unnest(bitcoin_cash.inputs) as unnested_inputs
LEFT JOIN unnest(bitcoin_cash.outputs) as unnested_outputs
WHERE DATE(bitcoin_cash.block_timestamp) > DATE_SUB( DATE( CURRENT_TIMESTAMP() ), INTERVAL 3 MONTH)


