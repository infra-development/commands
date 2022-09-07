-- Connecting from terminal
trino --catalog hive --schema default

CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_monthly', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['202205', '1']);
CALL system.sync_partition_metadata(schema_name=>'siq1', table_name=>'siq_monthly', mode=>'FULL')

CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220512', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220513', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220514', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220515', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220516', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220517', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220518', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220519', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220520', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220521', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220522', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220523', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220524', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220525', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220526', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220527', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220528', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220529', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220530', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220531', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220601', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220602', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220603', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220604', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220605', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220606', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220607', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220608', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220609', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220610', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220611', '0']);
CALL system.create_empty_partition( schema_name => 'siq1', table_name => 'siq_daily', partition_columns => ARRAY['timecol', 'subscriber_hash'], partition_values => ARRAY['20220612', '0']);


CALL system.sync_partition_metadata(schema_name=>'siq1', table_name=>'siq_daily', mode=>'FULL');

CALL system.sync_partition_metadata(schema_name=>'siq2', table_name=>'siq_hourly', mode=>'FULL');
