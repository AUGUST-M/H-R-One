
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.3.571' 
BEGIN
	
	ALTER TABLE LeaveApplication ADD
		EmpRequestID INT NULL,
		RequestLeaveAppID INT NULL 
		
	ALTER TABLE LeaveApplicationCancel ADD
		EmpRequestID INT NULL,
		RequestLeaveAppCancelID INT NULL 

	CREATE TABLE EmpRequestApprovalHistory
	(
		EmpRequestApprovalHistoryID INT NOT NULL IDENTITY (1, 1),
		EmpRequestID INT NULL,
		EmpRequestApprovalHistoryStatusBefore NVARCHAR(50) NULL,
		EmpRequestApprovalHistoryAuthorizationWorkFlowIndexBefore INT NULL,
		EmpRequestApprovalHistoryStatusAfter NVARCHAR(50) NULL,
		EmpRequestApprovalHistoryAuthorizationWorkFlowIndexAfter INT NULL,
		EmpRequestApprovalHistoryActionBy NVARCHAR(255) NULL,
		EmpRequestApprovalHistoryActionByEmpID INT NULL,
		EmpRequestApprovalHistoryCreateDateTime DATETIME NULL,
		CONSTRAINT PK_EmpRequestApprovalHistory PRIMARY KEY CLUSTERED 
		(
			EmpRequestApprovalHistoryID
		) 
	)

	ALTER TABLE EmpPersonalInfo ADD
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpPositionInfo ADD
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpRecurringPayment ADD
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpTermination ADD
		SynID NVARCHAR(255) NULL

	ALTER TABLE LeaveApplication ADD
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpAVCPlan ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpBankAccount ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpContractTerms ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpDependant ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL

	ALTER TABLE EmpEmergencyContact ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpFinalPayment ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpMPFPlan ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpORSOPlan ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpPermit ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpPlaceOfResidence ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpQualification ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpRosterTableGroup ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpCostCenter ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpSkill ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpSpouse ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpWorkExp ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

	ALTER TABLE EmpWorkInjuryRecord ADD 
		RecordCreatedDateTime DATETIME NULL,
		RecordCreatedBy INT NULL,
		RecordLastModifiedDateTime DATETIME NULL,
		RecordLastModifiedBy INT NULL,
		SynID NVARCHAR(255) NULL

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.3.572'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





