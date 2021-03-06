
/****** Object:  Table [dbo].[SystemParameter]    Script Date: 07/29/2014 15:59:26 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SystemParameter](
	[ParameterCode] [nvarchar](100) NOT NULL,
	[ParameterDesc] [nvarchar](200) NULL,
	[ParameterValue] [ntext] NULL,
 CONSTRAINT [PK_SystemParameter] PRIMARY KEY CLUSTERED 
(
	[ParameterCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Company]    Script Date: 07/29/2014 15:56:10 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](255) NULL,
	[CompanyAddress] [nvarchar](255) NULL,
	[CompanyContactPerson] [nvarchar](255) NULL,
	[CompanyContactNo] [nvarchar](255) NULL,
	[CompanyFaxNo] [nvarchar](255) NULL,
	[CompanyBRNo] [nvarchar](255) NULL,
	[CompanyBankCode] [nvarchar](30) NULL,
	[CompanyBranchCode] [nvarchar](30) NULL,
	[CompanyBankAccountNo] [nvarchar](90) NULL,
	[CompanyBankHolderName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Company_] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxCompany]    Script Date: 07/29/2014 15:59:27 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxCompany](
	[TaxCompID] [int] IDENTITY(1,1) NOT NULL,
	[TaxCompEmployerName] [nvarchar](255) NULL,
	[TaxCompEmployerAddress] [nvarchar](255) NULL,
	[TaxCompSection] [nvarchar](50) NULL,
	[TaxCompERN] [nvarchar](50) NULL,
	[TaxCompDesignation] [nvarchar](255) NULL,
 CONSTRAINT [PK_TaxCompany] PRIMARY KEY CLUSTERED 
(
	[TaxCompID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AVCPlan]    Script Date: 07/29/2014 15:56:00 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AVCPlan](
	[AVCPlanID] [int] IDENTITY(1,1) NOT NULL,
	[AVCPlanCode] [nvarchar](20) NULL,
	[AVCPlanDesc] [nvarchar](100) NULL,
	[AVCPlanEmployerResidual] [int] NULL,
	[AVCPlanEmployeeResidual] [int] NULL,
	[AVCPlanUseMPFExemption] [int] NULL,
	[AVCPlanJoinDateStart] [int] NULL,
	[AVCPlanContributeMaxAge] [int] NULL,
	[AVCPlanContributeMinRI] [int] NULL,
	[AVCPlanMaxEmployerVC] [decimal](15, 2) NULL,
	[AVCPlanMaxEmployeeVC] [decimal](15, 2) NULL,
	[AVCPlanEmployerDecimalPlace] [int] NULL,
	[AVCPlanEmployerRoundingRule] [nvarchar](50) NULL,
	[AVCPlanEmployeeDecimalPlace] [int] NULL,
	[AVCPlanEmployeeRoundingRule] [nvarchar](50) NULL,
	[AVCPlanNotRemoveContributionFromTopUp] [int] NULL,
 CONSTRAINT [PK_AVCPlan] PRIMARY KEY CLUSTERED 
(
	[AVCPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Position]    Script Date: 07/29/2014 15:58:56 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionCode] [nvarchar](200) NULL,
	[PositionDesc] [nvarchar](255) NULL,
	[PositionCapacity] [nvarchar](255) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxCompanyMap]    Script Date: 07/29/2014 15:59:28 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxCompanyMap](
	[TaxCompMapID] [int] IDENTITY(1,1) NOT NULL,
	[TaxCompID] [int] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_TaxCompanyMap] PRIMARY KEY CLUSTERED 
(
	[TaxCompMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AVCPlanDetail]    Script Date: 07/29/2014 15:56:01 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AVCPlanDetail](
	[AVCPlanDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AVCPlanID] [int] NULL,
	[AVCPlanDetailYearOfService] [int] NULL,
	[AVCPlanDetailERBelowRI] [decimal](15, 2) NULL,
	[AVCPlanDetailERAboveRI] [decimal](15, 2) NULL,
	[AVCPlanDetailERFix] [decimal](15, 2) NULL,
	[AVCPlanDetailEEBelowRI] [decimal](15, 2) NULL,
	[AVCPlanDetailEEAboveRI] [decimal](15, 2) NULL,
	[AVCPlanDetailEEFix] [decimal](15, 2) NULL,
 CONSTRAINT [PK_AVCPlanDetail] PRIMARY KEY CLUSTERED 
(
	[AVCPlanDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Rank]    Script Date: 07/29/2014 15:58:58 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Rank](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[RankCode] [nvarchar](200) NULL,
	[RankDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[StaffType]    Script Date: 07/29/2014 15:59:22 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[StaffType](
	[StaffTypeID] [int] IDENTITY(1,1) NOT NULL,
	[StaffTypeCode] [nvarchar](200) NULL,
	[StaffTypeDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_StaffType] PRIMARY KEY CLUSTERED 
(
	[StaffTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxEmpPayment]    Script Date: 07/29/2014 15:59:37 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxEmpPayment](
	[TaxEmpPayID] [int] IDENTITY(1,1) NOT NULL,
	[TaxEmpID] [int] NULL,
	[TaxPayID] [int] NULL,
	[TaxEmpPayNature] [nvarchar](35) NULL,
	[TaxEmpPayPeriodFr] [datetime] NULL,
	[TaxEmpPayPeriodTo] [datetime] NULL,
	[TaxEmpPayAmount] [bigint] NULL,
 CONSTRAINT [PK_TaxEmpPayment] PRIMARY KEY CLUSTERED 
(
	[TaxEmpPayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClaimsAndDeductions]    Script Date: 07/29/2014 15:56:07 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClaimsAndDeductions](
	[CNDID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[CNDEffDate] [datetime] NULL,
	[PayCodeID] [int] NULL,
	[CNDAmount] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[CNDPayMethod] [nvarchar](1) NULL,
	[EmpAccID] [int] NULL,
	[CNDRemark] [ntext] NULL,
	[CNDNumOfDayAdj] [real] NULL,
	[PayRecID] [int] NULL,
	[EmpPayrollID] [int] NULL,
	[CNDImportBatchID] [int] NULL,
	[CNDIsRestDayPayment] [int] NULL,
	[CostCenterID] [int] NULL,
 CONSTRAINT [PK_ClaimsAndDeductions] PRIMARY KEY CLUSTERED 
(
	[CNDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PayrollGroup]    Script Date: 07/29/2014 15:58:48 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PayrollGroup](
	[PayGroupID] [int] IDENTITY(1,1) NOT NULL,
	[PayGroupCode] [nvarchar](200) NULL,
	[PayGroupDesc] [nvarchar](255) NULL,
	[PayGroupFreq] [nvarchar](1) NULL,
	[PayGroupDefaultStartDay] [int] NULL,
	[PayGroupDefaultEndDay] [int] NULL,
	[PayGroupNextStartDate] [datetime] NULL,
	[PayGroupNextEndDate] [datetime] NULL,
	[CurrentPayPeriodID] [int] NULL,
	[PayGroupLeaveDeductFormula] [int] NULL,
	[PayGroupLeaveAllowFormula] [int] NULL,
	[PayGroupNewJoinFormula] [int] NULL,
	[PayGroupTerminatedFormula] [int] NULL,
	[PayGroupTerminatedALCompensationDailyFormula] [int] NULL,
	[PayGroupTerminatedALCompensationPaymentCodeID] [int] NULL,
	[PayGroupTerminatedPaymentInLieuMonthlyBaseMethod] [nvarchar](100) NULL,
	[PayGroupTerminatedPaymentInLieuDailyFormula] [int] NULL,
	[PayGroupTerminatedPaymentInLieuERPaymentCodeID] [int] NULL,
	[PayGroupTerminatedPaymentInLieuEEPaymentCodeID] [int] NULL,
	[PayGroupTerminatedLSPSPMonthlyBaseMethod] [nvarchar](100) NULL,
	[PayGroupTerminatedLSPPaymentCodeID] [int] NULL,
	[PayGroupTerminatedSPPaymentCodeID] [int] NULL,
	[PayGroupStatHolDeductFormula] [int] NULL,
	[PayGroupStatHolAllowFormula] [int] NULL,
	[PayGroupStatHolAllowPaymentCodeID] [int] NULL,
	[PayGroupStatHolDeductPaymentCodeID] [int] NULL,
	[PayGroupPayAdvance] [int] NULL,
	[PayGroupStatHolEligiblePeriod] [int] NULL,
	[PayGroupStatHolEligibleUnit] [nvarchar](1) NULL,
	[PayGroupStatHolEligibleAfterProbation] [int] NULL,
	[PayGroupYEBStartPayrollMonth] [int] NULL,
	[PayGroupYEBMonthFrom] [int] NULL,
	[PayGroupYEBMonthTo] [int] NULL,
	[PayGroupStatHolNextMonth] [int] NULL,
	[PayGroupTerminatedALCompensationProrataEligibleCheckEveryLeaveYear] [int] NULL,
	[PayGroupTerminatedALCompensationProrataEligiblePeriod] [int] NULL,
	[PayGroupTerminatedALCompensationProrataEligibleUnit] [nvarchar](1) NULL,
	[PayGroupTerminatedALCompensationEligibleAfterProbation] [int] NULL,
	[PayGroupDefaultProrataFormula] [int] NULL,
	[PayGroupRestDayHasWage] [int] NULL,
	[PayGroupRestDayProrataFormula] [int] NULL,
	[PayGroupAdditionalRemunerationPayCodeID] [int] NULL,
	[PayGroupUseCNDForDailyHourlyPayment] [int] NULL,
	[PayGroupPayAdvanceCompareTotalPaymentOnly] [int] NULL,
	[PayGroupLunchTimeHasWage] [int] NULL,
	[PayGroupTerminatedALCompensationByEEPaymentCodeID] [real] NULL,
	[PayGroupIsCNDProrata] [int] NULL,
	[PayGroupTerminatedRestDayCompensationDailyFormula] [int] NULL,
	[PayGroupTerminatedRestDayCompensationPaymentCodeID] [int] NULL,
	[PayGroupTerminatedStatutoryHolidayCompensationDailyFormula] [int] NULL,
	[PayGroupTerminatedStatutoryHolidayCompensationPaymentCodeID] [int] NULL,
	[PayGroupTerminatedALCompensationIsSkipRoundingRule] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[PayGroupIsSkipStatHol] [int] NULL,
	[PayGroupExistingFormula] [int] NULL,
	[PayGroupStatHolEligibleSkipDeduction] [int] NULL,
	[PayGroupDefaultNextStartDay] [int] NULL,
	[PayGroupLeaveDefaultCutOffDay] [int] NULL,
	[PayGroupLeaveDefaultNextCutOffDay] [int] NULL,
	[PayGroupIsStatHolUsePublicHoliday] [int] NULL,
	[PayGroupTerminatedALCompensationDailyFormulaAlternative] [int] NULL,
	[PayGroupTerminatedPaymentInLieuMonthlyBaseMethodAlternative] [nvarchar](100) NULL,
	[PayGroupTerminatedPaymentInLieuDailyFormulaAlternative] [int] NULL,
	[PayGroupTerminatedLSPSPMonthlyBaseMethodAlternative] [nvarchar](100) NULL,
 CONSTRAINT [PK_PayrollGroup] PRIMARY KEY CLUSTERED 
(
	[PayGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxEmpPlaceOfResidence]    Script Date: 07/29/2014 15:59:39 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxEmpPlaceOfResidence](
	[TaxEmpPlaceID] [int] IDENTITY(1,1) NOT NULL,
	[TaxEmpID] [int] NULL,
	[TaxEmpPlaceAddress] [nvarchar](255) NULL,
	[TaxEmpPlaceNature] [nvarchar](255) NULL,
	[TaxEmpPlacePeriodFr] [datetime] NULL,
	[TaxEmpPlacePeriodTo] [datetime] NULL,
	[TaxEmpPlaceERRent] [bigint] NULL,
	[TaxEmpPlaceEERent] [bigint] NULL,
	[TaxEmpPlaceEERentRefunded] [bigint] NULL,
	[TaxEmpPlaceERRentByEE] [bigint] NULL,
 CONSTRAINT [PK_TaxEmpPlaceOfResidence] PRIMARY KEY CLUSTERED 
(
	[TaxEmpPlaceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeavePlan]    Script Date: 07/29/2014 15:58:05 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeavePlan](
	[LeavePlanID] [int] IDENTITY(1,1) NOT NULL,
	[LeavePlanCode] [nvarchar](200) NULL,
	[LeavePlanDesc] [nvarchar](255) NULL,
	[ALProrataRoundingRuleID] [int] NULL,
	[LeavePlanResetYearOfService] [int] NULL,
	[LeavePlanNoCountFirstIncompleteYearOfService] [int] NULL,
	[LeavePlanComparePreviousLeavePlan] [int] NULL,
	[LeavePlanLeavePlanCompareRank] [int] NULL,
	[LeavePlanProrataSkipFeb29] [int] NULL,
	[LeavePlanUseStatutoryHolidayEntitle] [int] NULL,
	[LeavePlanUseRestDayEntitle] [int] NULL,
	[LeavePlanRestDayEntitlePeriod] [nvarchar](100) NULL,
	[LeavePlanRestDayEntitleDays] [float] NULL,
	[LeavePlanRestDayWeeklyEntitleStartDay] [nvarchar](100) NULL,
	[LeavePlanRestDayMonthlyEntitleProrataBase] [float] NULL,
	[LeavePlanRestDayMonthlyEntitleProrataRoundingRuleID] [int] NULL,
	[LeavePlanALRoundingRuleIsApplyFirstYearBroughtForwardOnly] [int] NULL,
	[LeavePlanUseCommonLeaveYear] [int] NULL,
	[LeavePlanCommonLeaveYearStartMonth] [int] NULL,
	[LeavePlanCommonLeaveYearStartDay] [int] NULL,
	[LeavePlanUsePublicHolidayEntitle] [int] NULL,
 CONSTRAINT [PK_LeavePlan] PRIMARY KEY CLUSTERED 
(
	[LeavePlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxForm]    Script Date: 07/29/2014 15:59:41 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxForm](
	[TaxFormID] [int] IDENTITY(1,1) NOT NULL,
	[TaxCompID] [int] NULL,
	[TaxFormSection] [nvarchar](3) NULL,
	[TaxFormERN] [nvarchar](8) NULL,
	[TaxFormYear] [int] NULL,
	[TaxFormSubmissionDate] [datetime] NULL,
	[TaxFormBatchNo] [int] NULL,
	[TaxFormEmployerName] [nvarchar](70) NULL,
	[TaxFormEmployerAddress] [nvarchar](90) NULL,
	[TaxFormDesignation] [nvarchar](25) NULL,
	[TaxFormType] [nvarchar](1) NULL,
 CONSTRAINT [PK_TaxForm] PRIMARY KEY CLUSTERED 
(
	[TaxFormID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CostAllocation]    Script Date: 07/29/2014 15:56:16 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CostAllocation](
	[CostAllocationID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpPayrollID] [int] NULL,
	[CostAllocationStatus] [nvarchar](1) NULL,
	[CostAllocationTrialRunDate] [datetime] NULL,
	[CostAllocationTrialRunBy] [int] NULL,
	[CostAllocationConfirmDate] [datetime] NULL,
	[CostAllocationConfirmBy] [int] NULL,
 CONSTRAINT [PK_CostAllocation] PRIMARY KEY CLUSTERED 
(
	[CostAllocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[HierarchyElement]    Script Date: 07/29/2014 15:57:43 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[HierarchyElement](
	[HElementID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[HElementCode] [nvarchar](200) NULL,
	[HElementDesc] [nvarchar](255) NULL,
	[HLevelID] [int] NULL,
 CONSTRAINT [PK_HierarchyElement] PRIMARY KEY CLUSTERED 
(
	[HElementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxPayment]    Script Date: 07/29/2014 15:59:42 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxPayment](
	[TaxPayID] [int] IDENTITY(1,1) NOT NULL,
	[TaxFormType] [nvarchar](1) NULL,
	[TaxPayCode] [nvarchar](10) NULL,
	[TaxPayDesc] [nvarchar](200) NULL,
	[TaxPayNature] [nvarchar](35) NULL,
	[TaxPayIsShowNature] [nvarchar](1) NULL,
 CONSTRAINT [PK_TaxPayment] PRIMARY KEY CLUSTERED 
(
	[TaxPayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CostAllocationDetail]    Script Date: 07/29/2014 15:56:18 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CostAllocationDetail](
	[CostAllocationDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CostAllocationID] [int] NULL,
	[CompanyID] [int] NULL,
	[CostCenterID] [int] NULL,
	[PaymentCodeID] [int] NULL,
	[CostAllocationDetailAmount] [decimal](15, 4) NULL,
	[PayRecID] [int] NULL,
	[CostAllocationDetailIsContribution] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_CostAllocationDetail] PRIMARY KEY CLUSTERED 
(
	[CostAllocationDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CostCenter]    Script Date: 07/29/2014 15:56:19 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CostCenter](
	[CostCenterID] [int] IDENTITY(1,1) NOT NULL,
	[CostCenterCode] [nvarchar](200) NOT NULL,
	[CostCenterDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_CostCenter] PRIMARY KEY CLUSTERED 
(
	[CostCenterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxPaymentMap]    Script Date: 07/29/2014 15:59:43 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxPaymentMap](
	[TaxPayMapID] [int] IDENTITY(1,1) NOT NULL,
	[TaxPayID] [int] NULL,
	[PaymentCodeID] [int] NULL,
 CONSTRAINT [PK_TaxPaymentMap] PRIMARY KEY CLUSTERED 
(
	[TaxPayMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CostAllocationDetailHElement]    Script Date: 07/29/2014 15:56:19 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CostAllocationDetailHElement](
	[CostAllocationDetailHElementID] [int] IDENTITY(1,1) NOT NULL,
	[CostAllocationDetailID] [int] NULL,
	[HElementID] [int] NULL,
	[HLevelID] [int] NULL,
 CONSTRAINT [PK_CostAllocationDetailHElement] PRIMARY KEY CLUSTERED 
(
	[CostAllocationDetailHElementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CessationReason]    Script Date: 07/29/2014 15:56:05 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CessationReason](
	[CessationReasonID] [int] IDENTITY(1,1) NOT NULL,
	[CessationReasonCode] [nvarchar](200) NULL,
	[CessationReasonDesc] [nvarchar](255) NULL,
	[CessationReasonIsSeverancePay] [int] NULL,
	[CessationReasonIsLongServicePay] [int] NULL,
	[CessationReasonHasProrataYEB] [int] NULL,
 CONSTRAINT [PK_CessationReason] PRIMARY KEY CLUSTERED 
(
	[CessationReasonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UploadClaimsAndDeductions]    Script Date: 07/29/2014 15:59:50 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadClaimsAndDeductions](
	[UploadCNDID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[CNDEffDate] [datetime] NOT NULL,
	[PayCodeID] [int] NOT NULL,
	[CNDAmount] [decimal](15, 4) NOT NULL,
	[CurrencyID] [nvarchar](3) NOT NULL,
	[CNDPayMethod] [nvarchar](1) NULL,
	[EmpAccID] [int] NULL,
	[CNDIsRestDayPayment] [int] NULL,
	[CostCenterID] [int] NULL,
	[CNDRemark] [nvarchar](200) NULL,
	[CNDNumOfDayAdj] [real] NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadClaimsAndDeductions] PRIMARY KEY CLUSTERED 
(
	[UploadCNDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



/****** Object:  Table [dbo].[PaymentCode]    Script Date: 07/29/2014 15:58:32 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PaymentCode](
	[PaymentCodeID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentCode] [nvarchar](200) NULL,
	[PaymentCodeDesc] [ntext] NULL,
	[PaymentTypeID] [int] NOT NULL,
	[PaymentCodeIsProrata] [int] NULL,
	[PaymentCodeIsProrataLeave] [int] NULL,
	[PaymentCodeIsMPF] [int] NULL,
	[PaymentCodeIsTopUp] [int] NULL,
	[PaymentCodeIsWages] [int] NULL,
	[PaymentCodeIsORSO] [int] NULL,
	[PaymentCodeDecimalPlace] [int] NULL,
	[PaymentCodeRoundingRule] [nvarchar](50) NULL,
	[PaymentCodeHideInPaySlip] [int] NULL,
	[PaymentCodeDisplaySeqNo] [int] NULL,
	[PaymentCodeNotRemoveContributionFromTopUp] [int] NULL,
	[PaymentCodeRoundingRuleIsAbsoluteValue] [int] NULL,
	[PaymentCodeIsProrataStatutoryHoliday] [int] NULL,
 CONSTRAINT [PK_PaymentCode] PRIMARY KEY CLUSTERED 
(
	[PaymentCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UserGroup]    Script Date: 07/29/2014 15:59:52 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserGroup](
	[UserGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupName] [nvarchar](100) NULL,
	[UserGroupDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Country]    Script Date: 07/29/2014 15:56:20 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Country](
	[CountryCode] [nvarchar](10) NOT NULL,
	[CountryDesc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeavePlanBroughtForward]    Script Date: 07/29/2014 15:58:06 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeavePlanBroughtForward](
	[LeavePlanBroughtForwardID] [int] IDENTITY(1,1) NOT NULL,
	[LeavePlanID] [int] NULL,
	[LeaveTypeID] [int] NULL,
	[LeavePlanBroughtForwardMax] [int] NULL,
	[LeavePlanBroughtForwardForfeitLastYearBroughtForwardOnly] [int] NULL,
	[LeavePlanBroughtForwardNumOfMonthExpired] [int] NULL,
 CONSTRAINT [PK_LeavePlanBroughtForward] PRIMARY KEY CLUSTERED 
(
	[LeavePlanBroughtForwardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserGroupAccess]    Script Date: 07/29/2014 15:59:52 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserGroupAccess](
	[UserGroupAccessID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserGroupID] [int] NULL,
 CONSTRAINT [PK_UserGroupAccess] PRIMARY KEY CLUSTERED 
(
	[UserGroupAccessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpAVCPlan]    Script Date: 07/29/2014 15:56:26 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpAVCPlan](
	[EmpAVCID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpAVCEffFr] [datetime] NULL,
	[EmpAVCEffTo] [datetime] NULL,
	[AVCPlanID] [int] NULL,
	[EmpAVCEROverrideSetting] [int] NULL,
	[EmpAVCERBelowRI] [decimal](15, 2) NULL,
	[EmpAVCERAboveRI] [decimal](15, 2) NULL,
	[EmpAVCERFix] [decimal](15, 2) NULL,
	[EmpAVCEEOverrideSetting] [int] NULL,
	[EmpAVCEEBelowRI] [decimal](15, 2) NULL,
	[EmpAVCEEAboveRI] [decimal](15, 2) NULL,
	[EmpAVCEEFix] [decimal](15, 2) NULL,
	[DefaultMPFPlanID] [int] NULL,
	[EmpAVCPlanExtendData] [ntext] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpAVCPlan] PRIMARY KEY CLUSTERED 
(
	[EmpAVCID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpEmergencyContact]    Script Date: 07/29/2014 15:56:41 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpEmergencyContact](
	[EmpEmergencyContactID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpEmergencyContactName] [nvarchar](255) NULL,
	[EmpEmergencyContactGender] [nvarchar](100) NULL,
	[EmpEmergencyContactRelationship] [nvarchar](255) NULL,
	[EmpEmergencyContactContactNoDay] [nvarchar](255) NULL,
	[EmpEmergencyContactContactNoNight] [nvarchar](255) NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpEmergencyContact] PRIMARY KEY CLUSTERED 
(
	[EmpEmergencyContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserGroupFunction]    Script Date: 07/29/2014 15:59:53 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserGroupFunction](
	[UserGroupFunctionID] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupID] [int] NULL,
	[FunctionID] [int] NULL,
	[FunctionAllowRead] [int] NULL,
	[FunctionAllowWrite] [int] NULL,
 CONSTRAINT [PK_UserGroupFunction] PRIMARY KEY CLUSTERED 
(
	[UserGroupFunctionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TrainingCourse]    Script Date: 07/29/2014 15:59:47 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TrainingCourse](
	[TrainingCourseID] [int] IDENTITY(1,1) NOT NULL,
	[TrainingCourseCode] [nvarchar](20) NULL,
	[TrainingCourseName] [nvarchar](100) NULL,
 CONSTRAINT [PK_TrainingCourse] PRIMARY KEY CLUSTERED 
(
	[TrainingCourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserRank]    Script Date: 07/29/2014 15:59:54 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserRank](
	[UserRankID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RankID] [int] NULL,
 CONSTRAINT [PK_UserRank] PRIMARY KEY CLUSTERED 
(
	[UserRankID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpContractTerms]    Script Date: 07/29/2014 15:56:31 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpContractTerms](
	[EmpContractID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpContractCompanyName] [nvarchar](100) NULL,
	[EmpContractCompanyContactNo] [nvarchar](100) NULL,
	[EmpContractCompanyAddr] [nvarchar](100) NULL,
	[EmpContractEmployedFrom] [datetime] NULL,
	[EmpContractEmployedTo] [datetime] NULL,
	[EmpContractGratuity] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[PayCodeID] [int] NULL,
	[EmpContractGratuityMethod] [nvarchar](1) NULL,
	[EmpAccID] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpContractTerms] PRIMARY KEY CLUSTERED 
(
	[EmpContractID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Users]    Script Date: 07/29/2014 15:59:58 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LoginID] [nvarchar](20) NULL,
	[UserName] [nvarchar](100) NULL,
	[UserPassword] [nvarchar](255) NULL,
	[UserAccountStatus] [nvarchar](1) NULL,
	[ExpiryDate] [datetime] NULL,
	[UserChangePassword] [int] NULL,
	[UserChangePasswordUnit] [nvarchar](1) NULL,
	[UserChangePasswordPeriod] [int] NULL,
	[UserChangePasswordDate] [datetime] NULL,
	[FailCount] [int] NULL,
	[UserLanguage] [nvarchar](10) NULL,
	[UserIsKeepConnected] [int] NULL,
	[UsersCannotCreateUsersWithMorePermission] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpCostCenter]    Script Date: 07/29/2014 15:56:33 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpCostCenter](
	[EmpCostCenterID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpCostCenterEffFr] [datetime] NULL,
	[EmpCostCenterEffTo] [datetime] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpCostCenter] PRIMARY KEY CLUSTERED 
(
	[EmpCostCenterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpPositionInfo]    Script Date: 07/29/2014 15:57:12 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpPositionInfo](
	[EmpPosID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpPosEffFr] [datetime] NULL,
	[EmpPosEffTo] [datetime] NULL,
	[CompanyID] [int] NULL,
	[PositionID] [int] NULL,
	[RankID] [int] NULL,
	[StaffTypeID] [int] NULL,
	[EmploymentTypeID] [int] NULL,
	[PayGroupID] [int] NULL,
	[LeavePlanID] [int] NULL,
	[YEBPlanID] [int] NULL,
	[EmpFirstAuthorizationGp] [int] NULL,
	[EmpSecondAuthorizationGp] [int] NULL,
	[AttendancePlanID] [int] NULL,
	[EmpPosDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternID] [int] NULL,
	[RosterTableGroupID] [int] NULL,
	[EmpPosIsRosterTableGroupSupervisor] [int] NULL,
	[EmpPosRemark] [ntext] NULL,
	[AuthorizationWorkFlowIDLeaveApp] [int] NULL,
	[AuthorizationWorkFlowIDEmpInfoModified] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[EmpPosIsLeavePlanResetEffectiveDate] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	AuthorizationWorkFlowIDOTClaims INT NULL,
 CONSTRAINT [PK_EmpPositionInfo] PRIMARY KEY CLUSTERED 
(
	[EmpPosID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpCostCenterDetail]    Script Date: 07/29/2014 15:56:34 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpCostCenterDetail](
	[EmpCostCenterDetailID] [int] IDENTITY(1,1) NOT NULL,
	[EmpCostCenterID] [int] NULL,
	[CostCenterID] [int] NULL,
	[EmpCostCenterPercentage] [real] NULL,
	[EmpCostCenterDetailIsDefault] [int] NULL,
 CONSTRAINT [PK_EmpCostCenterDetail] PRIMARY KEY CLUSTERED 
(
	[EmpCostCenterDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpTrainingEnroll]    Script Date: 07/29/2014 15:57:31 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpTrainingEnroll](
	[EmpTrainingEnrollID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[TrainingSeminarID] [int] NULL,
 CONSTRAINT [PK_EmpTrainingEnroll] PRIMARY KEY CLUSTERED 
(
	[EmpTrainingEnrollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ALProrataRoundingRule]    Script Date: 07/29/2014 15:55:29 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ALProrataRoundingRule](
	[ALProrataRoundingRuleID] [int] IDENTITY(1,1) NOT NULL,
	[ALProrataRoundingRuleCode] [nvarchar](200) NULL,
	[ALProrataRoundingRuleDesc] [nvarchar](255) NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[ALProrataRoundingRuleDetail]    Script Date: 07/29/2014 15:55:29 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ALProrataRoundingRuleDetail](
	[ALProrataRoundingRuleDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ALProrataRoundingRuleID] [int] NOT NULL,
	[ALProrataRoundingRuleDetailRangeTo] [real] NOT NULL,
	[ALProrataRoundingRuleDetailRoundTo] [real] NOT NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpPayroll]    Script Date: 07/29/2014 15:56:54 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpPayroll](
	[EmpPayrollID] [int] IDENTITY(1,1) NOT NULL,
	[PayPeriodID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpPayStatus] [nvarchar](1) NULL,
	[PayBatchID] [int] NULL,
	[EmpPayIsRP] [nvarchar](1) NULL,
	[EmpPayIsCND] [nvarchar](1) NULL,
	[EmpPayIsYEB] [nvarchar](1) NULL,
	[EmpPayIsHistoryAdj] [nvarchar](1) NULL,
	[EmpPayTrialRunDate] [datetime] NULL,
	[EmpPayTrialRunBy] [int] NULL,
	[EmpPayConfirmDate] [datetime] NULL,
	[EmpPayConfirmBy] [int] NULL,
	[EmpPayNumOfDayCount] [real] NULL,
	[EmpPayValueDate] [datetime] NULL,
	[EmpPayTotalWorkingHours] [real] NULL,
	[EmpPayIsAdditionalRemuneration] [nvarchar](1) NULL,
	[EmpPayRemark] [ntext] NULL,
 CONSTRAINT [PK_EmpPayroll] PRIMARY KEY CLUSTERED 
(
	[EmpPayrollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpFinalPayment]    Script Date: 07/29/2014 15:56:46 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpFinalPayment](
	[EmpFinalPayID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[PayCodeID] [int] NULL,
	[EmpFinalPayAmount] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[EmpFinalPayMethod] [nvarchar](50) NULL,
	[EmpAccID] [int] NULL,
	[EmpFinalPayIsAutoGen] [int] NULL,
	[EmpFinalPayNumOfDayAdj] [real] NULL,
	[LeaveAppID] [int] NULL,
	[PayRecID] [nvarchar](10) NULL,
	[EmpFinalPayRemark] [ntext] NULL,
	[LeaveAppIDList] [ntext] NULL,
	[EmpFinalPayIsRestDayPayment] [int] NULL,
	[CostCenterID] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpFinalPayment] PRIMARY KEY CLUSTERED 
(
	[EmpFinalPayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AVCPlanPaymentCeiling]    Script Date: 07/29/2014 15:56:02 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AVCPlanPaymentCeiling](
	[AVCPlanPaymentCeilingID] [int] IDENTITY(1,1) NOT NULL,
	[AVCPlanID] [int] NULL,
	[PaymentCodeID] [int] NULL,
	[AVCPlanPaymentCeilingAmount] [real] NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserCompany]    Script Date: 07/29/2014 15:59:51 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserCompany](
	[UserCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_UserCompany] PRIMARY KEY CLUSTERED 
(
	[UserCompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpHierarchy]    Script Date: 07/29/2014 15:56:47 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpHierarchy](
	[EmpHierarchyID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpPosID] [int] NULL,
	[HElementID] [int] NULL,
	[HLevelID] [int] NULL,
 CONSTRAINT [PK_EmpHierarchy] PRIMARY KEY CLUSTERED 
(
	[EmpHierarchyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AVCPlanPaymentConsider]    Script Date: 07/29/2014 15:56:03 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AVCPlanPaymentConsider](
	[AVCPlanPaymentConsiderID] [int] IDENTITY(1,1) NOT NULL,
	[AVCPlanID] [int] NULL,
	[PaymentCodeID] [int] NULL,
	[AVCPlanPaymentConsiderAfterMPF] [int] NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[Authorizer]    Script Date: 07/29/2014 15:55:56 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Authorizer](
	[AuthorizerID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[AuthorizationGroupID] [int] NULL,
	[AuthorizerIsReadOnly] [int] NULL,
	[AuthorizerSkipEmailAlert] [int] NULL,
 CONSTRAINT [PK_Authorizer] PRIMARY KEY CLUSTERED 
(
	[AuthorizerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmploymentType]    Script Date: 07/29/2014 15:56:47 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmploymentType](
	[EmploymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentTypeCode] [nvarchar](20) NULL,
	[EmploymentTypeDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_EmploymentType] PRIMARY KEY CLUSTERED 
(
	[EmploymentTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TrainingSeminar]    Script Date: 07/29/2014 15:59:48 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TrainingSeminar](
	[TrainingSeminarID] [int] IDENTITY(1,1) NOT NULL,
	[TrainingCourseID] [int] NULL,
	[TrainingSeminarDesc] [nvarchar](250) NULL,
	[TrainingSeminarDateFrom] [datetime] NULL,
	[TrainingSeminarDateTo] [datetime] NULL,
	[TrainingSeminarDuration] [real] NULL,
	[TrainingSeminarDurationUnit] [nvarchar](1) NULL,
	[TrainingSeminarTrainer] [nvarchar](250) NULL,
 CONSTRAINT [PK_TrainingSeminar] PRIMARY KEY CLUSTERED 
(
	[TrainingSeminarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpMPFPlan]    Script Date: 07/29/2014 15:56:49 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpMPFPlan](
	[EmpMPFID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpMPFEffFr] [datetime] NULL,
	[EmpMPFEffTo] [datetime] NULL,
	[MPFPlanID] [int] NULL,
	[EmpMPFPlanExtendData] [ntext] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpMPFPlan] PRIMARY KEY CLUSTERED 
(
	[EmpMPFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[RequestEmpPersonalInfo]    Script Date: 07/29/2014 15:59:01 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RequestEmpPersonalInfo](
	[RequestEmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[RequestEmpAlias] [nvarchar](255) NULL,
	[RequestEmpMaritalStatus] [nvarchar](100) NULL,
	[RequestEmpPassportNo] [nvarchar](255) NULL,
	[RequestEmpPassportIssuedCountry] [nvarchar](255) NULL,
	[RequestEmpNationality] [nvarchar](255) NULL,
	[RequestEmpPassportExpiryDate] [datetime] NULL,
	[RequestEmpHomePhoneNo] [nvarchar](255) NULL,
	[RequestEmpMobileNo] [nvarchar](255) NULL,
	[RequestEmpOfficePhoneNo] [nvarchar](255) NULL,
	[RequestEmpEmail] [nvarchar](255) NULL,
	[RequestEmpResAddr] [nvarchar](255) NULL,
	[RequestEmpCorAdd] [nvarchar](255) NULL,
	[RequestEmpCreateDate] [datetime] NULL,
	[RequestEmpResAddrAreaCode] [nvarchar](100) NULL,
 CONSTRAINT [PK_RequestEmpPersonalInfo] PRIMARY KEY CLUSTERED 
(
	[RequestEmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpORSOPlan]    Script Date: 07/29/2014 15:56:51 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpORSOPlan](
	[EmpORSOID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpORSOEffFr] [datetime] NULL,
	[EmpORSOEffTo] [datetime] NULL,
	[ORSOPlanID] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpORSOPlan] PRIMARY KEY CLUSTERED 
(
	[EmpORSOID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClaimsAndDeductionsImportBatch]    Script Date: 07/29/2014 15:56:08 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClaimsAndDeductionsImportBatch](
	[CNDImportBatchID] [int] IDENTITY(1,1) NOT NULL,
	[CNDImportBatchDateTime] [datetime] NULL,
	[CNDImportBatchUploadedBy] [int] NULL,
	[CNDImportBatchRemark] [ntext] NULL,
 CONSTRAINT [PK_ClaimsAndDeductionImportBatch] PRIMARY KEY CLUSTERED 
(
	[CNDImportBatchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ORSOPlan]    Script Date: 07/29/2014 15:58:25 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ORSOPlan](
	[ORSOPlanID] [int] IDENTITY(1,1) NOT NULL,
	[ORSOPlanCode] [nvarchar](20) NULL,
	[ORSOPlanDesc] [nvarchar](100) NULL,
	[ORSOPlanSchemeNo] [nvarchar](100) NULL,
	[ORSOPlanCompanyName] [nvarchar](100) NULL,
	[ORSOPlanPayCenter] [nvarchar](20) NULL,
	[ORSOPlanMaxEmployerVC] [decimal](15, 2) NULL,
	[ORSOPlanMaxEmployeeVC] [decimal](15, 2) NULL,
	[ORSOPlanEmployerDecimalPlace] [int] NULL,
	[ORSOPlanEmployerRoundingRule] [nvarchar](50) NULL,
	[ORSOPlanEmployeeDecimalPlace] [int] NULL,
	[ORSOPlanEmployeeRoundingRule] [nvarchar](50) NULL,
 CONSTRAINT [PK_ORSOPlan] PRIMARY KEY CLUSTERED 
(
	[ORSOPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TimeCardRecord]    Script Date: 07/29/2014 15:59:46 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TimeCardRecord](
	[TimeCardRecordID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[TimeCardRecordCardNo] [nvarchar](20) NULL,
	[TimeCardRecordDateTime] [datetime] NULL,
	[TimeCardRecordLocation] [nvarchar](50) NULL,
	[TimeCardRecordInOutIndex] [int] NULL,
	[TimeCardRecordOriginalData] [nvarchar](450) NULL,
 CONSTRAINT [PK_TimeCardRecord] PRIMARY KEY CLUSTERED 
(
	[TimeCardRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[BankList]    Script Date: 07/29/2014 15:56:03 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[BankList](
	[BankCode] [nvarchar](3) NOT NULL,
	[BankName] [nvarchar](200) NULL,
 CONSTRAINT [PK_BankList] PRIMARY KEY CLUSTERED 
(
	[BankCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeavePlanEntitle]    Script Date: 07/29/2014 15:58:07 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeavePlanEntitle](
	[LeavePlanEntitleID] [int] IDENTITY(1,1) NOT NULL,
	[LeavePlanID] [int] NULL,
	[LeaveTypeID] [int] NULL,
	[LeavePlanEntitleYearOfService] [int] NULL,
	[LeavePlanEntitleDays] [real] NULL,
 CONSTRAINT [PK__LeavePlanEntitle__18EBB532] PRIMARY KEY CLUSTERED 
(
	[LeavePlanEntitleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AttendanceFormula]    Script Date: 07/29/2014 15:55:31 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AttendanceFormula](
	[AttendanceFormulaID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceFormulaCode] [nvarchar](20) NULL,
	[AttendanceFormulaDesc] [nvarchar](100) NULL,
	[AttendanceFormulaType] [nvarchar](1) NULL,
	[AttendanceFormulaPayFormID] [int] NULL,
	[AttendanceFormulaWorkHourPerDay] [real] NULL,
	[AttendanceFormulaFixedRate] [decimal](15, 2) NULL,
	[AttendanceFormulaDecimalPlace] [int] NULL,
	[AttendanceFormulaRoundingRule] [nvarchar](50) NULL,
	[AttendanceFormulaIsUseRosterCodeForDefaultWorkHourPerDay] [int] NULL,
 CONSTRAINT [PK_AttendanceFormula] PRIMARY KEY CLUSTERED 
(
	[AttendanceFormulaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpWorkInjuryRecord]    Script Date: 07/29/2014 15:57:39 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpWorkInjuryRecord](
	[EmpWorkInjuryRecordID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpWorkInjuryRecordAccidentDate] [datetime] NULL,
	[EmpWorkInjuryRecordAccidentLocation] [nvarchar](100) NULL,
	[EmpWorkInjuryRecordAccidentReason] [nvarchar](100) NULL,
	[EmpWorkInjuryRecordInjuryNature] [nvarchar](50) NULL,
	[EmpWorkInjuryRecordReportedDate] [datetime] NULL,
	[EmpWorkInjuryRecordChequeReceivedDate] [datetime] NULL,
	[EmpWorkInjuryRecordSettleDate] [datetime] NULL,
	[EmpWorkInjuryRecordRemark] [ntext] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpWorkInjuryRecord] PRIMARY KEY CLUSTERED 
(
	[EmpWorkInjuryRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpQualification]    Script Date: 07/29/2014 15:57:14 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpQualification](
	[EmpQualificationID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[QualificationID] [int] NULL,
	[EmpQualificationFrom] [datetime] NULL,
	[EmpQualificationTo] [datetime] NULL,
	[EmpQualificationInstitution] [nvarchar](100) NULL,
	[EmpQualificationRemark] [ntext] NULL,
	[EmpQualificationLearningMethod] [nvarchar](255) NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpQualification] PRIMARY KEY CLUSTERED 
(
	[EmpQualificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PublicHoliday]    Script Date: 07/29/2014 15:58:56 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PublicHoliday](
	[PublicHolidayID] [int] IDENTITY(1,1) NOT NULL,
	[PublicHolidayDate] [datetime] NULL,
	[PublicHolidayDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_PublicHoliday] PRIMARY KEY CLUSTERED 
(
	[PublicHolidayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RosterCodeDetail]    Script Date: 07/29/2014 15:59:18 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RosterCodeDetail](
	[RosterCodeDetailID] [int] IDENTITY(1,1) NOT NULL,
	[RosterCodeID] [int] NULL,
	[RosterCodeDetailNoOfHour] [real] NULL,
	[RosterCodeDetailRate] [real] NULL,
 CONSTRAINT [PK_RosterCodeDetail] PRIMARY KEY CLUSTERED 
(
	[RosterCodeDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpRecurringPayment]    Script Date: 07/29/2014 15:57:18 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpRecurringPayment](
	[EmpRPID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpRPEffFr] [datetime] NULL,
	[EmpRPEffTo] [datetime] NULL,
	[PayCodeID] [int] NULL,
	[EmpRPAmount] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[EmpRPUnit] [nvarchar](1) NULL,
	[EmpRPMethod] [nvarchar](1) NULL,
	[EmpAccID] [int] NULL,
	[EmpRPRemark] [ntext] NULL,
	[EmpRPIsNonPayrollItem] [int] NULL,
	[CostCenterID] [int] NULL,
	[EmpRPUnitPeriodAsDaily] [int] NULL,
	[EmpRPUnitPeriodAsDailyPayFormID] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	SchemeCode nvarchar(24) NULL,
	Capacity nvarchar(255) NULL,
	Point decimal(5,2) NULL,		
	EmpRPBasicSalary decimal(15, 4) NULL,
	EmpRPFPS decimal(15, 4) NULL,
	EmpRPOTCAmount decimal(15, 4) NULL,
CONSTRAINT [PK_EmpRecurringPayment] PRIMARY KEY CLUSTERED 
(
	[EmpRPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
			

/****** Object:  Table [dbo].[WorkHourPattern]    Script Date: 07/29/2014 16:00:04 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[WorkHourPattern](
	[WorkHourPatternID] [int] IDENTITY(1,1) NOT NULL,
	[WorkHourPatternCode] [nvarchar](20) NULL,
	[WorkHourPatternDesc] [nvarchar](100) NULL,
	[WorkHourPatternWorkDayDetermineMethod] [nvarchar](10) NULL,
	[WorkHourPatternSunDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternSunDefaultDayUnit] [real] NULL,
	[WorkHourPatternMonDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternMonDefaultDayUnit] [real] NULL,
	[WorkHourPatternTueDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternTueDefaultDayUnit] [real] NULL,
	[WorkHourPatternWedDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternWedDefaultDayUnit] [real] NULL,
	[WorkHourPatternThuDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternThuDefaultDayUnit] [real] NULL,
	[WorkHourPatternFriDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternFriDefaultDayUnit] [real] NULL,
	[WorkHourPatternSatDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternSatDefaultDayUnit] [real] NULL,
	[WorkHourPatternUseStatutoryHolidayTable] [int] NULL,
	[WorkHourPatternUsePublicHolidayTable] [int] NULL,
	[WorkHourPatternStatutoryHolidayDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternPublicHolidayDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternContractWorkHoursPerDay] [real] NULL,
	[WorkHourPatternContractLunchTimeHoursPerDay] [real] NULL,
	[WorkHourPatternSunWorkHoursPerDay] [real] NULL,
	[WorkHourPatternSunLunchTimeHoursPerDay] [real] NULL,
	[WorkHourPatternMonWorkHoursPerDay] [real] NULL,
	[WorkHourPatternMonLunchTimeHoursPerDay] [real] NULL,
	[WorkHourPatternTueWorkHoursPerDay] [real] NULL,
	[WorkHourPatternTueLunchTimeHoursPerDay] [real] NULL,
	[WorkHourPatternWedWorkHoursPerDay] [real] NULL,
	[WorkHourPatternWedLunchTimeHoursPerDay] [real] NULL,
	[WorkHourPatternThuWorkHoursPerDay] [real] NULL,
	[WorkHourPatternThuLunchTimeHoursPerDay] [real] NULL,
	[WorkHourPatternFriWorkHoursPerDay] [real] NULL,
	[WorkHourPatternFriLunchTimeHoursPerDay] [real] NULL,
	[WorkHourPatternSatWorkHoursPerDay] [real] NULL,
	[WorkHourPatternSatLunchTimeHoursPerDay] [real] NULL,
 CONSTRAINT [PK_WorkHourPattern] PRIMARY KEY CLUSTERED 
(
	[WorkHourPatternID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpRequest]    Script Date: 07/29/2014 15:57:20 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpRequest](
	[EmpRequestID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpRequestType] [nvarchar](50) NULL,
	[EmpRequestRecordID] [int] NULL,
	[EmpRequestCreateDate] [datetime] NULL,
	[EmpRequestModifyDate] [datetime] NULL,
	[EmpRequestStatusCode] [nvarchar](50) NULL,
	[EmpRequestRejectReason] [ntext] NULL,
	[EmpRequestStatus] [nvarchar](50) NULL,
	[EmpRequestLastAuthorizationWorkFlowIndex] [int] NULL,
	[EmpRequestLastActionBy] [nvarchar](255) NULL,
	[EmpRequestLastActionByEmpID] [int] NULL,
 CONSTRAINT [PK_EmpRequest] PRIMARY KEY CLUSTERED 
(
	[EmpRequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmailLog]    Script Date: 07/29/2014 15:56:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmailLog](
	[EmailLogID] [int] IDENTITY(1,1) NOT NULL,
	[EmailLogToAddress] [ntext] NULL,
	[EmailLogStartTime] [datetime] NULL,
	[EmailLogEndTime] [datetime] NULL,
	[EmailLogTrialCount] [int] NULL,
	[EmailLogIsFail] [int] NULL,
	[EmailLogErrorMessage] [ntext] NULL,
 CONSTRAINT [PK_EmailLog] PRIMARY KEY CLUSTERED 
(
	[EmailLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[RosterTable]    Script Date: 07/29/2014 15:59:19 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RosterTable](
	[RosterTableID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[RosterTableDate] [datetime] NULL,
	[RosterCodeID] [int] NULL,
	[LeaveAppID] [int] NULL,
	[RosterTableOverrideInTime] [datetime] NULL,
	[RosterTableOverrideOutTime] [datetime] NULL,
 CONSTRAINT [PK_RosterTable] PRIMARY KEY CLUSTERED 
(
	[RosterTableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpSkill]    Script Date: 07/29/2014 15:57:25 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpSkill](
	[EmpSkillID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[SkillID] [int] NULL,
	[SkillLevelID] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpSkill] PRIMARY KEY CLUSTERED 
(
	[EmpSkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RequestLeaveApplication]    Script Date: 07/29/2014 15:59:04 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RequestLeaveApplication](
	[RequestLeaveAppID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[RequestLeaveCodeID] [int] NULL,
	[RequestLeaveAppUnit] [nvarchar](50) NULL,
	[RequestLeaveAppDateFrom] [datetime] NULL,
	[RequestLeaveAppDateTo] [datetime] NULL,
	[RequestLeaveAppTimeFrom] [datetime] NULL,
	[RequestLeaveAppTimeTo] [datetime] NULL,
	[RequestLeaveDays] [real] NULL,
	[RequestLeaveAppRemark] [ntext] NULL,
	[RequestLeaveAppCreateDate] [datetime] NULL,
	[RequestLeaveAppHasMedicalCertificate] [int] NULL,
	[RequestLeaveAppHours] [float] NULL,
 CONSTRAINT [PK_RequestLeaveApplication] PRIMARY KEY CLUSTERED 
(
	[RequestLeaveAppID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpWorkingSummary]    Script Date: 07/29/2014 15:57:36 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpWorkingSummary](
	[EmpWorkingSummaryID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpWorkingSummaryAsOfDate] [datetime] NULL,
	[EmpWorkingSummaryRestDayEntitled] [real] NULL,
	[EmpWorkingSummaryRestDayTaken] [real] NULL,
	[EmpWorkingSummaryTotalWorkingDays] [real] NULL,
	[EmpWorkingSummaryTotalWorkingHours] [real] NULL,
	[EmpWorkingSummaryTotalLunchTimeHours] [real] NULL,
 CONSTRAINT [PK_EmpWorkingSummary] PRIMARY KEY CLUSTERED 
(
	[EmpWorkingSummaryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpTermination]    Script Date: 07/29/2014 15:57:30 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpTermination](
	[EmpTermID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[CessationReasonID] [int] NULL,
	[EmpTermResignDate] [datetime] NULL,
	[EmpTermNoticePeriod] [int] NULL,
	[EmpTermNoticeUnit] [nvarchar](1) NULL,
	[EmpTermLastDate] [datetime] NULL,
	[EmpTermRemark] [ntext] NULL,
	[EmpTermIsTransferCompany] [int] NULL,
	[NewEmpID] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpTermination] PRIMARY KEY CLUSTERED 
(
	[EmpTermID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AttendanceRecord]    Script Date: 07/29/2014 15:55:49 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AttendanceRecord](
	[AttendanceRecordID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[AttendanceRecordDate] [datetime] NULL,
	[RosterCodeID] [int] NULL,
	[RosterTableID] [int] NULL,
	[AttendanceRecordWorkStart] [datetime] NULL,
	[AttendanceRecordWorkEnd] [datetime] NULL,
	[AttendanceRecordLunchOut] [datetime] NULL,
	[AttendanceRecordLunchIn] [datetime] NULL,
	[AttendanceRecordCalculateLateMins] [int] NULL,
	[AttendanceRecordActualLateMins] [int] NULL,
	[AttendanceRecordCalculateEarlyLeaveMins] [int] NULL,
	[AttendanceRecordActualEarlyLeaveMins] [int] NULL,
	[AttendanceRecordCalculateOvertimeMins] [int] NULL,
	[AttendanceRecordActualOvertimeMins] [int] NULL,
	[AttendanceRecordCalculateWorkingDay] [real] NULL,
	[AttendanceRecordActualWorkingDay] [real] NULL,
	[AttendanceRecordCalculateWorkingHour] [real] NULL,
	[AttendanceRecordActualWorkingHour] [real] NULL,
	[AttendanceRecordIsAbsent] [int] NULL,
	[AttendanceRecordRemark] [ntext] NULL,
	[AttendanceRecordOverrideBonusEntitled] [int] NULL,
	[AttendanceRecordHasBonus] [int] NULL,
	[AttendanceRecordExtendData] [ntext] NULL,
	[AttendanceRecordCalculateLunchTimeMins] [int] NULL,
	[AttendanceRecordActualLunchTimeMins] [int] NULL,
	[AttendanceRecordWorkStartLocation] [nvarchar](255) NULL,
	[AttendanceRecordWorkEndLocation] [nvarchar](255) NULL,
	[AttendanceRecordLunchOutLocation] [nvarchar](255) NULL,
	[AttendanceRecordLunchInLocation] [nvarchar](255) NULL,
	[AttendanceRecordCalculateLunchLateMins] [int] NULL,
	[AttendanceRecordActualLunchLateMins] [int] NULL,
	[AttendanceRecordCalculateLunchEarlyLeaveMins] [int] NULL,
	[AttendanceRecordActualLunchEarlyLeaveMins] [int] NULL,
	[AttendanceRecordRosterCodeInTimeOverride] [datetime] NULL,
	[AttendanceRecordRosterCodeOutTimeOverride] [datetime] NULL,
	[AttendanceRecordRosterCodeLunchStartTimeOverride] [datetime] NULL,
	[AttendanceRecordRosterCodeLunchEndTimeOverride] [datetime] NULL,
	[AttendanceRecordWorkStartTimeCardRecordID] [int] NULL,
	[AttendanceRecordWorkEndTimeCardRecordID] [int] NULL,
	[AttendanceRecordLunchOutTimeCardRecordID] [int] NULL,
	[AttendanceRecordLunchInTimeCardRecordID] [int] NULL,
	[AttendanceRecordCalculateLunchOvertimeMins] [int] NULL,
	[AttendanceRecordActualLunchOvertimeMins] [int] NULL,
	[LeaveAppID] [int] NULL,
	[AttendanceRecordWorkOnRestDay] [int] NULL,
 CONSTRAINT [PK_AttendanceRecord] PRIMARY KEY CLUSTERED 
(
	[AttendanceRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[FinalPayment]    Script Date: 07/29/2014 15:57:42 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[FinalPayment](
	[FinalPayID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[PayCodeID] [int] NULL,
	[FinalPayAmount] [decimal](15, 4) NULL,
	[Currency] [nvarchar](50) NULL,
	[EmpFinalPayMethod] [nvarchar](50) NULL,
	[EmpAccID] [int] NULL,
	[EmpFinalPayRemark] [nvarchar](50) NULL,
	[EmpFialPayIsAutoGen] [nchar](10) NULL,
 CONSTRAINT [PK_FinalPayment] PRIMARY KEY CLUSTERED 
(
	[FinalPayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MinimumWage]    Script Date: 07/29/2014 15:58:12 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MinimumWage](
	[MinimumWageID] [int] IDENTITY(1,1) NOT NULL,
	[MinimumWageEffectiveDate] [datetime] NULL,
	[MinimumWageHourlyRate] [real] NULL,
 CONSTRAINT [PK_MinimumWage] PRIMARY KEY CLUSTERED 
(
	[MinimumWageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RosterTableGroup]    Script Date: 07/29/2014 15:59:20 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RosterTableGroup](
	[RosterTableGroupID] [int] IDENTITY(1,1) NOT NULL,
	[RosterTableGroupCode] [nvarchar](200) NULL,
	[RosterTableGroupDesc] [nvarchar](255) NULL,
	[RosterClientID] [int] NULL,
	[RosterClientSiteID] [int] NULL,
	[RosterTableGroupExtendData] [ntext] NULL,
 CONSTRAINT [PK_RosterTableGroup] PRIMARY KEY CLUSTERED 
(
	[RosterTableGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[HierarchyLevel]    Script Date: 07/29/2014 15:57:44 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[HierarchyLevel](
	[HLevelID] [int] IDENTITY(1,1) NOT NULL,
	[HLevelCode] [nvarchar](20) NULL,
	[HLevelDesc] [nvarchar](100) NULL,
	[HLevelSeqNo] [int] NULL,
 CONSTRAINT [PK_HierarchyLevel] PRIMARY KEY CLUSTERED 
(
	[HLevelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CompensationLeaveEntitle]    Script Date: 07/29/2014 15:56:15 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CompensationLeaveEntitle](
	[CompensationLeaveEntitleID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[CompensationLeaveEntitleEffectiveDate] [datetime] NULL,
	[CompensationLeaveEntitleClaimPeriodFrom] [datetime] NULL,
	[CompensationLeaveEntitleClaimPeriodTo] [datetime] NULL,
	[CompensationLeaveEntitleClaimHourFrom] [datetime] NULL,
	[CompensationLeaveEntitleClaimHourTo] [datetime] NULL,
	[CompensationLeaveEntitleHoursClaim] [float] NULL,
	[CompensationLeaveEntitleApprovedBy] [nvarchar](255) NULL,
	[CompensationLeaveEntitleRemark] [ntext] NULL,
	[CompensationLeaveEntitleIsAutoGenerated] [int] NULL,
	[CompensationLeaveEntitleDateExpiry] [datetime] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_CompensationLeaveEntitle] PRIMARY KEY CLUSTERED 
(
	[CompensationLeaveEntitleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[LeaveApplication]    Script Date: 07/29/2014 15:57:52 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeaveApplication](
	[LeaveAppID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[LeaveCodeID] [int] NULL,
	[LeaveAppUnit] [nvarchar](1) NULL,
	[LeaveAppDateFrom] [datetime] NULL,
	[LeaveAppDateTo] [datetime] NULL,
	[LeaveAppTimeFrom] [datetime] NULL,
	[LeaveAppTimeTo] [datetime] NULL,
	[LeaveAppDays] [decimal](15, 4) NULL,
	[LeaveAppRemark] [ntext] NULL,
	[LeaveAppHasMedicalCertificate] [int] NULL,
	[LeaveAppNoPayProcess] [int] NULL,
	[EmpPaymentID] [int] NULL,
	[EmpPayrollID] [int] NULL,
	[LeaveAppHours] [float] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[LeaveAppCancelID] [int] NULL,
	[EmpRequestID] [int] NULL,
	[RequestLeaveAppID] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_LeaveApplication] PRIMARY KEY CLUSTERED 
(
	[LeaveAppID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[SystemFunctionEmailAlert]    Script Date: 07/29/2014 15:59:25 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SystemFunctionEmailAlert](
	[SystemFunctionEmailAlertID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionID] [int] NULL,
	[SystemFunctionEmailAlertInsert] [int] NULL,
	[SystemFunctionEmailAlertUpdate] [int] NULL,
	[SystemFunctionEmailAlertDelete] [int] NULL,
 CONSTRAINT [PK_SystemFunctionEmailAlert] PRIMARY KEY CLUSTERED 
(
	[SystemFunctionEmailAlertID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeaveBalance]    Script Date: 07/29/2014 15:57:55 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeaveBalance](
	[LeaveBalanceID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[LeaveTypeID] [int] NULL,
	[LeaveBalanceEffectiveDate] [datetime] NULL,
	[LeaveBalanceBF] [real] NULL,
	[LeaveBalanceForfeiture] [real] NULL,
	[LeaveBalanceEntitled] [real] NULL,
	[LeaveBalancePeriod] [int] NULL,
	[LeaveBalanceIsSettlement] [smallint] NULL,
	[LeaveBalanceIsFirst] [smallint] NULL,
 CONSTRAINT [PK_LeaveBalance] PRIMARY KEY CLUSTERED 
(
	[LeaveBalanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TimeCardLocationMap]    Script Date: 07/29/2014 15:59:44 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TimeCardLocationMap](
	[TimeCardLocationMapID] [int] IDENTITY(1,1) NOT NULL,
	[TimeCardLocationMapOriginalCode] [nvarchar](50) NULL,
	[TimeCardLocationMapNewCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_TimeCardLocationMap] PRIMARY KEY CLUSTERED 
(
	[TimeCardLocationMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeaveBalanceAdjustment]    Script Date: 07/29/2014 15:57:57 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeaveBalanceAdjustment](
	[LeaveBalAdjID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[LeaveBalAdjDate] [datetime] NULL,
	[LeaveTypeID] [int] NULL,
	[LeaveBalAdjType] [nvarchar](50) NULL,
	[LeaveBalAdjValue] [real] NULL,
	[LeaveBalAdjRemark] [ntext] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_LeaveBalanceAdjustment] PRIMARY KEY CLUSTERED 
(
	[LeaveBalAdjID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[InboxAttachment]    Script Date: 07/29/2014 15:57:48 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[InboxAttachment](
	[InboxAttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[InboxID] [int] NULL,
	[InboxAttachmentOriginalFileName] [nvarchar](250) NULL,
	[InboxAttachmentStoredFileName] [nvarchar](250) NULL,
	[InboxAttachmentIsCompressed] [int] NULL,
	[InboxAttachmentSize] [bigint] NULL,
 CONSTRAINT [PK_InboxAttachment] PRIMARY KEY CLUSTERED 
(
	[InboxAttachmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PermitType]    Script Date: 07/29/2014 15:58:55 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PermitType](
	[PermitTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PermitTypeCode] [nvarchar](20) NULL,
	[PermitTypeDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_PermitType] PRIMARY KEY CLUSTERED 
(
	[PermitTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeaveCode]    Script Date: 07/29/2014 15:58:02 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeaveCode](
	[LeaveCodeID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveCode] [nvarchar](20) NULL,
	[LeaveCodeDesc] [nvarchar](100) NULL,
	[LeaveTypeID] [int] NULL,
	[LeaveCodePayRatio] [decimal](15, 4) NULL,
	[LeaveCodeLeaveAllowPaymentCodeID] [int] NULL,
	[LeaveCodeLeaveDeductPaymentCodeID] [int] NULL,
	[LeaveCodeLeaveDeductFormula] [int] NULL,
	[LeaveCodeLeaveAllowFormula] [int] NULL,
	[LeaveCodePayAdvance] [int] NULL,
	[PaymentCodeID] [int] NULL,
	[LeaveCodeHideInESS] [int] NULL,
	[LeaveCodeIsSkipPayrollProcess] [int] NULL,
	[LeaveCodeIsPayrollProcessNextMonth] [int] NULL,
	[LeaveCodeUseAllowancePaymentCodeIfSameAmount] [int] NULL,
	[LeaveCodeIsCNDProrata] [int] NULL,
	[LeaveCodeIsShowMedicalCertOption] [int] NULL,
	LeaveAppUnit nvarchar(255) null,
CONSTRAINT [PK_LeaveCode] PRIMARY KEY CLUSTERED 
(
	[LeaveCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CompanyBankAccount]    Script Date: 07/29/2014 15:56:11 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CompanyBankAccount](
	[CompanyBankAccountID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyBankAccountBankCode] [nvarchar](30) NULL,
	[CompanyBankAccountBranchCode] [nvarchar](30) NULL,
	[CompanyBankAccountAccountNo] [nvarchar](255) NULL,
	[CompanyBankAccountHolderName] [nvarchar](255) NULL,
 CONSTRAINT [PK_CompanyBankAccount] PRIMARY KEY CLUSTERED 
(
	[CompanyBankAccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpPermit]    Script Date: 07/29/2014 15:56:57 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpPermit](
	[EmpPermitID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[PermitTypeID] [int] NULL,
	[EmpPermitNo] [nvarchar](50) NULL,
	[EmpPermitIssueDate] [datetime] NULL,
	[EmpPermitExpiryDate] [datetime] NULL,
	[EmpPermitRemark] [ntext] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpPermit] PRIMARY KEY CLUSTERED 
(
	[EmpPermitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[CompanyBankAccountMap]    Script Date: 07/29/2014 15:56:12 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CompanyBankAccountMap](
	[CompanyBankAccountMapID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[CompanyBankAccountID] [int] NULL,
 CONSTRAINT [PK_CompanyBankAccountMap] PRIMARY KEY CLUSTERED 
(
	[CompanyBankAccountMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[DocumentType]    Script Date: 07/29/2014 15:56:21 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DocumentType](
	[DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeCode] [nvarchar](20) NULL,
	[DocumentTypeDesc] [nvarchar](100) NULL,
	[DocumentTypeIsSystem] [int] NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpDocument]    Script Date: 07/29/2014 15:56:38 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpDocument](
	[EmpDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[DocumentTypeID] [int] NULL,
	[EmpDocumentOriginalFileName] [nvarchar](250) NULL,
	[EmpDocumentDesc] [nvarchar](250) NULL,
	[EmpDocumentStoredFileName] [nvarchar](250) NULL,
	[EmpDocumentIsCompressed] [int] NULL,
	[EmpDocumentIsProfilePhoto] [int] NULL,
 CONSTRAINT [PK_EmpDocument] PRIMARY KEY CLUSTERED 
(
	[EmpDocumentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeaveType]    Script Date: 07/29/2014 15:58:10 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeaveType](
	[LeaveTypeID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveType] [nvarchar](20) NULL,
	[LeaveTypeDesc] [nvarchar](100) NULL,
	[LeaveDecimalPlace] [int] NULL,
	[LeaveSystemUse] [int] NULL,
	[LeaveTypeIsUseWorkHourPattern] [int] NULL,
	[LeaveTypeIsSkipStatutoryHolidayChecking] [int] NULL,
	[LeaveTypeIsSkipPublicHolidayChecking] [int] NULL,
	[LeaveTypeIsESSHideLeaveBalance] [int] NULL,
	[LeaveTypeIsESSRestrictNegativeBalanceAsOfToday] [int] NULL,
	[LeaveTypeIsESSRestrictNegativeBalanceAsOfApplicationDateFrom] [int] NULL,
	[LeaveTypeIsESSRestrictNegativeBalanceAsOfApplicationDateTo] [int] NULL,
	[LeaveTypeIsESSRestrictNegativeBalanceAsOfEndOfLeaveYear] [int] NULL,
	[LeaveTypeIsDisabled] [int] NULL,
	[LeaveTypeIsESSIgnoreEntitlement] [int] NULL, 
 CONSTRAINT [PK_LeaveType] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PayrollGroupLeaveCodeSetupOverride]    Script Date: 07/29/2014 15:58:49 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PayrollGroupLeaveCodeSetupOverride](
	[PayrollGroupLeaveCodeSetupOverrideID] [int] IDENTITY(1,1) NOT NULL,
	[PayGroupID] [int] NULL,
	[LeaveCodeID] [int] NULL,
	[PayrollGroupLeaveCodeSetupLeaveAllowPaymentCodeID] [int] NULL,
	[PayrollGroupLeaveCodeSetupLeaveAllowFormula] [int] NULL,
	[PayrollGroupLeaveCodeSetupLeaveDeductPaymentCodeID] [int] NULL,
	[PayrollGroupLeaveCodeSetupLeaveDeductFormula] [int] NULL,
 CONSTRAINT [PK_PayrollGroupLeaveCodeSetupOverride] PRIMARY KEY CLUSTERED 
(
	[PayrollGroupLeaveCodeSetupOverrideID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MPFParameter]    Script Date: 07/29/2014 15:58:14 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MPFParameter](
	[MPFParamID] [int] IDENTITY(1,1) NOT NULL,
	[MPFParamEffFr] [datetime] NULL,
	[MPFParamMinMonthly] [decimal](15, 4) NULL,
	[MPFParamMaxMonthly] [decimal](15, 4) NULL,
	[MPFParamMinDaily] [decimal](15, 4) NULL,
	[MPFParamMaxDaily] [decimal](15, 4) NULL,
	[MPFParamEEPercent] [decimal](15, 4) NULL,
	[MPFParamERPercent] [decimal](15, 4) NULL,
 CONSTRAINT [PK_MPFParameter] PRIMARY KEY CLUSTERED 
(
	[MPFParamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AuthorizationWorkFlow]    Script Date: 07/29/2014 15:55:54 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AuthorizationWorkFlow](
	[AuthorizationWorkFlowID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorizationWorkFlowCode] [nvarchar](255) NULL,
	[AuthorizationWorkFlowDescription] [nvarchar](255) NULL,
 CONSTRAINT [PK_AuthorizationWorkFlow] PRIMARY KEY CLUSTERED 
(
	[AuthorizationWorkFlowID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RosterCode]    Script Date: 07/29/2014 15:59:16 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RosterCode](
	[RosterCodeID] [int] IDENTITY(1,1) NOT NULL,
	[RosterCode] [nvarchar](20) NULL,
	[RosterCodeDesc] [nvarchar](100) NULL,
	[RosterCodeType] [nvarchar](1) NULL,
	[RosterCodeInTime] [datetime] NULL,
	[RosterCodeOutTime] [datetime] NULL,
	[RosterCodeGraceInTime] [datetime] NULL,
	[RosterCodeGraceOutTime] [datetime] NULL,
	[RosterCodeHasLunch] [int] NULL,
	[RosterCodeLunchStartTime] [datetime] NULL,
	[RosterCodeLunchEndTime] [datetime] NULL,
	[RosterCodeLunchIsDeductWorkingHour] [int] NULL,
	[RosterCodeLunchDeductWorkingHourMinsUnit] [int] NULL,
	[RosterCodeLunchDeductWorkingHourMinsRoundingRule] [nvarchar](50) NULL,
	[RosterCodeHasOT] [int] NULL,
	[RosterCodeOTStartTime] [datetime] NULL,
	[RosterCodeOTEndTime] [datetime] NULL,
	[RosterCodeIsOTStartFromOutTime] [int] NULL,
	[RosterCodeCutOffTime] [datetime] NULL,
	[RosterCodeWorkingDayUnit] [real] NULL,
	[RosterCodeDailyWorkingHour] [real] NULL,
	[RosterCodeCountWorkHourOnly] [int] NULL,
	[RosterCodeCountOTAfterWorkHourMin] [int] NULL,
	[RosterCodeOTMinsUnit] [int] NULL,
	[RosterCodeOTMinsRoundingRule] [nvarchar](50) NULL,
	[RosterClientID] [int] NULL,
	[RosterClientSiteID] [int] NULL,
	[RosterCodeIsOverrideHourlyPayment] [int] NULL,
	[RosterCodeOverrideHoulyAmount] [decimal](15, 4) NULL,
	[LeaveCodeID] [int] NULL,
	[RosterCodeUseHalfWorkingDaysHours] [int] NULL,
	[RosterCodeUseHalfWorkingDaysHoursMaxWorkingHours] [real] NULL,
	[RosterCodeColorCode] [nvarchar](10) NULL,
	[RosterCodeLunchDurationHour] [real] NULL,
	[RosterCodeLunchDeductMinimumWorkHour] [real] NULL,
	[CostCenterID] [int] NULL,
	[RosterCodeOTIncludeLunch] [int] NULL,
	[RosterCodeLateMinsUnit] [int] NULL,
	[RosterCodeLateMinsRoundingRule] [nvarchar](50) NULL,
	[RosterCodeEarlyLeaveMinsUnit] [int] NULL,
	[RosterCodeEarlyLeaveMinsRoundingRule] [nvarchar](50) NULL,
	[RosterCodeLunchLateMinsUnit] [int] NULL,
	[RosterCodeLunchLateMinsRoundingRule] [nvarchar](50) NULL,
	[RosterCodeLunchEarlyLeaveMinsUnit] [int] NULL,
	[RosterCodeLunchEarlyLeaveMinsRoundingRule] [nvarchar](50) NULL,
	[RosterCodeOTShiftStartTimeForLate] [int] NULL,
 CONSTRAINT [PK_RosterCode] PRIMARY KEY CLUSTERED 
(
	[RosterCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MPFPlan]    Script Date: 07/29/2014 15:58:17 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MPFPlan](
	[MPFPlanID] [int] IDENTITY(1,1) NOT NULL,
	[MPFPlanCode] [nvarchar](20) NULL,
	[MPFPlanDesc] [nvarchar](100) NULL,
	[MPFPlanTrusteeName] [nvarchar](100) NULL,
	[MPFPlanSchemeNo] [nvarchar](20) NULL,
	[MPFPlanCompanyName] [nvarchar](100) NULL,
	[MPFPlanCompanyAddress] [nvarchar](200) NULL,
	[MPFPlanContactName] [nvarchar](100) NULL,
	[MPFPlanContactNo] [nvarchar](20) NULL,
	[MPFSchemeID] [int] NULL,
	[MPFPlanParticipationNo] [nvarchar](50) NULL,
	[MPFPlanExtendData] [ntext] NULL,
	[MPFPlanEmployerDecimalPlace] [int] NULL,
	[MPFPlanEmployerRoundingRule] [nvarchar](50) NULL,
	[MPFPlanEmployeeDecimalPlace] [int] NULL,
	[MPFPlanEmployeeRoundingRule] [nvarchar](50) NULL,
 CONSTRAINT [PK_MPFPlan] PRIMARY KEY CLUSTERED 
(
	[MPFPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AuthorizationWorkFlowDetail]    Script Date: 07/29/2014 15:55:55 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AuthorizationWorkFlowDetail](
	[AuthorizationWorkFlowDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorizationWorkFlowID] [int] NULL,
	[AuthorizationWorkFlowIndex] [int] NULL,
	[AuthorizationGroupID] [int] NULL,
 CONSTRAINT [PK_AuthorizationWorkFlowDetail] PRIMARY KEY CLUSTERED 
(
	[AuthorizationWorkFlowDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MPFRecord]    Script Date: 07/29/2014 15:58:20 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MPFRecord](
	[MPFRecordID] [int] IDENTITY(1,1) NOT NULL,
	[EmpPayrollID] [int] NOT NULL,
	[MPFPlanID] [int] NOT NULL,
	[AVCPlanID] [int] NOT NULL,
	[MPFRecPeriodFr] [datetime] NOT NULL,
	[MPFRecPeriodTo] [datetime] NOT NULL,
	[MPFRecType] [nvarchar](1) NOT NULL,
	[MPFRecCalMCRI] [decimal](15, 4) NULL,
	[MPFRecCalMCER] [decimal](15, 4) NULL,
	[MPFRecCalMCEE] [decimal](15, 4) NULL,
	[MPFRecCalVCRI] [decimal](15, 4) NULL,
	[MPFRecCalVCER] [decimal](15, 4) NULL,
	[MPFRecCalVCEE] [decimal](15, 4) NULL,
	[MPFRecActMCRI] [decimal](15, 4) NULL,
	[MPFRecActMCER] [decimal](15, 4) NULL,
	[MPFRecActMCEE] [decimal](15, 4) NULL,
	[MPFRecActVCRI] [decimal](15, 4) NULL,
	[MPFRecActVCER] [decimal](15, 4) NULL,
	[MPFRecActVCEE] [decimal](15, 4) NULL,
	[CostCenterID] [int] NULL,
 CONSTRAINT [PK_MPFRecord] PRIMARY KEY CLUSTERED 
(
	[MPFRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AuthorizerDelegate]    Script Date: 07/29/2014 15:55:57 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AuthorizerDelegate](
	[AuthorizerDelegateID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[AuthorizerDelegateEmpID] [int] NULL,
 CONSTRAINT [PK_AuthorizerDelegate] PRIMARY KEY CLUSTERED 
(
	[AuthorizerDelegateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MPFScheme]    Script Date: 07/29/2014 15:58:21 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MPFScheme](
	[MPFSchemeID] [int] IDENTITY(1,1) NOT NULL,
	[MPFSchemeCode] [nvarchar](20) NOT NULL,
	[MPFSchemeDesc] [nvarchar](100) NOT NULL,
	[MPFSchemeTrusteeCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_MPFScheme] PRIMARY KEY CLUSTERED 
(
	[MPFSchemeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RosterCodeAdditionalPayment]    Script Date: 07/29/2014 15:59:17 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RosterCodeAdditionalPayment](
	[RosterCodeAdditionalPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[RosterCodeID] [int] NULL,
	[PaymentCodeID] [int] NULL,
	[RosterCodeAdditionalPaymentAmount] [float] NULL,
 CONSTRAINT [PK_RosterCodeAdditionalPayment] PRIMARY KEY CLUSTERED 
(
	[RosterCodeAdditionalPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TaxEmp]    Script Date: 07/29/2014 15:59:36 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TaxEmp](
	[TaxEmpID] [int] IDENTITY(1,1) NOT NULL,
	[TaxFormID] [int] NULL,
	[EmpID] [int] NULL,
	[TaxEmpSheetNo] [int] NULL,
	[TaxEmpHKID] [nvarchar](50) NULL,
	[TaxEmpStatus] [nvarchar](1) NULL,
	[TaxEmpSurname] [nvarchar](255) NULL,
	[TaxEmpOtherName] [nvarchar](255) NULL,
	[TaxEmpChineseName] [nvarchar](255) NULL,
	[TaxEmpSex] [nvarchar](100) NULL,
	[TaxEmpMartialStatus] [nvarchar](100) NULL,
	[TaxEmpPassportNo] [nvarchar](255) NULL,
	[TaxEmpIssuedCountry] [nvarchar](255) NULL,
	[TaxEmpSpouseName] [nvarchar](255) NULL,
	[TaxEmpSpouseHKID] [nvarchar](50) NULL,
	[TaxEmpSpousePassportNo] [nvarchar](255) NULL,
	[TaxEmpSpouseIssuedCountry] [nvarchar](255) NULL,
	[TaxEmpResAddr] [nvarchar](255) NULL,
	[TaxEmpResAddrAreaCode] [nvarchar](100) NULL,
	[TaxEmpCorAddr] [nvarchar](255) NULL,
	[TaxEmpCapacity] [nvarchar](255) NULL,
	[TaxEmpPartTimeEmployer] [nvarchar](255) NULL,
	[TaxEmpStartDate] [datetime] NULL,
	[TaxEmpEndDate] [datetime] NULL,
	[TaxEmpCessationReason] [nvarchar](255) NULL,
	[TaxEmpPlaceOfResidenceIndicator] [int] NULL,
	[TaxEmpOvearseasIncomeIndicator] [int] NULL,
	[TaxEmpOverseasCompanyAmount] [nvarchar](20) NULL,
	[TaxEmpOverseasCompanyName] [nvarchar](60) NULL,
	[TaxEmpOverseasCompanyAddress] [nvarchar](60) NULL,
	[TaxEmpTaxFileNo] [nvarchar](13) NULL,
	[TaxEmpRemark] [nvarchar](60) NULL,
	[TaxEmpNewEmployerNameddress] [nvarchar](200) NULL,
	[TaxEmpFutureCorAddr] [nvarchar](200) NULL,
	[TaxEmpLeaveHKDate] [datetime] NULL,
	[TaxEmpIsERBearTax] [nvarchar](1) NULL,
	[TaxEmpIsMoneyHoldByOrdinance] [nvarchar](1) NULL,
	[TaxEmpHoldAmount] [real] NULL,
	[TaxEmpReasonForNotHold] [nvarchar](200) NULL,
	[TaxEmpReasonForDepartureReason] [nvarchar](200) NULL,
	[TaxEmpReasonForDepartureOtherReason] [nvarchar](200) NULL,
	[TaxEmpIsEEReturnHK] [nvarchar](1) NULL,
	[TaxEmpEEReturnHKDate] [datetime] NULL,
	[TaxEmpIsShareOptionsGrant] [nvarchar](1) NULL,
	[TaxEmpShareOptionsGrantCount] [nvarchar](200) NULL,
	[TaxEmpShareOptionsGrantDate] [datetime] NULL,
	[TaxEmpPreviousEmployerNameddress] [nvarchar](200) NULL,
	[TaxEmpGeneratedDate] [datetime] NULL,
	[TaxEmpGeneratedByUserID] [int] NULL,
	[TaxEmpIsReleasePrintoutToESS] [int] NULL,
 CONSTRAINT [PK_TaxEmp] PRIMARY KEY CLUSTERED 
(
	[TaxEmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AttendancePlanAdditionalPayment]    Script Date: 07/29/2014 15:55:42 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AttendancePlanAdditionalPayment](
	[AttendancePlanAdditionalPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[AttendancePlanID] [int] NULL,
	[PaymentCodeID] [int] NULL,
	[AttendancePlanAdditionalPaymentAmount] [float] NULL,
	[AttendancePlanAdditionalPaymentMaxLateMins] [int] NULL,
	[AttendancePlanAdditionalPaymentMaxEarlyLeaveMins] [int] NULL,
	[AttendancePlanAdditionalPaymentMinOvertimeMins] [int] NULL,
	[AttendancePlanAdditionalPaymentRosterAcrossTime] [datetime] NULL,
 CONSTRAINT [PK_AttendancePlanAdditionalPayment] PRIMARY KEY CLUSTERED 
(
	[AttendancePlanAdditionalPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[YEBPlan]    Script Date: 07/29/2014 16:00:07 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[YEBPlan](
	[YEBPlanID] [int] IDENTITY(1,1) NOT NULL,
	[YEBPlanCode] [nvarchar](20) NULL,
	[YEBPlanDesc] [nvarchar](100) NULL,
	[YEBPlanPaymentBaseMethod] [nvarchar](10) NULL,
	[YEBPlanRPPaymentCodeID] [int] NULL,
	[YEBPlanMultiplier] [real] NULL,
	[YEBPlanProrataMethod] [nvarchar](1) NULL,
	[YEBPlanPaymentCodeID] [int] NULL,
	[YEBPlanIsEligibleAfterProbation] [int] NULL,
	[YEBPlanEligiblePeriod] [int] NULL,
	[YEBPlanEligibleUnit] [nvarchar](1) NULL,
	[YEBPlanIsGlobal] [int] NULL,
	[YEBPlanEligiblePeriodIsCheckEveryYEBYear] [int] NULL,
	[YEBPlanEligiblePeriodIsExcludeMax3MonthsProbation] [int] NULL,
 CONSTRAINT [PK_YEBPlan] PRIMARY KEY CLUSTERED 
(
	[YEBPlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ORSOPlanDetail]    Script Date: 07/29/2014 15:58:27 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ORSOPlanDetail](
	[ORSOPlanDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ORSOPlanID] [int] NULL,
	[ORSOPlanDetailYearOfService] [int] NULL,
	[ORSOPlanDetailER] [decimal](15, 2) NULL,
	[ORSOPlanDetailERFix] [decimal](15, 2) NULL,
	[ORSOPlanDetailEE] [decimal](15, 2) NULL,
	[ORSOPlanDetailEEFix] [decimal](15, 2) NULL,
 CONSTRAINT [PK_ORSOPlanDetail] PRIMARY KEY CLUSTERED 
(
	[ORSOPlanDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[eChannelAuthorizedSignature]    Script Date: 07/29/2014 15:56:21 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[eChannelAuthorizedSignature](
	[eChannelAuthorizedSignatureID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_eChannelAuthorizedSignature] PRIMARY KEY CLUSTERED 
(
	[eChannelAuthorizedSignatureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpExtraField]    Script Date: 07/29/2014 15:56:41 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpExtraField](
	[EmpExtraFieldID] [int] IDENTITY(1,1) NOT NULL,
	[EmpExtraFieldName] [nvarchar](50) NULL,
	[EmpExtraFieldControlType] [nvarchar](100) NULL,
	[EmpExtraFieldGroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmpExtraField] PRIMARY KEY CLUSTERED 
(
	[EmpExtraFieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ORSORecord]    Script Date: 07/29/2014 15:58:29 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ORSORecord](
	[ORSORecordID] [int] IDENTITY(1,1) NOT NULL,
	[EmpPayrollID] [int] NOT NULL,
	[ORSOPlanID] [int] NOT NULL,
	[ORSORecPeriodFr] [datetime] NOT NULL,
	[ORSORecPeriodTo] [datetime] NOT NULL,
	[ORSORecType] [nvarchar](1) NOT NULL,
	[ORSORecCalRI] [decimal](15, 4) NULL,
	[ORSORecCalER] [decimal](15, 4) NULL,
	[ORSORecCalEE] [decimal](15, 4) NULL,
	[ORSORecActRI] [decimal](15, 4) NULL,
	[ORSORecActER] [decimal](15, 4) NULL,
	[ORSORecActEE] [decimal](15, 4) NULL,
	[CostCenterID] [int] NULL,
 CONSTRAINT [PK_ORSORecord] PRIMARY KEY CLUSTERED 
(
	[ORSORecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MPFSchemeTrustee]    Script Date: 07/29/2014 15:58:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MPFSchemeTrustee](
	[MPFSchemeTrusteeID] [int] IDENTITY(1,1) NOT NULL,
	[MPFSchemeTrusteeCode] [nvarchar](20) NULL,
	[MPFSchemeTrusteeName] [nvarchar](255) NULL,
 CONSTRAINT [PK_MPFSchemeTrustee] PRIMARY KEY CLUSTERED 
(
	[MPFSchemeTrusteeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpExtraFieldValue]    Script Date: 07/29/2014 15:56:42 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpExtraFieldValue](
	[EmpExtraFieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpExtraFieldID] [int] NULL,
	[EmpExtraFieldValue] [ntext] NULL,
 CONSTRAINT [PK_EmpExtraFieldValue] PRIMARY KEY CLUSTERED 
(
	[EmpExtraFieldValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpUniform]    Script Date: 07/29/2014 15:57:32 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpUniform](
	[EmpUniformID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpUniformB] [nvarchar](10) NULL,
	[EmpUniformW] [nvarchar](10) NULL,
	[EmpUniformH] [nvarchar](10) NULL,
 CONSTRAINT [PK_EmpUniform] PRIMARY KEY CLUSTERED 
(
	[EmpUniformID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PaymentRecord]    Script Date: 07/29/2014 15:58:35 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PaymentRecord](
	[PayRecID] [int] IDENTITY(1,1) NOT NULL,
	[EmpPayrollID] [int] NULL,
	[PaymentCodeID] [int] NULL,
	[PayRecCalAmount] [decimal](15, 4) NULL,
	[PayRecActAmount] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[PayRecMethod] [nvarchar](1) NULL,
	[EmpAccID] [int] NULL,
	[PayRecType] [nvarchar](1) NULL,
	[PayRecStatus] [nvarchar](1) NULL,
	[PayRecNumOfDayAdj] [real] NULL,
	[LeaveAppID] [int] NULL,
	[PayRecRemark] [ntext] NULL,
	[LeaveAppIDList] [ntext] NULL,
	[PayRecIsRestDayPayment] [int] NULL,
	[CostCenterID] [int] NULL,
	[EmpRPIDforBP] [int] NULL,
 CONSTRAINT [PK_PaymentRecord] PRIMARY KEY CLUSTERED 
(
	[PayRecID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpRosterTableGroup]    Script Date: 07/29/2014 15:57:24 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpRosterTableGroup](
	[EmpRosterTableGroupID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpRosterTableGroupEffFr] [datetime] NULL,
	[EmpRosterTableGroupEffTo] [datetime] NULL,
	[RosterTableGroupID] [int] NULL,
	[EmpRosterTableGroupIsSupervisor] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpRosterTableGroup] PRIMARY KEY CLUSTERED 
(
	[EmpRosterTableGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpWorkExp]    Script Date: 07/29/2014 15:57:35 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpWorkExp](
	[EmpWorkExpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpWorkExpFromYear] [int] NULL,
	[EmpWorkExpFromMonth] [int] NULL,
	[EmpWorkExpToYear] [int] NULL,
	[EmpWorkExpToMonth] [int] NULL,
	[EmpWorkExpCompanyName] [nvarchar](100) NULL,
	[EmpWorkExpPosition] [nvarchar](100) NULL,
	[EmpWorkExpRemark] [ntext] NULL,
	[EmpWorkExpEmploymentTypeID] [int] NULL,
	[EmpWorkExpIsRelevantExperience] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpWorkExp] PRIMARY KEY CLUSTERED 
(
	[EmpWorkExpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PaymentType]    Script Date: 07/29/2014 15:58:36 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeCode] [nvarchar](20) NULL,
	[PaymentTypeDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeaveBalanceEntitle]    Script Date: 07/29/2014 15:57:59 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeaveBalanceEntitle](
	[LeaveBalanceEntitleID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[LeaveTypeID] [int] NULL,
	[LeaveBalanceEntitleEffectiveDate] [datetime] NULL,
	[LeaveBalanceEntitleDateExpiry] [datetime] NULL,
	[LeaveBalanceEntitleDays] [real] NULL,
	[LeaveBalanceEntitleGrantPeriodFrom] [datetime] NULL,
	[LeaveBalanceEntitleGrantPeriodTo] [datetime] NULL,
 CONSTRAINT [PK_LeaveBalanceEntitle] PRIMARY KEY CLUSTERED 
(
	[LeaveBalanceEntitleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[INBOX]    Script Date: 07/29/2014 15:57:46 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[INBOX](
	[InboxID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[InboxFromUserID] [int] NULL,
	[InboxFromUserName] [nvarchar](100) NULL,
	[InboxType] [nvarchar](50) NULL,
	[InboxSubject] [nvarchar](100) NULL,
	[EmpID] [int] NULL,
	[InboxRelatedRecID] [int] NULL,
	[InboxRelatedReferenceDate] [datetime] NULL,
	[InboxMessage] [ntext] NULL,
	[InboxCreateDate] [datetime] NULL,
	[InboxReadDate] [datetime] NULL,
	[InboxDeleteDate] [datetime] NULL,
 CONSTRAINT [PK_INBOX] PRIMARY KEY CLUSTERED 
(
	[InboxID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PayrollBatch]    Script Date: 07/29/2014 15:58:37 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PayrollBatch](
	[PayBatchID] [int] IDENTITY(1,1) NOT NULL,
	[PayBatchConfirmDate] [datetime] NULL,
	[PayBatchValueDate] [datetime] NULL,
	[PayBatchFileGenDate] [datetime] NULL,
	[PayBatchFileGenBy] [int] NULL,
	[PayBatchRemark] [ntext] NULL,
	[PayBatchIsESSPaySlipRelease] [int] NULL,
 CONSTRAINT [PK_PayrollBatch] PRIMARY KEY CLUSTERED 
(
	[PayBatchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[RequestLeaveApplicationCancel]    Script Date: 07/29/2014 15:59:05 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RequestLeaveApplicationCancel](
	[RequestLeaveAppCancelID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[LeaveAppID] [int] NULL,
	[RequestLeaveAppCancelCreateDateTime] [datetime] NULL,
	[RequestLeaveAppCancelReason] [ntext] NULL,
 CONSTRAINT [PK_RequestLeaveApplicationCancel] PRIMARY KEY CLUSTERED 
(
	[RequestLeaveAppCancelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ReminderType]    Script Date: 07/29/2014 15:58:58 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReminderType](
	[ReminderTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ReminderTypeCode] [nvarchar](20) NULL,
	[ReminderTypeDesc] [nvarchar](200) NULL,
 CONSTRAINT [PK_ReminderType] PRIMARY KEY CLUSTERED 
(
	[ReminderTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LeaveApplicationCancel]    Script Date: 07/29/2014 15:57:53 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LeaveApplicationCancel](
	[LeaveAppCancelID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[LeaveAppID] [int] NULL,
	[LeaveAppCancelCreateDateTime] [datetime] NULL,
	[LeaveAppCancelReason] [ntext] NULL,
	[EmpRequestID] [int] NULL,
	[RequestLeaveAppCancelID] [int] NULL,
 CONSTRAINT [PK_LeaveApplicationCancel] PRIMARY KEY CLUSTERED 
(
	[LeaveAppCancelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UserReminderOption]    Script Date: 07/29/2014 15:59:55 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserReminderOption](
	[UserReminderOptionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ReminderTypeID] [int] NULL,
	[UserReminderOptionRemindDaysBefore] [int] NULL,
	[UserReminderOptionRemindDaysAfter] [int] NULL,
 CONSTRAINT [PK_UserReminderOption] PRIMARY KEY CLUSTERED 
(
	[UserReminderOptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PayrollPeriod]    Script Date: 07/29/2014 15:58:52 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PayrollPeriod](
	[PayPeriodID] [int] IDENTITY(1,1) NOT NULL,
	[PayGroupID] [int] NULL,
	[PayPeriodFr] [datetime] NULL,
	[PayPeriodTo] [datetime] NULL,
	[PayPeriodLeaveCutOffDate] [datetime] NULL,
	[PayPeriodAttnFr] [datetime] NULL,
	[PayPeriodAttnTo] [datetime] NULL,
	[PayPeriodStatus] [nvarchar](2) NULL,
	[PayPeriodTrialRunDate] [datetime] NULL,
	[PayPeriodTrialRunBy] [int] NULL,
	[PayPeriodConfirmDate] [datetime] NULL,
	[PayPeriodConfirmBy] [int] NULL,
	[PayPeriodProcessEndDate] [datetime] NULL,
	[PayPeriodProcessEndBy] [int] NULL,
	[PayPeriodRollbackDate] [datetime] NULL,
	[PayPeriodRollbackBy] [int] NULL,
	[PayPeriodIsAutoCreate] [int] NULL,
 CONSTRAINT [PK_PayrollPeriod] PRIMARY KEY CLUSTERED 
(
	[PayPeriodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX IX_PayrollPeriod_1
ON payrollPeriod (PayGroupID ASC);

CREATE NONCLUSTERED INDEX IX_PayrollPeriod_2
ON payrollPeriod (PayPeriodFr DESC);

CREATE NONCLUSTERED INDEX IX_CostAllocation1 
ON CostAllocation (EmpPayrollID ASC);


/****** Object:  Table [dbo].[EmpRequestApprovalHistory]    Script Date: 07/29/2014 15:57:22 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpRequestApprovalHistory](
	[EmpRequestApprovalHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[EmpRequestID] [int] NULL,
	[EmpRequestApprovalHistoryStatusBefore] [nvarchar](50) NULL,
	[EmpRequestApprovalHistoryAuthorizationWorkFlowIndexBefore] [int] NULL,
	[EmpRequestApprovalHistoryStatusAfter] [nvarchar](50) NULL,
	[EmpRequestApprovalHistoryAuthorizationWorkFlowIndexAfter] [int] NULL,
	[EmpRequestApprovalHistoryActionBy] [nvarchar](255) NULL,
	[EmpRequestApprovalHistoryActionByEmpID] [int] NULL,
	[EmpRequestApprovalHistoryCreateDateTime] [datetime] NULL,
 CONSTRAINT [PK_EmpRequestApprovalHistory] PRIMARY KEY CLUSTERED 
(
	[EmpRequestApprovalHistoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AttendancePlan]    Script Date: 07/29/2014 15:55:40 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AttendancePlan](
	[AttendancePlanID] [int] IDENTITY(1,1) NOT NULL,
	[AttendancePlanCode] [nvarchar](20) NULL,
	[AttendancePlanDesc] [nvarchar](100) NULL,
	[AttendancePlanOTFormula] [int] NULL,
	[AttendancePlanLateFormula] [int] NULL,
	[AttendancePlanOTMinsUnit] [int] NULL,
	[AttendancePlanLateMinsUnit] [int] NULL,
	[AttendancePlanOTPayCodeID] [int] NULL,
	[AttendancePlanLatePayCodeID] [int] NULL,
	[AttendancePlanOTMinsRoundingRule] [nvarchar](50) NULL,
	[AttendancePlanLateMinsRoundingRule] [nvarchar](50) NULL,
	[AttendancePlanLateIncludeEarlyLeave] [int] NULL,
	[AttendancePlanBonusMaxTotalLateCount] [int] NULL,
	[AttendancePlanBonusMaxTotalLateMins] [int] NULL,
	[AttendancePlanBonusMaxTotalEarlyLeaveCount] [int] NULL,
	[AttendancePlanBonusMaxTotalEarlyLeaveMins] [int] NULL,
	[AttendancePlanBonusMaxTotalSLWithMedicalCertificate] [int] NULL,
	[AttendancePlanBonusMaxTotalSLWithoutMedicalCertificate] [int] NULL,
	[AttendancePlanBonusMaxTotalAbsentCount] [int] NULL,
	[AttendancePlanBonusMaxTotalNonFullPayCasualLeave] [int] NULL,
	[AttendancePlanBonusMaxTotalInjuryLeave] [int] NULL,
	[AttendancePlanBonusAmount] [real] NULL,
	[AttendancePlanBonusAmountUnit] [nvarchar](1) NULL,
	[AttendancePlanBonusPayCodeID] [int] NULL,
	[AttendancePlanBonusOTAmount] [real] NULL,
	[AttendancePlanUseBonusAmountByRecurringPayment] [int] NULL,
	[AttendancePlanProrataBonusforNewJoin] [int] NULL,
	[AttendancePlanProrataBonusforTerminated] [int] NULL,
	[AttendancePlanAbsentProrataPayFormID] [int] NULL,
	[AttendancePlanCompensateLateByOT] [int] NULL,
	[AttendancePlanTerminatedHasBonus] [int] NULL,
	[AttendancePlanBonusPartialPaidPercent] [real] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalLateCount] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalLateMins] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveCount] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveMins] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalSLWithMedicalCertificate] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalSLWithoutMedicalCertificate] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalAbsentCount] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalNonFullPayCasualLeave] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalInjuryLeave] [int] NULL,
	[AttendancePlanOTRateMultiplier] [real] NULL,
	[AttendancePlanOTGainAsCompensationLeaveEntitle] [int] NULL,
	[AttendancePlanLateIncludeLunchLate] [int] NULL,
	[AttendancePlanLateIncludeLunchEarlyLeave] [int] NULL,
	[AttendancePlanBonusMaxTotalLateCountIncludeLunch] [int] NULL,
	[AttendancePlanBonusMaxTotalLateMinsIncludeLunch] [int] NULL,
	[AttendancePlanBonusMaxTotalEarlyLeaveCountIncludeLunch] [int] NULL,
	[AttendancePlanBonusMaxTotalEarlyLeaveMinsIncludeLunch] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalLateCountIncludeLunch] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalLateMinsIncludeLunch] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveCountIncludeLunch] [int] NULL,
	[AttendancePlanBonusPartialPaidMaxTotalEarlyLeaveMinsIncludeLunch] [int] NULL,
	[AttendancePlanOTIncludeLunchOvertime] [int] NULL,
	[AttendancePlanLateMaxTotalToleranceMins] [int] NULL,
 CONSTRAINT [PK_AttendancePlan] PRIMARY KEY CLUSTERED 
(
	[AttendancePlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PayrollProrataFormula]    Script Date: 07/29/2014 15:58:54 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PayrollProrataFormula](
	[PayFormID] [int] IDENTITY(1,1) NOT NULL,
	[PayFormCode] [nvarchar](20) NULL,
	[PayFormDesc] [nvarchar](100) NULL,
	[PayFormPaymentType] [int] NULL,
	[PayFormMultiplier] [real] NULL,
	[PayFormDivider] [real] NULL,
	[PayFormIsSys] [nvarchar](1) NULL,
	[ReferencePayFormID] [int] NULL,
	[PayFormDecimalPlace] [int] NULL,
	[PayFormRoundingRule] [nvarchar](50) NULL,
 CONSTRAINT [PK_PayrollProrataFormula] PRIMARY KEY CLUSTERED 
(
	[PayFormID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TextTransformation]    Script Date: 07/29/2014 15:59:44 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TextTransformation](
	[TextTransformationID] [int] IDENTITY(1,1) NOT NULL,
	[TextTransformationOriginalString] [nvarchar](255) NULL,
	[TextTransformationReplacedTo] [nvarchar](255) NULL,
 CONSTRAINT [PK_TextTransformation] PRIMARY KEY CLUSTERED 
(
	[TextTransformationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RosterClient]    Script Date: 07/29/2014 15:59:06 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RosterClient](
	[RosterClientID] [int] IDENTITY(1,1) NOT NULL,
	[RosterClientCode] [nvarchar](20) NULL,
	[RosterClientName] [nvarchar](100) NULL,
	[RosterClientMappingSiteCodeToHLevelID] [int] NULL,
	[CostCenterID] [int] NULL,
 CONSTRAINT [PK_RosterClient] PRIMARY KEY CLUSTERED 
(
	[RosterClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[LoginAudit]    Script Date: 07/29/2014 15:58:12 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[LoginAudit](
	[LoginAuditID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LoginAuditLoginID] [nvarchar](255) NULL,
	[LoginAuditLoginMachine] [nvarchar](255) NULL,
	[LoginAuditLoginIPAddress] [nvarchar](255) NULL,
	[LoginAuditLoginAgent] [ntext] NULL,
	[LoginAuditLoginDateTime] [datetime] NULL,
	[LoginAuditIsLoginFail] [int] NULL,
	[LoginAuditLoginErrorMesage] [nvarchar](255) NULL,
 CONSTRAINT [PK_LoginAudit] PRIMARY KEY CLUSTERED 
(
	[LoginAuditID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[RosterClientSite]    Script Date: 07/29/2014 15:59:08 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RosterClientSite](
	[RosterClientSiteID] [int] IDENTITY(1,1) NOT NULL,
	[RosterClientID] [int] NULL,
	[RosterClientSiteCode] [nvarchar](20) NULL,
	[RosterClientSitePropertyName] [nvarchar](100) NULL,
	[RosterClientSiteLocation] [nvarchar](200) NULL,
	[RosterClientSiteInCharge] [nvarchar](100) NULL,
	[RosterClientSiteInChargeContactNo] [nvarchar](50) NULL,
	[RosterClientSitePremisesNature] [nvarchar](50) NULL,
	[RosterClientSiteServiceHours] [nvarchar](100) NULL,
	[RosterClientSiteShift] [nvarchar](50) NULL,
	[CostCenterID] [int] NULL,
 CONSTRAINT [PK_RosterClientSite] PRIMARY KEY CLUSTERED 
(
	[RosterClientSiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Qualification]    Script Date: 07/29/2014 15:58:57 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Qualification](
	[QualificationID] [int] IDENTITY(1,1) NOT NULL,
	[QualificationCode] [nvarchar](20) NULL,
	[QualificationDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_Qualification] PRIMARY KEY CLUSTERED 
(
	[QualificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ESSLoginAudit]    Script Date: 07/29/2014 15:57:41 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ESSLoginAudit](
	[ESSLoginAuditID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[ESSLoginAuditLoginID] [nvarchar](255) NULL,
	[ESSLoginAuditLoginMachine] [nvarchar](255) NULL,
	[ESSLoginAuditLoginIPAddress] [nvarchar](255) NULL,
	[ESSLoginAuditLoginAgent] [ntext] NULL,
	[ESSLoginAuditLoginDateTime] [datetime] NULL,
	[ESSLoginAuditIsLoginFail] [int] NULL,
	[ESSLoginAuditLoginErrorMesage] [nvarchar](255) NULL,
 CONSTRAINT [PK_ESSLoginAudit] PRIMARY KEY CLUSTERED 
(
	[ESSLoginAuditID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[MPFSchemeCessationReason]    Script Date: 07/29/2014 15:58:22 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MPFSchemeCessationReason](
	[MPFSchemeCessationReasonID] [int] IDENTITY(1,1) NOT NULL,
	[MPFSchemeID] [int] NULL,
	[MPFSchemeCessationReasonCode] [nvarchar](10) NULL,
	[MPFSchemeCessationReasonDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_MPFSchemeCessationReason] PRIMARY KEY CLUSTERED 
(
	[MPFSchemeCessationReasonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MPFSchemeCessationReasonMapping]    Script Date: 07/29/2014 15:58:22 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MPFSchemeCessationReasonMapping](
	[MPFSchemeCessationReasonMappingID] [int] IDENTITY(1,1) NOT NULL,
	[MPFSchemeCessationReasonID] [int] NULL,
	[CessationReasonID] [int] NULL,
 CONSTRAINT [PK_MPFSchemeCessationReasonMapping] PRIMARY KEY CLUSTERED 
(
	[MPFSchemeCessationReasonMappingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RequestStatus]    Script Date: 07/29/2014 15:59:05 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RequestStatus](
	[RequestStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RequestStatusCode] [nvarchar](50) NULL,
	[RequestStatusDesc] [nvarchar](50) NULL,
	[RequestStatusPosition] [nvarchar](50) NULL,
 CONSTRAINT [PK_RequestStatus] PRIMARY KEY CLUSTERED 
(
	[RequestStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpSpouse]    Script Date: 07/29/2014 15:57:28 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpSpouse](
	[EmpSpouseID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpSpouseSurname] [nvarchar](255) NULL,
	[EmpSpouseOtherName] [nvarchar](255) NULL,
	[EmpSpouseChineseName] [nvarchar](255) NULL,
	[EmpSpouseHKID] [nvarchar](50) NULL,
	[EmpSpousePassportNo] [nvarchar](255) NULL,
	[EmpSpousePassportIssuedCountry] [nvarchar](255) NULL,
	[EmpSpouseDateOfBirth] [datetime] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpSpouse] PRIMARY KEY CLUSTERED 
(
	[EmpSpouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Skill]    Script Date: 07/29/2014 15:59:21 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Skill](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillCode] [nvarchar](20) NULL,
	[SkillDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[SkillLevel]    Script Date: 07/29/2014 15:59:22 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SkillLevel](
	[SkillLevelID] [int] IDENTITY(1,1) NOT NULL,
	[SkillLevelCode] [nvarchar](20) NULL,
	[SkillLevelDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_SkillLevel] PRIMARY KEY CLUSTERED 
(
	[SkillLevelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpBankAccount]    Script Date: 07/29/2014 15:56:29 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpBankAccount](
	[EmpBankAccountID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpBankCode] [nvarchar](30) NULL,
	[EmpBranchCode] [nvarchar](30) NULL,
	[EmpAccountNo] [nvarchar](90) NULL,
	[EmpBankAccountHolderName] [nvarchar](255) NULL,
	[EmpAccDefault] [int] NULL,
	[EmpBankAccountRemark] [ntext] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpBankAccount] PRIMARY KEY CLUSTERED 
(
	[EmpBankAccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AuditTrail]    Script Date: 07/29/2014 15:55:51 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AuditTrail](
	[AuditTrailID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[FunctionID] [int] NULL,
	[EmpID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ParentAuditTrailID] [int] NULL,
 CONSTRAINT [PK_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[AuditTrailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EmpPlaceOfResidence]    Script Date: 07/29/2014 15:57:07 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpPlaceOfResidence](
	[EmpPoRID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpPoRFrom] [datetime] NULL,
	[EmpPoRTo] [datetime] NULL,
	[EmpPoRLandLord] [nvarchar](255) NULL,
	[EmpPoRLandLordAddr] [nvarchar](255) NULL,
	[EmpPoRPropertyAddr] [nvarchar](255) NULL,
	[EmpPoRNature] [nvarchar](190) NULL,
	[EmpPoRPayToLandER] [decimal](15, 4) NOT NULL,
	[EmpPoRPayToLandEE] [decimal](15, 4) NOT NULL,
	[EmpPoRRefundToEE] [decimal](15, 4) NOT NULL,
	[EmpPoRPayToERByEE] [decimal](15, 4) NOT NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
 CONSTRAINT [PK_EmpPlaceOfResidence] PRIMARY KEY CLUSTERED 
(
	[EmpPoRID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[StatutoryHoliday]    Script Date: 07/29/2014 15:59:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[StatutoryHoliday](
	[StatutoryHolidayID] [int] IDENTITY(1,1) NOT NULL,
	[StatutoryHolidayDate] [datetime] NULL,
	[StatutoryHolidayDesc] [nvarchar](100) NULL,
 CONSTRAINT [PK_StatutoryHoliday] PRIMARY KEY CLUSTERED 
(
	[StatutoryHolidayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AuditTrailDetail]    Script Date: 07/29/2014 15:55:52 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AuditTrailDetail](
	[AuditTrailDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AuditTrailID] [int] NULL,
	[TableName] [nvarchar](50) NULL,
	[ActionType] [nvarchar](50) NULL,
	[Remark] [text] NULL,
 CONSTRAINT [PK_AuditTrailDetail] PRIMARY KEY CLUSTERED 
(
	[AuditTrailDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpPersonalInfo]    Script Date: 07/29/2014 15:57:04 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpPersonalInfo](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpNo] [nvarchar](255) NULL,
	[EmpStatus] [nvarchar](3) NULL,
	[EmpEngSurname] [nvarchar](255) NULL,
	[EmpEngOtherName] [nvarchar](255) NULL,
	[EmpChiFullName] [nvarchar](255) NULL,
	[EmpAlias] [nvarchar](255) NULL,
	[EmpHKID] [nvarchar](50) NULL,
	[EmpGender] [nvarchar](100) NULL,
	[EmpMaritalStatus] [nvarchar](100) NULL,
	[EmpDateOfBirth] [datetime] NULL,
	[EmpPlaceOfBirth] [nvarchar](255) NULL,
	[EmpNationality] [nvarchar](255) NULL,
	[EmpPassportNo] [nvarchar](255) NULL,
	[EmpPassportIssuedCountry] [nvarchar](255) NULL,
	[EmpPassportExpiryDate] [datetime] NULL,
	[EmpResAddr] [nvarchar](250) NULL,
	[EmpResAddrAreaCode] [nvarchar](100) NULL,
	[EmpCorAddr] [nvarchar](250) NULL,
	[EmpDateOfJoin] [datetime] NULL,
	[EmpServiceDate] [datetime] NULL,
	[EmpNoticePeriod] [int] NULL,
	[EmpNoticeUnit] [nvarchar](1) NULL,
	[EmpProbaPeriod] [int] NULL,
	[EmpProbaUnit] [nvarchar](1) NULL,
	[EmpProbaLastDate] [datetime] NULL,
	[EmpEmail] [nvarchar](255) NULL,
	[EmpHomePhoneNo] [nvarchar](255) NULL,
	[EmpMobileNo] [nvarchar](255) NULL,
	[EmpOfficePhoneNo] [nvarchar](255) NULL,
	[Remark] [ntext] NULL,
	[PreviousEmpID] [int] NULL,
	[EmpPW] [nvarchar](255) NULL,
	[EmpInternalEmail] [nvarchar](255) NULL,
	[EmpTimeCardNo] [nvarchar](255) NULL,
	[EmpIsOverrideMinimumWage] [int] NULL,
	[EmpOverrideMinimumHourlyRate] [real] NULL,
	[MasterEmpID] [int] NULL,
	[EmpIsCombinePaySlip] [int] NULL,
	[EmpIsCombineMPF] [int] NULL,
	[EmpIsCombineTax] [int] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[EmpNextSalaryIncrementDate] [datetime] NULL, 
 CONSTRAINT [PK__EmpPersonalInfo] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[SystemFunction]    Script Date: 07/29/2014 15:59:24 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SystemFunction](
	[FunctionID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionCode] [nvarchar](10) NULL,
	[Description] [nvarchar](100) NULL,
	[FunctionCategory] [nvarchar](100) NULL,
	[FunctionIsHidden] [int] NULL,
 CONSTRAINT [PK_SystemFunction] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AuthorizationGroup]    Script Date: 07/29/2014 15:55:54 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AuthorizationGroup](
	[AuthorizationGroupID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorizationCode] [nvarchar](20) NULL,
	[AuthorizationDesc] [nvarchar](100) NULL,
	[AuthorizationGroupIsApproveEEInfo] [int] NULL,
	[AuthorizationGroupIsApproveLeave] [int] NULL,
	[AuthorizationGroupIsReceiveOtherGrpAlert] [int] NULL,
	[AuthorizationGroupEmailAddress] [ntext] NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
 CONSTRAINT [PK_AuthorizationGroup] PRIMARY KEY CLUSTERED 
(
	[AuthorizationGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[EmpDependant]    Script Date: 07/29/2014 15:56:37 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[EmpDependant](
	[EmpDependantID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpDependantSurname] [nvarchar](255) NULL,
	[EmpDependantOtherName] [nvarchar](255) NULL,
	[EmpDependantChineseName] [nvarchar](255) NULL,
	[EmpDependantGender] [nvarchar](100) NULL,
	[EmpDependantHKID] [nvarchar](255) NULL,
	[EmpDependantPassportNo] [nvarchar](255) NULL,
	[EmpDependantPassportIssuedCountry] [nvarchar](255) NULL,
	[EmpDependantRelationship] [nvarchar](255) NULL,
	[EmpDependantDateOfBirth] [datetime] NULL,
	[SynID] [nvarchar](255) NULL,
	[RecordCreatedDateTime] [datetime] NULL,
	[RecordCreatedBy] [int] NULL,
	[RecordLastModifiedDateTime] [datetime] NULL,
	[RecordLastModifiedBy] [int] NULL,
 CONSTRAINT [PK_EmpDependant] PRIMARY KEY CLUSTERED 
(
	[EmpDependantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

	CREATE TABLE [dbo].[PayScale](
		[PayScaleID] [int] IDENTITY(1,1) NOT NULL,
		[SchemeCode] [nvarchar](24) NULL,
		[Capacity] [nvarchar](255) NULL,
		[FirstPoint] [decimal](5, 2) NULL,
		[MidPoint] [decimal](5, 2) NULL,
		[LastPoint] [decimal](5, 2) NULL,
		[RecordCreatedDateTime] [datetime] NULL,
		[RecordCreatedBy] [int] NULL,
		[RecordLastModifiedDateTime] [datetime] NULL,
		[RecordLastModifiedBy] [int] NULL,
		[SynID] [nvarchar](255) NULL,
	 CONSTRAINT [PK_PayScale] PRIMARY KEY CLUSTERED 
	(
		[PayScaleID] ASC
	));
	
	CREATE TABLE [dbo].[PayScaleMap](
		[PayScaleMapID] [int] IDENTITY(1,1) NOT NULL,
		[EffectiveDate] [datetime] NULL,
		[ExpiryDate] [datetime] NULL,
		[SchemeCode] [nvarchar](24) NULL,
		[Point] [decimal](5, 2) NULL,
		[Salary] [decimal](15, 4) NULL,
		[RecordCreatedDateTime] [datetime] NULL,
		[RecordCreatedBy] [int] NULL,
		[RecordLastModifiedDateTime] [datetime] NULL,
		[RecordLastModifiedBy] [int] NULL,
		[SynID] [nvarchar](255) NULL,
	 CONSTRAINT [PK_PayScalePoints] PRIMARY KEY CLUSTERED 
	(
		[PayScaleMapID] ASC
	));
	
	CREATE TABLE [dbo].[PS_SalaryIncrementBatch](
		[BatchID] [int] IDENTITY(1,1) NOT NULL,
		[AsAtDate] [datetime] NULL,
		[DeferredBatch] [int] NULL,
		[PaymentCodeID] [int] NULL,
		[PaymentDate] [datetime] NULL,
		[Status] [nvarchar](1) NULL,
		[UploadDateTime] [datetime] NULL,
		[UploadBy] [int] NULL,
		[ConfirmDateTime] [datetime] NULL,
		[ConfirmBy] [int] NULL,
		[RecordCreatedDateTime] [datetime] NULL,
		[RecordCreatedBy] [int] NULL,
		[RecordLastModifiedDateTime] [datetime] NULL,
		[RecordLastModifiedBy] [int] NULL,
		[SynID] [nvarchar](255) NULL,
	CONSTRAINT [PK_PS_SalaryIncrementBatchID] PRIMARY KEY CLUSTERED 
	(
		[BatchID] ASC
	));

	CREATE TABLE [dbo].[PS_SalaryIncrementBatchDetail](
		[DetailID] [int] IDENTITY(1,1) NOT NULL,
		[BatchID] [int] NULL,
		[EmpID] [int] NULL,
		[EmpRPID] [int] NULL,
		[SchemeCode] [nvarchar](24) NULL,
		[Capacity] [nvarchar](255) NULL,
		[CurrentPoint] [decimal](5, 2) NULL,
		[NewPoint] [decimal](5, 2) NULL,
		[RecordCreatedDateTime] [datetime] NULL,
		[RecordCreatedBy] [int] NULL,
		[RecordLastModifiedDateTime] [datetime] NULL,
		[RecordLastModifiedBy] [int] NULL,
		[SynID] [nvarchar](255) NULL, 
	 CONSTRAINT [PK_PS_SalaryIncrementBatchDetail] PRIMARY KEY CLUSTERED 
	(
		[DetailID] ASC
	));
	
	CREATE TABLE [dbo].[PS_BackpayBatchDetail](
		[DetailID] [int] IDENTITY(1,1) NOT NULL,
		[AnnounceDate] [datetime] NULL,
		[EffectiveDate] [datetime] NULL,
		[BackpayDate] [datetime] NULL,
		[SchemeCode] [nvarchar](24) NULL,
		[Point] [decimal](5, 2) NULL,
		[Salary] [decimal](15, 4) NULL,
		[CurrentSalary] [decimal](15, 4) NULL,
		[PaymentCode] [nvarchar](24) NULL,
		[RecordCreatedDateTime] [datetime] NULL,
		[RecordCreatedBy] [int] NULL,
		[RecordLastModifiedDateTime] [datetime] NULL,
		[RecordLastModifiedBy] [int] NULL, 
		[SynID] [nvarchar](255) NULL, 
	 CONSTRAINT [PK_BackpayProcessDetail] PRIMARY KEY CLUSTERED 
	(
		[DetailID] ASC
	));

		CREATE TABLE RequestOTClaim
	(
		RequestOTClaimID int NOT NULL IDENTITY (1, 1),
		EmpID int NULL,
		RequestOTClaimEffectiveDate datetime NULL,
		RequestOTClaimDateExpiry datetime NULL,
		RequestOTClaimPeriodFrom datetime NULL,
		RequestOTClaimPeriodTo datetime NULL,
		RequestOTClaimHourFrom datetime NULL,
		RequestOTClaimHourTo datetime NULL,
		RequestOTHours float NULL,
		RequestOTClaimRemark nvarchar(50) NULL,
		RequestOTClaimCreateDate datetime NULL,
		CONSTRAINT PK_RequestOTClaim PRIMARY KEY CLUSTERED 
		(
			RequestOTClaimID
		)
	);

	CREATE TABLE OTClaim
	(
		OTClaimID int NOT NULL IDENTITY (1, 1),
		EmpID int NULL,
		OTClaimDateFrom datetime NULL,
		OTClaimDateTo datetime NULL,
		OTClaimTimeFrom datetime NULL,
		OTClaimTimeTo datetime NULL,
		OTClaimHours float NULL,
		OTClaimRemark nvarchar(50) NULL,
		RecordCreatedDateTime datetime NULL,
		RecordCreatedBy int NULL,
		RecordLastModifiedDateTime datetime NULL,
		RecordLastModifiedBy int NULL,
		OTClaimCancelID int NULL,
		EmpRequestID int NULL,
		RequestOTClaimID int NULL,
		SynID nvarchar(255) NULL,
		CONSTRAINT PK_OTClaim PRIMARY KEY CLUSTERED 
		(
			OTClaimID
		)
	);

	CREATE TABLE RequestOTClaimCancel
	(
		RequestOTClaimCancelID int NOT NULL IDENTITY (1, 1),
		EmpID int NULL,
		OTClaimID int NULL,
		RequestOTClaimCancelCreateDateTime datetime NULL,
		RequestOTClaimCancelReason ntext NULL,
		CONSTRAINT PK_RequestOTClaimCancel PRIMARY KEY CLUSTERED 
		(
			RequestOTClaimCancelID
		)
	);
	
	CREATE TABLE CommissionAchievement(
		CAID int IDENTITY(1,1) NOT NULL,
		EmpID int NULL,
		CAPercent decimal(5, 2) NULL,
		RpID int NULL, 
		CAImportBatchID int NULL,
		CAEffDate datetime NULL, 
		CONSTRAINT PK_CommissionAchievement PRIMARY KEY CLUSTERED 
		(
			CAID
		)
	);
	
	CREATE TABLE CommissionAchievementImportBatch
	(
		CAImportBatchID int IDENTITY(1,1) NOT NULL,
		CAImportBatchDateTime datetime NULL,
		CAImportBatchUploadedBy int NULL,
		CAImportBatchRemark ntext NULL
		 CONSTRAINT PK_CommissionAchievementImportBatch PRIMARY KEY CLUSTERED 
		(
			CAImportBatchID
		)
	);

/****** Object:  Table [dbo].[UploadAttendanceRecord]    Script Date: 07/29/2014 19:42:09 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadAttendanceRecord](
	[UploadAttendanceRecordID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceRecordID] [int] NULL,
	[EmpID] [int] NULL,
	[AttendanceRecordDate] [datetime] NULL,
	[RosterCodeID] [int] NULL,
	[RosterTableID] [int] NULL,
	[AttendanceRecordWorkStart] [datetime] NULL,
	[AttendanceRecordWorkStartLocation] [nvarchar](255) NULL,
	[AttendanceRecordWorkEnd] [datetime] NULL,
	[AttendanceRecordWorkEndLocation] [nvarchar](255) NULL,
	[AttendanceRecordLunchOut] [datetime] NULL,
	[AttendanceRecordLunchOutLocation] [nvarchar](255) NULL,
	[AttendanceRecordLunchIn] [datetime] NULL,
	[AttendanceRecordLunchInLocation] [nvarchar](255) NULL,
	[AttendanceRecordCalculateLateMins] [int] NULL,
	[AttendanceRecordActualLateMins] [int] NULL,
	[AttendanceRecordCalculateEarlyLeaveMins] [int] NULL,
	[AttendanceRecordActualEarlyLeaveMins] [int] NULL,
	[AttendanceRecordCalculateOvertimeMins] [int] NULL,
	[AttendanceRecordActualOvertimeMins] [int] NULL,
	[AttendanceRecordActualLunchOvertimeMins] [int] NULL,
	[AttendanceRecordCalculateLunchTimeMins] [int] NULL,
	[AttendanceRecordActualLunchTimeMins] [int] NULL,
	[AttendanceRecordCalculateWorkingDay] [real] NULL,
	[AttendanceRecordActualWorkingDay] [real] NULL,
	[AttendanceRecordCalculateWorkingHour] [real] NULL,
	[AttendanceRecordActualWorkingHour] [real] NULL,
	[AttendanceRecordIsAbsent] [int] NULL,
	[AttendanceRecordWorkOnRestDay] [int] NULL,
	[AttendanceRecordRemark] [ntext] NULL,
	[AttendanceRecordOverrideBonusEntitled] [int] NULL,
	[AttendanceRecordHasBonus] [int] NULL,
	[AttendanceRecordExtendData] [ntext] NULL,
	[AttendanceRecordCalculateLunchLateMins] [int] NULL,
	[AttendanceRecordActualLunchLateMins] [int] NULL,
	[AttendanceRecordCalculateLunchEarlyLeaveMins] [int] NULL,
	[AttendanceRecordActualLunchEarlyLeaveMins] [int] NULL,
	[AttendanceRecordRosterCodeInTimeOverride] [datetime] NULL,
	[AttendanceRecordRosterCodeOutTimeOverride] [datetime] NULL,
	[AttendanceRecordRosterCodeLunchStartTimeOverride] [datetime] NULL,
	[AttendanceRecordRosterCodeLunchEndTimeOverride] [datetime] NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadAttendanceRecord] PRIMARY KEY CLUSTERED 
(
	[UploadAttendanceRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadCommissionAchievement]    Script Date: 07/29/2014 19:42:30 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadCommissionAchievement](
	[UploadCAID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[CAPercent] [decimal](5, 2) NOT NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
	[CAEffDate] [datetime] NULL,
 CONSTRAINT [PK_UploadCommissionAchievement] PRIMARY KEY CLUSTERED 
(
	[UploadCAID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadCompensationLeaveEntitle]    Script Date: 07/29/2014 19:42:38 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadCompensationLeaveEntitle](
	[UploadCompensationLeaveEntitleID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[CompensationLeaveEntitleID] [int] NULL,
	[EmpID] [int] NULL,
	[CompensationLeaveEntitleEffectiveDate] [datetime] NULL,
	[CompensationLeaveEntitleClaimPeriodFrom] [datetime] NULL,
	[CompensationLeaveEntitleClaimPeriodTo] [datetime] NULL,
	[CompensationLeaveEntitleClaimHourFrom] [datetime] NULL,
	[CompensationLeaveEntitleClaimHourTo] [datetime] NULL,
	[CompensationLeaveEntitleHoursClaim] [real] NULL,
	[CompensationLeaveEntitleDateExpiry] [datetime] NULL,
	[CompensationLeaveEntitleApprovedBy] [nvarchar](255) NULL,
	[CompensationLeaveEntitleIsAutoGenerated] [int] NULL,
	[CompensationLeaveEntitleRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadCompensationLeaveEntitle] PRIMARY KEY CLUSTERED 
(
	[UploadCompensationLeaveEntitleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpAVCPlan]    Script Date: 07/29/2014 19:42:47 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpAVCPlan](
	[UploadEmpAVCID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpAVCID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpAVCEffFr] [datetime] NULL,
	[EmpAVCEffTo] [datetime] NULL,
	[AVCPlanID] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpAVCPlan] PRIMARY KEY CLUSTERED 
(
	[UploadEmpAVCID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpBankAccount]    Script Date: 07/29/2014 19:42:54 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpBankAccount](
	[UploadEmpBankAccountID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpBankAccountID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpBankCode] [nvarchar](3) NULL,
	[EmpBranchCode] [nvarchar](3) NULL,
	[EmpAccountNo] [nvarchar](9) NULL,
	[EmpBankAccountHolderName] [nvarchar](100) NULL,
	[EmpAccDefault] [int] NULL,
	[EmpBankAccountRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpBankAccount] PRIMARY KEY CLUSTERED 
(
	[UploadEmpBankAccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpContractTerms]    Script Date: 07/29/2014 19:43:01 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpContractTerms](
	[UploadEmpContractID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpContractID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpContractCompanyName] [nvarchar](100) NULL,
	[EmpContractCompanyContactNo] [nvarchar](100) NULL,
	[EmpContractCompanyAddr] [nvarchar](100) NULL,
	[EmpContractEmployedFrom] [datetime] NULL,
	[EmpContractEmployedTo] [datetime] NULL,
	[EmpContractGratuity] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpContractTerms] PRIMARY KEY CLUSTERED 
(
	[UploadEmpContractID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpCostCenter]    Script Date: 07/29/2014 19:43:07 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpCostCenter](
	[UploadEmpCostCenterID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpCostCenterID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpCostCenterEffFr] [datetime] NULL,
	[EmpCostCenterEffTo] [datetime] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpCostCenter] PRIMARY KEY CLUSTERED 
(
	[UploadEmpCostCenterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpCostCenterDetail]    Script Date: 07/29/2014 19:43:13 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpCostCenterDetail](
	[UploadEmpCostCenterDetailID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpCostCenterID] [int] NULL,
	[EmpCostCenterDetailID] [int] NULL,
	[EmpCostCenterID] [int] NULL,
	[CostCenterID] [int] NULL,
	[EmpCostCenterPercentage] [real] NULL,
	[EmpCostCenterDetailIsDefault] [int] NULL,
 CONSTRAINT [PK_UploadEmpCostCenterDetail] PRIMARY KEY CLUSTERED 
(
	[UploadEmpCostCenterDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpDependant]    Script Date: 07/29/2014 19:43:20 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpDependant](
	[UploadEmpDependantID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpDependantID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpDependantSurname] [nvarchar](20) NULL,
	[EmpDependantOtherName] [nvarchar](40) NULL,
	[EmpDependantChineseName] [nvarchar](50) NULL,
	[EmpDependantGender] [nvarchar](1) NULL,
	[EmpDependantDateOfBirth] [datetime] NULL,
	[EmpDependantHKID] [nvarchar](12) NULL,
	[EmpDependantPassportNo] [nvarchar](40) NULL,
	[EmpDependantPassportIssuedCountry] [nvarchar](40) NULL,
	[EmpDependantRelationship] [nvarchar](100) NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpDependant] PRIMARY KEY CLUSTERED 
(
	[UploadEmpDependantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpEmergencyContact]    Script Date: 07/29/2014 19:43:25 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpEmergencyContact](
	[UploadEmpEmergencyContactID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpEmergencyContactID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpEmergencyContactName] [nvarchar](255) NULL,
	[EmpEmergencyContactGender] [nvarchar](100) NULL,
	[EmpEmergencyContactRelationship] [nvarchar](255) NULL,
	[EmpEmergencyContactContactNoDay] [nvarchar](255) NULL,
	[EmpEmergencyContactContactNoNight] [nvarchar](255) NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpEmergencyContact] PRIMARY KEY CLUSTERED 
(
	[UploadEmpEmergencyContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[UploadEmpExtraFieldValue](
	[UploadEmpExtraFieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[EmpExtraFieldValueID] [int] NULL,
	[UploadEmpID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpExtraFieldID] [int] NULL,
	[EmpExtraFieldValue] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpExtraFieldValue] PRIMARY KEY CLUSTERED 
(
	[UploadEmpExtraFieldValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpFinalPayment]    Script Date: 07/29/2014 19:43:52 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpFinalPayment](
	[UploadEmpFinalPayID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[UploadEmpAccID] [int] NULL,
	[EmpFinalPayID] [int] NULL,
	[EmpID] [int] NULL,
	[PayCodeID] [int] NULL,
	[EmpFinalPayAmount] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[EmpFinalPayMethod] [nvarchar](50) NULL,
	[EmpAccID] [int] NULL,
	[EmpFinalPayIsAutoGen] [int] NULL,
	[EmpFinalPayNumOfDayAdj] [real] NULL,
	[LeaveAppID] [int] NULL,
	[PayRecID] [nchar](10) NULL,
	[CostCenterID] [int] NULL,
	[EmpFinalPayRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpFinalPayment] PRIMARY KEY CLUSTERED 
(
	[UploadEmpFinalPayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpHierarchy]    Script Date: 07/29/2014 19:43:57 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpHierarchy](
	[UploadEmpHierarchyID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpPosID] [int] NULL,
	[EmpHierarchyID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpPosID] [int] NULL,
	[HElementID] [int] NULL,
	[HLevelID] [int] NULL,
 CONSTRAINT [PK_UploadEmpHierarchy] PRIMARY KEY CLUSTERED 
(
	[UploadEmpHierarchyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpMPFPlan]    Script Date: 07/29/2014 19:44:04 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpMPFPlan](
	[UploadEmpMPFID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpMPFID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpMPFEffFr] [datetime] NULL,
	[EmpMPFEffTo] [datetime] NULL,
	[MPFPlanID] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpMPFPlan] PRIMARY KEY CLUSTERED 
(
	[UploadEmpMPFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpORSOPlan]    Script Date: 07/29/2014 19:44:11 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpORSOPlan](
	[UploadEmpORSOID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpORSOID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpORSOEffFr] [datetime] NULL,
	[EmpORSOEffTo] [datetime] NULL,
	[ORSOPlanID] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpORSOPlan] PRIMARY KEY CLUSTERED 
(
	[UploadEmpORSOID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpPermit]    Script Date: 07/29/2014 19:44:18 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpPermit](
	[UploadEmpPermitID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpPermitID] [int] NULL,
	[EmpID] [int] NULL,
	[PermitTypeID] [int] NULL,
	[EmpPermitNo] [nvarchar](50) NULL,
	[EmpPermitIssueDate] [datetime] NULL,
	[EmpPermitExpiryDate] [datetime] NULL,
	[EmpPermitRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpPermit] PRIMARY KEY CLUSTERED 
(
	[UploadEmpPermitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpPersonalInfo]    Script Date: 07/29/2014 19:44:26 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpPersonalInfo](
	[UploadEmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmpNo] [nvarchar](20) NULL,
	[EmpStatus] [nvarchar](3) NULL,
	[EmpEngSurname] [nvarchar](20) NULL,
	[EmpEngOtherName] [nvarchar](55) NULL,
	[EmpChiFullName] [nvarchar](50) NULL,
	[EmpAlias] [nvarchar](100) NULL,
	[EmpHKID] [nvarchar](50) NULL,
	[EmpGender] [nvarchar](1) NULL,
	[EmpMaritalStatus] [nvarchar](10) NULL,
	[EmpDateOfBirth] [datetime] NULL,
	[EmpPlaceOfBirth] [nvarchar](100) NULL,
	[EmpNationality] [nvarchar](100) NULL,
	[EmpPassportNo] [nvarchar](100) NULL,
	[EmpPassportIssuedCountry] [nvarchar](40) NULL,
	[EmpPassportExpiryDate] [datetime] NULL,
	[EmpResAddr] [nvarchar](200) NULL,
	[EmpResAddrAreaCode] [nvarchar](1) NULL,
	[EmpCorAddr] [nvarchar](200) NULL,
	[EmpDateOfJoin] [datetime] NULL,
	[EmpServiceDate] [datetime] NULL,
	[EmpNoticePeriod] [int] NULL,
	[EmpNoticeUnit] [nvarchar](1) NULL,
	[EmpProbaPeriod] [int] NULL,
	[EmpProbaUnit] [nvarchar](1) NULL,
	[EmpProbaLastDate] [datetime] NULL,
	[EmpEmail] [nvarchar](100) NULL,
	[EmpInternalEmail] [nvarchar](100) NULL,
	[EmpHomePhoneNo] [nvarchar](100) NULL,
	[EmpMobileNo] [nvarchar](100) NULL,
	[EmpOfficePhoneNo] [nvarchar](100) NULL,
	[Remark] [ntext] NULL,
	[EmpTimeCardNo] [nvarchar](255) NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
	[EmpNextSalaryIncrementDate] [datetime] NULL,
 CONSTRAINT [PK_UploadEmpPersonalInfo] PRIMARY KEY CLUSTERED 
(
	[UploadEmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpPlaceOfResidence]    Script Date: 07/29/2014 19:44:32 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpPlaceOfResidence](
	[UploadEmpPoRID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpPoRID] [int] NOT NULL,
	[EmpID] [int] NULL,
	[EmpPoRFrom] [datetime] NULL,
	[EmpPoRTo] [datetime] NULL,
	[EmpPoRLandLord] [nvarchar](100) NULL,
	[EmpPoRLandLordAddr] [nvarchar](110) NULL,
	[EmpPoRPropertyAddr] [nvarchar](110) NULL,
	[EmpPoRNature] [nvarchar](19) NULL,
	[EmpPoRPayToLandER] [numeric](18, 4) NOT NULL,
	[EmpPoRPayToLandEE] [numeric](18, 4) NOT NULL,
	[EmpPoRRefundToEE] [numeric](18, 4) NOT NULL,
	[EmpPoRPayToERByEE] [numeric](18, 4) NOT NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpPlaceOfResidence] PRIMARY KEY CLUSTERED 
(
	[UploadEmpPoRID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpPositionInfo]    Script Date: 07/29/2014 19:44:39 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpPositionInfo](
	[UploadEmpPosID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpPosID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpPosEffFr] [datetime] NULL,
	[EmpPosEffTo] [datetime] NULL,
	[CompanyID] [int] NULL,
	[PositionID] [int] NULL,
	[RankID] [int] NULL,
	[EmploymentTypeID] [int] NULL,
	[StaffTypeID] [int] NULL,
	[PayGroupID] [int] NULL,
	[LeavePlanID] [int] NULL,
	[EmpPosIsLeavePlanResetEffectiveDate] [int] NULL,
	[YEBPlanID] [int] NULL,
	[AuthorizationWorkFlowIDLeaveApp] [int] NULL,
	[AuthorizationWorkFlowIDEmpInfoModified] [int] NULL,
	[AttendancePlanID] [int] NULL,
	[EmpPosDefaultRosterCodeID] [int] NULL,
	[WorkHourPatternID] [int] NULL,
	[RosterTableGroupID] [int] NULL,
	[EmpPosIsRosterTableGroupSupervisor] [int] NULL,
	[EmpPosRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
	[AuthorizationWorkFlowIDOTClaims] [int] NULL,
 CONSTRAINT [PK_UploadEmpPositionInfo] PRIMARY KEY CLUSTERED 
(
	[UploadEmpPosID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpQualification]    Script Date: 07/29/2014 19:44:44 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpQualification](
	[UploadEmpQualificationID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpQualificationID] [int] NULL,
	[EmpID] [int] NULL,
	[QualificationID] [int] NULL,
	[EmpQualificationFrom] [datetime] NULL,
	[EmpQualificationTo] [datetime] NULL,
	[EmpQualificationInstitution] [nvarchar](100) NULL,
	[EmpQualificationLearningMethod] [nvarchar](100) NULL,
	[EmpQualificationRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpQualification] PRIMARY KEY CLUSTERED 
(
	[UploadEmpQualificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpRecurringPayment]    Script Date: 07/29/2014 19:44:50 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpRecurringPayment](
	[UploadEmpRPID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[UploadEmpAccID] [int] NULL,
	[EmpRPID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpRPEffFr] [datetime] NULL,
	[EmpRPEffTo] [datetime] NULL,
	[PayCodeID] [int] NULL,
	[EmpRPAmount] [decimal](15, 4) NULL,
	[CurrencyID] [nvarchar](3) NULL,
	[EmpRPUnit] [nvarchar](50) NULL,
	[EmpRPMethod] [nvarchar](50) NULL,
	[EmpAccID] [int] NULL,
	[EmpRPIsNonPayrollItem] [int] NULL,
	[CostCenterID] [int] NULL,
	[EmpRPRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
	[SchemeCode] [nvarchar](24) NULL,
	[Capacity] [nvarchar](255) NULL,
	[Point] [decimal](5, 2) NULL,
 CONSTRAINT [PK_UploadEmpRecurringPayment] PRIMARY KEY CLUSTERED 
(
	[UploadEmpRPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpRosterTableGroup]    Script Date: 07/29/2014 19:44:55 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpRosterTableGroup](
	[UploadEmpRosterTableGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpRosterTableGroupID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpRosterTableGroupEffFr] [datetime] NULL,
	[EmpRosterTableGroupEffTo] [datetime] NULL,
	[RosterTableGroupID] [int] NULL,
	[EmpRosterTableGroupIsSupervisor] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpRosterTableGroup] PRIMARY KEY CLUSTERED 
(
	[UploadEmpRosterTableGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpSkill]    Script Date: 07/29/2014 19:45:01 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpSkill](
	[UploadEmpSkillID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpSkillID] [int] NULL,
	[EmpID] [int] NULL,
	[SkillID] [int] NULL,
	[SkillLevelID] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpSkill] PRIMARY KEY CLUSTERED 
(
	[UploadEmpSkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpSpouse]    Script Date: 07/29/2014 19:45:06 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpSpouse](
	[UploadEmpSpouseID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpSpouseID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpSpouseSurname] [nvarchar](20) NULL,
	[EmpSpouseOtherName] [nvarchar](40) NULL,
	[EmpSpouseChineseName] [nvarchar](50) NULL,
	[EmpSpouseDateOfBirth] [datetime] NULL,
	[EmpSpouseHKID] [nvarchar](12) NULL,
	[EmpSpousePassportNo] [nvarchar](40) NULL,
	[EmpSpousePassportIssuedCountry] [nvarchar](40) NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpSpouse] PRIMARY KEY CLUSTERED 
(
	[UploadEmpSpouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpTermination]    Script Date: 07/29/2014 19:45:12 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpTermination](
	[UploadEmpTermID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpTermID] [int] NULL,
	[EmpID] [int] NULL,
	[CessationReasonID] [int] NULL,
	[EmpTermResignDate] [datetime] NULL,
	[EmpTermNoticePeriod] [int] NULL,
	[EmpTermNoticeUnit] [nvarchar](1) NULL,
	[EmpTermLastDate] [datetime] NULL,
	[EmpTermRemark] [ntext] NULL,
	[EmpTermIsTransferCompany] [int] NULL,
	[NewEmpID] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpTermination] PRIMARY KEY CLUSTERED 
(
	[UploadEmpTermID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpWorkExp]    Script Date: 07/29/2014 19:45:17 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpWorkExp](
	[UploadEmpWorkExpID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpWorkExpID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpWorkExpFromYear] [int] NULL,
	[EmpWorkExpFromMonth] [int] NULL,
	[EmpWorkExpToYear] [int] NULL,
	[EmpWorkExpToMonth] [int] NULL,
	[EmpWorkExpCompanyName] [nvarchar](100) NULL,
	[EmpWorkExpPosition] [nvarchar](100) NULL,
	[EmpWorkExpEmploymentTypeID] [int] NULL,
	[EmpWorkExpIsRelevantExperience] [int] NULL,
	[EmpWorkExpRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpWorkExp] PRIMARY KEY CLUSTERED 
(
	[UploadEmpWorkExpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpWorkingSummary]    Script Date: 07/29/2014 19:45:24 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpWorkingSummary](
	[UploadEmpWorkingSummaryID] [int] IDENTITY(1,1) NOT NULL,
	[EmpWorkingSummaryID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpWorkingSummaryAsOfDate] [datetime] NULL,
	[EmpWorkingSummaryRestDayEntitled] [real] NULL,
	[EmpWorkingSummaryRestDayTaken] [real] NULL,
	[EmpWorkingSummaryTotalWorkingDays] [real] NULL,
	[EmpWorkingSummaryTotalWorkingHours] [real] NULL,
	[EmpWorkingSummaryTotalLunchTimeHours] [real] NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpWorkingSummary] PRIMARY KEY CLUSTERED 
(
	[UploadEmpWorkingSummaryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadEmpWorkInjuryRecord]    Script Date: 07/29/2014 19:45:30 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadEmpWorkInjuryRecord](
	[UploadEmpWorkInjuryRecordID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[EmpWorkInjuryRecordID] [int] NULL,
	[EmpID] [int] NULL,
	[EmpWorkInjuryRecordAccidentDate] [datetime] NULL,
	[EmpWorkInjuryRecordAccidentLocation] [nvarchar](100) NULL,
	[EmpWorkInjuryRecordAccidentReason] [nvarchar](100) NULL,
	[EmpWorkInjuryRecordInjuryNature] [nvarchar](50) NULL,
	[EmpWorkInjuryRecordReportedDate] [datetime] NULL,
	[EmpWorkInjuryRecordChequeReceivedDate] [datetime] NULL,
	[EmpWorkInjuryRecordSettleDate] [datetime] NULL,
	[EmpWorkInjuryRecordRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadEmpWorkInjuryRecord] PRIMARY KEY CLUSTERED 
(
	[UploadEmpWorkInjuryRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadLeaveApplication]    Script Date: 07/29/2014 19:45:35 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadLeaveApplication](
	[UploadLeaveAppID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[LeaveAppID] [int] NULL,
	[EmpID] [int] NULL,
	[LeaveCodeID] [int] NULL,
	[LeaveAppUnit] [nvarchar](1) NULL,
	[LeaveAppDateFrom] [datetime] NULL,
	[LeaveAppDateTo] [datetime] NULL,
	[LeaveAppTimeFrom] [datetime] NULL,
	[LeaveAppTimeTo] [datetime] NULL,
	[LeaveAppDays] [decimal](15, 4) NULL,
	[LeaveAppHours] [decimal](15, 4) NULL,
	[LeaveAppRemark] [ntext] NULL,
	[LeaveAppNoPayProcess] [int] NULL,
	[LeaveAppHasMedicalCertificate] [int] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadLeaveApplication] PRIMARY KEY CLUSTERED 
(
	[UploadLeaveAppID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadLeaveBalanceAdjustment]    Script Date: 07/29/2014 19:45:40 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadLeaveBalanceAdjustment](
	[UploadLeaveBalAdjID] [int] IDENTITY(1,1) NOT NULL,
	[UploadEmpID] [int] NULL,
	[LeaveBalAdjID] [int] NULL,
	[EmpID] [int] NULL,
	[LeaveBalAdjDate] [datetime] NULL,
	[LeaveTypeID] [int] NULL,
	[LeaveBalAdjType] [nvarchar](50) NULL,
	[LeaveBalAdjValue] [real] NULL,
	[LeaveBalAdjRemark] [ntext] NULL,
	[SynID] [nvarchar](255) NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadLeaveBalanceAdjustment] PRIMARY KEY CLUSTERED 
(
	[UploadLeaveBalAdjID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadRosterTable]    Script Date: 07/29/2014 19:45:45 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadRosterTable](
	[UploadRosterTableID] [int] IDENTITY(1,1) NOT NULL,
	[RosterTableID] [int] NULL,
	[EmpID] [int] NULL,
	[RosterTableDate] [datetime] NULL,
	[RosterCodeID] [int] NULL,
	[RosterTableOverrideInTime] [datetime] NULL,
	[RosterTableOverrideOutTime] [datetime] NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadRosterTable] PRIMARY KEY CLUSTERED 
(
	[UploadRosterTableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[UploadTimeCardRecord]    Script Date: 07/29/2014 19:45:51 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UploadTimeCardRecord](
	[UploadTimeCardRecordID] [int] IDENTITY(1,1) NOT NULL,
	[TimeCardRecordID] [int] NULL,
	[EmpID] [int] NULL,
	[TimeCardRecordCardNo] [nvarchar](20) NULL,
	[TimeCardRecordDateTime] [datetime] NULL,
	[TimeCardRecordLocation] [nvarchar](50) NULL,
	[TimeCardRecordInOutIndex] [int] NULL,
	[TimeCardRecordOriginalData] [ntext] NULL,
	[SessionID] [nvarchar](200) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ImportAction] [nvarchar](100) NULL,
	[ModifiedFieldList] [ntext] NULL,
 CONSTRAINT [PK_UploadTimeCardRecord] PRIMARY KEY CLUSTERED 
(
	[UploadTimeCardRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


