-- =================================================================
-- Query to Simultaneously Calculate TotalReferrals,TotalAccepted
-- =================================================================

SELECT
  COUNT(DISTINCT r.ReferralId)                AS TotalReferrals,
  SUM(r.ReferralsAccepted)                    AS TotalAccepted
FROM HealthCentral.CIM.vwOP_Referrals r
LEFT JOIN HealthCentral.CIM.vwIP_DescSpecialtyProgramForCube sp
  ON r.ClinicSpecialtyProviderRowIdentifier = sp.ProviderRowIdentifier
LEFT JOIN HealthCentral.CIM.vwDimDate_ForCube dd
  ON r.ReferralReceivedDateId = dd.DateId
WHERE dd.FinancialYear = '2025'
  AND sp.MedicalSpecialty LIKE 'urology%'
  AND ISNULL(r.ArchiveFlag,0)=0;



-- =================================================================
-- Query to Simultaneously Calculate TotalBookedAppts,TotalAttendedAppts,TotalCancelledAppts
-- =================================================================

SELECT
  SUM(a.TotalBookedAppointments)           AS TotalBookedAppts,
  SUM(a.TotalAttended)                     AS TotalAttendedAppts,
  SUM(a.CancelledAndDeceasedAppointments)  AS TotalCancelledAppts
FROM CIM.vwOP_Appointments a
LEFT JOIN CIM.vwIP_DescSpecialtyProgramForCube sp
  ON a.ClinicSpecialtyProviderRowIdentifier = sp.ProviderRowIdentifier
WHERE a.FinancialYear = 2025
  AND sp.MedicalSpecialty LIKE 'Urology%';



