# DNS Records
## MX
set an MX record for your domain example.com - in our example, the MX record contains mail.example.com
```
dig @1.1.1.1 +short MX example.com
```
## A
set an A record that resolves the name of your mail server - in our example, the A record contains 11.22.33.44
```
dig @1.1.1.1 +short A mail.example.com
```
## PTR
(in a best-case scenario) set a PTR record that resolves the IP of your mail server - in our example, the PTR contains mail.example.com
```
dig @1.1.1.1 +short -x 11.22.33.44
```
*Note: in CF you should set like this:
`
Name: anything  
value: mail.example.com
`
# Get files
```
DMS_GITHUB_URL="https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master"
wget "${DMS_GITHUB_URL}/compose.yaml"
wget "${DMS_GITHUB_URL}/mailserver.env"
```

# Config
## set domain in compose
```
sed -i -e 's/mail.example.com/mail.yourdomain.com/g' compose.yaml
```

## edit configuration
```
nano mailserver.env
```

# Up server
```
docker compose up -d
```
## manage DMS config
`docker exec -it <CONTAINER NAME> setup help`
```
docker exec -it mailserver setup help
```

## add some email user
`docker exec -ti <CONTAINER NAME> setup email add user@example.com
`
```
docker exec -ti mailserver setup email add user@example.com
```
## add some Alias
`docker exec -ti <CONTAINER NAME> setup alias add postmaster@example.com user@example.com`
```
docker exec -ti mailserver setup alias add postmaster@example.com user@example.com
```
### Generate keys
#### Creating DKIM Keys
`docker exec -it <CONTAINER NAME> setup config dkim`
```
docker exec -it mailserver setup config dkim
```
After running setup config dkim, your new DKIM key files (and OpenDKIM config) have been added to /tmp/docker-mailserver/opendkim/ on mailserver OR `docker-data/dms/config/opendkim/keys/example.com`
`
This file was generated for use within a DNS zone file. The file name uses the DKIM selector it was generated with ( default DKIM selector is mail, which creates mail.txt_ ).
`
Your generated DNS record file (<selector>.txt) should look similar to this:
```
mail._domainkey IN TXT ( "v=DKIM1; k=rsa; "
"p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqQMMqhb1S52Rg7VFS3EC6JQIMxNDdiBmOKZvY5fiVtD3Z+yd9ZV+V8e4IARVoMXWcJWSR6xkloitzfrRtJRwOYvmrcgugOalkmM0V4Gy/2aXeamuiBuUc4esDQEI3egmtAsHcVY1XCoYfs+9VqoHEq3vdr3UQ8zP/l+FP5UfcaJFCK/ZllqcO2P1GjIDVSHLdPpRHbMP/tU1a9mNZ"
"5QMZBJ/JuJK/s+2bp8gpxKn8rh1akSQjlynlV9NI+7J3CC7CUf3bGvoXIrb37C/lpJehS39KNtcGdaRufKauSfqx/7SxA0zyZC+r13f7ASbMaQFzm+/RRusTqozY/p/MsWx8QIDAQAB"
) ;
```
remove ... and line break and should look like this:
```
v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqQMMqhb1S52Rg7VFS3EC6JQIMxNDdiBmOKZvY5fiVtD3Z+yd9ZV+V8e4IARVoMXWcJWSR6xkloitzfrRtJRwOYvmrcgugOalkmM0V4Gy/2aXeamuiBuUc4esDQEI3egmtAsHcVY1XCoYfs+9VqoHEq3vdr3UQ8zP/l+FP5UfcaJFCK/ZllqcO2P1GjIDVSHLdPpRHbMP/tU1a9mNZ5QMZBJ/JuJK/s+2bp8gpxKn8rh1akSQjlynlV9NI+7J3CC7CUf3bGvoXIrb37C/lpJehS39KNtcGdaRufKauSfqx/7SxA0zyZC+r13f7ASbMaQFzm+/RRusTqozY/p/MsWx8QIDAQAB
```
add it to TXT reord to your domain
`Test` with ```dig +short TXT mail._domainkey.example.com```

#### Set DMARC to TXT
Typically something like this should be good to start with:
```_dmarc.example.com. IN TXT "v=DMARC1; p=none; sp=none; fo=0; adkim=r; aspf=r; pct=100; rf=afrf; ri=86400; rua=mailto:dmarc.report@example.com; ruf=mailto:dmarc.report@example.com"```
#### Adding an SPF Record
To add a SPF record in your DNS, insert the following line in your DNS zone:

```
example.com. IN TXT "v=spf1 mx ~all"
```

# Setting up TLS

# Testing
Here are some tools you can use to verify your configuration:  

MX Toolbox  

DMARC Analyzer  
mail-tester.com  
multiRBL.valli.org  
internet.nl  
 
