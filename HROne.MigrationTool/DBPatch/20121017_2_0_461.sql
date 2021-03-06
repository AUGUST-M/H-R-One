
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.0.457' 
BEGIN

	ALTER TABLE PayrollGroup ADD 
		PayGroupStatHolEligibleSkipDeduction INT NULL
	
	ALTER TABLE PayrollBatch ADD
		PayBatchIsESSPaySlipRelease INT NULL
	
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.0.461'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





