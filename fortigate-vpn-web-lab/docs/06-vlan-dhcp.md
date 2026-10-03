# 06 · VLAN 10 y DHCP

## Configuración real (running-config)
- **SW-1:** `GigabitEthernet0/1` → `switchport mode access` + `access vlan 10`; `GigabitEthernet0/0` → trunk 802.1Q, `allowed vlan 10`. (`configs/cisco/SW-1_running-config.txt`)
- **R1:** subinterfaz `GigabitEthernet2/0.10`, `encapsulation dot1Q 10`, `10.25.6.1 255.255.255.128`, `ip nat inside`.
- **DHCP (R1):** `ip dhcp excluded-address 10.25.6.1 10.25.6.10`; pool `USUARIOS-V10`, red `10.25.6.0/25`, gateway `10.25.6.1`, DNS `8.8.8.8`.

## Evidencias
![VLAN](images/03-cisco/cisco_sw_show_vlan_brief.png)
`show vlan brief`: VLAN 10 (`VLAN0010`) activa con `Gi0/1`. ⚠ El prompt es `Switch#`, no `SW-1#` (el hostname del running-config es `SW-1`) → ver [discrepancias](final-review.md).

![DHCP](images/03-cisco/cisco_r1_dhcp_binding.png)
`show ip dhcp binding` en `CISCO-SRV`: `10.25.6.11`, automático, activo, interfaz `GigabitEthernet2/0.10`, expira `Oct 03 2026 10:33 PM`.

![ipconfig](images/05-vpn/client_ipconfig_vpn_and_lan.png)
`ipconfig` del cliente: `Ethernet0 2` = `10.25.6.11`, máscara `255.255.255.128`, gateway `10.25.6.1`.

**Faltan:** `show interfaces trunk` (SW-1) y `show ip interface brief` (R1) → ver Evidence Gaps.
