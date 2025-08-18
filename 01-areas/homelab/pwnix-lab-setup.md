# PWNIX Lab

Red Team / Blue Team / Victim VM Lab Setup (UTM on macOS)

> **Platform**: M4 MacBook Air (32GB RAM)  
> **Hypervisor**: [UTM](https://mac.getutm.app/) (QEMU frontend for macOS)

---
- [PWNIX Lab](#pwnix-lab)
  - [📌 Lab Overview](#-lab-overview)
  - [🛠️ VM Configuration in UTM](#️-vm-configuration-in-utm)
    - [Shared Recommendations](#shared-recommendations)
  - [🌐 Virtual Network Setup (UTM)](#-virtual-network-setup-utm)
  - [🔴 Red Team VM – Kali Linux (x86)](#-red-team-vm--kali-linux-x86)
    - [Installation](#installation)
    - [Software Stack](#software-stack)
    - [Use Cases](#use-cases)
  - [🟡 Victim VM – Windows 10 (x86)](#-victim-vm--windows-10-x86)
    - [Installation](#installation-1)
    - [Configuration](#configuration)
    - [Use Cases](#use-cases-1)
  - [🔵 Blue Team VM – Ubuntu Server (ARM or x86)](#-blue-team-vm--ubuntu-server-arm-or-x86)
    - [Installation](#installation-2)
    - [Software Stack](#software-stack-1)
    - [Use Cases](#use-cases-2)
  - [🧪 Sample Workflow](#-sample-workflow)
  - [🖥️ Access \& Usage](#️-access--usage)
  - [🧹 Maintenance \& Tips](#-maintenance--tips)
  - [Other Resources](#other-resources)
  - [📅 Last Updated](#-last-updated)

---
## 📌 Lab Overview

| Role  | VM Name | OS                  | Purpose                           |
|-------|---------|---------------------|-----------------------------------|
| 🔴 Red Team | `kalred` | Kali Linux (x86)       | Attacker box (scanning, exploits) |
| 🟡 Victim   | `victim-win10` | Windows 10 (x86)      | Target machine (services to exploit) |
| 🔵 Blue Team | `ublue` | Ubuntu Desktop 24.04 (ARM/x86) | Detection & logging (SIEM/IDS) |

---

## 🛠️ VM Configuration in UTM

### Shared Recommendations
- **Enable networking**: Use a **shared virtual LAN**
- **Memory**:
  - Red: 4–6 GB
  - Victim: 6–8 GB
  - Blue: 6–8 GB
- **Storage**: 40–60 GB per VM
- **CPU**: 2–4 cores depending on task

---

## 🌐 Virtual Network Setup (UTM)

1. Open **UTM → Preferences → Networking**
2. Add a new **Bridged or Emulated Network**
3. Name it (e.g., `lab-net`)
4. For each VM:
   - Go to VM → Configuration → Network
   - Attach to `lab-net`
   - Set to **Bridged (emulated)** or **Shared** depending on isolation preference

> Optionally assign static IPs in each OS or set up local DHCP server in Blue VM

---

## 🔴 Red Team VM – Kali Linux (x86)

### Installation
- ISO: [https://www.kali.org/get-kali/](https://www.kali.org/get-kali/)
- Default user: `kali:kali`

### Software Stack
- Metasploit Framework
- Nmap
- Hydra
- Burp Suite
- sqlmap
- enum4linux / smbclient
- Wireshark

### Use Cases
- Reconnaissance (Nmap, enum4linux)
- Exploits (Metasploit)
- Credential bruteforce (Hydra)
- Web attacks (Burp Suite, sqlmap)

---

## 🟡 Victim VM – Windows 10 (x86)

### Installation
- Use any Windows 10 ISO
- Optionally install [Metasploitable 3](https://github.com/rapid7/metasploitable3) for pre-baked vulnerabilities

### Configuration
- Enable RDP, SMB, WinRM, Web services
- Install **Sysmon**, **Winlogbeat** (send logs to Blue)
- Add dummy users and weak passwords

### Use Cases
- Simulate real-world user behavior
- Run vulnerable apps (e.g., DVWA, old Apache/Tomcat)

---

## 🔵 Blue Team VM – Ubuntu Server (ARM or x86)

### Installation
- ISO: [Ubuntu Server 22.04](https://ubuntu.com/download/server)

### Software Stack
- Wazuh (SIEM/EDR)
- Suricata (IDS/IPS)
- Filebeat/Winlogbeat (log shippers)
- Zeek (network analysis)
- ELK Stack (Elasticsearch, Logstash, Kibana)

### Use Cases
- Detect intrusion attempts from Red to Victim
- Monitor system logs, network packets
- Build dashboards and alerts

---

## 🧪 Sample Workflow

1. Boot all VMs
2. Kali scans target:
   ```
   nmap -sS -A 192.168.122.10
   ```
3. Launch exploit via Metasploit
4. Monitor logs in Kibana on Blue VM
5. Investigate alerts triggered by Suricata/Wazuh

---

## 🖥️ Access & Usage

| VM     | Access Method    | Default User/Pass |
|--------|------------------|-------------------|
| Kali   | VNC or SSH       | kali / kali       |
| Win10  | RDP, SMB, Web    | user / weakpass   |
| Ubuntu | SSH, Web (Kibana)| ubuntu / yourpw   |

> Access via static IPs on shared lab network (`192.168.122.x` range)

---

## 🧹 Maintenance & Tips

- **Snapshots**: Take before each test run
- **Resource use**: Run only 2 VMs at a time if needed
- **Update tools weekly**: Especially Kali and Wazuh
- **Log everything**: Store logs from victim and attacker if possible

---

## Other Resources

[Metasploit Guide](https://www.offsec.com/metasploit-unleashed/)

---

## 📅 Last Updated

2025-06-15

*Build a warzone in your laptop—Red pokes holes, Blue patches them, and the Victim screams silently.* 🔥🧠🛡️
