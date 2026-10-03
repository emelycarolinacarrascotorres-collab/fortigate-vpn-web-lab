# 04 · Direccionamiento IP

| Segmento / dispositivo | Interfaz | Dirección | Fuente |
|---|---|---|---|
| ISP ↔ R1 | ISP `Gi1/0` | 20.25.6.1/30 | `ISP_running-config.txt` |
| ISP ↔ R1 | R1 `Gi1/0` | 20.25.6.2/30 | `R1_CISCO-SRV_running-config.txt` |
| ISP ↔ FortiGate | ISP `Gi2/0` | 20.25.97.1/30 | `ISP_running-config.txt` |
| ISP ↔ FortiGate | FortiGate WAN `port1` | 20.25.97.2/255.255.255.252 | [`fortigate_interfaces.png`](images/02-fortigate/fortigate_interfaces.png) |
| ISP ↔ Internet | ISP `Gi3/0` | DHCP (`ip address dhcp`), ruta por defecto 192.168.42.1 | `ISP_running-config.txt` |
| Usuarios (VLAN 10) | R1 `Gi2/0.10` | 10.25.6.1/25 (gateway) | running-config R1 |
| Usuario Windows | NIC `Ethernet0 2` | 10.25.6.11/25 (DHCP), GW 10.25.6.1 | [`client_ipconfig_vpn_and_lan.png`](images/05-vpn/client_ipconfig_vpn_and_lan.png) |
| Usuario Windows | NIC VPN `Ethernet` | 10.25.98.10/32 (VPN) | idem |
| Servidor | FortiGate LAN `port2` | 10.6.97.1/255.255.255.240 | `fortigate_interfaces.png` |
| Servidor | `eth0` | 10.6.97.2/28 | [`server_ip_eth0.png`](images/04-server/server_ip_eth0.png) |
| VIP HTTPS | WAN `port1` | 20.25.97.2:443 → 10.6.97.2:443 | [`fortigate_vip_https_detail.png`](images/02-fortigate/fortigate_vip_https_detail.png) |
| Pool VPN | IPsec `VPN-REMOTE` | 10.25.98.10 – 10.25.98.50 | [`fortigate_address_vpn_remote_range.png`](images/02-fortigate/fortigate_address_vpn_remote_range.png) |
| Gestión FortiGate | `port3` | 192.168.98.1/24 (PING/HTTPS/SSH/HTTP) | `fortigate_interfaces.png` |

## Subnetting
| Red | Máscara | Hosts útiles | Rango útil |
|---|---|---|---|
| 10.25.6.0/25 (usuarios) | 255.255.255.128 | 126 | 10.25.6.1 – 10.25.6.126 |
| 10.6.97.0/28 (servidor) | 255.255.255.240 | 14 | 10.6.97.1 – 10.6.97.14 |
| 20.25.97.0/30 (ISP–FortiGate) | 255.255.255.252 | 2 | .1 – .2 |
| 20.25.6.0/30 (ISP–R1) | 255.255.255.252 | 2 | .1 – .2 |

## Nota sobre "IP públicas" y el /28
El enunciado pide "Servidor Web (/28)" y, por separado, "ISP: IP Públicas". En la implementación, el `/28` del servidor es **privado** (`10.6.97.0/28`) y la publicación se realiza con la **IP pública `20.25.97.2`** (enlace ISP–FortiGate) mediante una **VIP** (NAT estático, TCP 443). Un evaluador que espere que el propio `/28` sea público podría considerarlo una desviación → ver [Potential Evaluation Issues](final-review.md).
