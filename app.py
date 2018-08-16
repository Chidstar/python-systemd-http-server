#!/usr/bin/python
import SimpleHTTPServer
import SocketServer

PORT = 9000

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

httpd = SocketServer.TCPServer(("", PORT), Handler)

msg = str(("serving at port" + str(PORT)))
print ("servering at port", PORT)
f = open("/home/jenkins/log.txt", "a+")
f.write(str(msg))
f.close()

httpd.serve_forever()
