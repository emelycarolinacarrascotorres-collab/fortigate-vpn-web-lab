# 01 · Visión general

## Objetivo
Implementar la **Infraestructura 3** del enunciado: un usuario en una red `/25` (VLAN 10, DHCP) debe poder

1. acceder al **servidor web (HTTPS) sin necesidad de VPN**, y
2. acceder al servidor por **SSH únicamente a través de la VPN**.

Tras un FortiGate (configurado y demostrado **por GUI**) se publica el servidor `/28`; un equipo Cisco da servicio a los usuarios y un router ISP provee las IP públicas.

## Alcance de este repositorio
Este repositorio documenta **únicamente evidencias reales** aportadas por la autora del laboratorio (capturas, `show run`, listados de comandos). Nada fue simulado. Lo que no está demostrado se marca como `PENDING EVIDENCE`, `NOT EXECUTED` o `UNKNOWN / NEEDS VERIFICATION`.

## Vocabulario de estados
| Estado | Significado |
|---|---|
| PASS | Existe captura que demuestra directamente el resultado |
| PARTIAL | Hay evidencia, pero incompleta o indirecta (se explica qué falta) |
| FAIL | La evidencia muestra que el resultado no se cumple |
| NOT EXECUTED | La prueba no se realizó |
| PENDING EVIDENCE | Podría estar hecho, pero no hay evidencia en el repositorio |

## Dispositivos (según topología GNS3)
NAT1 · ISP · R1 (`CISCO-SRV`) · SW (`SW-1`, IOSvL2) · windows10-1 · FortiGate 7.0.9 · web-server-lab-1.
