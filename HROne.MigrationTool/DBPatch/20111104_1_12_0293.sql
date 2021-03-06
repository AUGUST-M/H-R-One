
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.12.0292' 
BEGIN

	ALTER TABLE LeavePlan ADD 
		LeavePlanUseStatutoryHolidayEntitle INT NULL,
		LeavePlanUseRestDayEntitle INT NULL,
		LeavePlanRestDayEntitlePeriod NVARCHAR(100) NULL,
		LeavePlanRestDayEntitleDays float(53) NULL,
		LeavePlanRestDayWeeklyEntitleStartDay NVARCHAR(100) NULL,
		LeavePlanRestDayMonthlyEntitleProrataBase float(53) NULL,
		LeavePlanRestDayMonthlyEntitleProrataRoundingRuleID INT NULL

	INSERT INTO LEAVETYPE
		(LeaveType,LeaveTypeDesc,LeaveDecimalPlace,LeaveSystemUse)
	Values
		('REST','Rest Day',2,1)	

	INSERT INTO LEAVETYPE
		(LeaveType,LeaveTypeDesc,LeaveDecimalPlace,LeaveSystemUse)
	Values
		('STATUTORYHOLIDAY','Statutory Holiday',2,1)	
				
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.12.0293'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





