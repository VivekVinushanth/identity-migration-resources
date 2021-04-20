CREATE TABLE IF NOT EXISTS IDN_AUTH_SESSION_RECORDS_STORE (
            SESSION_ID VARCHAR (100) NOT NULL,
            SESSION_TYPE VARCHAR(100) NOT NULL,
            SESSION_OBJECT BLOB,
            TIME_CREATED BIGINT,
            TENANT_ID INTEGER DEFAULT -1,
            EXPIRY_TIME BIGINT,
            PRIMARY KEY (SESSION_ID, SESSION_TYPE)
)ENGINE INNODB;

CREATE TABLE IF NOT EXISTS IDN_AUTH_TEMP_SESSION_RECORDS_STORE (
            SESSION_ID VARCHAR (100) NOT NULL,
            SESSION_TYPE VARCHAR(100) NOT NULL,
            SESSION_OBJECT BLOB,
            TIME_CREATED BIGINT,
            TENANT_ID INTEGER DEFAULT -1,
            EXPIRY_TIME BIGINT,
            PRIMARY KEY (SESSION_ID, SESSION_TYPE)
)ENGINE INNODB;

-- --------------------------- INDEX CREATION -----------------------------

-- IDN_AUTH_SESSION_RECORDS_STORE --
CREATE INDEX IDX_IDN_AUTH_SESSION_RECORDS_TIME ON IDN_AUTH_SESSION_RECORDS_STORE (TIME_CREATED);

-- IDN_AUTH_TEMP_SESSION_RECORDS_STORE --
CREATE INDEX IDX_IDN_AUTH_TMP_SESSION_RECORDS_TIME ON IDN_AUTH_TEMP_SESSION_RECORDS_STORE (TIME_CREATED);