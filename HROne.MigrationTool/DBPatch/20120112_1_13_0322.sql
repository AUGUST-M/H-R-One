
DECLARE @DBVERSION as varchar(100);
set @DBVERSION = (Select ParameterValue from SystemParameter where ParameterCode='DBVERSION');

IF @DBVERSION='1.12.0313' 
BEGIN

	ALTER TABLE TaxCompany ALTER COLUMN 
		TaxCompEmployerName NVARCHAR(255) NULL
		
	ALTER TABLE TaxCompany ALTER COLUMN 
		TaxCompEmployerAddress NVARCHAR(255) NULL

	ALTER TABLE TaxCompany ALTER COLUMN 
		TaxCompSection NVARCHAR(50) NULL

	ALTER TABLE TaxCompany ALTER COLUMN 
		TaxCompERN NVARCHAR(50) NULL

	ALTER TABLE TaxCompany ALTER COLUMN 
		TaxCompDesignation NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpSurname NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpOtherName NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpChineseName NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpSex NVARCHAR(100) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpMartialStatus NVARCHAR(100) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpPassportNo NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpIssuedCountry NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpSpouseName NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpSpousePassportNo NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpSpouseIssuedCountry NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpResAddr NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpResAddrAreaCode NVARCHAR(100) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpCorAddr NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpCapacity NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpPartTimeEmployer NVARCHAR(255) NULL

	ALTER TABLE TaxEmp ALTER COLUMN 
		TaxEmpCessationReason NVARCHAR(255) NULL

	ALTER TABLE TaxEmpPlaceOfResidence ALTER COLUMN 
		TaxEmpPlaceAddress NVARCHAR(255) NULL

	ALTER TABLE TaxEmpPlaceOfResidence ALTER COLUMN 
		TaxEmpPlaceNature NVARCHAR(255) NULL

	ALTER TABLE EmpRecurringPayment ADD
		CostCenterID INT NULL
		
	ALTER TABLE PaymentRecord ADD
		CostCenterID INT NULL

	ALTER TABLE ClaimsAndDeductions ADD
		CostCenterID INT NULL

	ALTER TABLE EmpFinalPayment ADD
		CostCenterID int null

   	-- Insert version of Database --
	Update SystemParameter 
	set ParameterValue='1.13.0322'
	where ParameterCode='DBVERSION';
	print ('Upgrade Successfully');

END
ELSE
print ('Incorrect Version: ' + @DBVERSION);





