
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.08.0211' 
BEGIN
	UPDATE LeaveType
		SET LeaveTypeIsSkipStatutoryHolidayChecking = 1
		WHERE LeaveType='MAL'

	Alter Table PayrollGroup DROP COLUMN
		PayGroupTerminatedALCompensationEligibleCheckEveryCommonLeaveYear,
		PayGroupTerminatedALCompensationEligiblePeriod,
		PayGroupTerminatedALCompensationEligibleUnit,
		PayGroupTerminatedALCompensationEligibleAfterProrata

	Alter Table PayrollGroup ADD
		PayGroupTerminatedALCompensationProrataEligibleCheckEveryLeaveYear int NULL,
		PayGroupTerminatedALCompensationProrataEligiblePeriod int NULL,
		PayGroupTerminatedALCompensationProrataEligibleUnit NVARCHAR(1) NULL,
		PayGroupTerminatedALCompensationEligibleAfterProbation int NULL
		
	Alter Table LeavePlan DROP COLUMN
		LeavePlanUseCommonLeaveYear ,
		LeavePlanCommonLeaveYearStartMonth,
		LeavePlanCommonLeaveYearStartDay
	

	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.08.0212'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





