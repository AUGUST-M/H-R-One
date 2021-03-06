
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.3.572' 
BEGIN
	
	UPDATE PaymentCode
	SET PaymentCodeIsProrataStatutoryHoliday=PaymentCodeIsProrataLeave
	WHERE PaymentCodeIsProrataStatutoryHoliday IS NULL

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.3.573'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





