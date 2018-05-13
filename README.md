# nzbget-NNTPS-server-with-TLS13

For testing TLS1.3 of a NNTP client (like SABnzbd or NZBget): a nzbget-nserv based NNTPS server with TLS1.3 (and TLS1.2)

The NNTPS server has a self-signed certificate, so turn off certificate checking in your client

Build (in the directory containing the Dockerfile):
```
sudo docker build --no-cache -t="nzbget-with-tls13" .
```

Run:
```
sudo docker run  -p 6791:6791 --name mynzbget nzbget-with-tls13    nzbget --nserv -d /my_content/ -s /nzbget-example.com.cert /nzbget-example.com.key
```

```
$ sudo docker run  -p 6791:6791 --name mynzbget nzbget-with-tls13    nzbget --nserv -d /my_content/ -s /nzbget-example.com.cert /nzbget-example.com.key
[INFO] NServ 20.0-testing-r2171 (Test NNTP server)
[INFO] Press Ctrl+C to quit
[INFO] Listening on port 6791

[DETAIL] [1] Received: ARTICLE <test@home>
[DETAIL] [1] Serving: <test@home>

[ERROR] Could not read from TLS-Socket: Connection closed by remote host
```
