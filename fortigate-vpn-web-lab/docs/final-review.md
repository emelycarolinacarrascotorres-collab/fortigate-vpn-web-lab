# Revisión final (auditoría)

## Resumen de requisitos
Demostrados (PASS): web sin VPN, HTTPS/TLS (curl + Apache SSL), VPN establecida, enrutamiento por VPN, SSH bloqueado sin VPN, VLAN 10, DHCP, /25, /28, traceroute, FortiGate por GUI, equipo Cisco, ISP, running-configs.
Parciales: SSH vía VPN, validación de firewall.
Pendientes: video, scripts (ninguno aportado), subida a GitHub.

## Evidence Gaps
| # | Requisito | Qué falta |
|---|---|---|
| G1 | HTTPS (R09 / TEST-013) | **Resuelto en lo principal** (curl 200 OK + Apache 443). Pendiente (opcional): detalle del certificado y captura del navegador con `https://` visible tras aceptar la excepción |
| G2 | SSH vía VPN (R02 / TEST-007) | Captura única con VPN conectada: `ipconfig` (10.25.98.10), `ssh emely@10.6.97.2` y `who` o `echo $SSH_CLIENT` |
| G3 | VLAN/Trunk | `show interfaces trunk` en SW-1; `show vlan brief` con prompt `SW-1#`; `show ip interface brief` en R1 |
| G4 | Video | Enlace (`VIDEO_URL_PLACEHOLDER`) |
| G5 | Scripts | No se aportaron; si hubo alguno, agregarlo a `scripts/` |
| G6 | Firewall | Logs de tráfico (permitido/denegado) en el FortiGate; prueba del sentido `LAN-to-VPN` (0 B) |
| G7 | Servidor | Servicio identificado (Apache + `default-ssl.conf`). Pendiente: contenido del certificado y comandos de instalación/activación de SSL |
| G8 | Fecha/hora | Las capturas del monitor IPsec (up/down) no tienen marca temporal |
| G9 | Captura de NAT | Resaltado cubre parte de la salida; repetir sin resaltado |

## Potential Evaluation Issues
1. **/28 privado.** `10.6.97.0/28` es privado; la IP pública es `20.25.97.2` vía VIP. Un evaluador estricto podría esperar un /28 público.
2. **"VPN Remote-Site".** Se implementó acceso remoto dial-up (FortiClient), no site-to-site FortiGate↔FortiGate. Coincide con el diagrama (cliente ↔ FortiGate del servidor), pero podría cuestionarse.
3. **HTTPS:** el TLS se evidencia con `curl -vk` (que omite la validación del certificado) y no con el navegador; la captura de Firefox dice "Conexión no segura" y no muestra `https://`. Un evaluador podría pedir el detalle del certificado.
4. **SSH vía VPN es indirecto** (login previo desde 10.25.98.10).
5. **Cifrado débil** (DES, IKEv1 Aggressive) y política `all → all`.
6. **ISP sin hardening** en el running-config guardado, a diferencia del archivo de comandos.
7. **Capturas excluidas** (ver CHANGELOG): se descartaron dos pruebas de SSH que mostraban resultados distintos.
8. **Datos personales** visibles (nombre, matrícula).
9. **Sin video ni scripts.**

## Auditoría de consistencia
| Área | Resultado |
|---|---|
| IPs / subnetting | Coherente: 20.25.6.0/30, 20.25.97.0/30, 10.25.6.0/25, 10.6.97.0/28 en configs y capturas |
| Gateways | Cliente GW 10.25.6.1 = R1 `Gi2/0.10`; ISP `.1` en ambos /30; ruta FortiGate vía 20.25.97.1 |
| VLAN / DHCP | VLAN 10 en SW-1 y R1; pool y binding coherentes (excluidas .1–.10; lease .11). Prompt `Switch#` en una captura ⚠ |
| VIP / firewall | VIP 20.25.97.2→10.6.97.2:443 coherente con política `WAN-to-WEB-HTTPS` y con prueba TCP 443 |
| VPN fase 1/2 | Coherentes entre `Config_de_VPN` (resumen), `phase_1` y `phase_2` (DES/SHA256/DH14). Fase 2 con PFS |
| Pool VPN | 10.25.98.10-50 coherente en objetos, túnel, FortiClient (10.25.98.10) y SSH "Last login" |
| Routing | Ruta por defecto FortiGate coherente con ISP; tracert sin VPN pasa por 10.25.6.1 → 20.25.6.1 → 20.25.97.2 |
| Servidor | 10.6.97.2/28 coherente con FortiGate LAN 10.6.97.1/28 |

### Discrepancias abiertas
| # | Discrepancia | Acción |
|---|---|---|
| D1 | Dos capturas de SSH sin VPN dan resultados de ping distintos (TimedOut vs 57 ms) y una tercera usa origen 10.25.6.13 con `DestinationHostUnreachable` | Se conservó la de 57 ms; las otras dos se excluyeron y están registradas |
| D2 | `show vlan brief` con prompt `Switch#` vs hostname `SW-1` | Repetir captura |
| D3 | Archivo de comandos de R1 crea `NAT-ACL` que no existe en el running-config | Documentado; fuente oficial = `show run` |
| D4 | Hardening del ISP ausente en su running-config | Documentado; reaplicar o aceptar |
| D5 | `tracert` resuelve el servidor como `web.lab.local` mientras el host se llama `web-server-lab-1` | Nombre de resolución del cliente; sin evidencia de su origen |
| D6 | Shell de `ip a`/`netstat`/`ss` (`/ #`) vs sesión Ubuntu 22.04.5 | Parcialmente reducida: Apache/2.4.52 (Ubuntu) coincide con 22.04. Falta `hostnamectl` en la misma sesión |
| D7 | Historial del navegador muestra gestión del FortiGate en 192.168.98.1, 192.168.99.1 y 10.6.97.129; solo `port3` 192.168.98.1 está documentada | UNKNOWN / NEEDS VERIFICATION |
| D8 | Objeto `SEVER.NET` (sic) con 0 referencias | Informativo |

## Evaluación de preparación para GitHub
Estructura, documentación, diagramas, evidencias y matriz de trazabilidad completos. **Listo para subir.** Antes de la entrega conviene añadir el video (G4) y la evidencia G2 (SSH con VPN) para pasar TEST-007 de PARTIAL a PASS.
