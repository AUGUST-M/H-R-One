
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.12.0294' 
BEGIN

	ALTER TABLE PaymentCode
		ADD PaymentCodeRoundingRuleIsAbsoluteValue int null
		
	ALTER TABLE PayrollGroup ADD
		PayGroupTerminatedRestDayCompensationDailyFormula int null,
		PayGroupTerminatedRestDayCompensationPaymentCodeID int null,
		PayGroupTerminatedStatutoryHolidayCompensationDailyFormula int null,
		PayGroupTerminatedStatutoryHolidayCompensationPaymentCodeID int null
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.12.0300'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





