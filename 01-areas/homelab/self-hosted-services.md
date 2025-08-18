# Self-Hosted Services
My list of self-hosted services, grouped by use case. 

**Dashboard**

**Networking**
NordVPN
Uptime Kuma

**Media Acquisition and Management **
Plex Media Server
Jellyfin

Prowlarr -- indexer
Radarr -- movies
Sonarr -- tv shows


**Time and Project Management**
Jitsi Meet -- Self-hosted video conferencing & screen-share platform	
    https://jitsi.org/  ￼

Cal.com -- Calendly-style public booking & scheduling pages	
    https://github.com/calcom/cal.com  ￼

Focalboard -- Trello-like Kanban / project boards you host	
    https://www.focalboard.com  ￼

Wekan -- Classic Kanban board (Trello-style) with automations	
    https://wekan.github.io/  ￼


**Game Servers**
AMP Game Panel -- 


**Personal Care**
Grocy -- food inventory, meal planning, meal cost tracking
    https://grocy.info
    https://apps.apple.com/us/app/grocy-mobile/id1567803209


**Server Management**
[Beszel](https://beszel.dev) -- resource utilization dashboard

**Backups**
[Minarca](https://minarca.org/en_CA) -- backups


**Other**
Baserow -- no-code open source database solution
    https://baserow.io

Graphiti -- real-time knowledge graphs for AI agents
    https://github.com/getzep/graphiti

[Wazuh]() -- security monitoring / SEEAM system

[authentik](https://goauthentik.io/pricing/) -- oauth







## whisparr

network: ```none```
extra parameters: ```--net=container:nordlynx --cap-add=NET_ADMIN --sysctl="net.ipv4.conf.all.src_valid_mark=1" --sysctl="net.ipv6.conf.all.disable_ipv6=1"```

```
docker run
  -d
  --name='whisparr-scenes'
  --net='bridge'
  --pids-limit 2048
  -e TZ="America/Chicago"
  -e HOST_OS="Unraid"
  -e HOST_HOSTNAME="loki"
  -e HOST_CONTAINERNAME="whisparr-scenes"
  -e 'PRIVOXY_ENABLED'='false'
  -e 'UNBOUND_ENABLED'='false'
  -e 'UNBOUND_NAMESERVERS'=''
  -e 'VPN_ENABLED'='false'
  -e 'VPN_CONF'='wg0'
  -e 'VPN_PROVIDER'='generic'
  -e 'VPN_LAN_NETWORK'=''
  -e 'VPN_LAN_LEAK_ENABLED'='false'
  -e 'VPN_EXPOSE_PORTS_ON_LAN'=''
  -e 'VPN_AUTO_PORT_FORWARD'='true'
  -e 'VPN_AUTO_PORT_FORWARD_TO_PORTS'=''
  -e 'VPN_FIREWALL_TYPE'='auto'
  -e 'VPN_HEALTHCHECK_ENABLED'='false'
  -e 'VPN_NAMESERVERS'=''
  -e 'VPN_PIA_USER'=''
  -e 'VPN_PIA_PASS'=''
  -e 'VPN_PIA_PREFERRED_REGION'=''
  -e 'VPN_PIA_DIP_TOKEN'='no'
  -e 'VPN_PIA_PORT_FORWARD_PERSIST'='false'
  -e 'PUID'='99'
  -e 'PGID'='100'
  -e 'UMASK'='002'
  -l net.unraid.docker.managed=dockerman
  -l net.unraid.docker.webui='http://[IP]:[PORT:6969]'
  -l net.unraid.docker.icon='https://hotio.dev/webhook-avatars/whisparr.png'
  -p '6960:6969/tcp'
  -v '/mnt/user/appdata/whisparr-scenes/':'/config':'rw'
  -v '/mnt/remotes/10.0.0.9_xmedia/scenes/':'/data':'rw'
  --hostname=whisparr.internal
  --cap-add=NET_ADMIN
  --sysctl="net.ipv4.conf.all.src_valid_mark=1"
  --sysctl="net.ipv6.conf.all.disable_ipv6=1" 'ghcr.io/hotio/whisparr:latest'
e4f881987c9fc131bc8204f856905e17814123da10d7024f016433f7548003e3
```