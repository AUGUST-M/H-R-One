
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='2.1.488' 
BEGIN
	 	ALTER TABLE EmpRequest ADD
		EmpRequestLastActionBy NVARCHAR(255) NULL,
		EmpRequestLastActionByEmpID INT NULL
		
	 	UPDATE EmpRequest SET 
	 	EmpRequestStatus='Submitted',
		EmpRequestLastAuthorizationWorkFlowIndex=0
		WHERE EmpRequestStatusCode='USRSUBMIT'

	 	UPDATE EmpRequest SET 
	 	EmpRequestStatus='Cancelled',
		EmpRequestLastAuthorizationWorkFlowIndex=0
		WHERE EmpRequestStatusCode='USRCANCEL'

	 	UPDATE EmpRequest SET 
	 	EmpRequestStatus='Accepted',
		EmpRequestLastAuthorizationWorkFlowIndex=1
		WHERE EmpRequestStatusCode='1STAPPROVED'
		
	 	UPDATE EmpRequest SET 
	 	EmpRequestStatus='Rejected',
		EmpRequestLastAuthorizationWorkFlowIndex=1
		WHERE EmpRequestStatusCode='1STREJECTED'

	 	UPDATE EmpRequest SET 
	 	EmpRequestStatus='Rejected',
		EmpRequestLastAuthorizationWorkFlowIndex=2
		WHERE EmpRequestStatusCode='2NDREJECTED'

	 	UPDATE EmpRequest SET 
	 	EmpRequestStatus='Approved',
		EmpRequestLastAuthorizationWorkFlowIndex=2
		WHERE EmpRequestStatusCode='APPROVED'
		OR EmpRequestStatusCode='2NDAPPROVED'

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='2.1.490'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





