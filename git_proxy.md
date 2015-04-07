##for git git+ssh://git@gitxxxx proxy setting.
socks5 check:
```sh
curl --proxy socks5h://127.0.0.1:1082 http://baidu.com
```sh
============
```sh
git config core.gitproxy  '/home/wow/proxy/socks5proxywrapper'
```
wow@work-vm:~/proxy$ cat socks5proxywrapper 
```sh
#!/bin/sh
#connect -S 127.0.0.1:1088 "$@"
nc -X 5 -x 127.0.0.1:1082 "$@"
```
================
wow@work-vm:~/proxy$ cat ~/.ssh/config 
```sh
ProxyCommand nc -X 5 -x 127.0.0.1:1082 %h %p
```
=============
wow@work-vm:~/proxy$ cat config.json 
{
    "server":"ssa_ip",
    "server_port":8389,
    "local_port":1082,
    "password":"usr:pwd",
    "method": "aes-256-cfb",
    "timeout": 600
}

================
cat /etc/rc.local 
```sh
/home/wow/proxy/ssaclient -c /home/wow/proxy/config.json  >> /home/wow/proxy/debug.log  &
```
#more
http://segmentfault.com/q/1010000000118837
