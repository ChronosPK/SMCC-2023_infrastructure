import hashlib
import random
import string
import urllib.parse
from http.server import HTTPServer, BaseHTTPRequestHandler


word = "chronos-is-awesome"
# Calculate the SHA-256 hash of the word
hash = hashlib.sha256(word.encode()).hexdigest()
# Set the flag to the hexadecimal representation of the hash
flag = f"flag{{{hash}}}"
# Set the messages to choose from
messages = [
    "Incorrect value",
    "Value not recognized",
    "Value not accepted",
	"Still no"
]
class FlagHandler(BaseHTTPRequestHandler):
    def log_request(self, code='-', size='-'):
        # Open the log file in append mode
        client_ip = self.client_address[0]
        with open("requests1.log", "a") as f:
            # Client IP address
            f.write(f"Client IP: {client_ip}\n")
            # Write the request line to the file
            f.write(f"{self.requestline}\n")
            # Write the headers to the file
            for header, value in self.headers.items():
                f.write(f"{header}: {value}\n")
            # Write the time of the request
            f.write(f"Time of request: {self.log_date_time_string()}\n")
            # Write an extra newline after the arguments
            f.write("\n")
    def do_GET(self):
        # check LOCATION, QUERY, HEADER in this order

        # Check if the location is "/first"
        if self.path == "/first":
            # Send a message explaining the requirements
            message = """Complete the following tasks to get the flag: 
    Supply the query containing 
        the application used to build the server and 
        the version of that application. 
    Send the query in the "flag" sub-directory.\n"""
            self.send_response(200)
            self.send_header("Content-Type", "text/plain")
            self.end_headers()
            self.wfile.write(message.encode())

        # Check if the location is "/flag"
        elif self.path == "/first/flag" or "/first/flag?" in self.path:
            # Parse the query string
            query_string = urllib.parse.urlparse(self.path).query
            params = urllib.parse.parse_qs(query_string)

            # Check if "?flag=please" in the query are present
            if "python" in params and params["python"][0] == "3.7.16":

                # if everything is OK, send the flag
                self.send_response(200)
                self.send_header("Content-Type", "text/plain")
                self.end_headers()
                self.wfile.write(flag.encode())
                self.wfile.write("\n".encode())
            # if query is wrong, display message
            else:
                # If the header is not present, send an error message
                self.send_response(400)
                self.send_header("Content-Type", "text/plain")
                self.end_headers()
                self.wfile.write("Query! Query!\n".encode())
        else:
            # If the location is not "/first/flag", send a 404 error
            self.send_response(404)
            self.send_header("Content-Type", "text/plain")
            self.end_headers()
            self.wfile.write("Not found. Are you lost?\n".encode())


# Start the server
httpd = HTTPServer(("0.0.0.0", 8007), FlagHandler)
httpd.serve_forever()
