---
layout: post
title: "SIGINT 2013 crypto200 rsa"
description: "SIGINT 2013 crypto 200 enumerate seed"
category: "writeup"
tags: ["SIGINT 2013", "crypto", "writeup"]
---
{% include JB/setup %}
#SIGINT2013 crypto200 rsa

Description

    Cryptography is difficult
    authorized_keys
    ssh to challenge@188.40.147.109

[genrsa.py](https://github.com/5lipper/CTF-Challenges/blob/master/SIGINT2013/crypto/rsa/genrsa.py)

[authorized_keys](https://github.com/5lipper/CTF-Challenges/blob/master/SIGINT2013/crypto/rsa/authorized_keys)

challenge@188.40.147.109的ssh密钥是用genrsa.py生成的。

```python
SEED = int(time())
def randfunc(n):
    def rand():
        global SEED
        ret = SEED*0x1333370023004200babe004141414100e9a1192355de965ab8cc1239cf015a4e35 + 1
        SEED = ret
        return (ret >> 0x10) & 0x7fff
    ret = ""
    while len(ret) < n:
        ret += chr(rand() & 0xff)
    return ret
keypair = RSA.generate(1024, randfunc)
```

这个RSA使用的是自定义随机函数。
弱点不在于算法的随机性不够，而在于随机算法很快而且这个时间种子可以轻易枚举。
原本的算法中指用了乘法，而且实际上只用了最后6byte。只要每次运算模16777216(0x1000000)就可以降低运算的常数，从而加速计算。

现在已知公钥

	ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC+K6w1yodieqyryJnUYHw/ZuycabT0Ehwg4XFqZYfh/euE4QIXPJ23widXJUKIq8Gqwi5M/Pa+7/gAPeVcrcF65pUkeIYeZBXoAeDj0EqpFxiHdSB/K1Ovt/lIFmBG3hy+MVJLYfz6lBRxQwj+CJRkFX2Xf/5JyZWSK5UwXOlh0w==

如果每次都用读写文件再调`system("ssh-keygen -m PKCS8 -i -f pub > id_rsa.pub && rm pub")`显然非常慢。更好的办法是从公钥中解出N，每次比较生成的N是否相同。

RSAPublicKey的结构：

* The key type
* A chunk of PEM-encoded data
* A comment

PEM是[Privacy Enhanced Mail](http://en.wikipedia.org/wiki/Base64#Privacy-enhanced_mail)的缩写。
对于ssh密钥，PEM是由一些小数据块(big-endian)组成的。每一块前面是数据长度，后面就是数据。

```python
def b2i(s):
        ret = 0L
        for i in s:
                ret = (ret << 8) + ord(i)
        return ret

def ssh_rsa(text):
        text = text.split()[1].decode('base64')

        l = b2i(text[:4])
        text = text[4:]
        print text[:l]
        text = text[l:]

        l = b2i(text[:4])
        e = b2i(text[4:l+4])
        text = text[l+4:]

        l = b2i(text[:4])
        n = b2i(text[4:l+4])
        
        return {'e':e, 'n':n}
```

解码后就能得到公钥的N。[extract.py](https://github.com/5lipper/CTF-Challenges/blob/master/SIGINT2013/crypto/rsa/extract.py)

    ssh-rsa
    {'e': 65537L, 'n': 133542334266816908873627788991135098836872531174929294246169531210661376429243860064170039541966242804413057715139822380296022355504905790916703933165069728724833411797448828615450127927989084469577103148831167203596018572102137170380105783557008648639360019823792278259940952368577709045086814405497576841683L}

接下来就是暴力破解的过程了。

```python
from time import time
from Crypto.PublicKey import RSA

N = 133542334266816908873627788991135098836872531174929294246169531210661376429243860064170039541966242804413057715139822380296022355504905790916703933165069728724833411797448828615450127927989084469577103148831167203596018572102137170380105783557008648639360019823792278259940952368577709045086814405497576841683L

seed = 1373050924

def randfunc(n):
    def rand():
        global seed
        #ret = SEED*0x1333370023004200babe004141414100e9a1192355de965ab8cc1239cf015a4e35 + 1
        seed = (seed*5918261 + 1)
        seed = seed & 0xffffff
        return (seed >> 0x10) & 0xff
    ret = ""
    while len(ret) < n:
        ret += chr(rand())
    return ret

def guess(x):
        global seed
        seed = x
        keypair = RSA.generate(1024, randfunc)
        if  getattr(keypair, 'n') != N :
                return False
        print getattr(keypair, 'n'), x
        return True

if __name__ == '__main__':
        #now = 1373041808
        now = 1373038672    #answer
        while (not guess(now)):
                now -= 1
                print now
```
[my.py](https://github.com/5lipper/CTF-Challenges/blob/master/SIGINT2013/crypto/rsa/my.py)

SIGINT_some_people_pay_100_euro_for_this
[flag](https://github.com/5lipper/CTF-Challenges/blob/master/SIGINT2013/crypto/rsa/flag)
