
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.487' 
BEGIN
		
	CREATE TABLE AuthorizationWorkFlow
	(
		AuthorizationWorkFlowID INT NOT NULL IDENTITY (1, 1),
		AuthorizationWorkFlowCode NVARCHAR(255) NULL,
		AuthorizationWorkFlowDescription NVARCHAR(255) NULL,
		CONSTRAINT PK_AuthorizationWorkFlow PRIMARY KEY CLUSTERED 
		(
			AuthorizationWorkFlowID
		) 
	)
	 
 	CREATE TABLE AuthorizationWorkFlowDetail
	(
		AuthorizationWorkFlowDetailID INT NOT NULL IDENTITY (1, 1),
		AuthorizationWorkFlowID INT NULL,
		AuthorizationWorkFlowIndex INT NULL,
		AuthorizationGroupID INT NULL,
		CONSTRAINT PK_AuthorizationWorkFlowDetail PRIMARY KEY CLUSTERED 
		(
			AuthorizationWorkFlowDetailID
		) 
	)
	
 	ALTER TABLE EmpPositionInfo ADD
		AuthorizationWorkFlowIDLeaveApp INT NULL,
		AuthorizationWorkFlowIDEmpInfoModified INT NULL
	
 	ALTER TABLE EmpRequest ADD
		EmpRequestStatus NVARCHAR(50) NULL,
		EmpRequestLastAuthorizationWorkFlowIndex INT NULL
		
   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.488'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





