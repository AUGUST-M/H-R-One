
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.3.569' 
BEGIN

	DELETE FROM AuditTrailDetail
		WHERE TableName='TimeCardRecord'
	
	ALTER TABLE LeaveApplication ADD
		LeaveAppBalanceAsOfDate DATETIME NULL
		
	ALTER TABLE PayrollGroup ADD
		PayGroupTerminatedALCompensationDailyFormulaAlternative INT NULL

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.3.570'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





