#Python 2.7, Griffin Taylor 300122587

import socket
import sys
import select

msgServer = ""

class BasicClient(object):
    def __init__(self, name,address, regNum):
        self.name = name
        self.address = address
        self.reg = int(regNum)
        self.socket = socket.socket()

    def connect(self):
        self.socket.connect((self.address, 80))
    
    def send(self, message):
        msgToSend = self.name + " " + str(self.reg) + " " + message
        self.socket.sendall(msgToSend.encode())
    
    def receive(self):
        noPad = client.socket.recv(200).decode()
        return noPad

args = sys.argv
if len(args) != 4:
    print ("Please supply a name, server address/FQDN, registration number.")
    sys.exit()
client = BasicClient(args[1], args[2],args[3])
print("Connecting to "+args[1]+"on port 80")
#try to connect to server
try:
    client.connect()
    ###### NOTE: the client will append the email address onto the base message. 
    ###### The user only has to type in the email they want to query
    sys.stdout.write("\nEmail Query <email address>: ")
    sys.stdout.flush()
except socket.error:
    print("Cannot connect to server")
    exit()
inputs = [client.socket.fileno(),sys.stdin.fileno()]
while True:
    try:
        inReady,outReady,excReady = select.select(inputs,[],[])
        for inp in inReady:
            if inp == client.socket.fileno():
                msg = client.socket.recv(50).decode()
                if(msg != ""):
                    sys.stdout.write("Response: "+ msg + "\nEmail Query: ")
                    sys.stdout.flush()
            if inp == sys.stdin.fileno():
                msg = sys.stdin.readline()[:-1]
                client.send(msg)
                sys.stdout.write("\n")
    except socket.error:
        print("Server Disconnected")
        client.socket.close()
        exit()
