#!/bin/bash

echo "setup chisel for server or client? type s for server and c for client"
read chtype
echo "type your address for server or client to connect: [recommended domain with cloudflare proxy enabled]"
read addr
echo "type your port for chisel:[recommended usually port , for example 80,443,8080,2082,2083,10000 etc...]"
read port

echo "Are you want to run the service autorun after booutup? [recommend yes!] Y/N?"
read service

if [[ "$chtype" == "s" ]]; then
  echo "server selected"
elif [[ "$chtype" == "c" ]]; then
  echo "client selected"
else
  echo "not selected!!"
fi
