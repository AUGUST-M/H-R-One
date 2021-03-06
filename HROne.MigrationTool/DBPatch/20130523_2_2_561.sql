
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.2.555' 
BEGIN

	ALTER TABLE PayrollGroup ADD 
		PayGroupIsStatHolUsePublicHoliday INT NULL
		
	ALTER TABLE LeavePlan ADD
		LeavePlanUsePublicHolidayEntitle INT NULL
		
	INSERT INTO LEAVETYPE
		(LeaveType,LeaveTypeDesc,LeaveDecimalPlace,LeaveSystemUse)
	Values
		('PUBLICHOLIDAY','Public Holiday',2,1)
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.2.561'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





