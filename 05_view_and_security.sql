ALTER SESSION SET CONTAINER = AL_PDB_20251SEN101;

-- View for officer
CREATE OR REPLACE VIEW v_member_loans AS
SELECT m.full_name, l.loan_id, l.amount, l.status
FROM MEMBER m JOIN LOAN l ON m.member_id = l.member_id;

-- Security: member can only see view, not tables
GRANT SELECT ON v_member_loans TO sacco_member;
GRANT SELECT, INSERT, UPDATE ON MEMBER TO sacco_officer;
GRANT SELECT, INSERT, UPDATE ON LOAN TO sacco_officer;

-- Audit
AUDIT SELECT ON MEMBER BY ACCESS;