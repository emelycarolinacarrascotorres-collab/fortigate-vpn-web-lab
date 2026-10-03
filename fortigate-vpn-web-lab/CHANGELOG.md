# Changelog

## [1.1.0] – 2026-10-03
### Añadido
- `server_apache_ss_443_and_vhosts.png` (`ss -tlnp | grep 443` + `apache2ctl -S`).
- `test_https_curl_tls_response.png` (`curl.exe -vk https://20.25.97.2` → 200 OK).
- `test_browser_connection_info_firefox.png` (no concluyente; incluida con su salvedad).
### Cambiado
- TEST-003 (HTTPS) y R09: PARTIAL → PASS. TEST-013 redefinido como "detalle del certificado" (PENDING EVIDENCE). Nuevo TEST-015 (Apache SSL) PASS.
- G1/G7 y D6 actualizados en `docs/final-review.md`.

## [1.0.0] – 2026-10-03
### Añadido
- Documentación completa, diagramas Mermaid, matriz de trazabilidad y checklist de auditoría.
- 34 imágenes reales renombradas (sin alterar su contenido) en `docs/images/`.
- Running-configs de R1, SW-1 e ISP y comandos aportados, con secretos redactados.

### Excluido (decisión explícita, no ocultamiento)
| Archivo original | Motivo |
|---|---|
| `SSH_bloqueado_desde_fuera.png` | `Test-NetConnection 20.25.97.2 -Port 22` con ping TimedOut; contradice la captura conservada (ping 57 ms) |
| `prueba_de_ssh_sin_la_VPN_activa.png` | `Test-NetConnection 10.6.97.2 -Port 22` con `DestinationHostUnreachable` y origen 10.25.6.13; indica falta de ruta, no bloqueo del firewall |

La captura conservada es `Prueba_de_que_no_se_conecta_por_ssh_sin_vpn.png` (→ `test_ssh_blocked_without_vpn.png`). Los originales siguen en poder de la autora; la contradicción de ICMP entre capturas no está resuelta y se lista en `final-review.md` (D1).

### Modificado
- Contraseñas y hashes `secret 5` reemplazados por marcadores.
