from flask import Flask, abort, request
import unicodedata
import subprocess

app = Flask(__name__)

def waf(input):
	blacklist = ["~","!","@","#","$","%","^","&","*","(",")","_","-","+","{","}","]","[","|","\\","|",";",",",".","<",">","?","/","`",":","\""]
	vuln = False
	if any(string in input for string in blacklist):
		vuln = True
	return vuln

@app.route("/")
def index():
	with open("app.py","r") as f:
		output = f.read()
	return output

@app.route("/backdoor")
def backdoor():
	cmd = request.args.get("cmd")
	data = ""
	if waf(cmd):
		abort(403,description="Hacker detected! You need to stop!")
	else:
		norm = unicodedata.normalize("NFKC", cmd) 
		data = subprocess.getoutput(norm)
	return data

if __name__ == "__main__":
	app.run(host="0.0.0.0", port=8004, debug=True, threaded=True, use_evalex=False)
