# Docker image with test NNTPS server with TLS 1.3, based on NZBget-nserv

For testing TLS1.3 of a NNTP client (like SABnzbd or NZBget), this is a docker image with a nzbget-nserv based NNTPS server with TLS1.3 (and TLS1.2, but no lower protocols).

The NNTPS server has a self-signed certificate, so turn off certificate checking in your client

## Build

Build in the directory containing the Dockerfile

```
sudo docker build --no-cache -t="nzbget-with-tls13" .
```

## Run
Default, easy way (with NNTPS server on NTTPS port 563):
```
sudo docker run  -p 563:6791 --name mynzbget nzbget-with-tls13
```
Or if you want to specify special things:

```
sudo docker run  -p 6791:6791 --name mynzbget nzbget-with-tls13    nzbget --nserv -d /my_content/ -s /nzbget-example.com.cert /nzbget-example.com.key
```
... with example result:

```
$ sudo docker run  -p 6791:6791 --name mynzbget nzbget-with-tls13    nzbget --nserv -d /my_content/ -s /nzbget-example.com.cert /nzbget-example.com.key
[INFO] NServ 20.0-testing-r2171 (Test NNTP server)
[INFO] Press Ctrl+C to quit
[INFO] Listening on port 6791

[DETAIL] [1] Received: ARTICLE <test@home>
[DETAIL] [1] Serving: <test@home>

```

A SABnzbd client, running with python 2.7.15 and openssl 1.1.1, will show:
```
2018-05-14 20:03:34,460::INFO::[sabnzbdplus:1149] Python-version = 2.7.15 (default, May  1 2018, 05:55:50) 
[GCC 7.3.0]

2018-05-14 20:03:34,461::INFO::[sabnzbdplus:1165] SSL version = OpenSSL 1.1.1-pre6 (beta) 1 May 2018

2018-05-14 20:07:24,018::INFO::[newswrapper:228] -1@192.168.1.245: Connected using TLSv1.3 (TLS_AES_256_GCM_SHA384)
```
So: a TLS 1.3 connection from SABnzbd to NZBget-nserv.

The great testssl.sh (see https://github.com/drwetter/testssl.sh) will report:
```
 SSLv2      not offered (OK)
 SSLv3      not offered (OK)
 TLS 1      not offered
 TLS 1.1    not offered
 TLS 1.2    offered (OK)
 TLS 1.3    offered (OK): draft 26
```


## Stop
```
sudo docker kill mynzbget
```

