
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.14.368' 
BEGIN

	ALTER TABLE RosterCode ADD
		RosterCodeOTIncludeLunch INT NULL,
		RosterCodeLateMinsUnit INT NULL,
		RosterCodeLateMinsRoundingRule NVARCHAR(50),
		RosterCodeEarlyLeaveMinsUnit INT NULL,
		RosterCodeEarlyLeaveMinsRoundingRule NVARCHAR(50),
		RosterCodeLunchLateMinsUnit INT NULL,
		RosterCodeLunchLateMinsRoundingRule NVARCHAR(50),
		RosterCodeLunchEarlyLeaveMinsUnit INT NULL,
		RosterCodeLunchEarlyLeaveMinsRoundingRule NVARCHAR(50)

	ALTER TABLE AttendancePlan ADD
		AttendancePlanLateIncludeLunchLate INT NULL,
		AttendancePlanLateIncludeLunchEarlyLeave INT NULL

	ALTER TABLE AttendanceRecord ADD
		AttendanceRecordCalculateLunchLateMins INT NULL,
		AttendanceRecordActualLunchLateMins INT NULL,
		AttendanceRecordCalculateLunchEarlyLeaveMins INT NULL,
		AttendanceRecordActualLunchEarlyLeaveMins INT NULL,
		AttendanceRecordRosterCodeInTimeOverride DATETIME NULL,
		AttendanceRecordRosterCodeOutTimeOverride DATETIME NULL,
		AttendanceRecordRosterCodeLunchStartTimeOverride DATETIME NULL,
		AttendanceRecordRosterCodeLunchEndTimeOverride DATETIME NULL
	
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.14.369'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





