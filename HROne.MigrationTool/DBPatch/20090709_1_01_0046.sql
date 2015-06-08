DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.01.0044' 
BEGIN

	ALTER TABLE EmpSpouse ADD
		EmpSpouseDateOfBirth datetime NULL

	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.01.0046'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);

