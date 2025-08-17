# NMap User Reference



## terminal aliases


alias nmap_open_ports="nmap --open"
alias nmap_list_interfaces="nmap --iflist"
alias nmap_slow="sudo nmap -sS -v -T1"
alias nmap_fin="sudo nmap -sF -v"
alias nmap_full="sudo nmap -sS -Т4 -РЕ -РР -PS80,443 -РУ -д 53 -А -p1-65535 -V" alias nmap_check_for_firewall="sudo nmap -sA -p1-65535 -v -T4" 
alias nmap_ping_through_firewall="nmap -PS -PA"
alias nmap_fast="nmap -F-T5 --version-light --top-ports 300" alias nap_detect_versions="sudo nmap -sV -p1-65535 -0 --osscan-guess -T4 -Pn" 
alias nmap_check_for_vulns="nmap --script=vuln"
alias nmap_full_udp="sudo nmap -sS -SU -T4 -A -V -PE -PS22, 25,80 -PA21, 23, 80,443, 3389 " 
alias nap_traceroute="sudo nmap -SP -PE -PS22, 25,80 -PA21, 23,80,3389 -PU -PO --traceroute " 
alias nmap_full_with_scripts="sudo nmap -sS -SU -T -A -V -PE -PP -PS21, 22, 23, 25, 80, 113, 31339 -PA80, 113, 44 
alias nmap_web_safe_osscan="sudo nmap -p 80,443 -0 -v --osscan-guess --fuzzy " 
alias nmap_ping_scan="nmap -n -sP"




Here’s your request in the format you specified:

---

**Scan only open ports**

Lists hosts and ports that are open

```
# nmap --open
# alias nmap_open_ports="nmap --open"
```

**List network interfaces**

Displays interfaces and routes used by nmap

```
# nmap --iflist
# alias nmap_list_interfaces="nmap --iflist"
```

**Slow, stealthy SYN scan**

Used to avoid detection on networks

```
# sudo nmap -sS -v -T1
# alias nmap_slow="sudo nmap -sS -v -T1"
```

**FIN scan to bypass firewalls**

Checks for open ports using FIN flag

```
# sudo nmap -sF -v
# alias nmap_fin="sudo nmap -sF -v"
```

**Full aggressive scan all ports**

Comprehensive scan with all checks

```
# sudo nmap -sS -T4 -PE -PP -PS80,443 -PU -p 53 -A -p1-65535 -V
# alias nmap_full="sudo nmap -sS -Т4 -РЕ -РР -PS80,443 -РУ -д 53 -А -p1-65535 -V"
```

**Check for firewall presence**

Uses ACK scan to detect filtering

```
# sudo nmap -sA -p1-65535 -v -T4
# alias nmap_check_for_firewall="sudo nmap -sA -p1-65535 -v -T4"
```

**Ping through potential firewalls**

Uses TCP/ACK and SYN pings

```
# nmap -PS -PA
# alias nmap_ping_through_firewall="nmap -PS -PA"
```

**Fast scan common ports**

Top 300 ports, optimized speed

```
# nmap -F -T5 --version-light --top-ports 300
# alias nmap_fast="nmap -F-T5 --version-light --top-ports 300"
```

**Detect versions and OS guess**

Aggressive version and OS detection

```
# sudo nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn
# alias nap_detect_versions="sudo nmap -sV -p1-65535 -0 --osscan-guess -T4 -Pn"
```

**Check for known vulnerabilities**

Uses NSE scripts to find CVEs

```
# nmap --script=vuln
# alias nmap_check_for_vulns="nmap --script=vuln"
```

**Full TCP and UDP scan**

Scans both TCP/UDP with OS detect

```
# sudo nmap -sS -sU -T4 -A -V -PE -PS22,25,80 -PA21,23,80,443,3389
# alias nmap_full_udp="sudo nmap -sS -SU -T4 -A -V -PE -PS22, 25,80 -PA21, 23, 80,443, 3389 "
```

**Traceroute with host discovery**

Maps route using multiple probe types

```
# sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute
# alias nap_traceroute="sudo nmap -SP -PE -PS22, 25,80 -PA21, 23,80,3389 -PU -PO --traceroute "
```

**Full scan with NSE scripts**

Aggressive scan with scripts and detection

```
# sudo nmap -sS -sU -T -A -V -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,44
# alias nmap_full_with_scripts="sudo nmap -sS -SU -T -A -V -PE -PP -PS21, 22, 23, 25, 80, 113, 31339 -PA80, 113, 44"
```

**Safe web scan with OS guess**

Targets web ports with OS fingerprint

```
# sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy
# alias nmap_web_safe_osscan="sudo nmap -p 80,443 -0 -v --osscan-guess --fuzzy "
```

**Basic ping sweep scan**

Detects live hosts without DNS

```
# nmap -n -sP
# alias nmap_ping_scan="nmap -n -sP"
```

---

_“Alias your nmap, and scan like a boss.”_