
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.12.0305' 
BEGIN

	ALTER TABLE LeavePlan DROP COLUMN
		LeavePlanALMaxBF,
		LeavePlanSL1MaxBF,
		LeavePlanSL2MaxBF
		
	ALTER TABLE LeavePlan ADD
		LeavePlanALRoundingRuleIsApplyFirstYearBroughtForwardOnly int null
		
	ALTER TABLE LeavePlanBroughtForward ADD
		LeavePlanBroughtForwardForfeitLastYearBroughtForwardOnly int null

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.12.0311'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





