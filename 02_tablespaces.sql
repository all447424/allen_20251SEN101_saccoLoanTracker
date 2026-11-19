-- Connect to PDB
ALTER SESSION SET CONTAINER = AL_PDB_20251SEN101;

-- Data Tablespace
CREATE TABLESPACE sacco_data
DATAFILE 'sacco_data.dbf' SIZE 100M AUTOEXTEND ON;

-- Index Tablespace
CREATE TABLESPACE sacco_idx
DATAFILE 'sacco_idx.dbf' SIZE 50M AUTOEXTEND ON;

-- Temp Tablespace
CREATE TEMPORARY TABLESPACE sacco_temp
TEMPFILE 'sacco_temp.dbf' SIZE 50M AUTOEXTEND ON;