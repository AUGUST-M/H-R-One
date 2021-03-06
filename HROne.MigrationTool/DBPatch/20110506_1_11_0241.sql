
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.10.0236' 
BEGIN

	INSERT INTO SystemFunction
    (	FunctionCode
       ,Description
       ,FunctionCategory
       ,FunctionIsHidden)
     VALUES
           ('ATT013','Roster Table Overview', 'Attendance', 0)


	ALTER TABLE RosterCode ADD 
		RosterCodeColorCode NVARCHAR(10) NULL
		
	ALTER TABLE RosterTable	ADD 
		RosterTableOverrideInTime datetime NULL,
		RosterTableOverrideOutTime datetime NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.11.0241'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





