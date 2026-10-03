# 14 · Conclusiones

Según las evidencias aportadas, el laboratorio demuestra:
- Publicación del servidor en `10.6.97.2/28` mediante VIP TCP 443 en `20.25.97.2`, con acceso desde la red de usuarios **sin VPN** (TEST-004).
- Acceso SSH a `10.6.97.2` solo con VPN IPsec dial-up (TEST-005/006/007/008), con la salvedad de que la prueba de SSH vía VPN es indirecta.
- Red de usuarios `10.25.6.0/25` en VLAN 10 con DHCP, NAT y salida a Internet (TEST-001/002/012).
- Traceroute con y sin VPN (TEST-009).

HTTPS con TLS quedó evidenciado con `curl -vk` y el vhost SSL de Apache (TEST-003/015). No demostrado todavía: detalle del certificado (TEST-013), una captura única de SSH con VPN activa, el video y los scripts (no aportados). Ver [`final-review.md`](final-review.md).
