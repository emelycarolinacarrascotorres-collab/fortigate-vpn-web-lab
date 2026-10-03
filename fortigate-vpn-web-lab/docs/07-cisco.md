# 07 · Equipos Cisco

| Dispositivo | Rol | Running-config real | Comandos aplicados (aportados) |
|---|---|---|---|
| `CISCO-SRV` (R1) | Gateway VLAN 10, DHCP, NAT | [`R1_CISCO-SRV_running-config.txt`](../configs/cisco/R1_CISCO-SRV_running-config.txt) | [`…initial-commands.txt`](../configs/cisco/R1_CISCO-SRV_initial-commands.txt) |
| `SW-1` | Switch de acceso VLAN 10 | [`SW-1_running-config.txt`](../configs/cisco/SW-1_running-config.txt) | [`…initial-commands.txt`](../configs/cisco/SW-1_initial-commands.txt) |
| `ISP` | Router ISP + NAT hacia Internet | [`ISP_running-config.txt`](../configs/cisco/ISP_running-config.txt) | [`…initial-commands.txt`](../configs/cisco/ISP_initial-commands.txt) |

> Contraseñas y hashes `secret 5` fueron reemplazados por `<REDACTED>` / `<REDACTED_HASH>`. Nada más fue modificado.

## R1 (CISCO-SRV) — puntos clave
- WAN `Gi1/0` 20.25.6.2/30 `ip nat outside`; ruta por defecto `0.0.0.0/0 → 20.25.6.1`.
- NAT: `ip nat inside source list 1 interface GigabitEthernet1/0 overload` con `access-list 1 permit 10.25.6.0 0.0.0.127`.
- SSH v2, `login local`, `transport input ssh`, banner MOTD.

![NAT](images/03-cisco/cisco_r1_nat_statistics.png)
`show ip nat statistics`: 240 traducciones dinámicas, `Gi1/0` outside, `Gi2/0.10` inside, 1 606 084 hits, 0 misses. Una barra resaltada en la captura cubre parte de la línea "Inside Source"; se recomienda repetirla sin resaltado.

## ISP
`Gi1/0` 20.25.6.1/30 (hacia R1) y `Gi2/0` 20.25.97.1/30 (hacia FortiGate) como *nat inside*; `Gi3/0` DHCP como *nat outside*; ruta por defecto a `192.168.42.1`; ACL estándar `NAT_ACL` permite 20.25.97.0/30 y 20.25.6.0/30.

## Diferencias entre comandos aplicados y running-config guardado
| # | Diferencia |
|---|---|
| 1 | El archivo de comandos de R1 crea `ip access-list extended NAT-ACL` vacío con un `permit` suelto; el running-config **no** la contiene. El NAT usa `access-list 1`. |
| 2 | El running-config del ISP **no** contiene banner, usuario, SSH ni `ip domain-name` que sí están en su archivo de comandos; sus líneas `vty` usan `login` sin contraseña. |
| 3 | `crypto key generate rsa` no aparece en `show run` (comportamiento normal de IOS). |
