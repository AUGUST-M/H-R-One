
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION = '1.0.18'
BEGIN
	BEGIN TRANSACTION 

	ALTER TABLE PayrollGroup ADD 
		PayGroupIsPublic int NULL;
		
	TRUNCATE TABLE PayrollGroupUsers;

	-- Insert version of Database --
	UPDATE	SystemParameter 
	SET		ParameterValue='1.0.18a'
	WHERE	ParameterCode='DBVERSION';	

	SELECT  @DBVERSION='1.0.18a';
	
	COMMIT TRANSACTION
END

