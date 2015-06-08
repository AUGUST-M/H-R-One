
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.0.470' 
BEGIN
	
	ALTER TABLE EmpRecurringPayment ADD 
		EmpRPUnitPeriodAsDaily INT NULL,
		EmpRPUnitPeriodAsDailyPayFormID INT NULL

           
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.0.479'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





