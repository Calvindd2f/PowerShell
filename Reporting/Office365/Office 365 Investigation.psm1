Mandiant-Azure-AD-Investigator


PS C:\Users\calvin\Documents\Powershell\Mandiant-Azure-AD-Investigator-master> Invoke-MandiantAllChecks -OutputPath .\
Running all checks...
Checking for suspicious Azure AD App Registrations...
Checking for suspicious Service Principals...
Checking federated domains...
	!! An unverified domain is configured in Azure AD 
	Unverified domains should be deleted from Azure AD
		Domain Name : 	dread.ie
Checking for partner relationships...
No partner relationship found.
Make sure to run this check with Global Administrator account as partner relationships are not visible to global or security reader roles.
Checking for partner groups in EXO Role Groups...
No partner groups found in EXO Role Groups.
Auditing mailbox folder permissions...
This may take awhile (an hour+ if you have a large tenant) hold tight...
Results are written to folder_permissions.csv. If the file is empty you have nothing to do!
Search for 'Update Application' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:57' -EndDate '08/04/2022 20:08:57' -ResultSize 1000  -Operations 'Update application' -Session
Command ReturnLargeSet -SessionID 2022-08-03T20:08:57_o365auditlog_890219589
Search for 'Set domain authentication' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:57' -EndDate '08/04/2022 20:08:57' -ResultSize 1000  -Operations 'Set domain authentication' -
SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:57_o365auditlog_1088878952
Search for 'Set federation settings on domain' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:58' -EndDate '08/04/2022 20:08:58' -ResultSize 1000  -Operations 'Set federation settings on d
omain' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:58_o365auditlog_691665420
Search for 'Update application - Certificates and secrets management' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:58' -EndDate '08/04/2022 20:08:58' -ResultSize 1000  -Operations 'Update application - Certifi
cates and secrets management' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:58_o365auditlog_1837598542
Search for Mailbox Login events using PowerShell
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:58' -EndDate '08/04/2022 20:08:58' -ResultSize 1000  -FreeText 'Powershell' -Operations 'Mailb
oxLogin' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:58_o365auditlog_266887707
Search for 'Update service principal' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:58' -EndDate '08/04/2022 20:08:58' -ResultSize 1000  -Operations 'Update service principal' -S
essionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:58_o365auditlog_187337709
Search for 'Add service principal credentials' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:59' -EndDate '08/04/2022 20:08:59' -ResultSize 1000  -Operations 'Add service principal creden
tials' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:59_o365auditlog_492423005
Search for Add app role assignment' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:59' -EndDate '08/04/2022 20:08:59' -ResultSize 1000  -Operations 'Add app role assignment' -Se
ssionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:59_o365auditlog_965587312
Search for 'Add app role assignment grant to user.' events
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:59' -EndDate '08/04/2022 20:08:59' -ResultSize 1000  -Operations 'Add app role assignment gran
t to user.' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:59_o365auditlog_942426737
Search for PowerShell authentication events. These events are not inherently bad
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:08:59' -EndDate '08/04/2022 20:08:59' -ResultSize 1000  -FreeText 'a0c73c16-a7e3-4564-9a95-2bdf47
383716' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:08:59_o365auditlog_68279715
Search for PowerShell authentication events. These events are not inherently bad
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:09:00' -EndDate '08/04/2022 20:09:00' -ResultSize 1000  -FreeText '1b730954-1685-4b74-9bfd-dac224
a7b894' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:09:00_o365auditlog_639312985
Search for Mailbox folder permission modificatons.
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:09:00' -EndDate '08/04/2022 20:09:00' -ResultSize 1000  -Operations 'ModifyFolderPermissions' -Se
ssionCommand ReturnLargeSet -SessionID 2022-08-03T20:09:00_o365auditlog_1971415777
Search for new Management Role Assignments.
Query returned no results
Search-UnifiedAuditLog -StartDate '05/05/2022 20:09:00' -EndDate '08/04/2022 20:09:00' -ResultSize 1000  -Operations 'New-ManagementRoleAssignment
' -SessionCommand ReturnLargeSet -SessionID 2022-08-03T20:09:00_o365auditlog_1603886052
Auditing ApplicationImpersonation role holders...
Results are written to application_impersonation_holders.csv. If the file is empty, then no users or groups hold this role.
