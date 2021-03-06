
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.12.0280' 
BEGIN

	ALTER TABLE PayrollGroup 
		ADD PayGroupIsCNDProrata INT NULL

	ALTER TABLE LeaveCode 
		ADD LeaveCodeIsPayrollProcessNextMonth INT NULL

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.12.0281'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





