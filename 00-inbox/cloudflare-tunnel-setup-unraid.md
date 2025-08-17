

```
docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token eyJhIjoiYjRkNmY5OTFkZGNiY2QzYWJhMjE1ZTU0MzVkY2ZmNmUiLCJ0IjoiZjI2NjAyMWUtNTY3Ny00MjJlLThjZDAtY2RkMDViMGU1MjMyIiwicyI6IlpEbGpaRFl4TWpNdFpEUm1ZUzAwTkRFNExUazBOVFl0TnpObFl6RXhNak15WkRZNSJ9

```

1.  **Prep:** Create host dir for config/creds: `mkdir ~/.cloudflared`
2.  **Initial Run (for login/create):**
    ```bash
    docker run -it --rm \
      -v ~/.cloudflared:/etc/cloudflared \
      cloudflare/cloudflared:latest bash
    ```
3.  **Inside Container Console:**
    ```bash
    cloudflared tunnel login  # Follow browser link to authenticate
    cloudflared tunnel create <TUNNEL_NAME> # Note UUID
    exit
    ```
4.  **Host Machine:** Create `~/.cloudflared/config.yml`:
    ```yaml
    tunnel: <YOUR_UUID>
    credentials-file: /etc/cloudflared/<YOUR_UUID>.json
    ingress:
      - hostname: yourdomain.com
        service: http://traefik:80
      - service: http_status:404
    ```
5.  **Persistent Run (e.g., Docker Compose):**
    ```yaml
    services:
      cloudflared:
        image: cloudflare/cloudflared:latest
        command: tunnel run --config /etc/cloudflared/config.yml <TUNNEL_NAME>
        restart: unless-stopped
        volumes:
          - ~/.cloudflared:/etc/cloudflared
        networks:
          - your_docker_network
    ```
6.  **Cloudflare Dashboard:** Ensure DNS records point to your tunnel.





---
---
---
#### 🚧 Cloudflare Tunnel Setup – Unraid Only

---

#### ✅ Prerequisites

- You own a domain and it’s in Cloudflare
- Unraid is already set up with Docker
- You want to route services through Cloudflare without exposing ports

---

#### 🔧 Step 1: Generate Tunnel and Credentials (One-Time Setup)

Run these from any Linux/macOS machine or Unraid terminal (**outside Docker**):

```bash
# Authenticate with Cloudflare
cloudflared tunnel login

# Create a named tunnel
cloudflared tunnel create domain-routing-stack
```

> 💡 This will create:
> - A tunnel ID
> - A `.json` credentials file (e.g., `123abc456def.json`)
> - A suggested config path

---

#### 📁 Step 2: Prepare Config Folder on Unraid

Manually place the following files in:

```
/mnt/user/appdata/cloudflared/
├── config.yml
├── 123abc456def.json   # ← your credentials file
```

Example `config.yml`:

```yaml
tunnel: 123abc456def
credentials-file: /etc/cloudflared/123abc456def.json

ingress:
  - hostname: home.example.com
    service: http://traefik:80
  - service: http_status:404
```

---

#### 🐳 Step 3: Run the Cloudflared Docker Container

```bash
docker run -d \
  --name cloudflared \
  --restart unless-stopped \
  -v /mnt/user/appdata/cloudflared:/etc/cloudflared \
  cloudflare/cloudflared:latest tunnel run
```

---

#### 🧪 Step 4: Test and Validate

- Visit `https://home.example.com`
- Confirm it routes to your intended internal service
- Check Cloudflare > Zero Trust > Tunnels dashboard to see live tunnel

---

#### 📝 Notes

- You **do not** need to open any ports on your home router
- Traefik or your reverse proxy must be reachable on the Unraid internal network
- You can add more hostnames in the `config.yml` file using additional `- hostname:` entries

---