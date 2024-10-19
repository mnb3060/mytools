# taiga

## Install

## migrate

## taiga save html folder
```docker cp taiga-docker-taiga-front-1:/usr/share/nginx/html html
```
## rtl and vazirmatn font load (for example v 1686755246163)
```
docker cp taiga-docker-taiga-front-1:/usr/share/nginx/html/v-1686755246163/styles/theme-taiga.css theme-taiga.css
cat https://raw.githubusercontent.com/mnb3060/mytools/refs/heads/main/apps/taiga/rtl.css >> theme-taiga.css
docker cp theme-taiga.css taiga-docker-taiga-front-1:/usr/share/nginx/html/v-1686755246163/styles/theme-taiga.css
```


