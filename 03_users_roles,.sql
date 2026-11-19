ALTER SESSION SET CONTAINER = AL_PDB_20251SEN101;

-- Roles
CREATE ROLE sacco_admin_role;
CREATE ROLE sacco_officer_role;
CREATE ROLE sacco_member_role;

-- Users
CREATE USER ALLEN_APP IDENTIFIED BY Allen2025
DEFAULT TABLESPACE sacco_data
TEMPORARY TABLESPACE sacco_temp;

CREATE USER sacco_officer IDENTIFIED BY Officer2025
DEFAULT TABLESPACE sacco_data
TEMPORARY TABLESPACE sacco_temp;

CREATE USER sacco_member IDENTIFIED BY Member2025
DEFAULT TABLESPACE sacco_data
TEMPORARY TABLESPACE sacco_temp;

-- Grants
GRANT CONNECT, RESOURCE TO ALLEN_APP;
GRANT sacco_admin_role TO ALLEN_APP;
GRANT sacco_officer_role TO sacco_officer;
GRANT sacco_member_role TO sacco_member;

GRANT CREATE SESSION TO sacco_officer, sacco_member;