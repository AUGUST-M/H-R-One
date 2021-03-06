
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.11.0246' 
BEGIN

		
		
	ALTER Table RosterCode ADD
		RosterCodeLunchDeductMinimumWorkHour REAL NULL

	ALTER TABLE AttendancePlan ADD
		AttendancePlanBonusPartialPaidPercent REAL NULL,
		AttendancePlanBonusPartialPaidMaxTotalLateCount int NULL,
		AttendancePlanBonusPartialPaidMaxTotalLateMins int NULL,
		AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveCount int NULL,
		AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveMins int NULL,
		AttendancePlanBonusPartialPaidMaxTotalSLWithMedicalCertificate int NULL,
		AttendancePlanBonusPartialPaidMaxTotalSLWithoutMedicalCertificate int NULL,
		AttendancePlanBonusPartialPaidMaxTotalAbsentCount int NULL,
		AttendancePlanBonusPartialPaidMaxTotalNonFullPayCasualLeave int NULL,
		AttendancePlanBonusPartialPaidMaxTotalInjuryLeave int NULL

	Update WorkHourPattern SET
		WorkHourPatternSunWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay,
		WorkHourPatternSunLunchTimeHoursPerDay=WorkHourPatternContractLunchTimeHoursPerDay
		Where WorkHourPatternSunDefaultDayUnit=1
		
	Update WorkHourPattern SET
		WorkHourPatternMonWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay,
		WorkHourPatternMonLunchTimeHoursPerDay=WorkHourPatternContractLunchTimeHoursPerDay
		Where WorkHourPatternMonDefaultDayUnit=1
		
	Update WorkHourPattern SET
		WorkHourPatternTueWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay,
		WorkHourPatternTueLunchTimeHoursPerDay=WorkHourPatternContractLunchTimeHoursPerDay
		Where WorkHourPatternTueDefaultDayUnit=1
		
	Update WorkHourPattern SET
		WorkHourPatternWedWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay,
		WorkHourPatternWedLunchTimeHoursPerDay=WorkHourPatternContractLunchTimeHoursPerDay
		Where WorkHourPatternWedDefaultDayUnit=1
		
	Update WorkHourPattern SET
		WorkHourPatternThuWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay,
		WorkHourPatternThuLunchTimeHoursPerDay=WorkHourPatternContractLunchTimeHoursPerDay
		Where WorkHourPatternThuDefaultDayUnit=1

	Update WorkHourPattern SET
		WorkHourPatternFriWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay,
		WorkHourPatternFriLunchTimeHoursPerDay=WorkHourPatternContractLunchTimeHoursPerDay
		Where WorkHourPatternFriDefaultDayUnit=1

	Update WorkHourPattern SET
		WorkHourPatternSatWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay,
		WorkHourPatternSatLunchTimeHoursPerDay=WorkHourPatternContractLunchTimeHoursPerDay
		Where WorkHourPatternSatDefaultDayUnit=1
		
	Update WorkHourPattern SET
		WorkHourPatternSunWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay * WorkHourPatternSunDefaultDayUnit,
		WorkHourPatternSunLunchTimeHoursPerDay=0
		Where WorkHourPatternSunDefaultDayUnit<1
		
	Update WorkHourPattern SET
		WorkHourPatternMonWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay * WorkHourPatternMonDefaultDayUnit,
		WorkHourPatternMonLunchTimeHoursPerDay=0
		Where WorkHourPatternMonDefaultDayUnit<1
		
	Update WorkHourPattern SET
		WorkHourPatternTueWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay * WorkHourPatternTueDefaultDayUnit,
		WorkHourPatternTueLunchTimeHoursPerDay=0
		Where WorkHourPatternTueDefaultDayUnit<1
		
	Update WorkHourPattern SET
		WorkHourPatternWedWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay * WorkHourPatternWedDefaultDayUnit,
		WorkHourPatternWedLunchTimeHoursPerDay=0
		Where WorkHourPatternWedDefaultDayUnit<1
		
	Update WorkHourPattern SET
		WorkHourPatternThuWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay * WorkHourPatternThuDefaultDayUnit,
		WorkHourPatternThuLunchTimeHoursPerDay=0
		Where WorkHourPatternThuDefaultDayUnit<1

	Update WorkHourPattern SET
		WorkHourPatternFriWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay * WorkHourPatternFriDefaultDayUnit,
		WorkHourPatternFriLunchTimeHoursPerDay=0
		Where WorkHourPatternFriDefaultDayUnit<1

	Update WorkHourPattern SET
		WorkHourPatternSatWorkHoursPerDay=WorkHourPatternContractWorkHoursPerDay * WorkHourPatternSatDefaultDayUnit,
		WorkHourPatternSatLunchTimeHoursPerDay=0
		Where WorkHourPatternSatDefaultDayUnit<1

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.11.0247'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





