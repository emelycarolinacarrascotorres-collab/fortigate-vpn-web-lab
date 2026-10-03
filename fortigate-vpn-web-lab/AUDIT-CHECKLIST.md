# AUDIT-CHECKLIST

Revisión rápida requisito por requisito. Veredicto: ✅ demostrado · ⚠️ parcial · ❌ pendiente.

| # | Verificación | Veredicto | Dónde comprobar |
|---|---|---|---|
| 1 | Video al inicio del README | ⚠️ placeholder presente, sin enlace real | `README.md` |
| 2 | Propósito explicado | ✅ | README, `docs/01-overview.md` |
| 3 | Diagramas | ✅ 5 `.mmd` + Mermaid en README | `docs/diagrams/` |
| 4 | Imágenes | ✅ 37 | `docs/images/` |
| 5 | Imágenes = evidencias reales | ✅ copiadas sin modificar; 2 excluidas y registradas | `CHANGELOG.md` |
| 6 | FortiGate por GUI | ✅ | `docs/05-fortigate.md` |
| 7 | HTTPS sin VPN | ✅ (TCP 443 + página + curl 200 OK sobre TLS; estado de VPN no visible en capturas) | TEST-003/004 |
| 8 | SSH vía VPN | ⚠️ indirecto | TEST-007 |
| 9 | VLAN 10 | ✅ | `docs/06-vlan-dhcp.md` |
| 10 | DHCP | ✅ | idem |
| 11 | /25 usuarios | ✅ 10.25.6.0/25 | `docs/04-ip-addressing.md` |
| 12 | /28 servidor | ✅ 10.6.97.0/28 (privado; IP pública vía VIP) | idem |
| 13 | Traceroute | ✅ | TEST-009 |
| 14 | VPN | ✅ (dial-up, DES/Aggressive) | `docs/09-vpn.md` |
| 15 | Equipo Cisco | ✅ | `docs/07-cisco.md` |
| 16 | Running-configs | ✅ R1, SW-1, ISP (redactados) | `configs/cisco/` |
| 17 | Scripts | ⚠️ ninguno aportado | `scripts/README.md` |
| 18 | Pruebas documentadas | ✅ | `docs/11-testing.md` |
| 19 | Matriz de trazabilidad | ✅ | `README.md` |
| 20 | Sin secretos | ✅ `scripts/check_secrets.sh` | — |
| 21 | Sin resultados inventados | ✅ estados PARTIAL/PENDING donde falta evidencia | `docs/final-review.md` |
| 22 | Sin enlaces rotos | ✅ `scripts/check_links.sh` | — |
| 23 | Consistencia | ⚠️ 8 discrepancias abiertas (D1–D8) | `docs/final-review.md` |
| 24 | Apariencia profesional | ✅ | — |

## Reglas de lectura para un evaluador
- `PASS` solo cuando existe captura enlazada.
- `PARTIAL`/`PENDING EVIDENCE` son brechas reales, no omisiones.
- Debilidades de seguridad se declaran en `docs/13-security.md`.
