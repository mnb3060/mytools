# if CORS error in chrome and etc browser
copy and paste in Advanced tab of your host proxy 
```
add_header 'Access-Control-Allow-Origin' '*';
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
add_header 'Access-Control-Allow-Headers' 'User-Agent,Keep-Alive,Content-Type';
add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
```
