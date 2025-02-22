# force use of specific ip when talking to specific host
Let's say your host has IP addresses 10.0.0.2 and 10.0.0.3 and your default gateway is 10.0.0.1. Now if you want to use different local IP addresses to communicate with remote addresses 10.2.2.2 and 10.3.3.3, you could do like this:
```
ip route add 10.2.2.2/32 via 10.0.0.1 src 10.0.0.2
ip route add 10.3.3.3/32 via 10.0.0.1 src 10.0.0.3
```
src: https://serverfault.com/questions/644943/force-use-of-specific-ip-when-talking-to-specific-host