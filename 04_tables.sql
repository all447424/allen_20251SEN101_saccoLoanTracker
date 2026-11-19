ALTER SESSION SET CONTAINER = AL_PDB_20251SEN101;

CREATE TABLE MEMBER (
  member_id NUMBER PRIMARY KEY,
  full_name VARCHAR2(100) NOT NULL,
  national_id VARCHAR2(20) UNIQUE NOT NULL,
  phone VARCHAR2(20),
  join_date DATE DEFAULT SYSDATE
) TABLESPACE sacco_data;

CREATE TABLE LOAN (
  loan_id NUMBER PRIMARY KEY,
  member_id NUMBER REFERENCES MEMBER(member_id),
  amount NUMBER(12,2) NOT NULL,
  interest_rate NUMBER(5,2),
  status VARCHAR2(20) DEFAULT 'PENDING',
  loan_date DATE DEFAULT SYSDATE
) TABLESPACE sacco_data;

CREATE TABLE REPAYMENT (
  repayment_id NUMBER PRIMARY KEY,
  loan_id NUMBER REFERENCES LOAN(loan_id),
  amount_paid NUMBER(12,2) NOT NULL,
  payment_date DATE DEFAULT SYSDATE
) TABLESPACE sacco_data;

CREATE INDEX idx_loan_member ON LOAN(member_id) TABLESPACE sacco_idx;
CREATE INDEX idx_repay_loan ON REPAYMENT(loan_id) TABLESPACE sacco_idx;