echo "install chisel from the github rep"
mkdir chisel && cd chisel

echo "Downlod chisel for linux amd64"
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz && gunzip chisel_1.9.1_linux_amd64.gz && chmod +x chisel_1.9.1_linux_amd64

echo "setup chisel for server or client? type s for server and c for client"
read chtype

if[chtype == 's']
  then
  echo 'server selected'
elif[chtype == 'c']
  then
  echo 'client selected'
else
  echo 'not selected!!'  
fi
