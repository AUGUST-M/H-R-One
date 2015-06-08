
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.11.0251' 
BEGIN

		
	ALTER TABLE LeaveCode ADD
		LeaveCodeHideInESS int NULL
		
	ALTER TABLE AttendancePlan ADD
		AttendancePlanOTRateMultiplier Real NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.11.0253'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





