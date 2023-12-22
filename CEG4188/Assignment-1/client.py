#Python 2.7, Griffin Taylor 300122587

import socket
import sys
import utils
import select

def padMessage(message):
    while len(message) < utils.MESSAGE_LENGTH:
        message += " "
    return message[:utils.MESSAGE_LENGTH]

class BasicClient(object):
    def __init__(self, name,address, port):
        self.name = name
        self.address = address
        self.port = int(port)
        self.socket = socket.socket()

    def connect(self):
        self.socket.connect((self.address, self.port))
        self.socket.sendall(self.name)
    
    def send(self, message):
        padded_message = padMessage(message)#pad short messages
        self.socket.sendall(padded_message.encode())
    
    def receive(self):
        noPad = client.socket.recv(200).decode()
        if(len(msgServer)<200):
            msgServer+=noPad
        if(len(msgServer)==200):
            msg = ""
            if(len(msgServer)==0):
                msg == noPad
            else:
                msg = msgServer.strip()

args = sys.argv
if len(args) != 4:
    print ("Please supply a name, server address, and port.")
    sys.exit()
client = BasicClient(args[1], args[2],args[3])
#try to connect to server
try:
    client.connect()
    sys.stdout.write(utils.CLIENT_MESSAGE_PREFIX)
    sys.stdout.flush()
    #recv = client.socket.recv(200).decode()
    #sys.stdout.write
    #print(str(recv.strip()+"\n"+utils.CLIENT_MESSAGE_PREFIX))
    #sys.stdout.flush()
except socket.error,e:
    print(utils.CLIENT_CANNOT_CONNECT.format(client.address,client.port))
    exit()
inputs = [client.socket.fileno(),sys.stdin.fileno()]
msgServer = ""
while True:
    try:
        inReady,outReady,excReady = select.select(inputs,[],[])
        for inp in inReady:
            if inp == client.socket.fileno():
                noPad = client.socket.recv(200).decode()
                if(len(msgServer)<200):
                    msgServer+=noPad
                if(len(msgServer)==200):
                    msg = ""
                    if(len(msgServer)==0):
                        msg == noPad
                    else:
                        msg = msgServer.strip()
                    sys.stdout.write(utils.CLIENT_WIPE_ME+"\r"+msg+"\n"+utils.CLIENT_MESSAGE_PREFIX)
                    sys.stdout.flush()
                    msgServer = ""
            if inp == sys.stdin.fileno():
                msg = sys.stdin.readline()[:-1]
                client.send(msg)
                sys.stdout.write(utils.CLIENT_MESSAGE_PREFIX)
                sys.stdout.flush()
    except socket.error , e:
        print(utils.CLIENT_SERVER_DISCONNECTED.format(client.address,client.port))
        client.socket.close()
        exit()
