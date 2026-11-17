# Cybersecurity Homelab — Infrastructure Build Log

**Project:** Two-Host Cybersecurity & Active Directory Homelab  
**Project Type:** Independent / Self-Directed  
**Project Start:** October 15, 2026  
**Status:** In Progress — Phase 2: Active Directory & Identity Management  
**Role:** Homelab Administrator / Security Analyst (Simulated)

## 1. Project Overview

### Objective

Design, deploy, administer, secure, and monitor a simulated enterprise IT environment using virtualization, Windows Server, Active Directory, PowerShell, and security monitoring technologies.

The project simulates the infrastructure of **Black Shores**, a fictional cybersecurity and intelligence organization with a planned workforce of 30 employees across five departments.

The homelab is designed to provide practical experience in:

- Windows Server administration and Active Directory Domain Services (AD DS).
- Identity and Access Management (IAM).
- PowerShell scripting and administrative automation.
- DNS administration and virtual networking.
- Organizational Unit and security group management.
- Group Policy and endpoint security configuration.
- Role-based access control (RBAC) and least-privilege administration.
- Windows and Linux systems administration.
- Security Information and Event Management (SIEM).
- Security event investigation and incident response.
- Infrastructure troubleshooting, change management, and technical documentation.

### Simulated Organization

| Property | Configuration |
|---|---|
| Organization | Black Shores |
| Industry | Cybersecurity and Intelligence (Simulated) |
| Planned Workforce | 30 Employees |
| Departments | IT, Human Resources, Finance, Sales, Operations |
| Active Directory Domain | corp.blackshores.test |
| NetBIOS Domain Name | BLACKSHORES |
| Primary Domain Controller | DC01 |
| Domain Controller IP | 10.50.10.10 |
| Internal Network | CORP-LAN |
| Network Subnet | 10.50.10.0/24 |

### Implementation Approach

The homelab follows a phased development approach.

**Phase 1 — Infrastructure Preparation**

Assess physical hardware, prepare virtualization software, deploy Windows Server, configure its initial security baseline, and establish a recovery point.

**Phase 2 — Enterprise Network and Identity Management**

Deploy isolated corporate networking, establish Active Directory and DNS, configure departmental organizational structures, and implement automated employee provisioning.

Subsequent Phase 2 work includes domain-joined workstations, Group Policy, and access-control validation.

**Future Phases — Security Operations and Monitoring**

Introduce additional Windows and Linux systems, centralized security monitoring, endpoint logging, controlled security testing, incident investigation, and cross-host integration.

### Current Accomplishments

As of October 16, 2026:

- Upgraded Oracle VirtualBox to version 7.2.20.
- Deployed Windows Server 2025 Standard Evaluation on DC01.
- Established an isolated VirtualBox Internal Network.
- Configured persistent static IPv4 addressing.
- Installed Active Directory Domain Services and DNS.
- Created the corp.blackshores.test forest.
- Verified domain controller services, DNS records, and initial health checks.
- Created eight custom Organizational Units.
- Created five departmental Global Security Groups.
- Provisioned 30 fictional employee accounts.
- Automated 29 account provisioning operations using PowerShell.
- Implemented CSV-based validation, duplicate checking, and dry-run previews.
- Verified initial account security requirements and group membership.
- Completed five documented infrastructure and IAM change records.

### Intended Deliverables

The project will produce:

- A functional multi-machine enterprise cybersecurity homelab.
- Documented infrastructure architecture and network configurations.
- An operational Active Directory environment.
- Automated PowerShell administration and IAM scripts.
- Documented Group Policy and access-control configurations.
- Domain-joined Windows client systems.
- Centralized security monitoring and event collection.
- Controlled security testing and incident investigation reports.
- Change records, troubleshooting documentation, and verification evidence.
- A selected collection of technical artifacts suitable for a professional cybersecurity portfolio.

**Project Status:** In Progress

The initial infrastructure and employee-provisioning milestones are complete. Domain-joined endpoint deployment, security policy enforcement, resource-level access testing, and centralized monitoring remain to be implemented.

## 2. Available Infrastructure

### Host 1 — Primary Virtualization Server

**Computer:** Custom Windows Desktop

| Component | Specification |
|---|---|
| CPU | Intel Core i7-8700K |
| Physical Cores | 6 |
| Logical Processors | 12 |
| Installed RAM | 32GB |
| Host OS | Windows 10 Pro, Build 19045 |
| Virtualization Platform | Oracle VirtualBox 7.2.20 |
| Selected VM Storage | E: — Crucial MX500 SSD, approximately 790GB available |
| Network Connection | Ethernet |

**Assigned purpose:** Host infrastructure-intensive workloads, including Windows Server, Active Directory, and centralized security monitoring.

### Host 2 — Secondary Virtualization Host

**Computer:** MSI GT73VR 6RE Titan

| Component | Specification |
|---|---|
| CPU | 4 cores / 8 logical processors |
| Installed RAM | 16GB (2 × 8GB DDR4) |
| Memory Speed | 2133 MHz |
| Installed Storage | Approximately 476GB C: volume and 932GB D: volume |
| Host OS | Windows 10 22H2 |
| Virtualization | Enabled |
| Network Connection | Wi-Fi |

**Assigned purpose:** Host test endpoints, participate in network simulations, and provide a secondary system for administration and security testing.

**Upgrade consideration:** An additional 16GB of RAM was considered. Upgrade deferred pending workload and resource evaluation.

### Host Security

Both physical systems are enrolled in Windows 10 Extended Security Updates, as reported by the administrator. Windows 11 migration is not currently planned.

## 3. Infrastructure Preparation — Completed Work

### 3.1 Hardware Assessment

**Status:** Completed

Inspected CPU specifications, physical memory, available storage, and virtualization capability.

**Findings:**
- Primary desktop provides greater CPU and memory capacity for concurrent virtual machines.
- MSI Titan remains suitable for lighter workloads and endpoint testing.
- Existing hardware is sufficient to begin the project without additional purchases.
- Selected an SSD on the desktop for active virtual machines to improve storage performance.

### 3.2 Existing Virtual Machine Inventory

**Status:** Completed — Initial Inventory

Discovered 10 previously configured Ubuntu virtual machines from academic networking exercises.

The machines are organized into:
- SimpleNetworking: Four VMs
- SimpleNetworking2: Five VMs
- Standalone Ubuntu Desktop: One VM

Inspected the configuration of Machine-A.

**Finding:** Machine-A is attached to a VirtualBox Internal Network, suggesting that the previous exercise used isolated virtual networking.

Most legacy virtual disks are located under the user's VirtualBox directory on C:. One Ubuntu desktop virtual disk is stored on E:.

**Decision:** Retain the legacy machines for potential reuse and future Linux networking exercises.

### 3.3 Existing VM Backup

**Status:** Backup folders created; content verification pending

Copied legacy VM data to backup directories on the G: physical hard drive. Separate backup locations were prepared for legacy machines and VirtualBox global configuration data.

**Purpose:** Preserve configurations, virtual hard disks, and snapshots before modifying the virtualization software.

**Verification still required:** Confirm all expected VM files, virtual disk images, and snapshot dependencies are present in the backups.

### 3.4 VirtualBox Upgrade

**Status:** Completed

**Previous Version:** Oracle VirtualBox 7.0.14  
**New Version:** Oracle VirtualBox 7.2.20

**Actions:**
1. Obtained the newer Windows installer from Oracle.
2. Executed the upgrade using the existing Windows installation.
3. Left optional Python scripting dependencies uninstalled.
4. Completed installation without a restart requirement.
5. Launched VirtualBox and confirmed the previously registered virtual machines remained listed.

**Result:** VirtualBox upgraded successfully with the existing virtual machines still registered.

### 3.5 Virtual Machine Storage Configuration

**Status:** Completed

Configured the VirtualBox default machine folder:

`E:\Homelab\VMs`

**Reasoning:**
- Avoid additional storage consumption on the nearly full C: drive.
- Use SSD storage for better VM responsiveness.
- Organize new infrastructure separately from legacy academic projects.

**Result:** Default machine folder saved in VirtualBox settings.

### 3.6 Physical Network Assessment

**Status:** Initial assessment completed

Both physical computers connect to the same home router.

- Primary desktop: Ethernet
- MSI Titan: Wi-Fi

**Design consideration:** Cross-host virtual machine communication must be configured deliberately. Intentionally vulnerable machines must remain isolated from the normal home network.

**Not yet implemented:** Network connectivity between virtual machines hosted on separate physical computers.

## 4. Infrastructure Status and Roadmap

### 4.1 Physical Host Environment

The Black Shores homelab is designed around two physical Windows computers.

**Primary Virtualization Host**

- System: Custom Windows Desktop
- Processor: Intel Core i7-8700K
- Memory: 32 GB RAM
- Host Operating System: Windows 10 Pro
- Virtualization Platform: Oracle VirtualBox 7.2.20
- Primary VM Storage: E: SSD
- Network Connection: Ethernet
- Status: Operational — Primary virtualization host

**Secondary Virtualization Host**

- System: MSI GT73VR 6RE Titan
- Processor: 4 cores / 8 logical processors
- Memory: 16 GB RAM
- Host Operating System: Windows 10 22H2
- Network Connection: Wi-Fi
- Status: Available — Not yet integrated into the active lab network

The primary desktop currently hosts the operational Black Shores domain controller.

The MSI Titan is reserved for future endpoint, administration, and security testing workloads.

### 4.2 Current Infrastructure Inventory

| Component | Purpose | Status |
|---|---|---|
| Oracle VirtualBox 7.2.20 | Virtualization platform | Operational |
| DC01 — Windows Server 2025 | Primary Windows Server | Operational |
| CORP-LAN | Isolated corporate virtual network | Configured |
| Active Directory Domain Services | Centralized directory and authentication infrastructure | Operational |
| DNS Server | Internal domain name resolution | Operational |
| Organizational Units | Departmental object organization | Configured |
| Global Security Groups | Departmental security group membership | Configured |
| Employee Accounts | Simulated enterprise workforce | 30 Created |
| PowerShell IAM Automation | CSV-driven employee provisioning | Tested and Operational |
| Windows Client VM | Domain-joined endpoint | Planned |
| Ubuntu Server | Linux administration and security workloads | Planned |
| Wazuh SIEM | Centralized endpoint and security monitoring | Planned |
| Cross-Host Networking | Communication between physical host environments | Not Implemented |

### 4.3 DC01 — Current Configuration

| Property | Configuration |
|---|---|
| Computer Name | DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Installation Type | Desktop Experience |
| Memory | 4096 MB |
| Virtual CPUs | 3 |
| Virtual Disk | 80 GB VDI |
| Firmware | EFI |
| Network Adapter | VirtualBox Internal Network |
| Network Name | CORP-LAN |
| IPv4 Address | 10.50.10.10 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | None |
| DNS Server | 10.50.10.10 |
| Domain | corp.blackshores.test |
| NetBIOS Name | BLACKSHORES |

**Evaluation License:**

Windows Server 2025 Standard Evaluation was confirmed licensed during initial setup.

Recorded evaluation expiration: April 14, 2027.

### 4.4 Active Directory Infrastructure

The initial Active Directory forest has been established.

**Domain:** corp.blackshores.test

**Domain Controller:** DC01

**Forest Functional Level:** Windows Server 2025

**Domain Functional Level:** Windows Server 2025

**Implemented Directory Components:**

- Active Directory Domain Services.
- DNS Server.
- Global Catalog.
- Eight custom Organizational Units.
- Five departmental Global Security Groups.
- Thirty fictional employee accounts.

**Employee Distribution:**

| Department | Employees |
|---|---:|
| IT | 6 |
| Human Resources | 4 |
| Finance | 5 |
| Sales | 7 |
| Operations | 8 |
| **Total** | **30** |

### 4.5 IAM Automation

The Black Shores environment includes a tested PowerShell provisioning workflow.

**Primary Provisioning Script:**

`New-BlackShoresUsers.ps1` — Version 2

**Supporting Scripts:**

- `Test-BlackShoresEmployees.ps1`
- `AD-Provision-Check.ps1`

**Implemented Functions:**

- CSV employee data import.
- Required-field validation.
- Department and security group mapping.
- Duplicate username detection.
- Active Directory OU and group validation.
- `-WhatIf` provisioning previews.
- Automated account creation.
- Departmental security group assignment.
- Initial password security enforcement.
- Post-provisioning verification.
- Basic provisioning failure handling.

**Verified Results:**

- 29 employee accounts provisioned through automation.
- One employee account created manually.
- 24 expansion accounts passed an independent security audit.
- All 30 planned accounts were accounted for in the final departmental inventory.

**Scripts and Data Locations:**

- DC01 working directory: `C:\Lab\IAM`
- Primary host scripts directory: `E:\Homelab\Scripts\IAM`

### 4.6 Recovery and Backup Status

**Existing Recovery Point:**

`DC01 - Clean Baseline - Pre-AD`

Created October 16, 2026.

This VirtualBox snapshot preserves the Windows Server environment before Active Directory deployment.

**Current Limitations:**

- A separate post-IAM provisioning snapshot has not yet been created.
- A current independent backup of the deployed domain controller has not yet been verified.
- Legacy Ubuntu VM backup completeness remains unverified.

Snapshots are retained as convenient recovery points but are not substitutes for independent backups.

### 4.7 Planned Infrastructure Expansion

The next infrastructure priorities are:

1. Preserve the current domain controller configuration with an appropriate recovery and backup strategy.
2. Deploy a Windows client VM on CORP-LAN.
3. Join the client to the Black Shores Active Directory domain.
4. Test domain authentication using nonadministrative employee accounts.
5. Implement and verify Group Policy configurations.
6. Configure departmental resource permissions.
7. Test least-privilege access and security group enforcement.
8. Introduce Linux administration and centralized security monitoring.
9. Integrate the secondary MSI Titan host through controlled network connectivity.

**Current Infrastructure Status:** Initial domain infrastructure and IAM provisioning operational; endpoint deployment and security monitoring remain in progress or planned.

## 5. Current Project Decisions

| Decision | Justification |
|---|---|
| Retain Windows 10 on both hosts | Preserve existing systems and workflows |
| Use VirtualBox | Familiarity from prior coursework and existing installation |
| Use desktop as primary host | Greater processing and memory resources |
| Defer RAM purchases | Existing combined resources are sufficient initially |
| Preserve legacy VMs | Retain previous networking exercises and configuration work |
| Use E: SSD for new VMs | Performance, organization, and capacity |
| Document each major configuration | Build reproducibility and professional portfolio evidence |

## 6. Outstanding Work

The initial Windows Server, Active Directory, and IAM provisioning milestones have been completed.

The following work remains to develop the homelab into a broader enterprise cybersecurity environment.

### 6.1 Immediate Priorities — Infrastructure Protection

- [ ] Establish and verify a current independent backup of DC01.
- [ ] Create a documented post-IAM provisioning recovery point, accounting for Active Directory recovery considerations.
- [ ] Review domain controller time synchronization following Active Directory promotion.
- [ ] Preserve the tested PowerShell automation scripts, employee CSV templates, and verification evidence.
- [ ] Organize and finalize CHG-005 evidence references.

### 6.2 Domain-Joined Endpoint Deployment

- [ ] Create the first Windows client virtual machine.
- [ ] Connect the client to CORP-LAN.
- [ ] Configure the client to use DC01 for DNS.
- [ ] Join the client to corp.blackshores.test.
- [ ] Test authentication using a simulated employee account.
- [ ] Verify initial password-change behavior during employee sign-in.
- [ ] Confirm domain controller discovery and client network connectivity.

### 6.3 Group Policy and Access Control

- [ ] Design initial domain security and workstation Group Policy settings.
- [ ] Create and link Group Policy Objects to appropriate OUs.
- [ ] Test Group Policy application on domain-joined clients.
- [ ] Configure departmental file or resource access permissions.
- [ ] Verify access using departmental security group memberships.
- [ ] Test permitted and denied access scenarios.
- [ ] Document least-privilege and RBAC validation results.

### 6.4 IAM Lifecycle Management

- [ ] Develop account disablement and deprovisioning automation.
- [ ] Test employee department transfers and security group changes.
- [ ] Develop account reporting and audit scripts.
- [ ] Review privileged administrative account separation.
- [ ] Evaluate delegated administration and service account requirements.

### 6.5 Security Monitoring and Incident Response

- [ ] Deploy the planned Wazuh SIEM environment.
- [ ] Configure Windows endpoint event collection.
- [ ] Evaluate Sysmon deployment and logging.
- [ ] Establish monitoring for account changes, authentication events, and privilege activity.
- [ ] Perform controlled security detection and investigation exercises.
- [ ] Document simulated security incidents and remediation procedures.

### 6.6 Secondary Host and Linux Integration

- [ ] Determine the workload allocation for the MSI Titan.
- [ ] Evaluate the secondary host's memory requirements.
- [ ] Design secure connectivity between virtual machines on both physical hosts.
- [ ] Verify that cross-host lab networking does not unnecessarily expose the home network.
- [ ] Deploy additional Linux systems for administration and security exercises.
- [ ] Evaluate the reuse of existing academic Ubuntu virtual machines.

### 6.7 Deferred Maintenance and Validation

- [ ] Verify the completeness of the legacy VM backups.
- [ ] Test representative legacy Ubuntu VMs after the VirtualBox upgrade.
- [ ] Continue applying applicable Windows security updates.
- [ ] Track Windows Server evaluation licensing and expiration.
- [ ] Maintain independent backups of important virtual machines and documentation.
- [ ] Periodically review the security of host-to-guest integration features.

### 6.8 Documentation and Portfolio Development

- [ ] Link evidence screenshots to the relevant change records.
- [ ] Produce a current logical network architecture diagram.
- [ ] Document Active Directory and IAM automation scripts.
- [ ] Create selected technical demonstrations suitable for a public portfolio.
- [ ] Review portfolio artifacts for sensitive information before publication.
- [ ] Develop accurate resume bullet points based on completed and verified project work.

**Next Immediate Milestone:** Preserve the current post-IAM DC01 environment, then deploy and join the first Windows client to the Black Shores Active Directory domain.

## 7. Documentation and Evidence Standards

For each major configuration change, record:

**Objective:** What is being accomplished?  
**Configuration:** Which settings, commands, and tools were used?  
**Reasoning:** Why were these choices made?  
**Verification:** How was the result tested?  
**Challenges:** What errors, issues, or unexpected results occurred?  
**Resolution:** What fixed the problem?  
**Evidence:** Screenshots, command output, logs, or configuration exports.

Do not publish personal usernames, IP addresses associated with personal infrastructure, passwords, credentials, or sensitive files in the public portfolio.

## 8. Current Project Status

**Last Updated:** October 16, 2026

**Overall Status:** In Progress

**Current Phase:** Phase 2 — Enterprise Network, Active Directory, and Identity Management

### 8.1 Project Progress

**Phase 1 — Infrastructure Preparation**

**Status:** Initial deployment completed

Completed major activities:

- Physical hardware and virtualization assessment.
- VirtualBox upgrade to version 7.2.20.
- Windows Server 2025 VM provisioning.
- Initial startup troubleshooting.
- Windows Server installation and configuration.
- Security updates and evaluation licensing verification.
- Time synchronization verification.
- Pre-Active Directory baseline snapshot creation.
- Phase 1 evidence organization.

Legacy VM functionality and backup completeness remain deferred verification items.

**Phase 2 — Enterprise Network and Active Directory**

**Status:** In Progress — Initial infrastructure and IAM provisioning completed

Completed major activities:

- Isolated CORP-LAN virtual network configuration.
- DC01 persistent static IP configuration.
- Active Directory Domain Services installation.
- Black Shores forest and domain deployment.
- DNS and domain controller health verification.
- Organizational Unit hierarchy creation.
- Departmental security group creation.
- Manual employee account provisioning.
- PowerShell IAM automation development and testing.
- Full 30-employee workforce provisioning.
- Independent employee security audits.

Remaining Phase 2 work includes domain-joined endpoints, Group Policy deployment, and departmental access-control validation.

### 8.2 Operational Infrastructure Summary

| Component | Current State |
|---|---|
| Primary Virtualization Host | Operational |
| Secondary MSI Titan Host | Available — Not Integrated |
| Windows Server DC01 | Operational |
| Active Directory Domain | Operational |
| DNS Server | Operational |
| CORP-LAN | Configured |
| Departmental OUs | 5 Configured |
| Departmental Security Groups | 5 Configured |
| Employee Accounts | 30 Created |
| PowerShell IAM Provisioning | Tested and Operational |
| Domain-Joined Client | Not Yet Deployed |
| Group Policy Testing | Not Yet Performed |
| Resource-Level RBAC Testing | Not Yet Performed |
| Centralized Security Monitoring | Not Yet Deployed |

### 8.3 Identity Management Milestone

Black Shores has reached its planned simulated workforce of 30 employees.

**Final Workforce Distribution:**

| Department | Employees |
|---|---:|
| IT | 6 |
| HumanResources | 4 |
| Finance | 5 |
| Sales | 7 |
| Operations | 8 |
| **Total** | **30** |

**Provisioning Methods:**

- 1 account created manually.
- 29 accounts provisioned through PowerShell automation.

**Verified Security Configuration:**

- Departmental OU placement.
- Departmental security group membership.
- Account-enabled status.
- Initial password-change requirements.
- Password expiration configuration.
- Department and job title attributes during expansion verification.

The 24-account expansion passed an independent audit with 24 successful results and zero failures.

These results establish the initial IAM provisioning milestone but do not yet demonstrate workstation authentication or resource-level authorization.

### 8.4 Completed Change Records

| Change Record | Description | Status |
|---|---|---|
| CHG-001 | VirtualBox Upgrade | Completed |
| CHG-002 | DC01 Provisioning and Baseline Preparation | Completed |
| CHG-003 | Black Shores Network and Domain Controller Deployment | Completed |
| CHG-004 | Active Directory Organizational Structure and Security Groups | Completed |
| CHG-005 | Active Directory User Provisioning and Group Membership | Completed |

Deferred verification items are retained within the applicable change records.

### 8.5 Current Limitations

The Black Shores environment is currently operating as a single-domain-controller virtual lab.

Employee accounts and security groups have been created, but domain-joined workstation authentication and resource permissions have not yet been tested.

Additional infrastructure is required before the lab can demonstrate centralized endpoint security, Group Policy enforcement, comprehensive access-control testing, or SIEM-based incident detection.

The MSI Titan remains available as a secondary physical system but has not been integrated into the operational virtual network.

### 8.6 Next Milestone

**Protect the Completed IAM Environment and Deploy the First Domain-Joined Client**

The next planned activities are:

1. Establish an appropriate current DC01 backup and recovery point.
2. Prepare the first Windows client virtual machine.
3. Connect the client to CORP-LAN.
4. Join the client to corp.blackshores.test.
5. Validate employee authentication and initial password-change behavior.
6. Begin Group Policy and resource access-control testing.

**Project Outlook:**

The initial infrastructure and IAM deployment objectives have been achieved. Subsequent work will focus on verifying how centrally managed identities, security policies, and access permissions behave on actual domain-joined client systems.

## 9. Change Log

### CHG-001: VirtualBox Upgrade

**Date:** October 15, 2026

**Status:** Completed — Legacy VM Functional Verification Pending

**Change Type:** Virtualization Infrastructure Maintenance

**Platform:** Oracle VirtualBox

**Host System:** Primary Windows 10 Desktop

---

#### Objective

Upgrade Oracle VirtualBox from version 7.0.14 to version 7.2.20 in preparation for deploying the Black Shores cybersecurity homelab.

Preserve previously configured virtual machines, virtual disk images, and application configuration data while updating the virtualization platform.

Establish a stable foundation for subsequent Windows Server, Active Directory, Linux, and cybersecurity testing environments.

#### 1. Pre-Upgrade Environment Assessment

The primary virtualization host was running Oracle VirtualBox 7.0.14.

An inventory identified ten previously configured Ubuntu virtual machines originating from earlier academic networking exercises.

**Existing Virtual Machine Inventory:**

| Virtual Machine Group | VM Count |
|---|---:|
| SimpleNetworking | 4 |
| SimpleNetworking2 | 5 |
| Standalone Ubuntu Desktop | 1 |
| **Total** | **10** |

Most legacy virtual disk files were stored under the existing VirtualBox directory on the C: drive. One standalone Ubuntu Desktop virtual disk was located on the E: drive.

**Configuration Review:**

Inspected the configuration of Machine-A and identified an existing VirtualBox Internal Network attachment.

This indicated that at least part of the legacy environment had been configured for isolated virtual networking.

**Decision:**

Retain all ten legacy virtual machines for potential reuse in future Linux administration, networking, and security testing exercises.

#### 2. Backup Preparation and Risk Assessment

**Identified Risk:**

Upgrading the virtualization platform could introduce compatibility issues affecting existing virtual machines, virtual disks, saved states, or snapshot configurations.

**Precautions Taken:**

1. Identified existing virtual machines and their associated storage locations.
2. Prepared separate backup directories on the G: physical hard drive.
3. Copied legacy virtual machine data into the designated backup location.
4. Prepared backup storage for VirtualBox global configuration data.
5. Preserved the existing virtual machines rather than deleting or rebuilding them.

**Purpose:**

Reduce the risk of losing existing academic VM configurations and provide recovery material if the VirtualBox upgrade caused unexpected issues.

**Outstanding Verification:**

The completeness of the backup contents has not been independently verified.

Additional verification is required to confirm that all necessary VM configuration files, virtual disk images, and snapshot dependencies are present and usable.

#### 3. VirtualBox Upgrade Implementation

**Previous Version:** Oracle VirtualBox 7.0.14

**Target Version:** Oracle VirtualBox 7.2.20

**Actions Performed:**

1. Obtained the VirtualBox 7.2.20 Windows installer from Oracle.
2. Initiated the installation on the primary Windows desktop.
3. Proceeded with the upgrade of the existing VirtualBox installation.
4. Reviewed the installer notification concerning optional Python scripting dependencies.
5. Continued without installing the optional Python bindings.
6. Completed the installation successfully.
7. Launched VirtualBox Manager to inspect the updated environment.

**Optional Dependency Notification:**

During installation, VirtualBox reported that its optional Python bindings required additional Python components.

The optional Python integration was not required for the planned graphical VM administration workflow.

**Decision:**

Continue the installation without configuring the optional Python scripting dependencies.

These components can be installed separately if future automation requirements justify their use.

**Restart Requirement:**

The installer completed without prompting for a system restart.

**Installation Result:**

Oracle VirtualBox 7.2.20 was successfully installed.

#### 4. Post-Upgrade Verification

Launched Oracle VirtualBox Manager following installation.

**Verification Performed:**

- Confirmed that the VirtualBox installation completed successfully.
- Confirmed that VirtualBox Manager launched.
- Confirmed the virtualization platform was upgraded to version 7.2.20.
- Confirmed previously registered virtual machines remained visible in VirtualBox Manager.
- Confirmed that the existing legacy VM inventory had not been removed from the application's registered machine list.

**Observed Result:**

All previously registered virtual machines remained listed after the upgrade.

This confirmed that the installation preserved their registration in VirtualBox Manager.

**Verification Limitation:**

The presence of a VM in VirtualBox Manager does not independently confirm that its virtual disk, operating system, or saved state remains functional.

Individual VM boot testing was not performed as part of this change.

#### 5. Issues, Decisions, and Limitations

**Issue 1 — Optional Python Dependencies**

The installer identified missing dependencies for optional Python bindings.

**Resolution:**

Continued installation without those optional components because they were not required for the immediate homelab deployment.

**Result:**

The main VirtualBox installation completed successfully.

**Issue 2 — Legacy VM Compatibility Risk**

Existing Ubuntu virtual machines could potentially experience compatibility problems following the upgrade.

**Mitigation:**

Preserved existing VM data in designated backup storage and confirmed that the machines remained registered after installation.

**Remaining Limitation:**

Legacy VM boot functionality and backup completeness have not yet been verified.

No specific post-upgrade VM compatibility failure has been confirmed.

#### 6. Evidence and Artifacts

**Recommended Evidence:**

- VirtualBox 7.2.20 installation completion screen.
- VirtualBox Manager showing the existing registered virtual machines after the upgrade.
- Available screenshots of the legacy VM inventory and backup preparation.

**Related Configuration:**

- Virtualization platform: Oracle VirtualBox 7.2.20
- Primary host: Windows 10 desktop
- Legacy backup destination: G: physical hard drive

**Related Documentation:**

- Section 3.2 — Existing Virtual Machine Inventory
- Section 3.3 — Existing VM Backup
- Section 3.4 — VirtualBox Upgrade

Evidence filenames and links will be standardized during the final evidence organization process.

#### 7. Remaining Verification

The following checks remain outstanding:

- [ ] Verify the completeness of legacy VM backups.
- [ ] Confirm the required virtual disk files and snapshot dependencies are present.
- [ ] Boot representative legacy Ubuntu virtual machines.
- [ ] Confirm basic operating system functionality after the VirtualBox upgrade.
- [ ] Investigate and document any compatibility issues discovered during testing.

These checks are deferred and do not prevent deployment of new Black Shores virtual machines.

---

#### Final Result

Successfully upgraded Oracle VirtualBox from version 7.0.14 to version 7.2.20 on the primary Windows desktop.

The upgrade completed without requiring a restart, and previously registered virtual machines remained listed in VirtualBox Manager.

Optional Python scripting dependencies were deferred because they were not needed for the initial homelab implementation.

Legacy VM functionality and backup completeness remain outstanding verification items.

**Final Status:** Completed — Legacy VM Functional Verification Pending

**Outcome:** The virtualization platform was upgraded and prepared for the initial Black Shores Windows Server deployment while preserving the existing registered virtual machine inventory.

**Next Change:** CHG-002 — DC01 Provisioning and Boot Troubleshooting.


### CHG-002: DC01 Provisioning, Configuration, and Baseline Preparation

**Date:** October 15–16, 2026

**Status:** Completed

**Change Type:** Virtual Machine Deployment / Windows Server Administration

**Virtualization Platform:** Oracle VirtualBox 7.2.20

**Host System:** Primary Windows 10 Desktop

**Virtual Machine:** DC01

---

#### Objective

Deploy and configure the first Windows Server 2025 virtual machine for the Black Shores cybersecurity homelab.

Establish a functional, updated, and documented Windows Server baseline before installing Active Directory Domain Services (AD DS).

Perform initial operating system configuration, resolve installation issues, configure temporary internet connectivity, verify time synchronization and evaluation licensing, install security updates, and preserve a clean recovery point.

#### 1. Virtual Machine Creation and Configuration

Created a new virtual machine named `DC01` using Oracle VirtualBox 7.2.20.

**Operating System:**

Windows Server 2025 Standard Evaluation (Desktop Experience)

**Final Virtual Machine Configuration:**

| Component | Configuration |
|---|---|
| Virtual Machine Name | DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Installation Type | Desktop Experience |
| Memory | 4096 MB (4 GB) |
| Processors | 3 vCPUs |
| Virtual Disk | 80 GB |
| Disk Format | VDI (VirtualBox Disk Image) |
| Disk Allocation | Dynamically allocated |
| Firmware | EFI enabled |
| Graphics Controller | VBoxSVGA |
| Video Memory | 128 MB |
| Virtualization Platform | VirtualBox 7.2.20 |

**Initial Configuration:**

The VM was originally configured with two virtual processors and 4096 MB of RAM.

The processor allocation was subsequently increased to three vCPUs during startup troubleshooting.

**Storage Configuration:**

Selected the E: SSD as the storage location for the new Black Shores virtual machine.

Virtual disk files were kept separate from legacy academic virtual machines.

**Installation Media:**

Mounted the Windows Server 2025 Evaluation ISO through the VirtualBox virtual optical drive.

**Installation Method:**

Selected manual installation rather than VirtualBox's unattended installation option.

**Result:**

DC01 was successfully created with the resources required for initial Windows Server administration and subsequent Active Directory deployment.

---

#### 2. Initial Startup Issue and Troubleshooting

**Issue Encountered:**

During the initial startup attempt, DC01 displayed a black screen rather than immediately loading the Windows Server installation environment.

The virtual machine remained in a running state.

**Initial Symptoms:**

- VirtualBox reported DC01 as running.
- The virtual machine display remained black.
- The Windows Server installation interface did not initially appear.
- The display remained unresponsive for several minutes.

**Troubleshooting Actions:**

1. Observed the virtual machine's initial startup behavior.
2. Confirmed that VirtualBox reported the VM as running.
3. Powered off the virtual machine.
4. Reviewed the virtual hardware configuration.
5. Increased the processor allocation from two to three vCPUs.
6. Restarted the virtual machine.
7. Confirmed that the Windows Server installation interface subsequently appeared.

**Result:**

Windows Server Setup successfully launched, allowing installation to proceed.

**Root Cause:**

The exact cause of the initial black-screen behavior was not conclusively determined.

The successful startup occurred after the processor configuration change, but the available evidence does not establish that processor allocation was the sole cause.

**Resolution Status:** Resolved for continued installation.

---

#### 3. Windows Server 2025 Installation

**Installation Actions:**

1. Booted DC01 using the Windows Server 2025 Evaluation ISO.
2. Selected English (United States) installation and regional settings.
3. Selected Windows Server 2025 Standard Evaluation (Desktop Experience).
4. Proceeded with the graphical installation environment.
5. Selected the new 80 GB virtual disk as the installation destination.
6. Allowed Windows Server Setup to create the required partitions.
7. Completed operating system installation.
8. Configured the built-in Administrator account password.
9. Completed the initial Windows Server privacy and diagnostic settings.
10. Signed in using the Administrator account.

**Installation Edition Decision:**

Selected Standard Evaluation with Desktop Experience rather than Server Core.

**Reasoning:**

The graphical interface was appropriate for the initial homelab because it provides access to Server Manager, Windows Settings, and graphical administration tools.

This also supports learning Windows Server administration alongside PowerShell-based management.

**Verification:**

Successfully signed in to Windows Server and launched Server Manager.

**Result:**

Windows Server 2025 Standard Evaluation was installed and operational.

---

#### 4. Computer Name Configuration

**Initial Condition:**

Windows Server assigned an automatically generated computer name during installation.

**Required Configuration:**

Rename the server to `DC01`.

**Actions Performed:**

1. Opened Server Manager.
2. Navigated to Local Server properties.
3. Changed the computer name to DC01.
4. Restarted Windows Server to apply the configuration.

**Verification:**

Confirmed that Server Manager displayed `DC01` as the computer name after restarting.

**Reasoning:**

A consistent server naming convention improves identification, administration, troubleshooting, and documentation.

The name DC01 was selected because the server was intended to become the first Active Directory domain controller in the Black Shores environment.

**Result:**

Computer name successfully configured as DC01.

---

#### 5. Time Zone and System Clock Configuration

**Objective:**

Configure the server's regional time settings and establish accurate system time before deploying Active Directory.

**Actions Performed:**

1. Opened Windows Server time and date settings.
2. Selected Central Time (US & Canada).
3. Manually adjusted the system clock during initial configuration.
4. Subsequently configured and verified automatic time synchronization.

**Reasoning:**

Accurate time synchronization is important in an Active Directory environment, particularly for Kerberos authentication and the interpretation of security event timestamps.

Incorrect system time can contribute to authentication failures and misleading event timelines.

**Verification:**

Confirmed the Central Time configuration and subsequently verified successful synchronization with an external Windows Time source.

**Result:**

Regional time settings were configured, and the server's time synchronization was verified before domain controller deployment.

---

#### 6. Temporary Network Configuration

**Objective:**

Provide DC01 with temporary outbound internet connectivity to obtain Windows security updates and verify licensing and time synchronization.

**Initial Network Configuration:**

Configured the VirtualBox network adapter to use Network Address Translation (NAT).

**Observed Network Settings:**

| Property | Value |
|---|---|
| Network Mode | NAT |
| IPv4 Address | 10.0.2.15 |
| Default Gateway | 10.0.2.2 |
| Address Assignment | DHCP |

**Verification Commands:**

`ipconfig /all`

`Test-NetConnection www.microsoft.com -Port 443`

**Verification Results:**

- DC01 received an IPv4 address through DHCP.
- The expected VirtualBox NAT gateway was identified.
- TCP connectivity to `www.microsoft.com` on port 443 succeeded.
- The connection test reported `TcpTestSucceeded : True`.

**Reasoning:**

Temporary NAT connectivity provided outbound access for initial maintenance without requiring permanent integration into the home network.

This configuration was intended only for initial server preparation.

**Security Consideration:**

The production-style Black Shores laboratory network would later use a separate VirtualBox Internal Network.

**Result:**

Temporary outbound internet connectivity was successfully established and verified.

---

#### 7. Windows Time Synchronization

**Objective:**

Verify that DC01 could synchronize its system clock with a reliable external time source.

**Commands Used:**

`w32tm /query /source`

`w32tm /query /status`

**Observed Configuration:**

| Property | Verified Value |
|---|---|
| Time Source | time.windows.com |
| Synchronization Protocol | SNTP |
| Stratum | 5 |
| Leap Indicator | 0 — No warning |
| Last Successful Synchronization | October 16, 2026, 1:09:08 AM |

**Verification:**

Windows Time reported a successful synchronization event and identified `time.windows.com` as the configured source.

**Reasoning:**

Active Directory relies on consistent timekeeping across domain controllers and domain-joined computers.

Confirming time synchronization before AD DS deployment reduced the possibility of introducing avoidable time-related authentication problems.

**Result:**

External time synchronization was successfully verified while temporary NAT connectivity was available.

**Future Consideration:**

The domain time hierarchy and synchronization behavior should be reviewed after additional domain-joined systems are deployed.

---

#### 8. Windows Server Evaluation Licensing Verification

**Objective:**

Confirm the licensing and evaluation status of the installed Windows Server operating system.

**Commands Used:**

`slmgr /xpr`

`slmgr /dlv`

**Verification Results:**

| Property | Verified Value |
|---|---|
| Operating System Edition | Windows Server 2025 Standard Evaluation |
| License Status | Licensed |
| Evaluation Period | 180 days |
| Evaluation Expiration | April 14, 2027 |

**Verification:**

Windows Software Licensing Management displayed the evaluation edition and confirmed its time-based licensing status.

**Reasoning:**

The evaluation edition provides an appropriate environment for nonproduction Windows Server administration and Active Directory practice.

Tracking the evaluation expiration date helps avoid unexpected interruptions to the homelab.

**Result:**

Windows Server evaluation licensing was verified.

**Limitation:**

The evaluation license is time-limited. The expiration date reflects the status verified during initial deployment, not a permanent license.

---

#### 9. Initial Windows Security Updates

**Objective:**

Install available security and reliability updates before promoting DC01 to an Active Directory domain controller.

**Actions Performed:**

1. Opened Windows Update.
2. Checked for available updates.
3. Downloaded and installed the initial security and maintenance updates.
4. Monitored installation progress.
5. Restarted Windows Server when required.
6. Rechecked Windows Update after the restart.

**Updates Recorded:**

| Update | Knowledge Base |
|---|---|
| Windows Server Security Update | KB5126646 |
| .NET Framework Security Update | KB5127690 |
| Microsoft Defender Security Intelligence Update | KB2267602 |
| Windows Malicious Software Removal Tool | KB890830 |
| Windows Security Platform Update | KB5007651 |

**Issue Encountered:**

Some updates appeared to remain at low installation or download percentages for an extended period.

The .NET Framework security update and Windows Server security update initially progressed slowly.

**Troubleshooting and Observation:**

- Monitored update progress.
- Allowed installation processes to continue.
- Avoided forcibly interrupting the installation.
- Confirmed that the updates eventually reached the pending-restart state.
- Restarted DC01 to complete installation.

**Verification:**

After the restart, Windows Update reported:

"You're up to date."

**Result:**

The initial available Windows security updates were installed, and Windows Update reported no additional applicable updates at the time of verification.

**Limitation:**

This result represents the update state at the time of the check. Ongoing patch management remains necessary.

---

#### 10. Final Pre-Active Directory Configuration Review

**Objective:**

Confirm that DC01 was prepared for Active Directory deployment.

**Verified Configuration:**

- Windows Server 2025 Standard Evaluation installed.
- Desktop Experience operational.
- Computer name configured as DC01.
- 4096 MB RAM allocated.
- Three virtual processors configured.
- 80 GB virtual disk available.
- EFI enabled.
- Central Time configured.
- Time synchronization verified.
- Initial security updates installed.
- Evaluation licensing verified.
- Server Manager operational.

**Network Configuration:**

Temporary NAT connectivity was used for initial maintenance.

Before proceeding with the isolated Active Directory deployment, the temporary network connection was disconnected.

Permanent Black Shores network configuration was reserved for CHG-003.

**Result:**

DC01 was prepared for the next stage of infrastructure deployment.

---

#### 11. Clean Baseline Snapshot

**Objective:**

Preserve the configured Windows Server environment before installing Active Directory Domain Services.

**Snapshot Information:**

| Property | Value |
|---|---|
| Snapshot Name | DC01 - Clean Baseline - Pre-AD |
| Virtual Machine | DC01 |
| Date | October 16, 2026 |
| Snapshot Type | VirtualBox VM snapshot |
| Active Directory Installed | No |
| Network State | Disconnected |

**Actions Performed:**

1. Completed initial Windows Server configuration.
2. Verified operating system updates and evaluation licensing.
3. Confirmed the intended server name and virtual hardware configuration.
4. Disconnected the temporary network connection.
5. Powered off DC01.
6. Created a VirtualBox snapshot.
7. Added a descriptive snapshot name and configuration notes.
8. Verified that the snapshot appeared in VirtualBox Manager.

**Reasoning:**

A pre-Active Directory snapshot provides a recovery point if subsequent domain controller deployment encounters significant configuration or installation problems.

The snapshot also allows the initial Windows Server environment to be reviewed without reconstructing the entire installation process.

**Verification:**

VirtualBox Manager displayed the snapshot:

`DC01 - Clean Baseline - Pre-AD`

**Result:**

Successfully established and verified a clean Windows Server recovery point before AD DS deployment.

**Recovery Limitation:**

A VirtualBox snapshot is not a substitute for an independent VM backup. Snapshot dependencies must remain intact, and later restoration can discard changes made after the snapshot.

Restoring domain controllers also requires additional precautions once Active Directory is deployed.

---

#### 12. Issues, Resolutions, and Lessons Learned

| Issue | Resolution or Outcome |
|---|---|
| Initial black screen during VM startup | Increased vCPU allocation and successfully restarted installation; exact cause undetermined |
| Automatically generated Windows Server computer name | Renamed server to DC01 and verified after restart |
| Initial system clock required adjustment | Configured Central Time and verified external synchronization |
| Temporary internet connectivity required | Used VirtualBox NAT and verified HTTPS connectivity |
| Slow security update progress | Continued monitoring until updates completed and restart was requested |
| Need for safe recovery before AD DS deployment | Created and verified a clean pre-AD snapshot |

**Key Lessons:**

- VM startup problems should be investigated before assuming the installation media is defective.
- Changes made during troubleshooting should be documented even when the precise root cause remains unknown.
- Time synchronization should be verified before implementing domain authentication services.
- Operating system security updates should be applied before deploying critical infrastructure roles.
- Licensing status and expiration should be tracked.
- Recovery points should be created before major configuration changes.
- Successful installation should be supported by independent verification wherever possible.

---

#### 13. Evidence and Artifacts

**Evidence Collected:**

- DC01 initial virtual machine configuration.
- Virtual hardware settings and adjustments.
- Windows Server installation and initial configuration.
- Successful Administrator sign-in.
- Server Manager dashboard and computer name verification.
- Time zone and synchronization verification.
- Temporary NAT networking and successful connectivity testing.
- Evaluation licensing status.
- Windows security updates and completion.
- Clean pre-Active Directory snapshot.

**Primary Artifacts:**

- DC01 Windows Server 2025 virtual machine.
- DC01 dynamically allocated 80 GB VDI.
- Windows Server 2025 Evaluation installation media.
- VirtualBox snapshot: `DC01 - Clean Baseline - Pre-AD`.

**Evidence Directory:**

Phase 1 infrastructure preparation evidence, maintained under the Black Shores homelab evidence directory.

Specific screenshot filenames and references will be standardized during final evidence organization.

---

#### 14. Remaining Considerations

The following activities were intentionally deferred to later change records:

- Permanent isolated corporate network configuration.
- Static IP addressing for DC01.
- Active Directory Domain Services installation.
- Domain controller promotion.
- DNS service configuration and validation.
- Domain controller health testing.

These activities were subsequently addressed under CHG-003.

Ongoing maintenance considerations include Windows Server evaluation expiration, future security updates, VM backup management, and domain time synchronization.

---

#### Final Result

Successfully provisioned Windows Server 2025 Standard Evaluation (Desktop Experience) in Oracle VirtualBox 7.2.20.

Resolved the initial startup problem sufficiently to complete installation, configured the server as DC01, established temporary connectivity, verified time synchronization and evaluation licensing, and installed initial Windows security updates.

Created and verified a clean pre-Active Directory snapshot to preserve the initial server configuration.

The exact cause of the original black-screen startup behavior was not conclusively determined, but the problem did not prevent successful deployment.

**Final Status:** Completed

**Outcome:** DC01 was successfully configured and prepared for Active Directory Domain Services deployment, with a documented initial security baseline and VirtualBox recovery point.

**Next Change:** CHG-003 — Black Shores Network and Domain Controller Deployment.

### CHG-003: Black Shores Network and Domain Controller Deployment

**Date:** October 16, 2026

**Status:** Completed

**Change Type:** Virtual Networking / Active Directory Domain Services / DNS Administration

**Organization:** Black Shores

**Virtualization Platform:** Oracle VirtualBox 7.2.20

**Domain Controller:** DC01

---

#### Objective

Design and deploy an isolated corporate network for the fictional Black Shores organization.

Configure DC01 with persistent static IPv4 addressing, install Active Directory Domain Services (AD DS), and establish the first domain controller in a new Active Directory forest.

Implement integrated DNS services and verify that the domain controller can provide essential directory, name resolution, and authentication infrastructure for future domain-joined systems.

Establish the foundation for centralized Identity and Access Management (IAM), Group Policy, and departmental access control.

#### 1. Environment and Prerequisites

DC01 was previously provisioned and configured during CHG-002.

**Existing Server Configuration:**

| Component | Configuration |
|---|---|
| Server Name | DC01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Installation Type | Desktop Experience |
| Memory | 4 GB |
| Processors | 3 vCPUs |
| Virtual Disk | 80 GB VDI |
| Firmware | EFI enabled |
| Virtualization Platform | Oracle VirtualBox 7.2.20 |

**Previously Completed Preparation:**

- Windows Server installation.
- Initial security updates.
- Server computer name configuration.
- Central Time configuration.
- Time synchronization verification.
- Evaluation licensing verification.
- Creation of a clean pre-Active Directory snapshot.

**Recovery Point:**

`DC01 - Clean Baseline - Pre-AD`

This snapshot was created before installing Active Directory and provided a recovery point for the initial server environment.

---

#### 2. Black Shores Corporate Network Design

**Objective:**

Establish an isolated network for domain infrastructure and future simulated enterprise systems.

**Network Configuration:**

| Property | Value |
|---|---|
| Organization | Black Shores |
| VirtualBox Network Mode | Internal Network |
| Network Name | CORP-LAN |
| Network Subnet | 10.50.10.0/24 |
| Subnet Mask | 255.255.255.0 |
| Domain Controller | DC01 |
| DC01 IPv4 Address | 10.50.10.10 |
| Default Gateway | None |
| Preferred DNS Server | 10.50.10.10 |
| Active Directory Domain | corp.blackshores.test |
| NetBIOS Domain Name | BLACKSHORES |

**Design Reasoning:**

A VirtualBox Internal Network was selected to isolate the simulated corporate environment from the physical home network.

The design allows virtual machines connected to the same internal network to communicate without providing direct external network connectivity.

A static IPv4 address was reserved for DC01 because domain controllers and DNS servers require predictable network addressing.

The server was configured to use its own IPv4 address for DNS in preparation for hosting the domain's DNS service.

**Security Considerations:**

- No default gateway was configured.
- Direct external network routing was not enabled.
- The domain used the isolated `.test` naming convention.
- Internal network connectivity was limited to appropriately configured virtual machines.
- Future cross-host connectivity would require additional network design and implementation.

**Result:**

The logical Black Shores network design was established using the `CORP-LAN` VirtualBox Internal Network.

---

#### 3. VirtualBox Internal Network Configuration

**Objective:**

Attach DC01 to the isolated Black Shores network.

**Actions Performed:**

1. Powered off DC01.
2. Opened the virtual machine's network settings in VirtualBox.
3. Enabled Network Adapter 1.
4. Changed the attachment type to Internal Network.
5. Configured the network name as `CORP-LAN`.
6. Retained the Intel PRO/1000 MT Desktop virtual network adapter.
7. Left Virtual Cable Connected enabled.
8. Saved the configuration and started DC01.

**Verification:**

Confirmed that DC01's network adapter was connected to the designated internal network.

**Expected Network Behavior:**

Because CORP-LAN did not initially provide DHCP or internet routing services, the server could not obtain a conventional DHCP-assigned corporate address.

This behavior was consistent with the isolated network design.

**Result:**

DC01 was attached to the Black Shores Internal Network and prepared for static IPv4 configuration.

---

#### 4. Static IPv4 Configuration and Troubleshooting

**Objective:**

Assign DC01 the static address `10.50.10.10/24` and configure the server to use itself as its preferred DNS server.

**Initial Configuration Attempt:**

Entered the following settings using the Windows graphical IPv4 configuration interface:

- IP Address: 10.50.10.10
- Subnet Mask: 255.255.255.0
- Default Gateway: None
- Preferred DNS Server: 10.50.10.10

**Issue Encountered:**

After applying the graphical configuration, `ipconfig /all` continued reporting that DHCP was enabled.

The adapter also displayed an automatically assigned APIPA address in the `169.254.x.x` range.

**Observed Symptoms:**

- DHCP remained enabled.
- The intended static IPv4 address was not initially active.
- The Ethernet adapter received an APIPA address.
- No default gateway was present.
- DNS configuration did not reflect the intended final state.

**Troubleshooting Actions:**

1. Reviewed the IPv4 configuration entered through the graphical interface.
2. Rechecked network configuration using `ipconfig /all`.
3. Attempted `ipconfig /flushdns`, which did not resolve the addressing problem.
4. Queried the Ethernet adapter through PowerShell.
5. Confirmed that the adapter was present and connected.
6. Applied static IPv4 and DNS configuration using PowerShell.

**PowerShell Commands Used:**

`Get-NetAdapter`

`New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.50.10.10" -PrefixLength 24`

`Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "10.50.10.10"`

**Additional Verification Commands:**

`Get-NetIPAddress`

`Get-NetIPInterface`

`Get-DnsClientServerAddress`

`ipconfig /all`

**Troubleshooting Observation:**

The initial PowerShell address assignment displayed transitional address states, including Tentative and Invalid.

Subsequent verification confirmed that the intended address became Preferred.

**Root Cause:**

The exact reason the graphical configuration did not initially persist was not conclusively determined.

The issue was resolved through PowerShell-based network configuration.

---

#### 5. Static IP Persistence Verification

**Objective:**

Confirm that the static network settings were correctly applied and persisted.

**Verified Configuration:**

| Property | Result |
|---|---|
| Interface | Ethernet |
| IPv4 Address | 10.50.10.10 |
| Prefix Length | 24 |
| Subnet Mask | 255.255.255.0 |
| Address State | Preferred |
| DHCP | Disabled |
| Preferred DNS | 10.50.10.10 |
| Default Gateway | None |

**Verification Actions:**

- Queried the IPv4 address using PowerShell.
- Confirmed DHCP was disabled.
- Verified the configured DNS server.
- Reviewed the complete interface configuration using `ipconfig /all`.
- Restarted DC01.
- Repeated the network configuration checks after restart.

**Result:**

The static IPv4 address, subnet configuration, and preferred DNS settings remained correct after restarting DC01.

**Resolution Status:** Completed.

---

#### 6. Active Directory Domain Services Role Installation

**Objective:**

Install the Windows Server roles and management tools required to establish the Black Shores Active Directory domain.

**Installation Method:**

Server Manager — Add Roles and Features Wizard.

**Actions Performed:**

1. Opened Server Manager.
2. Selected Add Roles and Features.
3. Chose role-based or feature-based installation.
4. Selected DC01 as the destination server.
5. Selected Active Directory Domain Services.
6. Accepted the required management tools and dependencies.
7. Reviewed the installation selections.
8. Initiated installation.
9. Monitored installation progress.
10. Confirmed successful installation.

**Installed Components:**

- Active Directory Domain Services.
- Group Policy Management.
- Remote Server Administration Tools required for AD DS management.
- Active Directory administrative tools and Windows PowerShell module.

**Verification:**

Server Manager reported successful feature installation on DC01.

The installation wizard indicated that additional configuration was required to make the server a domain controller.

**Result:**

Active Directory Domain Services and supporting administrative tools were successfully installed.

**Important Distinction:**

Installing the AD DS role alone does not make a Windows Server a functioning domain controller.

A separate promotion operation was required.

---

#### 7. Active Directory Forest Deployment

**Objective:**

Promote DC01 as the first domain controller in a new Active Directory forest.

**Deployment Method:**

Active Directory Domain Services Configuration Wizard.

**Deployment Configuration:**

| Setting | Value |
|---|---|
| Deployment Operation | Add a new forest |
| Root Domain Name | corp.blackshores.test |
| NetBIOS Domain Name | BLACKSHORES |
| Forest Functional Level | Windows Server 2025 |
| Domain Functional Level | Windows Server 2025 |
| Domain Name System (DNS) Server | Enabled |
| Global Catalog | Enabled |
| Read-Only Domain Controller | Not selected |
| Initial Domain Controller | DC01 |

**Actions Performed:**

1. Selected Promote this server to a domain controller.
2. Selected Add a new forest.
3. Entered `corp.blackshores.test` as the root domain.
4. Selected Windows Server 2025 functional levels.
5. Retained the DNS Server and Global Catalog options.
6. Configured the Directory Services Restore Mode (DSRM) password.
7. Reviewed DNS delegation options.
8. Confirmed the NetBIOS domain name as BLACKSHORES.
9. Retained the default Active Directory database and SYSVOL paths.
10. Reviewed the forest configuration.
11. Executed prerequisite checks.
12. Initiated the domain controller promotion.

**Password Security:**

A separate DSRM password was configured.

The password was not included in the technical change log or published evidence.

---

#### 8. DNS Delegation Warning

**Issue Observed:**

During domain controller promotion, the configuration wizard displayed a warning indicating that DNS delegation could not be created because the authoritative parent zone could not be found.

**Context:**

Black Shores was being deployed as a new, isolated Active Directory forest using the domain `corp.blackshores.test`.

No existing parent DNS infrastructure had been established to delegate the new domain.

**Decision:**

Proceed without creating DNS delegation.

**Reasoning:**

The initial Black Shores environment was designed as a self-contained lab domain rather than a delegated child of an existing externally managed DNS infrastructure.

A delegation to an external parent zone was not required for the intended isolated deployment.

**Verification:**

The Active Directory prerequisite checks completed successfully despite the warning.

**Result:**

The DNS delegation warning was treated as nonblocking for the planned isolated forest deployment.

No DNS delegation was created.

---

#### 9. Active Directory Database and SYSVOL Configuration

**Objective:**

Review and confirm the storage locations used by Active Directory Domain Services.

**Configured Paths:**

| Component | Location |
|---|---|
| AD DS Database | `C:\Windows\NTDS` |
| AD DS Log Files | `C:\Windows\NTDS` |
| SYSVOL | `C:\Windows\SYSVOL` |

**Decision:**

Retain the default directory locations for the initial single-domain-controller environment.

**Reasoning:**

The lab did not require separate dedicated virtual disks for Active Directory database and log storage.

Using the default locations simplified deployment and administration for the initial infrastructure implementation.

**Result:**

The default AD DS database, log, and SYSVOL paths were retained during deployment.

---

#### 10. Prerequisite Checks and Domain Controller Promotion

**Objective:**

Confirm that DC01 satisfied the requirements for domain controller promotion.

**Verification:**

Executed the prerequisite checks through the Active Directory Domain Services Configuration Wizard.

**Observed Result:**

"All prerequisite checks passed successfully."

The DNS delegation warning remained visible but did not prevent promotion.

**Actions Performed:**

1. Confirmed the prerequisite check result.
2. Reviewed the selected deployment configuration.
3. Initiated installation.
4. Allowed Active Directory forest and domain creation to complete.
5. Allowed DC01 to restart automatically.

**Observed Behavior:**

Windows Server displayed a notification that the computer would be restarted because Active Directory Domain Services had been installed or removed.

**Result:**

DC01 successfully completed domain controller promotion and restarted.

---

#### 11. Domain Administrator Authentication Verification

**Objective:**

Confirm that DC01 had joined the newly created Black Shores domain as its initial domain controller.

**Verification Actions:**

1. Returned to the Windows Server sign-in screen.
2. Confirmed the domain Administrator sign-in identity was available.
3. Signed in using the BLACKSHORES domain Administrator account.
4. Opened PowerShell as Administrator.
5. Queried the authenticated identity and domain configuration.

**Commands Used:**

`whoami`

`Get-ADDomain`

**Verified Identity:**

`blackshores\administrator`

**Domain Properties Verified:**

| Property | Result |
|---|---|
| DNS Root | corp.blackshores.test |
| NetBIOS Name | BLACKSHORES |
| Domain Mode | Windows Server 2025 |
| PDC Emulator | DC01.corp.blackshores.test |

**Result:**

Successfully authenticated using the domain Administrator account.

PowerShell confirmed that DC01 was operating within the newly created Black Shores Active Directory domain.

---

#### 12. Active Directory and DNS Service Verification

**Objective:**

Confirm that the essential directory and DNS services were operational following domain controller promotion.

**Command Used:**

`Get-Service -Name NTDS,DNS`

**Verified Services:**

| Service | Display Name | Status |
|---|---|---|
| NTDS | Active Directory Domain Services | Running |
| DNS | DNS Server | Running |

**Reasoning:**

NTDS provides Active Directory directory services.

The DNS Server service supports domain name resolution and service discovery required by Active Directory clients.

**Result:**

Both required services were confirmed running on DC01.

---

#### 13. DNS Record and Domain Controller Discovery Verification

**Objective:**

Verify that DNS could resolve the domain controller's name and locate the domain controller through its Active Directory service records.

**DNS Server Queried:**

`10.50.10.10`

**Host Record Verification:**

Queried the A record for:

`DC01.corp.blackshores.test`

**Verified Result:**

The domain controller name resolved to:

`10.50.10.10`

**Service Record Verification:**

Queried the Active Directory LDAP domain controller service record:

`_ldap._tcp.dc._msdcs.corp.blackshores.test`

**Verified Result:**

The SRV record identified:

`dc01.corp.blackshores.test`

Additional DNS resolution information associated the domain controller with `10.50.10.10`.

**Reasoning:**

Active Directory relies on DNS service records to help clients and administrative tools discover domain controllers.

Correct A and SRV records are therefore essential to domain operations.

**Result:**

The initial domain controller host record and LDAP service discovery record were successfully queried and verified.

**Limitation:**

These tests confirmed the selected internal DNS records. They did not establish that external DNS resolution or domain-joined client discovery was fully operational.

---

#### 14. Domain Controller Diagnostic Testing

**Objective:**

Verify the initial domain controller's ability to advertise directory services and provide the required SYSVOL infrastructure.

**Diagnostic Utility:**

`dcdiag`

**Commands Executed:**

`dcdiag /test:Advertising`

`dcdiag /test:SysVolCheck`

**Advertising Test:**

Verified that DC01 passed the Advertising diagnostic test.

**SysVolCheck Test:**

Verified that DC01 passed the SysVolCheck diagnostic test.

**Observed Results:**

| Diagnostic Test | Result |
|---|---|
| Connectivity | Passed |
| Advertising | Passed |
| SysVolCheck | Passed |

**Reasoning:**

These checks help identify problems affecting domain controller service advertisement and SYSVOL availability.

**Result:**

DC01 successfully passed the selected domain controller diagnostic tests.

**Verification Limitation:**

These tests were targeted diagnostics rather than a comprehensive assessment of every possible Active Directory health condition.

---

#### 15. SYSVOL and NETLOGON Share Verification

**Objective:**

Confirm that the domain controller exposed the required Active Directory shared resources.

**PowerShell Command Used:**

`Get-SmbShare -Name SYSVOL,NETLOGON`

**Verified Shares:**

| Share | Path |
|---|---|
| SYSVOL | `C:\Windows\SYSVOL\sysvol` |
| NETLOGON | `C:\Windows\SYSVOL\sysvol\corp.blackshores.test\SCRIPTS` |

**Reasoning:**

SYSVOL stores domain-wide information used by Active Directory, including Group Policy-related files.

NETLOGON provides a shared location traditionally used for domain logon scripts and related administrative resources.

The presence of these shares supports verification that the initial domain controller completed essential post-promotion configuration.

**Result:**

Both SYSVOL and NETLOGON shares were present and accessible through Windows Server's SMB share enumeration.

---

#### 16. Issues, Resolutions, and Lessons Learned

| Issue or Observation | Resolution or Outcome |
|---|---|
| Static IPv4 settings did not initially persist through the GUI | Applied static addressing using PowerShell and verified persistence |
| Ethernet adapter received APIPA addressing | Configured 10.50.10.10/24 and confirmed DHCP was disabled |
| Initial address assignment showed transitional address states | Rechecked until the address was Preferred |
| No default gateway or internet connectivity | Expected configuration for isolated CORP-LAN |
| DNS delegation warning during promotion | Determined that external DNS delegation was not required for the isolated forest |
| Domain controller promotion required a restart | Allowed the automatic restart and confirmed domain Administrator sign-in |
| Need to verify AD DS functionality | Queried domain properties, services, and DNS records |
| Need to confirm domain controller health | Passed targeted DCDiag tests and verified SYSVOL/NETLOGON shares |

**Key Lessons Learned:**

- Domain controllers should have predictable network addressing.
- Graphical network changes should be verified using independent command-line tools.
- DHCP and static IP configurations should not be assumed correct until checked.
- A DNS delegation warning does not necessarily indicate a failed Active Directory deployment.
- Installing the AD DS role and promoting a server to a domain controller are separate operations.
- Domain controller promotion requires follow-up service, DNS, and directory verification.
- Active Directory depends on functional DNS for domain controller discovery.
- Successful deployment should be supported by diagnostic evidence, not merely a successful installation message.
- Configuration decisions should reflect the requirements and boundaries of the intended environment.

---

#### 17. Evidence and Artifacts

**Evidence Collected:**

- VirtualBox Internal Network configuration for CORP-LAN.
- Initial DHCP and APIPA configuration issue.
- PowerShell static IPv4 assignment.
- DNS client configuration.
- Verification of DHCP being disabled.
- Static IP persistence after restarting DC01.
- AD DS role installation selections.
- Successful AD DS role installation.
- New forest deployment configuration.
- Domain controller options and functional levels.
- DNS delegation warning.
- NetBIOS domain name configuration.
- Active Directory database and SYSVOL paths.
- Domain promotion configuration review.
- Successful prerequisite checks.
- Domain controller promotion and automatic restart.
- BLACKSHORES domain Administrator sign-in.
- Active Directory domain identity verification.
- NTDS and DNS service status.
- DNS A and LDAP SRV record verification.
- DCDiag Advertising and SysVolCheck results.
- SYSVOL and NETLOGON share verification.

**Primary Artifacts:**

- CORP-LAN VirtualBox Internal Network.
- DC01 Windows Server 2025 virtual machine.
- Active Directory forest: `corp.blackshores.test`.
- NetBIOS domain: `BLACKSHORES`.
- Domain controller and DNS server: `DC01`.
- Static IPv4 address: `10.50.10.10`.

**Evidence Directory:**

`E:\Homelab\Evidence\Phase-02-Active-Directory\01-CHG-003-Network-ADDS`

Evidence screenshots will be linked and standardized separately during the final evidence organization process.

---

#### 18. Security Considerations and Remaining Work

**Implemented Configuration:**

- Isolated VirtualBox Internal Network.
- Static IPv4 addressing for the domain controller.
- No default gateway on the isolated network.
- Dedicated internal Active Directory domain.
- Windows Server 2025 functional levels.
- Integrated DNS service.
- Global Catalog enabled.
- Domain Administrator authentication verified.
- Essential AD DS and DNS services verified.
- Initial directory and DNS diagnostic testing completed.

**Not Yet Implemented or Verified During This Change:**

- Additional domain controllers and replication.
- Domain-joined workstation authentication.
- Departmental user and security group management.
- Group Policy deployment and validation.
- Departmental resource permissions.
- Centralized security monitoring.
- Cross-host virtual machine networking.
- Production-style Active Directory backup and recovery testing.

These activities were reserved for later change records and project phases.

**Security Note:**

The environment is an isolated training lab. Passing the initial domain controller health checks does not establish comprehensive enterprise security hardening.

Additional identity security, endpoint management, logging, patch management, and access-control testing remain necessary.

---

#### Final Result

Successfully configured DC01 with a persistent static IPv4 address on the isolated Black Shores CORP-LAN network.

Installed Active Directory Domain Services and promoted DC01 as the first domain controller in the new `corp.blackshores.test` forest.

Established the BLACKSHORES NetBIOS domain, configured DNS and Global Catalog services, and completed the domain controller promotion.

Independently verified the domain identity, Administrator authentication, essential Windows services, DNS resolution, LDAP service discovery, selected domain controller diagnostics, and SYSVOL/NETLOGON shared resources.

The original graphical static IP configuration issue was resolved through PowerShell, although its precise root cause was not conclusively determined.

The DNS delegation warning was nonblocking for the isolated forest design.

**Final Status:** Completed

**Outcome:** DC01 was successfully deployed and verified as the initial Active Directory domain controller and DNS server for the Black Shores enterprise homelab.

**Next Change:** CHG-004 — Active Directory Organizational Structure.

### CHG-004: Active Directory Organizational Structure and Security Groups

**Date:** October 16, 2026

**Status:** Completed

**Change Type:** Active Directory Administration / Identity and Access Management Preparation

**Organization:** Black Shores

**Domain:** `corp.blackshores.test`

**Domain Controller:** DC01

---

#### Objective

Design and implement a structured Active Directory organizational hierarchy for the fictional Black Shores enterprise.

Create Organizational Units (OUs) to separate employee accounts by department and establish Global Security Groups for future group-based access management.

Configure accidental-deletion protection on Organizational Units and verify the resulting directory structure using PowerShell.

Prepare the environment for employee account provisioning, Group Policy administration, and future role-based access control (RBAC) exercises.

#### 1. Environment and Prerequisites

The following infrastructure was established during CHG-003:

- Windows Server 2025 domain controller (DC01).
- Active Directory forest: `corp.blackshores.test`.
- NetBIOS domain name: `BLACKSHORES`.
- Active Directory Domain Services installed and operational.
- DNS Server installed and operational.
- Successful domain Administrator authentication.
- Successful domain controller health and DNS verification.

**Administration Tools:**

- Active Directory Users and Computers (ADUC).
- Windows PowerShell.
- ActiveDirectory PowerShell module.
- Server Manager.

**Initial Condition:**

The Black Shores Active Directory domain had been created, but its custom departmental Organizational Units and security groups had not yet been established.

**Design Requirement:**

Organize the planned workforce of 30 fictional employees across five departments:

- IT
- Human Resources
- Finance
- Sales
- Operations

---

#### 2. Organizational Unit Hierarchy Design

**Objective:**

Establish a hierarchical directory structure capable of supporting departmental account administration and future security policy assignments.

**Planned OU Structure:**

```text
corp.blackshores.test
|
+-- BlackShores
    |
    +-- Users
    |   |
    |   +-- IT
    |   +-- HumanResources
    |   +-- Finance
    |   +-- Sales
    |   +-- Operations
    |
    +-- Groups
```

**Design Decisions:**

A top-level `BlackShores` OU was created to distinguish custom enterprise directory objects from the domain's default containers.

The `Users` OU was designated for employee account organization.

Five departmental OUs were planned beneath `Users`.

A separate `Groups` OU was designated for departmental security groups.

**Reasoning:**

Organizational Units provide logical organization for directory objects and support delegated administration and Group Policy targeting.

Separating users by department creates a structured foundation for applying different administrative settings and policies.

Security groups were placed in a separate OU to simplify group administration and maintain a distinction between organizational structure and permission assignment.

**Important Distinction:**

Organizational Units organize directory objects and provide administrative and policy boundaries.

Security groups are used to manage membership and can be assigned permissions to protected resources.

Simply placing an employee in an OU does not automatically grant departmental resource permissions.

---

#### 3. Top-Level BlackShores OU Creation

**Objective:**

Create the primary organizational container for Black Shores directory objects.

**Administration Method:**

Active Directory Users and Computers.

**Actions Performed:**

1. Opened Active Directory Users and Computers.
2. Expanded the `corp.blackshores.test` domain.
3. Selected the domain root.
4. Created a new Organizational Unit named `BlackShores`.
5. Enabled accidental-deletion protection.
6. Saved the configuration.

**Distinguished Name:**

`OU=BlackShores,DC=corp,DC=blackshores,DC=test`

**Verification:**

Executed `Get-ADOrganizationalUnit` to retrieve the new OU and its properties.

Confirmed:

- OU name: BlackShores.
- OU location: Domain root.
- Accidental-deletion protection: True.

**Result:**

Successfully created and verified the top-level BlackShores Organizational Unit.

---

#### 4. Users OU Creation

**Objective:**

Establish a dedicated container for Black Shores employee accounts.

**Actions Performed:**

1. Opened Active Directory Users and Computers.
2. Expanded the BlackShores OU.
3. Created a child Organizational Unit named `Users`.
4. Enabled accidental-deletion protection.
5. Saved the configuration.

**Distinguished Name:**

`OU=Users,OU=BlackShores,DC=corp,DC=blackshores,DC=test`

**Verification:**

Used `Get-ADOrganizationalUnit` to confirm:

- The Users OU existed.
- The parent OU was BlackShores.
- The Distinguished Name was correct.
- Accidental-deletion protection was enabled.

**Result:**

Successfully created and verified the Users OU.

**Design Note:**

The new Users OU is separate from the built-in Active Directory `Users` container located at the domain root.

---

#### 5. Departmental OU Creation

**Objective:**

Create dedicated Organizational Units for Black Shores' five departments.

**Administration Method:**

Active Directory Users and Computers.

**Actions Performed:**

1. Opened the BlackShores Users OU.
2. Created a child OU for IT.
3. Repeated the process for HumanResources, Finance, Sales, and Operations.
4. Enabled accidental-deletion protection for each OU.
5. Confirmed that all five were located directly beneath the Users OU.

**Created Organizational Units:**

| Department | OU Name |
|---|---|
| Information Technology | IT |
| Human Resources | HumanResources |
| Finance | Finance |
| Sales | Sales |
| Operations | Operations |

**Parent Distinguished Name:**

`OU=Users,OU=BlackShores,DC=corp,DC=blackshores,DC=test`

**PowerShell Verification:**

Used `Get-ADOrganizationalUnit` with:

- `SearchBase` targeting the Users OU.
- `SearchScope OneLevel`.
- `Filter *`.
- The `ProtectedFromAccidentalDeletion` property.

Sorted the results by OU name and reviewed each Distinguished Name.

**Verification Results:**

| OU | Correct Parent | Deletion Protection |
|---|---|---|
| IT | Verified | True |
| HumanResources | Verified | True |
| Finance | Verified | True |
| Sales | Verified | True |
| Operations | Verified | True |

**Result:**

All five departmental Organizational Units were successfully created and verified.

Each OU was located directly beneath the Users OU with accidental-deletion protection enabled.

---

#### 6. Groups OU Creation

**Objective:**

Create a dedicated organizational container for Active Directory security groups.

**Actions Performed:**

1. Opened Active Directory Users and Computers.
2. Selected the BlackShores OU.
3. Created a new child OU named `Groups`.
4. Enabled accidental-deletion protection.
5. Saved the configuration.

**Distinguished Name:**

`OU=Groups,OU=BlackShores,DC=corp,DC=blackshores,DC=test`

**Verification:**

Executed `Get-ADOrganizationalUnit` and confirmed:

- Name: Groups.
- Parent: BlackShores.
- Distinguished Name: Correct.
- ProtectedFromAccidentalDeletion: True.

**Result:**

Successfully created the Groups OU alongside the Users OU.

This established a dedicated location for departmental security group objects.

---

#### 7. Accidental-Deletion Protection

**Objective:**

Reduce the risk of unintentionally deleting Organizational Units and their contents during administrative operations.

**Configuration:**

Enabled the Protect container from accidental deletion setting during OU creation.

**Protected OUs:**

- BlackShores
- Users
- Groups
- IT
- HumanResources
- Finance
- Sales
- Operations

**Verification:**

Used the Active Directory PowerShell module to retrieve the `ProtectedFromAccidentalDeletion` property.

**Result:**

All eight custom Organizational Units were verified with accidental-deletion protection enabled.

**Security Consideration:**

Accidental-deletion protection is an administrative safeguard, not an absolute security boundary.

Authorized administrators can remove the protection when legitimate directory restructuring or deletion is required.

---

#### 8. Departmental Security Group Design

**Objective:**

Establish departmental Global Security Groups for future employee membership and access-control assignments.

**Naming Convention:**

`SG_<Department>_Staff`

The `SG_` prefix identifies an object as a security group.

**Group Configuration:**

| Property | Configuration |
|---|---|
| Group Type | Security |
| Group Scope | Global |
| Parent OU | Groups |
| Domain | corp.blackshores.test |

**Design Reasoning:**

Global Security Groups were selected because departmental employees belong to the same Black Shores Active Directory domain.

These groups can represent employee roles or departmental membership and later participate in resource-permission assignments.

Using groups provides a more manageable approach than granting permissions individually to every employee.

**Security Consideration:**

Group creation alone does not grant access to protected resources.

Permissions must be explicitly configured against the appropriate resources or through other supported access-control mechanisms.

---

#### 9. Initial IT Security Group Creation

**Objective:**

Create and verify the first departmental security group before expanding the configuration.

**Group Name:**

`SG_IT_Staff`

**Actions Performed:**

1. Opened Active Directory Users and Computers.
2. Navigated to BlackShores → Groups.
3. Selected New → Group.
4. Entered `SG_IT_Staff` as the group name.
5. Selected Global group scope.
6. Selected Security group type.
7. Created the group.

**PowerShell Verification:**

Executed `Get-ADGroup` to review:

- Group name.
- Group category.
- Group scope.
- Distinguished Name.

**Verified Configuration:**

- Name: SG_IT_Staff
- GroupCategory: Security
- GroupScope: Global

**Distinguished Name:**

`CN=SG_IT_Staff,OU=Groups,OU=BlackShores,DC=corp,DC=blackshores,DC=test`

**Result:**

Successfully created and verified the initial IT Global Security Group.

No administrative privileges or resource permissions were assigned as part of this operation.

---

#### 10. Remaining Departmental Security Groups

**Objective:**

Extend the verified security group configuration across the remaining Black Shores departments.

**Actions Performed:**

Created the following groups using Active Directory Users and Computers:

| Department | Security Group |
|---|---|
| IT | SG_IT_Staff |
| Human Resources | SG_HR_Staff |
| Finance | SG_Finance_Staff |
| Sales | SG_Sales_Staff |
| Operations | SG_Operations_Staff |

**Configuration:**

All five groups were created inside:

`OU=Groups,OU=BlackShores,DC=corp,DC=blackshores,DC=test`

**Group Scope:** Global

**Group Type:** Security

**Verification:**

Executed `Get-ADGroup` with the Groups OU as the search base.

Used `SearchScope OneLevel` to retrieve groups directly beneath the Groups OU.

Reviewed:

- Name
- GroupCategory
- GroupScope

**Verification Results:**

| Security Group | Category | Scope |
|---|---|---|
| SG_IT_Staff | Security | Global |
| SG_HR_Staff | Security | Global |
| SG_Finance_Staff | Security | Global |
| SG_Sales_Staff | Security | Global |
| SG_Operations_Staff | Security | Global |

**Result:**

All five departmental Global Security Groups were successfully created and independently verified using PowerShell.

---

#### 11. VirtualBox Guest Additions Installation

**Objective:**

Improve usability and administrative interaction between the primary Windows desktop and the DC01 virtual machine.

**Initial Limitation:**

PowerShell commands were being manually entered inside the Windows Server VM, creating unnecessary administrative effort and increasing the possibility of transcription errors.

**Actions Performed:**

1. Enabled VirtualBox Shared Clipboard functionality.
2. Installed VirtualBox Guest Additions inside DC01.
3. Used host-to-guest clipboard integration to transfer PowerShell commands.
4. Continued administrative configuration and verification using the improved workflow.

**Reasoning:**

Clipboard integration simplified the execution of longer PowerShell commands and supported more efficient Active Directory administration.

**Security Consideration:**

Host-to-guest clipboard sharing was preferred over unnecessary bidirectional sharing.

Clipboard integration should be disabled when performing higher-risk security testing or handling environments requiring stronger isolation.

**Result:**

VirtualBox Guest Additions were installed, and host-to-guest interaction was used for subsequent homelab administration.

**Limitation:**

A separate comprehensive verification of all Guest Additions components and drivers was not performed as part of this change.

---

#### 12. Administrative Verification and Troubleshooting

**Objective:**

Independently verify the resulting Active Directory objects using PowerShell.

**Primary Commands Used:**

- `Get-ADOrganizationalUnit`
- `Get-ADGroup`
- `Format-List`
- `Format-Table`
- `Sort-Object`

**Verification Activities:**

- Retrieved the BlackShores OU.
- Confirmed the Users OU existed beneath BlackShores.
- Confirmed the five departmental OUs existed beneath Users.
- Verified accidental-deletion protection.
- Retrieved the Groups OU.
- Confirmed all five departmental security groups existed.
- Verified group category and scope.

**Minor Issue Encountered:**

An initial OU verification command contained a typographical error in the `DistinguishedName` property name.

The command did not display the expected property output.

**Resolution:**

Corrected the property name and repeated the query.

**Result:**

The corrected command returned the intended Distinguished Name and confirmed deletion protection.

**Root Cause:**

A PowerShell property-name typing error rather than a failure in the Active Directory configuration.

**Impact:**

No Active Directory objects were modified or damaged by the verification error.

---

#### 13. Final Organizational Structure Verification

**Objective:**

Confirm that the directory hierarchy and departmental security groups were ready for employee account provisioning.

**Final OU Structure:**

```text
corp.blackshores.test
|
+-- BlackShores
    |
    +-- Users
    |   |
    |   +-- IT
    |   +-- HumanResources
    |   +-- Finance
    |   +-- Sales
    |   +-- Operations
    |
    +-- Groups
        |
        +-- SG_IT_Staff
        +-- SG_HR_Staff
        +-- SG_Finance_Staff
        +-- SG_Sales_Staff
        +-- SG_Operations_Staff
```

**Verification Summary:**

| Component | Verified Result |
|---|---|
| Top-level BlackShores OU | Created |
| Users OU | Created |
| Groups OU | Created |
| Departmental OUs | 5 |
| Total Custom OUs | 8 |
| OUs Protected from Accidental Deletion | 8 |
| Global Security Groups | 5 |
| Group Category | Security |
| Group Scope | Global |
| PowerShell Object Verification | Passed |

**Result:**

The initial Black Shores directory hierarchy was successfully created, organized, and verified.

The environment was ready for subsequent employee account creation and departmental security group membership assignments.

---

#### 14. Issues, Resolutions, and Lessons Learned

| Issue or Observation | Resolution or Outcome |
|---|---|
| Need for a manageable directory structure | Implemented hierarchical Organizational Units |
| Need to separate departmental accounts | Created five departmental OUs |
| Risk of accidental OU deletion | Enabled and verified deletion protection |
| Need for scalable access administration | Created departmental Global Security Groups |
| PowerShell property-name typo | Corrected the command and repeated verification |
| Manual command entry was inefficient | Installed VirtualBox Guest Additions and used host-to-guest clipboard functionality |
| Need to verify configuration independently | Used Active Directory PowerShell commands to confirm OU and group properties |

**Key Lessons Learned:**

- Organizational Units and security groups serve different administrative purposes.
- Organizational Unit hierarchy should be designed before large-scale account provisioning.
- Departmental groups provide a foundation for group-based access control.
- Security group membership does not automatically grant resource permissions.
- Accidental-deletion protection should be applied to important administrative containers.
- PowerShell queries can independently verify changes performed through graphical management tools.
- Administrative tools and naming conventions help maintain a consistent Active Directory environment.
- A correctly organized directory structure simplifies future automation, policy management, and troubleshooting.

---

#### 15. Evidence and Artifacts

**Evidence Collected:**

- Initial BlackShores OU creation.
- BlackShores OU Distinguished Name and deletion protection verification.
- Users OU creation and verification.
- Departmental OU hierarchy.
- PowerShell verification of the five departmental OUs.
- Groups OU creation.
- Groups OU Distinguished Name and deletion protection verification.
- Initial IT security group creation and verification.
- All five departmental Global Security Groups.
- PowerShell verification of group categories and scopes.

**Primary Configuration Artifacts:**

- Top-level BlackShores OU.
- Users OU.
- Groups OU.
- Five departmental OUs.
- Five departmental Global Security Groups.
- VirtualBox Guest Additions installation.

**Evidence Directory:**

`E:\Homelab\Evidence\Phase-02-Active-Directory\02-CHG-004-OUs-Groups`

**Supporting Screenshots:**

Evidence captured during EN30.PNG through EN42.PNG documents the Organizational Unit and security group configuration process.

The strongest evidence includes the completed departmental OU hierarchy, PowerShell OU verification, departmental security group inventory, and PowerShell group verification.

Screenshot filenames and Markdown links will be finalized during evidence organization.

---

#### 16. Security Considerations and Remaining Work

**Implemented Controls and Administrative Practices:**

- Structured Active Directory OU hierarchy.
- Departmental separation of employee account containers.
- Dedicated security group container.
- Consistent security group naming convention.
- Global Security Groups for departmental membership.
- Accidental-deletion protection.
- Independent PowerShell configuration verification.

**Not Yet Implemented During This Change:**

- Employee account creation.
- Departmental security group membership assignments.
- Department-specific Group Policy Objects.
- Resource-level access permissions.
- Role-based access control testing.
- Delegated administrative permissions.
- Service account organization and provisioning.
- Privileged account separation.
- Automated identity lifecycle management.

These activities were intentionally reserved for subsequent change records.

**Future Directory Considerations:**

Additional Organizational Units may be created for workstations, servers, service accounts, or privileged accounts when those objects are introduced.

This change did not modify the built-in Domain Controllers OU or establish new privileged administrative accounts.

---

#### Final Result

Successfully designed and implemented the initial Active Directory organizational hierarchy for Black Shores.

Created eight custom Organizational Units, including the top-level BlackShores OU, Users OU, Groups OU, and five departmental OUs.

Enabled and verified accidental-deletion protection across all eight custom OUs.

Created five Global Security Groups corresponding to the company's departments and independently verified their names, categories, scopes, and directory locations using PowerShell.

Installed VirtualBox Guest Additions to improve host-to-guest administrative interaction.

The completed directory structure established a consistent foundation for employee provisioning, group-based access administration, Group Policy, and future security testing.

**Final Status:** Completed

**Outcome:** Black Shores' Active Directory organizational structure and departmental security groups were successfully created and verified, preparing the domain for employee account provisioning and subsequent IAM automation.

**Next Change:** CHG-005 — Active Directory User Provisioning and Group Membership.

### CHG-005: Active Directory User Provisioning and Group Membership

**Date:** October 16, 2026

**Status:** Completed

**Organization:** Black Shores

**Domain:** `corp.blackshores.test`

**Domain Controller:** DC01

**Change Type:** Identity and Access Management (IAM) / PowerShell Automation

---

#### Objective

Provision and manage 30 fictional employee accounts within the Black Shores Active Directory environment.

Implement departmental Organizational Unit placement, security group membership, initial password security requirements, and automated employee provisioning using PowerShell.

Develop a reusable provisioning workflow that validates employee information, prevents duplicate account creation, supports dry-run execution, and verifies security settings following account creation.

#### Environment and Prerequisites

The following infrastructure was established during previous change records:

- Windows Server 2025 domain controller (DC01).
- Active Directory domain: `corp.blackshores.test`.
- Five departmental Organizational Units: IT, HumanResources, Finance, Sales, and Operations.
- Five corresponding Global Security Groups.
- PowerShell ActiveDirectory module available on DC01.
- VirtualBox Guest Additions installed for host-to-guest clipboard functionality.

**Working Directories:**

- DC01: `C:\Lab\IAM`
- Primary host: `E:\Homelab\Scripts\IAM`

A backup copy of the working Version 2 provisioning script was also saved to the primary host.

---

#### 1. Initial Manual Employee Provisioning

Created the first fictional Black Shores employee account using Active Directory Users and Computers.

**Employee Information:**

- Name: Avery Morgan
- Username: `amorgan`
- User Principal Name: `amorgan@corp.blackshores.test`
- Department: IT
- Organizational Unit: `BlackShores/Users/IT`
- Security Group: `SG_IT_Staff`

**Actions Performed:**

1. Created the employee account in the IT Organizational Unit.
2. Enabled the account.
3. Assigned membership to `SG_IT_Staff`.
4. Verified account properties using `Get-ADUser`.
5. Verified departmental group membership using `Get-ADGroupMember`.

**Verification:**

Confirmed the account existed in the correct OU, was enabled, and belonged to the appropriate departmental security group.

A subsequent security verification confirmed:

- Enabled: True
- MustChangeAtNextLogon: True
- PasswordNeverExpires: False

**Result:**

Successfully completed the initial manual employee provisioning workflow.

---

#### 2. CSV-Based Employee Data Validation

Created the initial employee CSV file:

`blackshores-employees.csv`

The CSV contained five fictional employees distributed across the five departments.

**CSV Attributes:**

- FirstName
- LastName
- SamAccountName
- Department
- Title

Created the initial PowerShell validation script:

`Test-BlackShoresEmployees.ps1`

**Validation Functions:**

- Confirm required employee attributes were populated.
- Validate departmental assignments.
- Detect duplicate usernames within the CSV.
- Map employees to the appropriate departmental security groups.

**Issue Encountered:**

Windows PowerShell initially blocked script execution because the active execution policy did not permit running the `.ps1` file.

**Resolution:**

Temporarily configured the execution policy for the current PowerShell process:

`Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned`

**Verification:**

Successfully executed the validation script.

**Result:**

All five initial employee records passed validation. No Active Directory objects were modified.

---

#### 3. Active Directory-Aware Provisioning Validation

Developed:

`AD-Provision-Check.ps1`

**Purpose:**

Extend CSV validation by querying the actual Black Shores Active Directory environment.

**Validation Functions:**

- Confirm target departmental OU exists.
- Confirm corresponding security group exists.
- Check whether the employee username already exists.
- Report whether the employee is ready for provisioning.

**Issue Encountered:**

The original script used `Get-ADUser -Identity` to check for existing usernames. Nonexistent accounts generated object-not-found errors during execution.

**Resolution:**

Replaced the identity-based lookup with a filtered `Get-ADUser` query using the `SamAccountName` attribute.

**Verification:**

Re-executed the script and confirmed all five initial employees returned `Ready` without errors.

**Result:**

Successfully implemented Active Directory-aware account validation without modifying existing directory objects.

---

#### 4. Automated Provisioning Script — Version 1

Developed:

`New-BlackShoresUsers.ps1`

**Purpose:**

Automate employee account creation and departmental security group assignment from CSV records.

**Core Functions:**

- Import employee information from CSV.
- Validate required information and usernames.
- Verify target Organizational Units and security groups.
- Prevent attempts to recreate existing accounts.
- Support `-WhatIf` dry-run execution.
- Prompt for temporary account passwords.
- Create accounts in a disabled state.
- Assign departmental security group membership.
- Enable accounts following group assignment.

**Initial Testing:**

Performed a successful five-employee dry run.

Created a single-employee pilot CSV containing Noah Park (`npark`).

Verified the pilot using `-WhatIf` before executing actual provisioning.

**Pilot Result:**

Successfully provisioned Noah Park into the IT OU and added the account to `SG_IT_Staff`.

---

#### 5. Password Security Issue and Remediation

**Issue Encountered:**

Post-provisioning verification of Noah Park revealed that the password-change requirement had not been enforced as intended.

**Observed Values:**

- Enabled: True
- MustChangeAtNextLogon: False
- PasswordNeverExpires: False

The script reported successful provisioning, but the account did not satisfy the intended initial password security requirements.

**Resolution:**

Applied the correction:

`Set-ADUser -Identity "npark" -ChangePasswordAtLogon $true`

**Verification:**

Re-queried the account using `Get-ADUser` and confirmed:

- MustChangeAtNextLogon: True
- PasswordNeverExpires: False

**Root Cause:**

The original provisioning sequence did not result in the requested password-change setting persisting. The precise underlying cause was not conclusively established.

**Result:**

Corrected Noah Park's account and identified the need for explicit post-provisioning security enforcement and verification.

---

#### 6. Automated Provisioning Script — Version 2

Revised `New-BlackShoresUsers.ps1` to address the password security issue and improve reliability.

**Enhancements Implemented:**

- Explicit password-change enforcement following account enablement.
- Verification of account-enabled status.
- Verification of the `pwdLastSet` attribute.
- Verification that PasswordNeverExpires is False.
- Verification of departmental security group membership.
- Improved exception handling.
- Attempted automatic account disabling if post-provisioning verification fails.
- Retained duplicate prevention and `-WhatIf` functionality.

**Security Considerations:**

Temporary passwords are requested interactively using `Read-Host -AsSecureString`.

Passwords are not stored in the employee CSV files or hardcoded into the provisioning script.

The script performs validation before attempting account creation.

**Limitations:**

The script does not implement complete transaction rollback. If a batch fails partway through execution, previously created accounts may remain, and a partially configured account may require manual investigation.

**Syntax Verification:**

Validated Version 2 using the PowerShell language parser.

**Result:** Zero parsing errors.

---

#### 7. Version 2 Pilot and Initial Batch Testing

Created a single-user pilot CSV for Maya Chen (`mchen`).

**Pilot Actions:**

1. Verified employee CSV attributes.
2. Executed a successful `-WhatIf` preview.
3. Provisioned Maya using Version 2.
4. Verified account status, department, title, OU placement, and security group membership.
5. Verified the password-change requirement was enforced.

**Pilot Result:**

Maya Chen passed all tested provisioning and security checks.

**Additional Batch Test:**

Provisioned three fictional employees:

- Jordan Reed (`jreed`) — Finance
- Sofia Patel (`spatel`) — Sales
- Elliot Brooks (`ebrooks`) — Operations

**Independent Verification:**

All three accounts passed checks for:

- Account-enabled status.
- Correct departmental OU.
- Correct security group membership.
- Password change required at next logon.
- PasswordNeverExpires set to False.

**Result:**

Version 2 successfully completed both single-user and multi-user provisioning tests.

---

#### 8. Full Workforce Expansion

**Objective:**

Expand Black Shores from six existing fictional employee accounts to a planned workforce of thirty.

Created:

`blackshores-expansion.csv`

**Expansion Distribution:**

| Department | New Employees |
|---|---:|
| IT | 4 |
| HumanResources | 3 |
| Finance | 4 |
| Sales | 6 |
| Operations | 7 |
| **Total** | **24** |

**Pre-Provisioning Verification:**

Imported the expansion CSV using PowerShell and confirmed all 24 records were present.

Executed Version 2 using the `-Apply -WhatIf` parameters.

**Dry-Run Result:**

- 24 employee records validated.
- 24 accounts returned Ready.
- 24 provisioning operations previewed.
- No Active Directory changes occurred during the preview.

**Deployment:**

Executed `New-BlackShoresUsers.ps1` against the 24-employee expansion CSV using `-Apply`, without `-WhatIf`.

Temporary passwords were entered through individual protected PowerShell prompts.

**Result:**

The provisioning script completed the 24-account expansion and reported successful provisioning and verification.

Active Directory Users and Computers confirmed the planned departmental employee totals.

---

#### 9. Independent Expansion Security Audit

Performed an independent PowerShell audit of all 24 newly provisioned accounts.

**Verification Criteria:**

- Account is enabled.
- Account resides in the correct departmental OU.
- Account belongs to the intended departmental security group.
- Department attribute matches the CSV.
- Job title matches the CSV.
- Password change is required at next logon.
- PasswordNeverExpires is False.

**Audit Results:**

| Audit Metric | Result |
|---|---:|
| Accounts Audited | 24 |
| Passed | 24 |
| Failed | 0 |
| Pass Rate | 100% |

**Result:**

All 24 expansion accounts satisfied the tested provisioning and security requirements.

No failures were reported.

---

#### 10. Final Workforce Verification

Executed PowerShell queries to verify employee counts across all five departmental Organizational Units.

**Final Departmental Distribution:**

| Department | Employee Accounts |
|---|---:|
| IT | 6 |
| HumanResources | 4 |
| Finance | 5 |
| Sales | 7 |
| Operations | 8 |
| **Total** | **30** |

**Account Creation Methods:**

- Manually provisioned: 1 account.
- Provisioned through PowerShell automation: 29 accounts.

**Final Security Verification:**

Independently verified Avery Morgan's password settings and confirmed:

- Enabled: True
- MustChangeAtNextLogon: True
- PasswordNeverExpires: False

Combined with previous employee and expansion audits, the planned thirty accounts have been verified against the applicable initial provisioning requirements.

**Result:**

Black Shores successfully reached its planned workforce of 30 fictional employee accounts across five departments.

---

#### 11. Evidence and Project Artifacts

**Primary Scripts:**

- `Test-BlackShoresEmployees.ps1`
- `AD-Provision-Check.ps1`
- `New-BlackShoresUsers.ps1` — Version 2

**Primary Data Files:**

- `blackshores-employees.csv`
- `blackshores-expansion.csv`

Additional pilot and batch CSV files were created to support controlled testing and troubleshooting.

**Evidence Directory:**

`E:\Homelab\Evidence\Phase-02-Active-Directory\03-CHG-005-User-Provisioning`

**Evidence Collected:**

- Manual employee creation and group assignment.
- CSV import and validation.
- PowerShell execution-policy troubleshooting.
- Active Directory provisioning previews.
- Single-user and multi-user dry runs.
- Successful account creation.
- Password security issue and remediation.
- Version 2 pilot verification.
- 24-account workforce expansion.
- Independent 24-account security audit.
- Final departmental employee counts.
- Final manual-account password-policy verification.

Evidence screenshot organization and filename normalization will be finalized separately.

---

#### 12. Security Considerations and Remaining Work

**Implemented Controls:**

- Departmental OU organization.
- Global Security Group membership.
- Duplicate account prevention.
- Pre-provisioning validation.
- Dry-run execution.
- Individual temporary password prompts.
- Password change at next logon.
- Post-provisioning security verification.
- Error handling and attempted account disabling following provisioning failures.

**Not Yet Implemented or Verified:**

- Authentication from domain-joined Windows workstations.
- Group Policy deployment and enforcement.
- Resource-level access control and permission testing.
- Role-based access control validation against departmental resources.
- Centralized security event monitoring.
- Formal user deprovisioning and account lifecycle automation.

These activities will be addressed during subsequent homelab phases or separate change records.

---

#### Final Result

Successfully deployed and verified an initial 30-employee Active Directory identity environment for the fictional Black Shores organization.

Developed, tested, troubleshot, and revised PowerShell-based employee provisioning automation.

The final provisioning process demonstrated CSV-driven account creation, departmental security group assignment, OU placement, initial password security enforcement, dry-run validation, and independent post-deployment auditing.

The project also demonstrated identification and remediation of a password security configuration issue during pilot testing.

**Final Status:** Completed

**Outcome:** 30 employee accounts created, including 29 provisioned through PowerShell automation, with the tested identity configuration and initial security requirements verified.

**Next Phase:** Domain-joined endpoint deployment, Group Policy implementation, and access-control testing.

### CHG-006: Domain Controller Backup and Recovery Preparation

**Date:** October 17–18, 2026

**Status:** Completed — Backup Creation and Verification; Restore Testing Pending

**Change Type:** Backup and Recovery / Active Directory Administration / Virtualization Infrastructure

**Organization:** Black Shores

**Domain:** `corp.blackshores.test`

**Domain Controller:** DC01

**Virtualization Platform:** Oracle VirtualBox 7.2.20

---

#### Objective

Establish and verify backup and recovery measures for the Black Shores domain controller following the successful deployment of Active Directory and the provisioning of 30 fictional employee accounts.

Preserve the existing Active Directory configuration, DNS infrastructure, Organizational Units, departmental security groups, and employee account information before introducing additional domain-joined systems.

Implement three complementary recovery measures:

1. A post-IAM VirtualBox snapshot.
2. An independent offline copy of the complete DC01 virtual machine files.
3. An Active Directory-aware Windows Server System State backup.

Verify backup integrity, confirm backup discoverability, investigate storage dependencies, and preserve recovery artifacts separately from the active virtual machine configuration.

#### 1. Environment and Prerequisites

The following infrastructure had been established through CHG-001 to CHG-005:

- Windows Server 2025 Standard Evaluation installed on DC01.
- Active Directory domain `corp.blackshores.test`.
- DNS Server and Global Catalog services operational.
- Isolated VirtualBox Internal Network named `CORP-LAN`.
- Static DC01 IPv4 address: `10.50.10.10/24`.
- Eight custom Organizational Units.
- Five departmental Global Security Groups.
- Thirty simulated employee accounts.
- PowerShell-based provisioning automation successfully tested.
- Independent security audit of 24 expansion accounts completed with zero failures.

**Existing Recovery Point:**

`DC01 - Clean Baseline - Pre-AD`

The original snapshot was created before Active Directory deployment and therefore did not preserve the completed IAM configuration.

**Identified Risk:**

A failure of DC01's active virtual disk, accidental directory modification, or significant configuration error could result in the loss of the deployed identity environment.

**Decision:**

Establish updated recovery artifacts before continuing with domain-joined endpoint deployment and Group Policy configuration.

---

#### 2. Post-IAM VirtualBox Snapshot

**Objective:**

Capture a new recovery checkpoint following completion of the initial Black Shores IAM deployment.

**Snapshot Information:**

| Property | Value |
|---|---|
| Virtual Machine | DC01 |
| Snapshot Name | DC01 - Post-IAM - 30 Employees |
| Date | October 17, 2026 |
| Time | 1:23 AM |
| VM State | Powered Off |
| Snapshot Platform | Oracle VirtualBox 7.2.20 |

**Actions Performed:**

1. Gracefully shut down Windows Server.
2. Confirmed DC01 displayed Powered Off in VirtualBox Manager.
3. Opened the Snapshots view.
4. Selected the current virtual machine state.
5. Created the post-IAM snapshot.
6. Added a descriptive summary of the existing domain and IAM configuration.
7. Verified the snapshot appeared in VirtualBox Manager.

**Snapshot Description Included:**

- Windows Server 2025 domain controller.
- Black Shores Active Directory domain.
- Operational DNS infrastructure.
- Thirty employee accounts across five departments.
- Eight custom Organizational Units.
- Five Global Security Groups.
- Tested PowerShell provisioning Version 2.
- Successful independent expansion audit.

**Verification:**

VirtualBox displayed the new snapshot beneath the existing pre-AD baseline snapshot.

**Result:**

Successfully created and verified the post-IAM VirtualBox snapshot.

**Limitation:**

The snapshot is a local recovery checkpoint, not an independent backup. Restoring a domain controller snapshot requires additional precautions to avoid Active Directory recovery and consistency problems.

No snapshot restoration was performed.

---

#### 3. Independent Offline Virtual Machine Backup

**Objective:**

Create a separate copy of DC01's virtual machine files, including its configuration, base virtual disk, and snapshot dependencies.

**Backup Configuration:**

| Property | Value |
|---|---|
| Source | `E:\HomeLab\VMs\HomeLab\DC01` |
| Destination | `G:\HomeLab\Backups\DC01-Post-IAM-2026-10-17\DC01` |
| Source Drive | E: SSD |
| Backup Drive | G: HDD |
| VM State | Powered Off |
| Method | Complete VM folder copy |

**Actions Performed:**

1. Confirmed DC01 was powered off.
2. Located the original DC01 virtual machine folder.
3. Examined the source folder properties.
4. Created the designated backup directory on G:.
5. Copied the entire DC01 folder to the backup location.
6. Preserved the original virtual machine files on E:.
7. Reviewed the copied files and directories.

**Source Folder Properties:**

- Total Size: 34,376,659,475 bytes.
- Displayed Size: Approximately 32.0 GB.
- File Count: 13.
- Subfolder Count: 2.

**Backup Folder Verification:**

The destination contained:

- `DC01.vbox`
- `DC01.vbox-prev`
- `DC01.nvram`
- `DC01.vdi`
- `Logs` directory
- `Snapshots` directory
- Associated snapshot VDI and NVRAM files

The copied files included the virtual disk dependencies required by DC01's existing snapshot configuration.

**Verification:**

Source and destination folder sizes matched exactly.

The destination contained the expected 13 files and two internal subfolders.

**Result:**

Successfully created an independent file-level copy of DC01 on the G: physical drive.

**Limitation:**

Matching file counts and directory sizes alone do not establish file integrity or recovery success. Additional cryptographic verification was therefore performed.

---

#### 4. SHA-256 Backup Integrity Verification

**Objective:**

Confirm that every file in the offline DC01 backup matched its original counterpart.

**Verification Method:**

PowerShell SHA-256 file hashing.

**Script:**

`SHA-256-backup-integrity-verification.ps1`

**Primary PowerShell Commands:**

- `Get-ChildItem`
- `Get-Item`
- `Get-FileHash`
- `Test-Path`

**Verification Process:**

1. Enumerated all files in the source directory.
2. Enumerated all files in the backup directory.
3. Matched files using their relative paths.
4. Compared source and destination file sizes.
5. Calculated SHA-256 hashes for corresponding files.
6. Compared the resulting hashes.
7. Reported pass/fail status for each file.
8. Summarized the total verification results.

**Observation During Execution:**

The verification script initially appeared unresponsive because it did not display intermediate output.

Disk activity was monitored through Windows Task Manager and Resource Monitor.

The primary SSD and backup HDD showed read activity while the hashing operation processed the virtual disk files.

**Resolution:**

Allowed the read-only verification process to complete without interruption.

**Verification Results:**

| Metric | Result |
|---|---:|
| Source Files | 13 |
| Backup Files | 13 |
| Matching SHA-256 Hashes | 13 |
| Failed Comparisons | 0 |
| File Counts Match | True |

**Final Output:**

`INTEGRITY CHECK: PASS`

**Result:**

All thirteen backed-up files matched their corresponding source files using SHA-256 verification.

No file integrity differences were detected.

**Limitation:**

Cryptographic integrity verification confirms matching file contents. It does not independently establish that the copied VM can be started or that Active Directory can be successfully restored.

---

#### 5. Dedicated System State Backup Disk

**Objective:**

Prepare a separate backup destination for Windows Server System State data.

**Backup Disk Configuration:**

| Property | Configuration |
|---|---|
| Disk Name | DC01-SystemState.vdi |
| Storage Location | `G:\HomeLab\Backups\DC01-SystemState` |
| Disk Format | VDI |
| Virtual Capacity | 64 GB |
| Allocation | Dynamically Allocated |
| Virtual Controller | SATA |
| Initial SATA Port | Port 2 |

**Actions Performed:**

1. Confirmed DC01 was powered off.
2. Opened the VirtualBox Storage settings.
3. Created a new dynamically allocated virtual hard disk.
4. Selected the G: backup directory.
5. Configured a 64 GB virtual capacity.
6. Attached the disk to the existing SATA controller.
7. Verified the original 80 GB system disk remained attached.
8. Saved the configuration.

**Verification:**

VirtualBox displayed both:

- `DC01.vdi` — Original 80 GB system disk.
- `DC01-SystemState.vdi` — New 64 GB backup disk.

**Result:**

Successfully attached the dedicated backup disk without modifying the original system disk.

---

#### 6. Windows Server Backup Volume Initialization

**Objective:**

Prepare the new virtual disk for storing the System State backup.

**Actions Performed:**

1. Started DC01.
2. Opened Windows Disk Management using `diskmgmt.msc`.
3. Identified the existing 80 GB system disk as Disk 0.
4. Identified the new 64 GB backup disk as Disk 1.
5. Initialized Disk 1 using GPT.
6. Created a new simple volume using the maximum available capacity.
7. Assigned drive letter `S:`.
8. Formatted the volume with NTFS.
9. Assigned the volume label `DC01-SystemState`.
10. Verified the resulting disk configuration.

**Final Volume Configuration:**

| Property | Result |
|---|---|
| Disk | Disk 1 |
| Partition Style | GPT |
| Volume Size | Approximately 63.98 GB |
| Drive Letter | S: |
| File System | NTFS |
| Volume Label | DC01-SystemState |
| Allocation Unit Size | Default |
| Quick Format | Enabled |
| Compression | Disabled |
| Status | Healthy (Basic Data Partition) |

**Verification:**

Windows Disk Management displayed Disk 1 as Online, Healthy, and formatted with NTFS.

The existing Windows Server partitions on Disk 0 remained unchanged.

**Result:**

Successfully initialized and formatted the dedicated System State backup volume.

---

#### 7. Windows Server Backup Installation

**Objective:**

Install the Windows Server feature required to perform System State backups.

**PowerShell Installation Command:**

`Install-WindowsFeature -Name Windows-Server-Backup -IncludeManagementTools`

**Verification Command:**

`Get-WindowsFeature -Name Windows-Server-Backup`

**Observed Results:**

| Property | Result |
|---|---|
| Success | True |
| Restart Needed | No |
| Exit Code | Success |
| Feature | Windows Server Backup |
| Install State | Installed |

**Result:**

Windows Server Backup was successfully installed on DC01.

No restart was required.

---

#### 8. Active Directory System State Backup

**Objective:**

Create a Windows Server System State backup containing the critical system and directory components required for supported recovery procedures.

**Backup Method:**

Windows Server Backup command-line utility (`wbadmin`).

**Backup Destination:**

`S:`

**Command Executed:**

`wbadmin start systemstatebackup -backuptarget:S:`

**Backup Process:**

1. Started the System State backup using an elevated PowerShell session.
2. Allowed Windows Server Backup to identify the required components.
3. Monitored backup progress.
4. Observed activity involving system-state writers, including the System Writer and NTDS.
5. Allowed the backup operation to finish.
6. Reviewed the completion summary and backup log location.

**Observed Completion Message:**

"The backup operation successfully completed."

**Recorded Backup Details:**

| Property | Value |
|---|---|
| Backup Target | S: |
| Backup Time | October 17, 2026, 8:53 PM |
| Version Identifier | 10/18/2026-01:53 |
| Completion Timestamp Displayed | October 18, 2026, 3:07 AM |
| Backup Status | Successfully Completed |

**Backup Log Location:**

`C:\Windows\Logs\WindowsServerBackup`

**Result:**

Windows Server successfully completed the initial System State backup.

**Security Consideration:**

Domain controller System State backups can contain sensitive directory and security information. Backup access must therefore be restricted to authorized administrators.

---

#### 9. System State Backup Discovery and Verification

**Objective:**

Confirm that Windows Server could independently discover the completed backup on the designated destination.

**Verification Commands:**

`wbadmin get versions`

`wbadmin get versions -backuptarget:S:`

**Verified Backup Properties:**

- Backup destination: Fixed disk S:.
- Backup time: October 17, 2026, 8:53 PM.
- Version identifier: `10/18/2026-01:53`.
- System State listed among available recovery categories.

**Recoverable Categories Reported:**

- Volume(s)
- File(s)
- Application(s)
- System State

**Additional Storage Verification:**

Queried the backup volume using `Get-Volume`.

**Observed Capacity:**

| Property | Result |
|---|---:|
| Used Space | 19.87 GB |
| Free Space | 44.12 GB |

Enumerated the root directory of S: and confirmed the presence of:

`WindowsImageBackup`

**Result:**

The backup operation was successful, the backup files were present on S:, and Windows Server Backup recognized the recovery version.

**Limitation:**

Backup discoverability does not prove successful restoration. A recovery test remains outstanding.

---

#### 10. Domain Controller Time Verification

**Objective:**

Investigate the backup timestamps and review DC01's time synchronization status.

**Commands Executed:**

- `Get-Date`
- `Get-TimeZone`
- `w32tm /query /source`
- `w32tm /query /status`

**Observed Results:**

| Property | Result |
|---|---|
| System Date | October 17, 2026 |
| Time Zone | Central Time (US & Canada) |
| Windows Time Source | Local CMOS Clock |
| Leap Indicator | 0 — No warning |
| Reported Stratum | 1 |
| Last Successful Sync Reported | October 17, 2026, 8:42:08 PM |

**Timestamp Observation:**

The displayed backup time and UTC-formatted backup version identifier differed by five hours, consistent with Central Daylight Time and UTC.

The backup completed successfully despite the differing timestamp presentations.

**Additional Finding:**

Windows Time identified `Local CMOS Clock` as DC01's time source.

Because DC01 operates on an isolated network without an external default gateway, no external NTP source was identified during this check.

**Risk:**

DC01 holds the domain's PDC Emulator role. Inaccurate or drifting domain controller time could affect Kerberos authentication and other time-sensitive directory operations.

**Decision:**

Do not change the Windows Time configuration during backup verification.

**Follow-Up:**

Review and configure an appropriate reliable time source for the isolated domain in a separate infrastructure change.

**Result:**

Time settings were documented, and the need for additional domain time configuration was identified.

---

#### 11. System State Backup Disk Detachment

**Objective:**

Preserve the completed System State backup as a detached virtual disk rather than leaving it continuously available to the active domain controller.

**Actions Performed:**

1. Completed backup verification.
2. Gracefully shut down DC01.
3. Confirmed the VM was Powered Off.
4. Opened VirtualBox Storage settings.
5. Identified `DC01-SystemState.vdi` on SATA Port 2.
6. Removed the backup disk attachment without selecting any file-deletion option.
7. Saved the updated VM configuration.
8. Confirmed that the original `DC01.vdi` remained attached.

**Verification:**

VirtualBox Manager displayed:

- DC01 — Powered Off.
- Original `DC01.vdi` attached.
- Guest Additions ISO still mounted.
- No `DC01-SystemState.vdi` attachment.

**Result:**

The backup disk was detached from DC01.

The underlying VDI was retained on the G: physical drive.

**Security Benefit:**

Detaching the backup disk reduces its exposure to accidental modifications originating from the active guest operating system.

It does not replace physical backup separation, access controls, or backup encryption.

---

#### 12. Backup VDI Size Discrepancy Investigation

**Issue Encountered:**

During the disk detachment process, VirtualBox displayed an unexpectedly small actual disk size of approximately 78 MB for `DC01-SystemState.vdi`.

This appeared inconsistent with the approximately 19.87 GB used on the S: volume after backup completion.

**Risk Identified:**

The apparent size discrepancy raised concern that the backup data might reside in a VirtualBox snapshot differencing disk instead of the intended standalone backup image.

**Investigation:**

Used PowerShell to inspect:

- The actual size of `DC01-SystemState.vdi` on G:.
- The sizes of existing DC01 snapshot VDI files.

**Observed Results:**

| Disk File | Approximate Size |
|---|---:|
| DC01-SystemState.vdi | 18.9 GB |
| Existing Snapshot VDI 1 | 4.11 GB |
| Existing Snapshot VDI 2 | 1.57 GB |

**Finding:**

The System State backup VDI contained approximately 18.9 GB of allocated data.

This was consistent with the amount of space used inside the backup volume.

**Result:**

The later file inspection showed that the backup VDI was substantially larger than the earlier VirtualBox display indicated.

The precise reason for the earlier 78 MB display was not established.

Additional verification was performed to rule out virtual disk parent dependencies.

---

#### 13. Virtual Disk Independence Verification

**Objective:**

Determine whether the detached System State backup VDI depended on a VirtualBox snapshot differencing image.

**Verification Tool:**

Oracle VirtualBox `VBoxManage`.

**Command Executed:**

`VBoxManage showmediuminfo disk "G:\HomeLab\Backups\DC01-SystemState\DC01-SystemState.vdi"`

**Verified Properties:**

| Property | Result |
|---|---|
| Parent UUID | base |
| Disk Type | normal (base) |
| State | Created |
| Storage Format | VDI |
| Format Variant | dynamic default |
| Virtual Capacity | 65,536 MB |
| Size on Disk | 19,352 MB |
| Encryption | Disabled |

**Key Findings:**

- `Parent UUID: base` confirmed no parent disk dependency.
- `Type: normal (base)` confirmed the image was not a differencing disk.
- The actual disk size was consistent with the System State backup volume usage.
- The intended G: storage path was reported.

**Result:**

Successfully verified that `DC01-SystemState.vdi` was an independent base virtual disk.

No snapshot consolidation was required for this backup image.

**Verification Limitation:**

The disk metadata and size checks establish structural independence. A separate recovery test would still be necessary to demonstrate successful restoration of the backup contents.

---

#### 14. Recovery Assets and Current Protection

Three recovery measures were established during CHG-006.

| Recovery Measure | Purpose | Verification |
|---|---|---|
| Post-IAM VirtualBox snapshot | Local VM checkpoint | Snapshot present |
| Offline VM folder backup | Independent copy of complete VM files | 13/13 SHA-256 matches |
| Windows Server System State backup | Active Directory-aware recovery data | Backup completed and discoverable |

**Backup Storage Locations:**

**Offline VM Backup:**

`G:\HomeLab\Backups\DC01-Post-IAM-2026-10-17\DC01`

**System State Backup VDI:**

`G:\HomeLab\Backups\DC01-SystemState\DC01-SystemState.vdi`

**Snapshot:**

`DC01 - Post-IAM - 30 Employees`

**Current Recovery Limitations:**

- No full virtual machine restoration has been tested.
- No Active Directory System State restoration has been tested.
- Both independent backup copies currently reside on the same physical G: drive.
- The System State VDI is not encrypted.
- Domain controller recovery procedures have not yet been exercised.
- Ongoing automated backup scheduling has not been implemented.

**Risk Consideration:**

Storing both independent backups on the same physical drive leaves them vulnerable to a common storage failure.

**Future Recommendation:**

Create an additional protected backup copy on separate physical storage and perform a controlled recovery test in a suitably isolated environment.

---

#### 15. Issues, Resolutions, and Lessons Learned

| Issue or Observation | Resolution or Outcome |
|---|---|
| Original snapshot did not include IAM deployment | Created a new post-IAM snapshot |
| Need to protect the current VM configuration | Copied complete VM files to G: |
| File copying alone did not verify integrity | Performed SHA-256 comparisons |
| Hash script appeared unresponsive | Confirmed disk activity and allowed verification to complete |
| Need for an AD-aware backup | Installed Windows Server Backup and created a System State backup |
| Need for a dedicated backup target | Created and formatted a 64 GB virtual disk |
| Backup timestamp differences | Reviewed time zone and Windows Time status |
| Domain controller relied on Local CMOS Clock | Documented for future time synchronization configuration |
| Backup VDI appeared unexpectedly small | Inspected physical file size and VirtualBox disk metadata |
| Possible differencing disk dependency | Verified Parent UUID was base |
| Backup exposed through guest storage | Detached the completed backup VDI |
| Both backup copies stored on G: | Documented the remaining common-drive failure risk |

**Key Lessons Learned:**

- VirtualBox snapshots and independent backups serve different purposes.
- A complete VM backup must preserve relevant virtual disk and snapshot dependencies.
- Matching folder sizes alone is insufficient for integrity verification.
- SHA-256 hashing provides evidence that copied files match their sources.
- Domain controllers require Active Directory-aware recovery planning.
- Successful backup creation should be followed by independent backup discovery checks.
- Virtual disk metadata can help identify storage dependencies.
- Backup verification and restoration testing are separate activities.
- Sensitive domain controller backups require appropriate access controls.
- Backup destinations should be protected against common physical storage failures.

---

#### 16. Evidence and Artifacts

**Primary Evidence Directory:**

`E:\Homelab\Evidence\Phase-02-Active-Directory\04-CHG-006-DC01-Backup-Recovery`

**Primary Evidence:**

| Evidence File | Description |
|---|---|
| `DC01-Post-IAM-Snapshot-Verified.png` | Post-IAM snapshot created |
| `DC01-Offline-Backup-Source-Properties.png` | Original VM folder inventory |
| `DC01-Offline-Backup-Destination-Properties.png` | Offline backup size verification |
| `DC01-Offline-Backup-Snapshot-Files-Preserved.png` | Snapshot disk files copied |
| `DC01-Offline-Backup-SHA256-Integrity-Passed.png` | 13/13 hash comparison success |
| `DC01-SystemState-VDI-Attached.png` | Backup disk attached |
| `DC01-SystemState-Backup-Volume-Ready.png` | NTFS S: volume prepared |
| `DC01-Windows-Server-Backup-Feature-Installed.png` | Backup feature installed |
| `DC01-SystemState-Backup-Completed-Verified.png` | Successful System State backup |
| `DC01-SystemState-Backup-Storage-Verified.png` | Backup files and recovery version confirmed |
| `DC01-Backup-Disk-Before-Detachment.png` | Backup disk originally attached |
| `DC01-SystemState-Backup-VDI-Detached.png` | Backup disk removed from active VM |
| `DC01-SystemState-VDI-Size-Verified.png` | Actual VDI size inspected |
| `DC01-SystemState-VDI-Independence-Verified.png` | Parent UUID and base image verified |

**Supporting Evidence:**

Intermediate configuration and troubleshooting screenshots are archived under:

`E:\Homelab\Evidence\Phase-02-Active-Directory\Archive\CHG-006-Supporting`

**Primary Technical Artifacts:**

- Post-IAM VirtualBox snapshot.
- Offline DC01 VM folder backup.
- PowerShell SHA-256 backup verification script.
- Windows Server System State backup VDI.
- Windows Server Backup completion log.

Backup files and recovery information are maintained for internal lab administration and should not be included in a publicly distributed portfolio.

---

#### 17. Remaining Work

The following activities remain outstanding:

- [ ] Create an additional protected copy of important backups on separate physical storage.
- [ ] Develop and document a controlled domain controller recovery procedure.
- [ ] Test recovery of a backup in an isolated environment.
- [ ] Review backup encryption and access restrictions.
- [ ] Establish a recurring backup and verification schedule as the lab evolves.
- [ ] Review and configure DC01's time synchronization strategy.
- [ ] Periodically verify backup integrity and available recovery versions.

These activities do not change the successful result of the initial backup creation and verification work.

They remain important to improving the reliability and recoverability of the Black Shores environment.

---

#### Final Result

Successfully established three complementary recovery measures for the Black Shores domain controller following completion of the initial 30-employee IAM deployment.

Created and verified a post-IAM VirtualBox snapshot.

Copied the complete DC01 virtual machine directory to independent storage on G: and verified that all thirteen files matched their original counterparts using SHA-256 hashes.

Installed Windows Server Backup, created a dedicated NTFS backup volume, and successfully completed an Active Directory-aware System State backup.

Verified the resulting backup using `wbadmin`, confirmed the presence of backup data, and safely detached the backup virtual disk.

Investigated an apparent virtual disk size discrepancy and confirmed that the detached backup VDI was an independent base image without parent differencing disk dependencies.

The backup artifacts have been preserved, but a complete recovery test remains outstanding.

**Final Status:** Completed — Backup Creation and Verification; Restore Testing Pending

**Outcome:** DC01's post-IAM configuration is protected by a verified offline VM copy, a VirtualBox checkpoint, and a completed Windows Server System State backup. Further work is required to establish tested recovery procedures and stronger physical backup separation.

**Next Change:** Domain Controller Time Synchronization and Authentication Readiness.

### CHG-007: Domain Controller Time Synchronization and Authentication Readiness

**Date:** October 17, 2026

**Status:** Completed — Initial Configuration and Local Verification; Client Testing Pending

**Change Type:** Windows Server Administration / Active Directory / Time Synchronization

**Organization:** Black Shores

**Domain:** `corp.blackshores.test`

**Domain Controller:** DC01

**Domain Controller IP:** `10.50.10.10`

**Virtualization Platform:** Oracle VirtualBox 7.2.20

---

#### Objective

Evaluate and configure time synchronization for the isolated Black Shores Active Directory environment.

Verify the physical virtualization host's time configuration, assess VirtualBox Guest Additions time synchronization capabilities, and configure DC01 to advertise reliable Windows Time services to future domain-joined computers.

Validate NTP service availability, Active Directory domain controller advertisement, and Windows Firewall configuration.

Prepare the domain's time infrastructure for future Kerberos authentication and domain-joined workstation testing without introducing unnecessary connectivity between CORP-LAN and the physical home network.

#### 1. Environment and Prerequisites

The following infrastructure was established during previous changes:

- Windows Server 2025 Standard Evaluation installed on DC01.
- Active Directory forest: `corp.blackshores.test`.
- DC01 configured as the first domain controller.
- DC01 holding the PDC Emulator Flexible Single Master Operations (FSMO) role.
- DNS Server and Active Directory Domain Services operational.
- Isolated VirtualBox Internal Network named `CORP-LAN`.
- DC01 static IPv4 address: `10.50.10.10/24`.
- No default gateway configured on DC01.
- VirtualBox Guest Additions installed.
- Windows Server Backup and recovery preparation completed under CHG-006.

**Initial Concern:**

During CHG-006, Windows Time reported that DC01 was using `Local CMOS Clock` as its synchronization source.

Because the server functions as the forest-root PDC Emulator, its timekeeping configuration required review before deploying domain-joined Windows clients.

**Security Consideration:**

Kerberos authentication is sensitive to clock differences between participating systems.

The initial Black Shores environment therefore requires a consistent time reference for the domain controller and its future clients.

---

#### 2. Initial Domain Controller Time Assessment

**Objective:**

Establish a baseline of DC01's existing time configuration before making changes.

**PowerShell Commands Used:**

- `Get-Date`
- `Get-ADDomain`
- `w32tm /query /source`
- `w32tm /query /status`
- `w32tm /query /configuration`
- `Get-Service`

**Verification Results:**

| Property | Observed Configuration |
|---|---|
| Active Directory Domain | corp.blackshores.test |
| PDC Emulator | DC01.corp.blackshores.test |
| Windows Time Source | Local CMOS Clock |
| NTP Client Type | NT5DS |
| NTP Server Provider | Enabled |
| Windows Time Service | Running |
| Windows Time Startup Type | Automatic |
| VirtualBox Guest Additions Service | Running |
| VBoxService Startup Type | Automatic |

**Findings:**

DC01 was confirmed as the PDC Emulator for the Black Shores domain.

Windows Time was running but identified the local clock as its time source.

The NTP client configuration used `NT5DS`, which is associated with domain-hierarchy synchronization.

The NTP server provider was enabled.

**Assessment:**

DC01 had the Windows Time components required to participate in domain time synchronization, but a reliable upstream synchronization source had not been established through Windows Time.

Further investigation was required before designating the server as the domain's reliable time reference.

---

#### 3. Physical Host Time Verification

**Objective:**

Determine whether the primary Windows 10 virtualization host maintained an appropriate system clock.

**Host System:**

Primary Windows 10 desktop running Oracle VirtualBox.

**Commands Executed:**

- `Get-Date`
- `Get-TimeZone`
- `w32tm /query /source`
- `w32tm /query /status`

**Initial Findings:**

| Property | Result |
|---|---|
| Host Time Zone | Central Time (US & Canada) |
| Windows Time Source Query | Failed |
| Windows Time Status Query | Failed |
| Error Code | 0x80070426 |

**Error Message:**

"The service has not been started."

**Assessment:**

The host's Windows Time service was not running when the initial status queries were executed.

This did not independently establish that the system clock was incorrect.

Additional inspection was performed to determine whether the stopped service reflected normal standalone Windows behavior or a configuration problem.

---

#### 4. Physical Host Windows Time Service Inspection

**Objective:**

Review the Windows Time service configuration and its startup behavior.

**Commands Executed:**

`Get-Service -Name W32Time`

`sc.exe qtriggerinfo w32time`

`Get-ScheduledTask`

**Observed Results:**

| Property | Result |
|---|---|
| Service | W32Time |
| Status | Stopped |
| Startup Type | Manual |
| Service Trigger | Domain Joined |
| Scheduled Task Query | No matching task found at specified path |

**Findings:**

The physical desktop was not joined to the Black Shores Active Directory domain.

The Windows Time service had a domain-joined startup trigger and was configured for manual startup.

The scheduled task query did not find an object at the specified Time Synchronization path.

**Assessment:**

The stopped W32Time service was consistent with possible standalone Windows behavior.

However, the service inspection did not establish whether the physical host was maintaining accurate time through another synchronization mechanism.

**Decision:**

Inspect the Windows graphical Date & time settings before modifying any services.

---

#### 5. Physical Host Automatic Time Configuration

**Objective:**

Confirm the physical host's time synchronization settings and enable automatic timekeeping.

**Administration Method:**

Windows 10 Settings — Time & Language — Date & time.

**Initial Configuration:**

| Property | Observed Value |
|---|---|
| Set Time Automatically | Off |
| Time Server | pool.ntp.org |
| Last Successful Synchronization | October 17, 2026, 11:20:47 PM |
| Time Zone | Central Time (US & Canada) |
| Daylight Saving Adjustment | Enabled |

**Finding:**

Automatic time configuration was disabled even though Windows displayed a recent successful synchronization with `pool.ntp.org`.

**Actions Performed:**

1. Opened Windows Date & time settings.
2. Located the Set time automatically option.
3. Changed the setting from Off to On.
4. Retained Central Time.
5. Retained automatic daylight saving adjustment.
6. Reviewed the synchronization information.

**Verification:**

Windows displayed Set time automatically as On.

The time server remained `pool.ntp.org`, with the previously reported successful synchronization visible.

**Result:**

Automatic time configuration was enabled on the physical Windows desktop.

**Limitation:**

The available evidence confirms the enabled setting and a reported successful synchronization. It does not establish long-term clock accuracy or a complete history of recurring synchronization events.

---

#### 6. VirtualBox Host-Time Synchronization Assessment

**Objective:**

Determine whether VirtualBox host-to-guest time synchronization had been explicitly disabled for DC01.

**Verification Tool:**

Oracle VirtualBox `VBoxManage`.

**Command Executed:**

`VBoxManage getextradata "DC01" "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled"`

**Observed Result:**

`No value set!`

**Interpretation:**

No explicit value was configured for the VirtualBox setting that disables host-time access.

**Additional Verification:**

Queried the VirtualBox Guest Additions service inside DC01.

**Verified Service:**

| Property | Result |
|---|---|
| Service Name | VBoxService |
| Service State | Running |
| Startup Type | Automatic |
| Executable | C:\Windows\System32\VBoxService.exe |

No obvious synchronization-disabling argument was present in the reported service command line.

**Result:**

VirtualBox Guest Additions was operational, and the inspected configuration did not show host-time synchronization being explicitly disabled.

**Limitation:**

These checks establish service availability and configuration state. They do not independently prove that Guest Additions is continuously correcting the guest clock.

---

#### 7. Physical Host and DC01 Clock Comparison

**Objective:**

Assess whether DC01's current clock was reasonably aligned with the physical virtualization host.

**PowerShell Command Used on Both Systems:**

`Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff zzz"`

**Verification Method:**

Executed timestamp queries on the physical desktop and inside DC01.

Compared the displayed dates, times, and UTC offsets.

**Observed Results:**

- Both systems reported October 17, 2026.
- Both systems used UTC−05:00.
- The displayed timestamps were consistent with clocks that were closely aligned.
- No obvious multi-minute discrepancy was observed.

**Assessment:**

The results were consistent with the host and guest maintaining approximately the same time.

**Verification Limitation:**

The commands were executed sequentially rather than through a synchronized measurement mechanism.

Therefore, the test did not establish a precise clock offset or verify long-term synchronization accuracy.

**Result:**

No significant clock discrepancy was identified during the comparison.

---

#### 8. Time Synchronization Design Decision

**Objective:**

Select a practical timekeeping approach for the isolated Black Shores homelab.

**Environmental Constraints:**

- CORP-LAN has no default gateway.
- DC01 is not directly connected to an external NTP server.
- Direct connectivity between CORP-LAN and the household network is intentionally restricted.
- The physical Windows desktop has automatic time configuration enabled.
- VirtualBox Guest Additions is installed and running.

**Selected Lab Approach:**

Use the physical virtualization host as a potential underlying clock reference through VirtualBox Guest Additions.

Configure DC01 to advertise a reliable Windows Time service to future domain clients.

**Planned Time Hierarchy:**

```text
Physical Windows Desktop
    |
    | VirtualBox Guest Additions
    | Host-assisted clock synchronization
    v
DC01 — PDC Emulator
    |
    | Windows Time / Active Directory
    | Domain time hierarchy
    v
Future Black Shores Domain-Joined Workstations
```

**Reasoning:**

This approach preserves the isolated virtual network while allowing DC01 to provide a consistent time reference to future Windows clients.

**Security and Operational Limitation:**

This is a lab-specific design.

Microsoft's preferred production configuration generally uses a reliable upstream time source for the forest-root PDC Emulator.

The chosen approach relies on the physical host maintaining correct time, and ongoing host-to-guest synchronization accuracy has not yet been independently established.

---

#### 9. Reliable Windows Time Service Configuration

**Objective:**

Configure DC01 to advertise itself as a reliable domain time source.

**Command Executed:**

`w32tm /config /reliable:yes /update`

**Observed Result:**

"The command completed successfully."

**Verification Commands:**

`w32tm /query /configuration`

`w32tm /query /status /verbose`

**Verified Configuration:**

| Property | Result |
|---|---|
| AnnounceFlags | 5 |
| Server Role | 576 — Reliable Time Service |
| Time Source | Local CMOS Clock |
| Leap Indicator | 0 — No warning |

**Additional Observations:**

The verbose Windows Time status reported:

- State Machine: 0 (Unset).
- Last Sync Error: 1 — No time data was available.
- Time Source Flags: 0 (None).

**Assessment:**

The configuration command succeeded, and Windows Time recognized DC01 as a reliable time service.

However, Windows Time continued to use the local clock rather than a verified external NTP source.

The synchronization error was consistent with the absence of an available upstream time source, but it was not independently attributed to a specific underlying cause.

**Result:**

DC01 was configured to advertise itself as a reliable domain time server.

Additional testing was required to confirm that the service actually responded to NTP requests.

---

#### 10. NTP Service Availability and Response Verification

**Objective:**

Confirm that DC01's Windows Time service was listening for NTP traffic and responding to local requests.

**NTP Protocol:**

UDP port 123.

**Commands Executed:**

`Get-NetUDPEndpoint -LocalPort 123`

`w32tm /stripchart /computer:10.50.10.10 /samples:4 /dataonly`

**UDP Listener Verification:**

| Address | Port | Result |
|---|---|---|
| 0.0.0.0 | UDP 123 | Listening |
| :: | UDP 123 | Listening |

**NTP Response Test:**

The `w32tm /stripchart` command requested four samples from DC01 using its internal IPv4 address.

**Observed Offsets:**

| Sample | Offset |
|---|---:|
| 1 | +0.0005652 seconds |
| 2 | +0.0009697 seconds |
| 3 | −0.0000738 seconds |
| 4 | +0.0001573 seconds |

**Verification Results:**

- Four NTP samples requested.
- Four responses received.
- No timeouts reported.
- All measured offsets were below one millisecond in magnitude.

**Result:**

Successfully verified that DC01 responded to local NTP requests on UDP port 123.

**Verification Limitation:**

The test was executed from DC01 against its own IP address.

It confirmed local NTP responsiveness but did not establish that another workstation could communicate with the service across CORP-LAN.

---

#### 11. Active Directory Time Service Advertisement Verification

**Objective:**

Confirm that Active Directory advertised DC01 as a domain controller capable of providing reliable time services.

**Command Executed:**

`nltest /dsgetdc:corp.blackshores.test /force`

**Verified Domain Controller:**

`DC01.corp.blackshores.test`

**Verified IPv4 Address:**

`10.50.10.10`

**Relevant Flags:**

| Flag | Meaning | Result |
|---|---|---|
| PDC | Primary Domain Controller role | Present |
| GC | Global Catalog | Present |
| DS | Directory Services | Present |
| LDAP | LDAP directory service | Present |
| KDC | Kerberos Key Distribution Center | Present |
| TIMESERV | Time service available | Present |
| GTIMESERV | Reliable time service advertised | Present |
| DNS_DC | DNS-capable domain controller | Present |

**Command Result:**

"The command completed successfully."

**Assessment:**

Active Directory successfully discovered DC01 and reported the expected domain controller and time-service capabilities.

The presence of both `TIMESERV` and `GTIMESERV` confirmed that DC01 advertised itself as a reliable time server.

**Result:**

Domain controller time-service advertisement verification passed.

---

#### 12. Windows Firewall NTP Verification

**Objective:**

Confirm that Windows Firewall was configured to permit inbound NTP traffic to DC01.

**Verification Method:**

PowerShell firewall inspection.

**Commands and Cmdlets Used:**

- `Get-NetFirewallRule`
- `Get-NetFirewallPortFilter`
- `Get-NetConnectionProfile`

**Supporting Script:**

`Verify-Firewall-NTP.ps1`

**Verified Firewall Rule:**

`Active Directory Domain Controller - W32Time (NTP-UDP-In)`

**Observed Configuration:**

| Property | Result |
|---|---|
| Enabled | True |
| Direction | Inbound |
| Action | Allow |
| Protocol | UDP |
| Local Port | 123 |
| Firewall Profile | Any |

**Active Network Profile:**

| Property | Result |
|---|---|
| Interface | Ethernet |
| Network Category | DomainAuthenticated |

**Assessment:**

The NTP inbound rule was enabled and permitted UDP port 123.

The rule's profile applied to DC01's active network connection.

**Result:**

Windows Firewall configuration was verified as permitting inbound NTP traffic.

**Verification Limitation:**

Firewall configuration verification is not equivalent to an end-to-end network connectivity test.

A separate virtual machine must be used to confirm that NTP traffic is actually received and answered across CORP-LAN.

---

#### 13. Final Verification Summary

**Completed Checks:**

| Verification | Result |
|---|---|
| DC01 PDC Emulator role | Passed |
| Physical host automatic time enabled | Passed |
| Physical host time server identified | Passed |
| VirtualBox Guest Additions running | Passed |
| Host-time disabling setting absent | Passed |
| Host and guest clock comparison | No significant discrepancy observed |
| Reliable Windows Time setting | Passed |
| AnnounceFlags set to 5 | Passed |
| Local NTP listener on UDP 123 | Passed |
| Four local NTP responses | Passed |
| TIMESERV advertisement | Passed |
| GTIMESERV advertisement | Passed |
| Windows Firewall inbound NTP rule | Passed |
| Active network profile | DomainAuthenticated |

**Remaining Verification Requirements:**

- Confirm accurate and consistent host-to-guest clock synchronization over time.
- Verify NTP connectivity from a separate VM on CORP-LAN.
- Verify domain-joined client synchronization through Windows Time.
- Confirm Kerberos authentication functions with normal clock synchronization behavior.

**Overall Result:**

DC01 was configured and locally verified as a reliable domain time service.

External or independently synchronized upstream time accuracy has not been established.

---

#### 14. Issues, Resolutions, and Lessons Learned

| Issue or Observation | Resolution or Outcome |
|---|---|
| DC01 used Local CMOS Clock | Investigated the isolated domain time configuration |
| Physical host W32Time service was stopped | Reviewed service startup triggers and Windows time settings |
| Host automatic time setting was disabled | Enabled Set time automatically |
| Scheduled task query returned no matching path | Documented the finding without modifying Task Scheduler |
| Need to evaluate VirtualBox host time integration | Inspected VirtualBox configuration and VBoxService |
| No precise guest clock offset measurement | Compared timestamps and documented the limitation |
| Windows Time reported no upstream time data | Preserved the finding and verified local NTP service behavior |
| Need for reliable domain time advertisement | Configured `w32tm /reliable:yes` |
| Need to verify actual NTP response | Completed four successful local NTP requests |
| Need to verify domain controller advertisement | Confirmed TIMESERV and GTIMESERV flags |
| Need to permit incoming time requests | Verified the inbound UDP 123 firewall rule |

**Key Lessons Learned:**

- Domain controller time synchronization requires separate consideration from ordinary Windows clock configuration.
- The PDC Emulator plays a central role in an Active Directory domain's time hierarchy.
- Virtual machine time synchronization and Windows Time synchronization are related but distinct mechanisms.
- A running hypervisor integration service does not independently prove accurate clock synchronization.
- Successful service configuration should be followed by functional verification.
- NTP service advertisement and actual NTP responses provide different types of evidence.
- A local NTP test does not replace testing from a separate network client.
- Accurate time is important for Kerberos authentication and reliable security event timestamps.
- Isolated laboratory environments may require different synchronization designs from production networks.

---

#### 15. Evidence and Artifacts

**Primary Evidence Directory:**

`E:\Homelab\Evidence\Phase-02-Active-Directory\05-CHG-007-Time-Synchronization`

**Primary Evidence:**

| Evidence File | Description |
|---|---|
| `DC01-Time-Configuration-Baseline.png` | Initial DC01 time configuration |
| `Host-Automatic-Time-Initially-Disabled.png` | Physical host initial time settings |
| `Host-Automatic-Time-Enabled.png` | Automatic time configuration enabled |
| `VirtualBox-Host-Time-Setting-Verified.png` | VirtualBox host-time setting inspection |
| `Host-Guest-Clock-Comparison.png` | Host and guest timestamp comparison |
| `DC01-VBoxService-Running.png` | Guest Additions service verification |
| `DC01-Reliable-Time-Service-Configured.png` | Reliable Windows Time configuration |
| `DC01-NTP-UDP123-Response-Passed.png` | Local NTP response verification |
| `DC01-Domain-Time-Advertisement-Verified.png` | Active Directory TIMESERV and GTIMESERV verification |
| `DC01-NTP-Firewall-Rule-Verified.png` | Inbound UDP 123 firewall verification |

**Supporting Evidence:**

Additional baseline and troubleshooting screenshots are archived under:

`E:\Homelab\Evidence\Phase-02-Active-Directory\Archive\CHG-007-Supporting`

**Primary Technical Artifacts:**

- Windows Time service configuration.
- Physical host automatic time setting.
- VirtualBox Guest Additions integration.
- PowerShell time verification commands.
- NTP response verification results.
- Active Directory domain controller advertisement results.
- PowerShell firewall verification script.

---

#### 16. Security Considerations and Remaining Work

**Implemented Configuration:**

- Physical virtualization host automatic time configuration enabled.
- VirtualBox Guest Additions integration inspected.
- DC01 configured to advertise reliable Windows Time services.
- Local NTP service verified on UDP port 123.
- Active Directory time-service advertisement verified.
- Windows Firewall NTP allowance verified.

**Limitations:**

- DC01 continues to identify `Local CMOS Clock` as its Windows Time source.
- No verified external NTP peer is configured on DC01.
- VirtualBox's long-term host-to-guest synchronization behavior has not been independently measured.
- NTP connectivity from another VM has not yet been tested.
- Domain-client synchronization remains unverified.
- Configuration is intended for an isolated training environment, not a production deployment.

**Outstanding Work:**

- [ ] Deploy the first Windows workstation on CORP-LAN.
- [ ] Verify workstation-to-DC01 NTP connectivity.
- [ ] Join the workstation to `corp.blackshores.test`.
- [ ] Confirm Windows Time uses the domain synchronization hierarchy.
- [ ] Test employee authentication and required initial password changes.
- [ ] Review host and guest clock accuracy periodically.
- [ ] Reevaluate the time architecture if the lab gains additional domain controllers or controlled upstream connectivity.

These activities will be documented during subsequent workstation deployment and authentication testing.

---

#### Final Result

Successfully assessed and configured Windows Time services for the Black Shores domain controller.

Confirmed that DC01 holds the PDC Emulator role, reviewed its existing time configuration, and identified the physical host's disabled automatic time setting.

Enabled automatic time configuration on the physical Windows desktop and verified that VirtualBox Guest Additions was operational.

Configured DC01 to advertise a reliable Windows Time service and verified the corresponding Windows Time settings.

Confirmed that DC01 listened on UDP port 123 and successfully responded to four local NTP requests.

Verified Active Directory domain controller advertisement through the PDC, TIMESERV, GTIMESERV, and KDC flags.

Confirmed that Windows Firewall permitted inbound NTP traffic for the active domain network profile.

The initial time-service configuration and local verification objectives were achieved. Client-based synchronization testing and long-term clock accuracy verification remain outstanding.

**Final Status:** Completed — Initial Configuration and Local Verification; Client Testing Pending

**Outcome:** DC01 is configured and locally verified to provide domain time services within the isolated Black Shores environment. Full end-to-end validation will occur during domain-joined workstation deployment.

**Next Change:** CHG-008 — Windows Client Deployment and Domain Join.
