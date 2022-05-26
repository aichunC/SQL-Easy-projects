CREATE DATABASE BMS_DB1;
SHOW DATABASES;
USE BMS_DB1;

-- in this sql project, we will build a database for a bank data
-- management system, it includes four tables, and inserted values in bank and customer info. 

-- cusomter_personal_info 

CREATE TABLE customer_personal_info (
    customer_id VARCHAR(5),
    customer_name VARCHAR(30),
    date_of_birth DATE,
    guardian_name VARCHAR(30),
    address VARCHAR(50),
    contact_no BIGINT(10),
    mail_id VARCHAR(30),
    gender CHAR(1),
    marital_status VARCHAR(10),
    identification_doc_type VARCHAR(20),
    id_doc_no VARCHAR(20),
    citizenship VARCHAR(10),
    CONSTRAINT cust_pers_info_pk PRIMARY KEY (customer_id)
);

-- customer_reference_info

CREATE TABLE customer_reference_info (
    customer_id VARCHAR(5),
    reference_acc_name VARCHAR(20),
    reference_acc_no BIGINT(16),
    reference_acc_address VARCHAR(50),
    relation VARCHAR(25),
    CONSTRAINT cust_ref_info_pk PRIMARY KEY (customer_id),
    CONSTRAINT cust_ref_info_fk FOREIGN KEY (customer_id)
        REFERENCES customer_personal_info (customer_id)
);

-- bank info 

CREATE TABLE bank_info (
    ifsc_code VARCHAR(15),
    bank_name VARCHAR(25),
    branch_name VARCHAR(25),
    CONSTRAINT bank_info_pk PRIMARY KEY (ifsc_code)
);

SHOW TABLES;

-- account info 

CREATE TABLE account_info (
    account_no BIGINT(16),
    customer_id VARCHAR(5),
    account_type VARCHAR(10),
    registration_date DATE,
    activation_date DATE,
    ifsc_code VARCHAR(10),
    interest DECIMAL(7 , 2 ),
    initial_deposit BIGINT(10),
    CONSTRAINT acc_info_pk PRIMARY KEY (account_no),
    CONSTRAINT acc_info_pers_fk FOREIGN KEY (customer_id)
        REFERENCES customer_personal_info (customer_id),
    CONSTRAINT acc_info_bank_fk FOREIGN KEY (ifsc_code)
        REFERENCES bank_info (ifsc_code)
);

-- insert values into bank info 

INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES("hdvl0012","hdfc","abcvldjsa");
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES("sbitn0123","sbi","adbdiked");
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES("idei0123","abcd","adkjoiekddd");
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES("dieke9999","dkde","adoijoieoid");
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES("diejoe9900","djkl","jdkljoijiojeofj");

SELECT 
    *
FROM
    bank_info;

INSERT INTO customer_personal_info (
    customer_id ,
    customer_name ,
    date_of_birth ,
    guardian_name ,
    address,
    contact_no,
    mail_id ,
    gender ,
    marital_status ,
    identification_doc_type ,
    id_doc_no ,
    citizenship
    ) VALUES (
 "1234",
 "Sky Chen",
 "1988-01-02",
 "Weng",
 "San Mateo",
 "6507413686",
 "94402",
 "F",
 "single",
 "driver license",
 "E00293",
 "USA"
);


SELECT 
    *
FROM
    customer_personal_info;

show tables;


