# Black Shores — Active Directory & Cybersecurity Homelab

> **Independent, self-directed project · In progress**  
> Simulated enterprise IT environment built with Windows Server, Active Directory, PowerShell, and VirtualBox.

## Overview

Black Shores is a fictional organization used to practice building, administering, securing, and troubleshooting an isolated Windows domain. This repository presents selected technical documentation, administrative scripts, and screenshots from the environment; **it does not contain virtual machine disks, operating-system installation images, or production credentials**.

The project is distinct from my guided [ACI Learning security practice labs](https://github.com/Akiet453/cybersecurity-practice-labs).

## Environment

| Component | Configuration |
|---|---|
| Virtualization | Oracle VirtualBox 7.2.20 on a Windows host |
| Domain controller | DC01 — Windows Server 2025 Standard Evaluation (Desktop Experience) |
| Domain / forest | `corp.blackshores.test` (fictional, isolated lab) |
| Directory and name resolution | Active Directory Domain Services, integrated DNS |
| Network | Isolated VirtualBox Internal Network (`CORP-LAN`, `10.50.10.0/24`) |
| Workforce simulation | 30 fictional employee accounts across IT, HR, Finance, Sales and Operations |
| Administration | PowerShell scripting, AD DS tools, Windows configuration and verification |
| Client workstation | WS01 — workstation deployment, domain join, and security testing evidenced in the current screenshots; write-up still being consolidated |

## Completed milestones and evidence

| Change | Technical work | Verification or evidence |
|---|---|---|
| CHG-001–002 | VirtualBox upgrade, Windows Server deployment, updates, clean baseline snapshot | [Deployment evidence](evidence/Phase-01-Infrastructure/03-DC01-Deployment/DC01-Final-Virtual-Hardware.PNG), [snapshot](evidence/Phase-01-Infrastructure/07-Baseline-Snapshot/DC01-Clean-Baseline-Snapshot.PNG) |
| CHG-003 | Isolated networking, static IP, AD DS forest and DNS | [Domain verified](evidence/Phase-02-Active-Directory/01-CHG-003-Network-ADDS/ADDS-Domain-Identity-Verified.PNG), [DNS records](evidence/Phase-02-Active-Directory/01-CHG-003-Network-ADDS/ADDS-DNS-Records-Verified.PNG) |
| CHG-004 | Departmental OUs and security groups | [OUs](evidence/Phase-02-Active-Directory/02-CHG-004-OUs-Groups/AD-Departmental-OUs-Verified.PNG), [groups](evidence/Phase-02-Active-Directory/02-CHG-004-OUs-Groups/AD-Departmental-Security-Groups.PNG) |
| CHG-005 | CSV-driven PowerShell user provisioning; 30 total accounts, 29 created through automation | [Department counts](evidence/Phase-02-Active-Directory/03-CHG-005-User-Provisioning/IAM-Final-30-Employee-Department-Counts.PNG), [security audit](evidence/Phase-02-Active-Directory/03-CHG-005-User-Provisioning/IAM-24-Employee-Security-Audit-Passed.PNG) |
| CHG-006 | Offline VM backup and System State backup | [SHA-256 integrity comparison](evidence/Phase-02-Active-Directory/04-CHG-006-DC01-Backup-Recovery/DC01-Offline-Backup-SHA256-Integrity-Passed.PNG), [System State backup](evidence/Phase-02-Active-Directory/04-CHG-006-DC01-Backup-Recovery/DC01-SystemState-Backup-Completed-Verified.PNG) |
| CHG-007 | Windows Time / NTP local response and domain time-service advertisement | [Local UDP/123 response](evidence/Phase-02-Active-Directory/05-CHG-007-Time-Synchronization/DC01-NTP-UDP123-Response-Passed.PNG), [advertisement](evidence/Phase-02-Active-Directory/05-CHG-007-Time-Synchronization/DC01-Domain-Time-Advertisement-Verified.PNG) |

### CHG-008 — Workstation and endpoint security (evidence in progress)

The archive includes screenshots showing a Windows workstation joined to the Black Shores domain, and subsequent verification of the domain secure channel, applied Group Policy, Kerberos tickets, and firewall log events. The detailed build log currently ends after CHG-007, so **CHG-008's narrative/change record is not yet complete**. The images below are preserved as selected evidence rather than a claim that all endpoint security work is finalized.

- [Successful domain join](evidence/Phase-02-Active-Directory/06-CHG-008-WS01-Deployment-and-Firewall/02-Network-Domain-Join-and-OU/WS048-Successful-Domain-Join.PNG)
- [Domain membership and secure channel](evidence/Phase-02-Active-Directory/06-CHG-008-WS01-Deployment-and-Firewall/02-Network-Domain-Join-and-OU/WS051-Domain-Membership-and-Secure-Channel.PNG)
- [Applied workstation baseline GPO](evidence/Phase-02-Active-Directory/06-CHG-008-WS01-Deployment-and-Firewall/05-Group-Policy-and-Auditing/WS067-Baseline-GPO-Applied-gpresult.PNG)
- [Kerberos ticket evidence](evidence/Phase-02-Active-Directory/06-CHG-008-WS01-Deployment-and-Firewall/04-Authentication-Events-and-Kerberos/WS079-Noah-Kerberos-TGT-and-LDAP-Tickets.PNG)
- [Firewall logging verified](evidence/Phase-02-Active-Directory/06-CHG-008-WS01-Deployment-and-Firewall/06-Firewall-Baseline-and-Logging/WS091-Effective-Firewall-Logging-Verified.PNG)
- [Firewall drop event](evidence/Phase-02-Active-Directory/06-CHG-008-WS01-Deployment-and-Firewall/07-TCP65000-Investigation-and-Cleanup/WS106-TCP65000-Firewall-DROP-SYN.PNG) and [permitted test connection](evidence/Phase-02-Active-Directory/06-CHG-008-WS01-Deployment-and-Firewall/07-TCP65000-Investigation-and-Cleanup/WS108-TCP65000-Connection-Succeeded.PNG)

## Automation and scripts

The [`scripts/IAM/`](scripts/IAM/) folder contains three PowerShell scripts and one small sample employee CSV:

- [`New-BlackShoresUsers.ps1`](scripts/IAM/New-BlackShoresUsers.ps1): validates CSV entries, previews actions with `-WhatIf`, prompts for temporary passwords, creates users, assigns group membership, and verifies results
- [`Test-BlackShoresEmployees.ps1`](scripts/IAM/Test-BlackShoresEmployees.ps1): validates employee input data and detects duplicates
- [`SHA-256-backup-integrity-verification.ps1`](scripts/IAM/SHA-256-backup-integrity-verification.ps1): compares the source and backup inventories, lengths, and SHA-256 hashes using lab-specific paths
- [`blackshores-employees.csv`](scripts/IAM/blackshores-employees.csv): fictional sample identities for the lab

> Scripts were developed and tested for this isolated environment. They contain environment-specific paths and are **not production-ready tools**. Review and adapt them before reuse.

## Documentation

The [full infrastructure build log](documentation/01-HomeLab-Build-Log.md) contains detailed goals, implementation steps, challenges, verification and evidence references. Its status summary predates the CHG-008 screenshots; the next documentation task is to integrate and verify the CHG-008 narrative and update the current status section.

## Key technical lessons

- Separate **authentication**, **authorization**, network reachability, and DNS when diagnosing domain issues
- Verify configuration changes with commands and logs rather than assuming an accepted command proves intended behavior
- Use `-WhatIf` and validation before bulk identity provisioning
- Treat VM snapshots and independent backups as different recovery mechanisms
- Use timestamps, system-event evidence, and temporary test rules carefully when investigating firewall behavior
- Document unresolved root causes and verification limitations rather than guessing

## Responsible disclosure and publication notes

All organizational names and employee identities in this portfolio are fictional. This repository was prepared from a larger private working archive. IP addresses are from a nonroutable lab subnet. Screenshots show lab interfaces and must be visually reviewed for identifying details, sensitive tokens, and unexpected information **before changing repository visibility to Public**. Do not publish passwords, credentials, VDI/VBOX machine disks, ISOs, or actual backup copies.