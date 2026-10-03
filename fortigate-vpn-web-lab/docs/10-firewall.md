# 10 · Firewall

Ver tabla y captura en [05-fortigate.md §5](05-fortigate.md).

![Políticas](images/02-fortigate/fortigate_firewall_policies.png)

## Matriz de comportamiento esperado (derivada de las políticas) y su evidencia
| Flujo | Política que lo rige | Resultado esperado | Evidencia real |
|---|---|---|---|
| Internet/Usuarios → 20.25.97.2:443 | `WAN-to-WEB-HTTPS` + `VIP-WEB-HTTPS` | Permitido | `test_https_tcp443_without_vpn.png` (TcpTestSucceeded True), `test_https_curl_tls_response.png` (200 OK); contador 36.41 kB |
| Internet/Usuarios → 20.25.97.2:22 | Ninguna (Implicit Deny) | Bloqueado | `test_ssh_blocked_without_vpn.png` (TcpTestSucceeded False) |
| Cliente VPN (10.25.98.10-50) → 10.6.97.0/28 PING/SSH | `VPN-to-LAN-SSH` | Permitido | `server_ssh_login_success.png`; contador 25.20 kB |
| LAN servidor → cliente VPN | `LAN-to-VPN` | Permitido (PING/SSH) | **Sin evidencia** (0 B) |
| LAN servidor → WAN | `LAN-to-WAN` (NAT) | Permitido | Contador 53.59 MB; sin prueba explícita |
| Resto | Implicit Deny | Bloqueado | Contador 1.99 kB (log deshabilitado, sin entradas visibles) |

## Observación importante
El ping a `20.25.97.2` responde porque `port1` tiene **PING** habilitado como acceso administrativo; responde el FortiGate, no el servidor. Esto no contradice el bloqueo de SSH.
