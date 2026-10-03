# 11 · Pruebas

Solo se marca **PASS** cuando hay captura que lo demuestra. Estados: ver [01-overview.md](01-overview.md).

| ID | Prueba | Evidencia | Resultado | Estado |
|---|---|---|---|---|
| TEST-001 | DHCP VLAN 10 | [dhcp binding](images/03-cisco/cisco_r1_dhcp_binding.png), [ipconfig](images/05-vpn/client_ipconfig_vpn_and_lan.png), [vlan](images/03-cisco/cisco_sw_show_vlan_brief.png) | Cliente obtiene 10.25.6.11/25, GW 10.25.6.1 por `Gi2/0.10`. La captura de VLAN tiene prompt `Switch#` | PASS |
| TEST-002 | Conectividad a Internet | [ping 8.8.8.8](images/06-tests/test_ping_internet_8.8.8.8.png) | 4/4 respuestas, 0 % pérdida, TTL 125, media 90 ms | PASS |
| TEST-003 | HTTPS (servicio TLS) | [curl -vk](images/06-tests/test_https_curl_tls_response.png), [Apache 443](images/04-server/server_apache_ss_443_and_vhosts.png), [URL https](images/06-tests/test_https_browser_url.png) | `curl.exe -vk https://20.25.97.2`: conexión al puerto 443, ALPN negociado (`server accepted http/1.1`), `HTTP/1.1 200 OK`, `Server: Apache/2.4.52 (Ubuntu)`, cuerpo `Servidor Web - Lab 2025-0697`. `apache2` escucha en `0.0.0.0:443` (vhost `default-ssl.conf`). No se muestra el contenido del certificado (`-k`) | PASS |
| TEST-004 | HTTPS sin VPN | [TCP 443](images/06-tests/test_https_tcp443_without_vpn.png), [página](images/06-tests/test_web_page_loaded_without_vpn.png) | `TcpTestSucceeded True` a 20.25.97.2:443 desde `Ethernet0 2` (10.25.6.11); página cargada. El estado de la VPN no aparece en la misma captura | PASS |
| TEST-005 | Establecimiento de VPN | [FortiClient](images/05-vpn/forticlient_connected.png), [monitor](images/05-vpn/fortigate_ipsec_monitor_up.png) | Conectada, IP 10.25.98.10; 1 dialup connection | PASS |
| TEST-006 | Enrutamiento por la VPN | [VPN on](images/06-tests/test_traceroute_private_ip_vpn_on.png), [VPN off](images/06-tests/test_traceroute_private_ip_vpn_off.png) | Off: 9+ saltos con timeout hacia 10.6.97.2. On: 169.254.1.1 → 10.6.97.2 | PASS |
| TEST-007 | SSH a través de la VPN | [SSH](images/04-server/server_ssh_login_success.png), [ipconfig](images/05-vpn/client_ipconfig_vpn_and_lan.png) | SSH a 10.6.97.2 exitoso; solo aparece "Last login from 10.25.98.10" (sesión previa). Falta captura única con VPN conectada + `ssh` + `who`/`$SSH_CLIENT` | PARTIAL |
| TEST-008 | SSH bloqueado desde Internet | [Test-NetConnection 22](images/06-tests/test_ssh_blocked_without_vpn.png) | `TcpTestSucceeded False` a 20.25.97.2:22; `PingSucceeded True` (57 ms, responde el FortiGate) | PASS |
| TEST-009 | Traceroute al servidor | [pública sin VPN](images/06-tests/test_traceroute_public_ip_without_vpn.png), [privada con VPN](images/06-tests/test_traceroute_private_ip_vpn_on.png) | Sin VPN a 20.25.97.2: 10.25.6.1 → 20.25.6.1 → 20.25.97.2. Con VPN a 10.6.97.2: 169.254.1.1 → 10.6.97.2 | PASS |
| TEST-010 | Validación de firewall | [políticas](images/02-fortigate/fortigate_firewall_policies.png) | Políticas y contadores coherentes con TEST-004/007/008; `LAN-to-VPN` 0 B; sin logs de denegación | PARTIAL |
| TEST-011 | Puertos 22/443 en el servidor | [netstat](images/04-server/server_listening_ports_22_443.png) | 443 y 22 en LISTEN | PASS |
| TEST-012 | NAT en R1 | [NAT](images/03-cisco/cisco_r1_nat_statistics.png) | 240 traducciones, 0 misses | PASS |
| TEST-013 | Detalle del certificado TLS | — | El handshake se evidencia en TEST-003, pero no hay captura del certificado (emisor, validez, autofirmado) | PENDING EVIDENCE |
| TEST-015 | Servicio Apache con SSL en 443 | [ss + apache2ctl -S](images/04-server/server_apache_ss_443_and_vhosts.png) | `ss -tlnp \| grep 443` muestra procesos `apache2`; `apache2ctl -S` lista `*:80` (000-default.conf) y `*:443` (default-ssl.conf) | PASS |
| TEST-014 | Acceso FortiGate → cliente VPN (`LAN-to-VPN`) | — | 0 B en la política | NOT EXECUTED |

Nota: [`test_browser_connection_info_firefox.png`](images/06-tests/test_browser_connection_info_firefox.png) (Firefox: "No seguro" / "Conexión no segura", sin `https://` visible) **no es concluyente** por sí sola; la prueba de TLS es la de `curl`. El estado de la VPN no aparece en las capturas de HTTPS.

Comandos visibles en las capturas: [`tests/manual-test-commands.md`](../tests/manual-test-commands.md). Capturas excluidas: ver [CHANGELOG](../CHANGELOG.md).
