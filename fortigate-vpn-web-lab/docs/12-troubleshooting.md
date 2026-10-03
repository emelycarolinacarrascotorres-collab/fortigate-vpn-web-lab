# 12 · Troubleshooting (basado en observaciones reales)

| Síntoma observado | Causa probable (derivada de la config/captura) | Dónde verificar |
|---|---|---|
| `tracert 10.6.97.2` con timeouts | Sin VPN no existe ruta hacia 10.6.97.0/28 | `test_traceroute_private_ip_vpn_off.png` |
| `Test-NetConnection 20.25.97.2 -Port 22` falla pero hay ping | No hay VIP ni política para TCP 22; ping lo responde la interfaz WAN | `fortigate_interfaces.png`, `fortigate_vip_https_list.png` |
| Primer salto `169.254.1.1` con VPN | Gateway link-local del adaptador de FortiClient | `test_traceroute_private_ip_vpn_on.png` |
| `access-list 1` en lugar de `NAT-ACL` | El running-config guardado usa ACL numerada; la nombrada del archivo de comandos no se aplicó | [07-cisco.md](07-cisco.md) |
| SSH desde `10.25.98.10` | Rango del pool VPN; política `VPN-to-LAN-SSH` | `fortigate_firewall_policies.png` |

Verificaciones sugeridas (no ejecutadas en el laboratorio, no son evidencia): `show interfaces trunk`, `show ip interface brief`, `ss -tlnp | grep 443`, `curl -vk https://20.25.97.2`.
