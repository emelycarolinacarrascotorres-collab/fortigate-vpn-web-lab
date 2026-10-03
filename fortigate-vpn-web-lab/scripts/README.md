# Scripts

Aquí están los **listados de comandos que se pegaron en los equipos** (no hay archivos `.sh`/`.py`: no se aportó ninguno).

| Archivo | Equipo |
|---|---|
| `R1_CISCO-SRV_commands.txt` | Router de usuarios (VLAN 10, DHCP, NAT) |
| `SW-1_commands.txt` | Switch (VLAN 10, trunk) |
| `ISP_commands.txt` | Router ISP |
| `server_commands.txt` | Servidor (OpenSSH y usuario) |

FortiGate: se configuró **solo por GUI**; no hay script.

Notas honestas: el archivo de R1 crea una ACL `NAT-ACL` que no quedó en el running-config (el NAT usa `access-list 1`), y el running-config del ISP no conserva el banner/usuario/SSH de su listado. Los comandos de instalación de Apache/SSL no se aportaron. Contraseñas reemplazadas por `<REDACTED>`.
