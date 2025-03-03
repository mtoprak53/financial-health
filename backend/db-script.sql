\echo 'Delete and recreate finhealth db?' 
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE finhealth;
CREATE DATABASE finhealth;
\connect finhealth
\i db-schema.sql
\i db-seed.sql

\echo 'Delete and recreate finhealth_test db?' 
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE finhealth_test;
CREATE DATABASE finhealth_test;
\connect finhealth_test
\i db-schema.sql
\i db-seed.sql