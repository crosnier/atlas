# Game Server Proxy

**Objective**
Leverage VPS and Tailscale as a Game Server Proxy

Let external players connect to a **VPS’s public IP**, which securely forwards traffic to your **home game server**, without exposing your real home IP.

End-state Routing: 
```Internet → VPS:game-port → Tailscale → Home Server```

---

## Implementation Components

### **1. Provision VPS**
- Use a reliable host: DigitalOcean, Hetzner, Vultr, etc.
- Ubuntu 22.04 is a solid base.
- Open only the ports you need (e.g., 2456–2458 UDP for Valheim).

### **2. Install Tailscale on VPS + Home Server**

```
# on both VPS and homelab server
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey <auth-key>
```
- Both machines will now be on the same private mesh network (e.g., 100.x.x.x).
- **No need to open ports on your home router.**

### **3. Set VPS Firewall Rules (UFW or cloud provider)**

- Only allow game port(s) from public
- Optionally allow SSH from your own IP
- Drop everything else
```
# example for Valheim (UDP 2456–2458)
sudo ufw allow 2456:2458/udp
sudo ufw default deny incoming
sudo ufw enable
```

---

### Progress Check-In
By this point, 
- The VPS is publicly reachable.
- Your homelab server is **privately** reachable from the VPS via Tailscale.
- No ports are open on your home router.

---

### **4. Forward Game Ports from VPS to Home via Tailscale**

Here are two options for forwarding:
#### 🔁 Option A - socat (simplest)

Example for Valheim:
```
# On VPS: forward UDP 2456 to your home server
socat UDP4-LISTEN:2456,fork UDP4:100.x.x.x:2456
socat UDP4-LISTEN:2457,fork UDP4:100.x.x.x:2457
socat UDP4-LISTEN:2458,fork UDP4:100.x.x.x:2458
```
- Replace 100.x.x.x with your home server’s Tailscale IP.
- You can systemd-ify this later.

#### 🔁 Option B - iptables
#### **ip route**
*(more performant, more complex)*

If you want raw NAT masquerading behavior (like true port forwarding), we can do that too — just let me know.

---

## **✅ Summary**

```
🛡️ External IP Exposed: VPS only  
🔗 Home IP Exposed: ❌ Never  
🧠 Complexity: Moderate  
💰 Cost: ~$5/month VPS  
🎮 Game Latency: +10–30ms (usually negligible)
```

---

## Future Enhancements

- Full infra-as-code setup (Terraform + Ansible optional)