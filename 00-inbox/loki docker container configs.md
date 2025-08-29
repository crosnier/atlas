docker run  
  -d  
  --name='n8n'  
  --net='bridge'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="n8n"  
  -e 'GENERIC_TIMEZONE'='America/Chicago'  
  -e 'WEBHOOK_URL'='http://10.0.0.10:5678/'  
  -e 'N8N_SECURE_COOKIE'='false'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:5678]/'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/tmchow/unraid-docker-templates/master/img/n8n-icon.png'  
  -p '5678:5678/tcp'  
  -v '/mnt/user/appdata/n8n/':'/home/node/.n8n':'rw'  
  --restart unless-stopped 'n8nio/n8n'  

5a6a4fc67dfe0a827679a4c9aa8b352d4d58b03dcbc3d2c4be18e54d878f0543  
  
**The command finished successfully!**  

  

Removing orphan image: e46ddf7a87b5

**Successfully removed orphan image: e46ddf7a87b5**  

  

Pulling image: lscr.io/linuxserver/qbittorrent:latest

IMAGE ID [2115336331]: Pulling from linuxserver/qbittorrent.  
IMAGE ID [323a0346bdbb]: Pulling fs layer.Downloading 100% of 6 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [e1cde46db0e1]: Pulling fs layer.Downloading 100% of 6 KB.Download complete.Extracting.Pull complete.Pulling fs layer.Downloading 100% of 6 KB.Download complete.Extracting.Pull complete.Already exists.  
IMAGE ID [4d65eb6ac414]: Pulling fs layer.Downloading 100% of 1 KB.Download complete.Extracting.Pull complete.  
IMAGE ID [eb0dfa2a27a6]: Pulling fs layer.Downloading 100% of 701 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [54360c3bb670]: Pulling fs layer.Downloading 100% of 427 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [2bb7cffbbe35]: Pulling fs layer.Downloading 100% of 5 MB.Download complete.Extracting.Pull complete.  
IMAGE ID [6aa286c99ec2]: Pulling fs layer.Downloading 100% of 4 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [67fca23f96ff]: Pulling fs layer.Downloading 100% of 70 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [5efc4494c6ec]: Pulling fs layer.Downloading 100% of 1 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [38900e01a087]: Pulling fs layer.Downloading 100% of 594 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for lscr.io/linuxserver/qbittorrent:latest  
  
**TOTAL DATA PULLED:** 82 MB  

  

Stopping container: qbittorrent

**Successfully stopped container: qbittorrent**  

  

Removing container: qbittorrent

**Successfully removed container: qbittorrent**  

  

Command executiondocker run  
  -d  
  --name='qbittorrent'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="qbittorrent"  
  -e 'WEBUI_PORT'='8080'  
  -e 'PUID'='99'  
  -e 'PGID'='100'  
  -e 'UMASK'='022'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:8080]'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/qbittorrent-logo.png'  
  -v '/mnt/user/downloads/torrents/':'/downloads':'rw'  
  -v '/mnt/user/appdata/qbittorrent':'/config':'rw'  
  --net=container:nordlynx 'lscr.io/linuxserver/qbittorrent'  

4fca1ceb87da11cf2e532a699818c901ccabec11e60295526475a73aedc3b48e  
  
**The command finished successfully!**  

  

Removing orphan image: 65e381346b30

**Successfully removed orphan image: 65e381346b30**  

  

Pulling image: flaresolverr/flaresolverr:latest

IMAGE ID [1062596721]: Pulling from flaresolverr/flaresolverr.  
IMAGE ID [b1badc6e5066]: Pulling fs layer.Downloading 100% of 27 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [7e88bf276da0]: Pulling fs layer.Downloading 100% of 3 MB.Download complete.Extracting.Pull complete.  
IMAGE ID [d55dfff74d98]: Pulling fs layer.Downloading 100% of 12 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [e97853488aa5]: Pulling fs layer.Downloading 100% of 250 B.Download complete.Extracting.Pull complete.  
IMAGE ID [75f63eba1a23]: Pulling fs layer.Downloading 100% of 4 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [5b71e6493a2f]: Pulling fs layer.Downloading 100% of 93 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [06c6fef6e8b6]: Pulling fs layer.Downloading 100% of 194 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [230d2970e009]: Pulling fs layer.Downloading 100% of 374 B.Download complete.Extracting.Pull complete.  
IMAGE ID [ce890a6ea397]: Pulling fs layer.Downloading 100% of 18 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [e1716ae1000e]: Pulling fs layer.Downloading 100% of 187 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [dbe2265bed9c]: Pulling fs layer.Downloading 100% of 34 KB.Download complete.Extracting.Pull complete.  
IMAGE ID [77c19a7c449d]: Pulling fs layer.Downloading 100% of 248 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for flaresolverr/flaresolverr:latest  
  
**TOTAL DATA PULLED:** 254 MB  

  

Stopping container: flaresolverr

**Successfully stopped container: flaresolverr**  

  

Removing container: flaresolverr

**Successfully removed container: flaresolverr**  

  

Command executiondocker run  
  -d  
  --name='flaresolverr'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="flaresolverr"  
  -e 'LOG_LEVEL'='info'  
  -e 'TZ'='America/Chicago'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/FlareSolverr/FlareSolverr/master/resources/flaresolverr_logo.png'  
  --net=container:nordlynx 'flaresolverr/flaresolverr'  

6437cbc063c6108c300e32a0a0d3c748ddb651978ea54d2513a03954756c29c7  
  
**The command finished successfully!**  

  

Removing orphan image: f95000dc15eb

**Successfully removed orphan image: f95000dc15eb**  

  

Pulling image: lscr.io/linuxserver/prowlarr:latest

IMAGE ID [1526569375]: Pulling from linuxserver/prowlarr.  
IMAGE ID [7f029bcbd38b]: Pulling fs layer.Downloading 100% of 6 MB.Verifying Checksum.Download complete.Extracting.Pull complete.Already exists.  
IMAGE ID [b0dadb58761d]: Pulling fs layer.Downloading 100% of 1 KB.Verifying Checksum.Download complete.Extracting.Pull complete.Already exists.  
IMAGE ID [76ae768b6938]: Pulling fs layer.Downloading 100% of 700 B.Verifying Checksum.Download complete.Extracting.Pull complete.Already exists.  
IMAGE ID [ac874513c1de]: Pulling fs layer.Downloading 100% of 428 B.Verifying Checksum.Download complete.Extracting.Pull complete.Already exists.  
IMAGE ID [fab95afd621f]: Pulling fs layer.Downloading 100% of 6 MB.Verifying Checksum.Download complete.Extracting.Pull complete.Already exists.  
IMAGE ID [e30fea9614c5]: Pulling fs layer.Downloading 100% of 5 KB.Verifying Checksum.Download complete.Extracting.Pull complete.Already exists.  
IMAGE ID [7720301a9a2c]: Pulling fs layer.Downloading 100% of 66 MB.Download complete.Extracting.Pull complete.  
IMAGE ID [5c7d6e586ba7]: Pulling fs layer.Downloading 100% of 1 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for lscr.io/linuxserver/prowlarr:latest  
  
**TOTAL DATA PULLED:** 78 MB  

  

Stopping container: prowlarr

**Successfully stopped container: prowlarr**  

  

Removing container: prowlarr

**Successfully removed container: prowlarr**  

  

Command executiondocker run  
  -d  
  --name='prowlarr'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="prowlarr"  
  -e 'PUID'='99'  
  -e 'PGID'='100'  
  -e 'UMASK'='022'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:9696]/system/status'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/prowlarr-logo.png'  
  -v '/mnt/user/appdata/prowlarr':'/config':'rw'  
  --net=container:nordlynx 'lscr.io/linuxserver/prowlarr'  

fad9a177453105015f6208fe6965ef4046b1a0052b7157c66937cc05ba5125c2  
  
**The command finished successfully!**  

  

Removing orphan image: 9f72fd6fb903

**Successfully removed orphan image: 9f72fd6fb903**  

  

Pulling image: huntarr/huntarr:latest

IMAGE ID [1696186308]: Pulling from huntarr/huntarr.  
IMAGE ID [396b1da7636e]: Already exists.  
IMAGE ID [0219e1e5e6ef]: Already exists.  
IMAGE ID [5ec99fe17015]: Already exists.  
IMAGE ID [ea3499df304f]: Already exists.  
IMAGE ID [773023001809]: Pulling fs layer.Downloading 100% of 93 B.Verifying Checksum.Extracting.Pull complete.  
IMAGE ID [8b607169c28b]: Pulling fs layer.Downloading 100% of 5 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [93cddc2362f7]: Pulling fs layer.Download complete.Extracting.Pull complete.  
IMAGE ID [629491d43947]: Pulling fs layer.Downloading 100% of 15 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [2061a80f6023]: Pulling fs layer.Downloading 100% of 13 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [ed84e5215cd3]: Pulling fs layer.Downloading 100% of 96 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for huntarr/huntarr:latest  
  
**TOTAL DATA PULLED:** 33 MB  

  

Stopping container: huntarr

**Successfully stopped container: huntarr**  

  

Removing container: huntarr

**Successfully removed container: huntarr**  

  

Command executiondocker run  
  -d  
  --name='huntarr'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="huntarr"  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:9705]/'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/plexguide/Huntarr.io/main/frontend/static/logo/512.png'  
  -v '/mnt/user/appdata/huntarr':'/config':'rw'  
  --net=container:nordlynx 'huntarr/huntarr:latest'  

d7088a99137de7267f6b30840d35df292f998f86e848912bf9827e194579eb2a  
  
**The command finished successfully!**  

  

Removing orphan image: 17faedc81d65

**Successfully removed orphan image: 17faedc81d65**  

  

Pulling image: lscr.io/linuxserver/radarr:latest

IMAGE ID [146382579]: Pulling from linuxserver/radarr.  
IMAGE ID [508026eddbb0]: Pulling fs layer.Downloading 100% of 74 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [573fc80a5f15]: Pulling fs layer.Downloading 100% of 1 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for lscr.io/linuxserver/radarr:latest  
  
**TOTAL DATA PULLED:** 74 MB  

  

Stopping container: radarr

**Successfully stopped container: radarr**  

  

Removing container: radarr

**Successfully removed container: radarr**  

  

Command executiondocker run  
  -d  
  --name='radarr'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="radarr"  
  -e 'PUID'='99'  
  -e 'PGID'='100'  
  -e 'UMASK'='022'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:7878]/system/status'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/radarr-logo.png'  
  -v '/mnt/remotes/10.0.0.9_media/':'/mediastore':'rw,slave'  
  -v '/mnt/user/downloads/torrents/':'/downloads':'rw'  
  -v '/mnt/user/appdata/radarr':'/config':'rw'  
  --net=container:nordlynx 'lscr.io/linuxserver/radarr'  

be4a8d1e49e5c6807cdc82b6cfb78bb1358612198dc747976a8d835b0f764f57  
  
**The command finished successfully!**  

  

Removing orphan image: 73c6bc444998

**Successfully removed orphan image: 73c6bc444998**  

  

Pulling image: ghcr.io/hotio/whisparr:v3

IMAGE ID [v3]: Pulling from hotio/whisparr.  
IMAGE ID [9824c27679d3]: Already exists.  
IMAGE ID [c1f0da0172a5]: Pulling fs layer.Downloading 100% of 27 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [3ac7c69d35dc]: Pulling fs layer.Downloading 100% of 594 KB.Download complete.Extracting.Pull complete.  
IMAGE ID [ae2f0603b098]: Pulling fs layer.Downloading 100% of 2 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [8646000d2368]: Pulling fs layer.Downloading 100% of 1000 B.Download complete.Extracting.Pull complete.  
IMAGE ID [3b94a74e4c91]: Pulling fs layer.Downloading 100% of 12 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [e17f4ba5ce32]: Pulling fs layer.Downloading 100% of 3 MB.Download complete.Extracting.Pull complete.  
IMAGE ID [25a07a42d798]: Pulling fs layer.Downloading 100% of 64 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [285645b68a72]: Pulling fs layer.Downloading 100% of 674 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for ghcr.io/hotio/whisparr:v3  
  
**TOTAL DATA PULLED:** 97 MB  

  

Stopping container: whisparr

**Successfully stopped container: whisparr**  

  

Removing container: whisparr

**Successfully removed container: whisparr**  

  

Command executiondocker run  
  -d  
  --name='whisparr'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="whisparr"  
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
  -v '/mnt/user/appdata/whisparr':'/config':'rw'  
  -v '/mnt/remotes/10.0.0.9_xmedia/':'/data':'rw,slave'  
  -v '/mnt/user/downloads/torrents/':'/downloads':'rw,slave'  
  --net=container:nordlynx  
  --cap-add=NET_ADMIN  
  --sysctl="net.ipv4.conf.all.src_valid_mark=1"  
  --sysctl="net.ipv6.conf.all.disable_ipv6=1" 'ghcr.io/hotio/whisparr:v3'  

2274483b082a476c765b58af54101b086b675fec7d707fd1210531587934f0a9  
  
**The command finished successfully!**  

  

Removing orphan image: d02cc857976a

**Successfully removed orphan image: d02cc857976a**  

  

Pulling image: lscr.io/linuxserver/bazarr:latest

IMAGE ID [333346472]: Pulling from linuxserver/bazarr.  
IMAGE ID [079553e2e6a3]: Pulling fs layer.Downloading 100% of 128 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [fac9041e6843]: Pulling fs layer.Downloading 100% of 905 B.Download complete.Extracting.Pull complete.  
IMAGE ID [afaef9804099]: Pulling fs layer.Downloading 100% of 594 KB.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for lscr.io/linuxserver/bazarr:latest  
  
**TOTAL DATA PULLED:** 128 MB  

  

Removing container: bazarr

**Successfully removed container: bazarr**  

  

Command executiondocker create  
  --name='bazarr'  
  --net='bridge'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="bazarr"  
  -e 'PUID'='99'  
  -e 'PGID'='100'  
  -e 'UMASK'='022'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:6767]/system/status'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/bazarr-logo.png'  
  -p '6767:6767/tcp'  
  -v '/mnt/user/appdata/bazarr':'/config':'rw' 'lscr.io/linuxserver/bazarr'  

4eec2ccaffcb2fe1b4e83eabb885db0323feb16cce1d2c184e181d063bb034df  
  
**The command finished successfully!**  

  

Removing orphan image: d953c02a653f

**Successfully removed orphan image: d953c02a653f**  

  

Pulling image: lscr.io/linuxserver/tautulli:latest

IMAGE ID [1184260797]: Pulling from linuxserver/tautulli.  
IMAGE ID [51e2f2dc9a85]: Pulling fs layer.Downloading 100% of 43 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [19516985fac0]: Pulling fs layer.Downloading 100% of 851 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for lscr.io/linuxserver/tautulli:latest  
  
**TOTAL DATA PULLED:** 43 MB  

  

Stopping container: tautulli

**Successfully stopped container: tautulli**  

  

Removing container: tautulli

**Successfully removed container: tautulli**  

  

Command executiondocker run  
  -d  
  --name='tautulli'  
  --net='bridge'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="tautulli"  
  -e 'PUID'='99'  
  -e 'PGID'='100'  
  -e 'UMASK'='022'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:8181]'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/tautulli-logo.png'  
  -p '8383:8181/tcp'  
  -v '/mnt/user/appdata/tautulli':'/config':'rw' 'lscr.io/linuxserver/tautulli'  

086f304466320810332ffce8b24b3b0c36ed42200c5b2a1dba8fca9ea23f3ad9  
  
**The command finished successfully!**  

  

Removing orphan image: f988871c3d2d

**Successfully removed orphan image: f988871c3d2d**  

  

Pulling image: lscr.io/linuxserver/rustdesk:latest

IMAGE ID [1143262256]: Pulling from linuxserver/rustdesk.  
IMAGE ID [e1cbad51b718]: Already exists.  
IMAGE ID [c0f8eff906b8]: Already exists.  
IMAGE ID [543d35b9b2f3]: Already exists.  
IMAGE ID [841388210a62]: Already exists.  
IMAGE ID [283b87ff1754]: Already exists.  
IMAGE ID [b2c8efbb5a67]: Already exists.  
IMAGE ID [2023448bcd21]: Already exists.  
IMAGE ID [0b46a3a192d2]: Pulling fs layer.Downloading 100% of 871 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [2d61d6319048]: Pulling fs layer.Downloading 100% of 9 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [addc6fff6799]: Pulling fs layer.Downloading 100% of 224 KB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [6d3fc29f3223]: Pulling fs layer.Downloading 100% of 1 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [490849de9c3d]: Pulling fs layer.Downloading 100% of 31 MB.Verifying Checksum.Download complete.Extracting.Pull complete.  
IMAGE ID [2de473b83ae3]: Pulling fs layer.Downloading 100% of 417 B.Verifying Checksum.Download complete.Extracting.Pull complete.  
Status: Downloaded newer image for lscr.io/linuxserver/rustdesk:latest  
  
**TOTAL DATA PULLED:** 902 MB  

  

Removing container: rustdesk

**Successfully removed container: rustdesk**  

  

Command executiondocker create  
  --name='rustdesk'  
  --net='bridge'  
  --pids-limit 2048  
  -e TZ="America/Chicago"  
  -e HOST_OS="Unraid"  
  -e HOST_HOSTNAME="loki"  
  -e HOST_CONTAINERNAME="rustdesk"  
  -e 'PUID'='99'  
  -e 'PGID'='100'  
  -e 'UMASK'='022'  
  -l net.unraid.docker.managed=dockerman  
  -l net.unraid.docker.webui='http://[IP]:[PORT:3000]'  
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/rustdesk-logo.png'  
  -p '3000:3000/tcp'  
  -p '3001:3001/tcp'  
  -v '/mnt/user/appdata/rustdesk':'/config':'rw' 'lscr.io/linuxserver/rustdesk'  

fd16052c8c73a1ba8e616250efacd2b8a74bb22fee3e73a40e210a15c304e1a6  
  
**The command finished successfully!**