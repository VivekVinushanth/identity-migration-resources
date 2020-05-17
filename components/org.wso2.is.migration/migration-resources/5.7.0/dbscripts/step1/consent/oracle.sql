ALTER TABLE CM_PURPOSE DROP constraint PURPOSE_CONSTRAINT
/

DECLARE
 COUNT_INDEXES INTEGER;
  BEGIN
   SELECT COUNT(*) INTO COUNT_INDEXES
      FROM USER_INDEXES
      WHERE INDEX_NAME = 'PURPOSE_CONSTRAINT';
    IF COUNT_INDEXES > 0 THEN
      EXECUTE IMMEDIATE 'DROP INDEX PURPOSE_CONSTRAINT';
    END IF;
END;
/

ALTER TABLE CM_PURPOSE
ADD (PURPOSE_GROUP VARCHAR(255) DEFAULT '',
	GROUP_TYPE    VARCHAR(255) DEFAULT '',
	constraint PURPOSE_CONSTRAINT UNIQUE (NAME, TENANT_ID, PURPOSE_GROUP, GROUP_TYPE))
/

UPDATE CM_PURPOSE
SET
PURPOSE_GROUP =
CASE WHEN NAME = 'DEFAULT' THEN 'DEFAULT' ELSE 'SIGNUP' END
/

UPDATE CM_PURPOSE
SET
GROUP_TYPE =
CASE WHEN NAME = 'DEFAULT' THEN 'SP' ELSE 'SYSTEM' end
/

ALTER TABLE CM_PURPOSE_PII_CAT_ASSOC
ADD IS_MANDATORY INTEGER DEFAULT 1 NOT NULL
/
