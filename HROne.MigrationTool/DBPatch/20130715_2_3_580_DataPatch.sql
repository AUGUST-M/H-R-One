UPDATE PayrollGroup
SET PayGroupTerminatedPaymentInLieuMonthlyBaseMethodAlternative=''
WHERE PayGroupTerminatedPaymentInLieuMonthlyBaseMethodAlternative IS NULL

UPDATE PayrollGroup
SET PayGroupTerminatedLSPSPMonthlyBaseMethodAlternative=''
WHERE PayGroupTerminatedLSPSPMonthlyBaseMethodAlternative IS NULL