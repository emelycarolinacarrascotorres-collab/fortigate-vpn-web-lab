# 02 · Requisitos

Texto del enunciado (captura: [`assignment_infrastructure_3.png`](images/01-topology/assignment_infrastructure_3.png)):

![Enunciado](images/01-topology/assignment_infrastructure_3.png)

| ID | Requisito del enunciado | Estado | Detalle |
|---|---|---|---|
| R01 | El usuario accede al servidor web sin VPN | PASS | [TEST-004](11-testing.md) |
| R02 | El usuario accede al servidor por SSH vía VPN | PARTIAL | [TEST-007](11-testing.md) |
| R03 | FortiGate: toda configuración y demostración por GUI | PASS | Todas las capturas del FortiGate son de la GUI |
| R04 | FortiGate: configuraciones de red | PASS | [05-fortigate.md](05-fortigate.md) |
| R05 | FortiGate: VPN Remote-Site entre cliente y servidor | PASS | [09-vpn.md](09-vpn.md) (acceso remoto IPsec dial-up con FortiClient) |
| R06 | Equipo de red (preferiblemente Cisco) con configuraciones de red | PASS | [07-cisco.md](07-cisco.md) |
| R07 | ISP con IP públicas | PASS | [04-ip-addressing.md](04-ip-addressing.md) |
| R08 | Servidor web (/28) | PASS | `10.6.97.2/28` |
| R09 | Servidor: web HTTPS | PASS | Apache en 443 con vhost SSL y `curl -vk` con `200 OK` ([TEST-003](11-testing.md)); detalle del certificado pendiente |
| R10 | Servidor: SSH | PASS | Puerto 22 en LISTEN y sesión SSH exitosa |
| R11 | Usuarios (/25) | PASS | `10.25.6.0/25` |
| R12 | VLAN 10 | PASS | [06-vlan-dhcp.md](06-vlan-dhcp.md) |
| R13 | DHCP | PASS | Pool `USUARIOS-V10` y binding |
| R14 | Traceroute hacia el servidor | PASS | [TEST-009](11-testing.md) |
| R15 | Documentación, imágenes, diagramas, running-configs | PASS | Este repositorio |
| R16 | Scripts utilizados | N/A | No se aportaron scripts; solo comandos en `configs/` |
| R17 | Video demostrativo | PENDING EVIDENCE | `VIDEO_URL_PLACEHOLDER` |
| R18 | Repositorio GitHub | PENDING | Pendiente de subir |
