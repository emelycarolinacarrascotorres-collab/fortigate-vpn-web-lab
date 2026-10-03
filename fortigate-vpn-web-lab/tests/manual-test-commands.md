# Comandos visibles en las capturas reales

| Prueba | Comando (cliente Windows salvo indicación) |
|---|---|
| Conectividad | `ping 8.8.8.8` |
| HTTPS sin VPN | `Test-NetConnection 20.25.97.2 -Port 443` |
| SSH bloqueado sin VPN | `Test-NetConnection 20.25.97.2 -Port 22` |
| Traceroute pública | `tracert 20.25.97.2` |
| Traceroute privada | `tracert 10.6.97.2` (con y sin VPN) |
| SSH vía VPN | `ssh emely@10.6.97.2` |
| Cliente | `ipconfig` |
| R1 | `show ip dhcp binding`, `show running-config \| include nat`, `show ip nat statistics` |
| SW | `show vlan brief` |
| Servidor | `ip a`, `netstat -tln \| grep -E ":22\|:443"`, `ss -tlnp \| grep 443`, `apache2ctl -S` |
| HTTPS con TLS | `curl.exe -vk https://20.25.97.2` |
