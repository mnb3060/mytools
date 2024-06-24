# if cert error on iOS device
copy and paste on Advanced tab of your proxy hosts in npm panel
```
proxy_hide_header Upgrade;
proxy_hide_header X-Powered-By;
add_header Content-Security-Policy "upgrade-insecure-requests";
add_header X-Frame-Options "SAMEORIGIN";
add_header X-XSS-Protection "1; mode=block" always;
add_header X-Content-Type-Options "nosniff" always;
add_header Cache-Control "no-transform" always;
add_header Referrer-Policy no-referrer always;
add_header X-Robots-Tag none;
```
enjoy!
source: [https://github.com/NginxProxyManager/nginx-proxy-manager/issues/661](https://github.com/NginxProxyManager/nginx-proxy-manager/issues/661#issuecomment-717465167)
