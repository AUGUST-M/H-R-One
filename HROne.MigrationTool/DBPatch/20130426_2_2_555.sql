
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.2.551' 
BEGIN

	ALTER TABLE CompensationLeaveEntitle ADD 
		CompensationLeaveEntitleDateExpiry DATETIME NULL
		
	ALTER TABLE LeaveType ADD 
		LeaveTypeIsESSHideLeaveBalance INT NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.2.555'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





