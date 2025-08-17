# Domain Routing Stack

## **Objective**

*Full-stack homelab perimeter using Traefik, Pi-hole, and Cloudflare for dynamic DNS, SSL, and internal service routing.*

Establish secure, streamlined access to my domain and subdomains using Cloudflare Tunnel and Traefik, minimizing exposed ports while enabling flexible internal service routing. Game server support will be handled separately due to Cloudflare’s protocol limitations.

**Cloudflare Tunnel + DNS + Zero Trust** setup ready for the Domain Routing Stack.

### **Key Requirements**
- Protect domain and subdomains behind Cloudflare (DDoS, WAF, HTTPS).
- Route main domain and subdomains to internal services (via Traefik).
- Avoid exposing home network ports beyond required (ideally none inbound).
- Maintain full control of routing logic using a reverse proxy.
- Handle web apps and services via HTTP/S and WebSocket.

> Not Supported - Game servers require direct port forwarding (Cloudflare Tunnel won’t work for UDP or raw TCP).

---

## Cloudflare Tunnel

### Prerequisites Checklist

Before we configure anything:
- You own a domain and it’s registered or added in **Cloudflare DNS**
- You have a Cloudflare account (free tier is fine)
- Your home server can install and run cloudflared
- You can install Docker (optional, but preferred for your stack)
- You want to use **Traefik** as your internal reverse proxy

---

### Cloudflare Setup (Tunnel + Routing)

#### Step 1: Add your domain to Cloudflare

> _Skip this step if Cloudflare is already your domain registrar or DNS provider._

1. Go to [https://dash.cloudflare.com](https://dash.cloudflare.com)
2. Click **“Add Site”**
3. Enter your domain (example.com)
4. Choose **Free plan**
5. Cloudflare will give you **nameservers**
6. Go to your domain registrar and replace existing nameservers with Cloudflare’s

> Propagation may take a few minutes to a few hours.

---

#### Step 2: Install cloudflared on your homelab server

If using Docker on Unraid:
1. Generate Tunnel

If using Docker (recommended for Unraid/Synology/Proxmox):
```
docker run -d \
  --name cloudflared \
  --restart unless-stopped \
  -v /etc/cloudflared:/etc/cloudflared \
  cloudflare/cloudflared:latest tunnel run
```

Or bare metal (Debian/Ubuntu):
```
curl -fsSL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o cloudflared.deb
sudo dpkg -i cloudflared.deb
```

If Unraid, first create the 
To run cloudflared correctly on Unraid **after you’ve created the tunnel and have the config + credentials**, you just need to:
1. Place all files in /mnt/user/appdata/cloudflared
2. Mount that path as the config directory inside the container
3. Use the tunnel run command
    

### **✅ Final Docker Command for Unraid (Persistent + Correct)**

```
docker run -d \
  --name cloudflared \
  --restart unless-stopped \
  -v /mnt/user/appdata/cloudflared:/etc/cloudflared \
  cloudflare/cloudflared:latest tunnel run --config /etc/cloudflared/config.yml
```


Directory Structure (inside `/mnt/user/appdata/cloudflared`)
```
cloudflared/
├── config.yml                    # Defines routing rules
├── <TUNNEL-ID>.json             # Credentials for the tunnel
├── cert.pem                     # (Optional, from `tunnel login`)
```

---

### **🧠 Notes:**

- Replace <TUNNEL-ID> with your actual tunnel UUID.
    
- If you want to run multiple tunnels, you can manage them with tunnel run <name> instead of --config.
    

  

Let me know if you’d like a ready-to-use config.yml template to drop into that folder.









---

#### Step 3: Authenticate and Create Tunnel

```
cloudflared tunnel login
```

- A browser will open → authenticate to Cloudflare.
- Choose your domain.

Then create the tunnel:
```
cloudflared tunnel create domain-routing-stack
```

---

#### Step 4: Define Tunnel Configuration File

Create this YAML file:
**/etc/cloudflared/config.yml** (or /mnt/user/appdata/cloudflared/config.yml if using Unraid)

```
tunnel: <Tunnel-ID>         # from tunnel creation output
credentials-file: /etc/cloudflared/<Tunnel-ID>.json

ingress:
  - hostname: home.example.com
    service: http://traefik:80
  - service: http_status:404
```

> You’ll update hostname entries as you add more routed subdomains.

---

#### Step 5: Create DNS Routes in Cloudflare Automatically

```
cloudflared tunnel route dns domain-routing-stack home.example.com
```

Repeat this for any subdomains you want to route via the tunnel.

---

#### Step 6: Start the Tunnel

```
cloudflared tunnel run domain-routing-stack
```
Or, if using Docker Compose, we can define this as a service with volume mapping.

---

## Traefik + Tunnel Integration 

Once your tunnel is running and domain is live, we’ll configure:
- traefik.yml
- docker-compose.yml
- service labels for internal routing



---
