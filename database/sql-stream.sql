CREATE or REPLACE FOREIGN TABLE "bdr_db"."read_ts_file" (
  "timestamp" VARCHAR(128)
)
SERVER "FILE_SERVER"
OPTIONS (
 "PARSER" 'NONE',
 "CHARACTER_ENCODING" 'UTF-8',
 "ROW_SEPARATOR" u&'\000A',
 "SEPARATOR" ',',
 "SKIP_HEADER" 'false',
 "DIRECTORY" '/home/sqlstream/ts',
 "FILENAME_PATTERN" 'bdr-conv-ts'
);

select * from "bdr_db"."read_ts_file";