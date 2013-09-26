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
    #now = 1373038672    #answer
    now=1373038673
    while (not guess(now)):
        now -= 1
        print now