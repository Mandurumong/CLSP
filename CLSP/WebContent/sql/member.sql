CREATE TABLE Member(
	user_id VARCHAR2(20) PRIMARY KEY,
	user_pw VARCHAR2(20) NOT NULL,
	user_email VARCHAR2(50) DEFAULT NULL,
	reg_date VARCHAR2(50) NOT NULL,
    user_level INT NOT NULL DEFAULT 0
);