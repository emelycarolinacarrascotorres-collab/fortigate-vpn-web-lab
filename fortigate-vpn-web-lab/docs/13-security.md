# 13 · Seguridad

## Gestión de secretos en este repositorio
- Contraseñas (`Cisco@…`) y hashes `secret 5` reemplazados por `<REDACTED>` / `<REDACTED_HASH>`.
- La PSK de la VPN y las contraseñas de FortiClient están ocultas en las capturas originales; no se incluye ningún secreto.
- El script `scripts/check_secrets.sh` (generado en la documentación) busca patrones comunes.

## Controles observados
| Control | Evidencia |
|---|---|
| HTTPS publicado solo por VIP TCP 443 | VIP + política `WAN-to-WEB-HTTPS` |
| SSH solo desde el rango VPN | Política `VPN-to-LAN-SSH` |
| *Implicit Deny* | Captura de políticas |
| Autenticación XAUTH con grupo | `VPN-USERS` / usuario `Emely` |
| SSH v2 y `login local` en Cisco | Running-configs |
| Timeouts de consola/VTY (5 min) en R1 y SW-1 | Running-configs |

## Debilidades observadas (se documentan, no se ocultan)
| # | Hallazgo |
|---|---|
| 1 | IPsec **DES** (Phase 1 y 2): algoritmo obsoleto |
| 2 | IKEv1 **Aggressive mode** con PSK |
| 3 | `LAN-to-WAN` es `all → all / ALL` |
| 4 | `port3` del FortiGate con **HTTP** habilitado (la GUI lo marca en rojo) |
| 5 | Usuario VPN sin autenticación de dos factores |
| 6 | *Implicit Deny* sin registro de logs |
| 7 | ISP: `line vty 0 4 / login` sin contraseña y consola con `privilege level 15` |
| 8 | `ip http server` / `ip http secure-server` habilitados en SW-1 |
| 9 | Phase 2 selectores 0.0.0.0/0 ↔ 0.0.0.0/0 (la restricción real la hacen las políticas) |
| 10 | Las capturas muestran nombre y matrícula (banners "EMELY CARRASCO 2025-0697") y nombre de usuario `Emely`; confirme que desea publicarlos |
