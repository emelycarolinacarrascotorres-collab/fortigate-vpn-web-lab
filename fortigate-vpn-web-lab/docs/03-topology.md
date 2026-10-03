# 03 · Topología

Captura real de GNS3 ([`gns3_topology.png`](images/01-topology/gns3_topology.png)):

![Topología GNS3](images/01-topology/gns3_topology.png)

**Qué se observa:** `NAT1 → ISP`; `ISP → R1 → CiscoIOSvL2 → windows10-1`; `ISP → FortiGate7.0.9-1 → web-server-lab-1`. Los puntos verdes indican enlaces activos.
**Limitación:** la captura no muestra los nombres de los puertos de cada enlace; las correspondencias de puerto (p. ej. `R1 Gi2/0 ↔ SW Gi0/0`) se deducen de las configuraciones y están marcadas como `UNKNOWN / NEEDS VERIFICATION` donde corresponde.

## Diagramas fuente (Mermaid)
| Archivo | Contenido |
|---|---|
| [`network-topology.mmd`](diagrams/network-topology.mmd) | Topología completa con IP |
| [`vlan-topology.mmd`](diagrams/vlan-topology.mmd) | Trunk/VLAN 10/DHCP |
| [`vpn-topology.mmd`](diagrams/vpn-topology.mmd) | VPN dial-up |
| [`https-flow.mmd`](diagrams/https-flow.mmd) | Flujo HTTPS sin VPN |
| [`ssh-flow.mmd`](diagrams/ssh-flow.mmd) | Flujo SSH vía VPN |

```mermaid
flowchart TB
  NET((NAT1 / Internet)) --- ISP[ISP]
  ISP ---|20.25.6.0/30| R1[R1 CISCO-SRV<br/>10.25.6.1/25 VLAN 10]
  ISP ---|20.25.97.0/30| FG[FortiGate<br/>WAN 20.25.97.2<br/>LAN 10.6.97.1/28]
  R1 --- SW[SW-1] --- PC[windows10-1<br/>10.25.6.11/25]
  FG --- SRV[web-server-lab-1<br/>10.6.97.2/28]
```
