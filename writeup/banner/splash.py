from text import color
import time,random
import log

banner = '''  .:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:
  )     _    _                 _       _                   )
  (    | |_ | | _ _  ___      | | ___ | |_  _ _  ___       (
  )    | . || || | || -_| ___ | || . ||  _|| | ||_ -|      )
  (    |___||_||___||___|     |_||___||_|  |___||___|      (
  (                                                        (
  .:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:'''

Logos ={
    1:'wake-up-neo.txt',
    2:'cow-head.txt',
    3:'r7-metasploit.txt',
    4:'figlet.txt',
    5:'i-heart-shells.txt',
    6:'branded-longhorn.txt',
    7:'cowsay.txt',
    8:'3kom-superhack.txt',
    9:'missile-command.txt',
    10:'null-pointer-deref.txt',
    11:'metasploit-shield.txt',
    12:'ninja.txt',
    13:'workflow.txt'
  }

data=open(random.choice(Logos)).read()

_lines = data.split('\n')


def splash():
    log.trace('\x1b[G\x1b[?25l')
    for c in range(8):
        for line in _lines:
            log.trace(color(c % 8, line) + '\n')
            time.sleep(0.005)
        for _ in _lines:
            log.trace('\x1b[F')
    for line in _lines:
        log.trace(line + '\n')
    log.trace('\x1b[?25h')

splash()

_lines = banner.split('\n')

splash()
