#!/usr/bin/python3
import subprocess as sub
import re
from http import server
import socketserver

def arp_scan():
	arp = sub.Popen(["arp-scan","--localnet"],
		stdout=sub.PIPE)
	stdout, stderr = arp.communicate()
	lines = stdout.decode("utf-8").split("\n")
	table = [l.split("\t") for l in lines[2:-4]]
	return table

def htmlify_table(table):
	html = '<table class="table table-striped">'
	for row in table:
		html += "<tr>"
		for col in row:
			html += "<td>" + col + "</td>"
		html += "</tr>"
	html += "</table>"
	return html
				
def template(template):
	placeholder = re.compile(r"<python>(.*)</python>")
	result = ""
	for line in template.split("\n"):
		matches = re.findall(placeholder, line)
		if matches:
			for m in matches:
				result += eval(m)
		else:
			result += line
	return result
	
def convert(input_file, output_file):
	with open(input_file) as template_file:
		t = template_file.read()
		r = template(t)

	with open(output_file, "w") as index_file:
		index_file.write(r)		

class ARPYRequestHander(server.SimpleHTTPRequestHandler):
	def do_GET(self):
		convert("template.html", "index.html")
		return server.SimpleHTTPRequestHandler.do_GET(self)


if __name__ == "__main__":
	
	server_address = ('', 8000)
	handler = ARPYRequestHander

	httpd = socketserver.TCPServer(server_address, handler)
	httpd.serve_forever()
			
