#Python 2.7, Griffin Taylor 300122587

import socket
from thread import *
import threading
import sys

clients = {} # ID : Name
database = {} # Email : Full Name

def clientThread (clientSocket):
    #receive response from client
    while True:
        try:
            received = clientSocket.recv(50)
            recvMess= received.decode().strip()
            messSplit = recvMess.split()
            if recvMess != "" and recvMess != None:
                if(len(messSplit)!=3):
                    clientSocket.send("Format is incorrect. Please fix.")
                    continue
                #Checking Registration
                if messSplit[1] not in clients.keys():
                    #if not Registered
                    clients.update({messSplit[1]:messSplit[0]})

                #Check if the email is in the database
                if messSplit[2] in database.keys():
                    #In the database
                    mess = database.get(messSplit[2])
                    clientSocket.send(mess.encode())
                else:
                    #Not in database
                    mess = "Email does not exist in database."
                    clientSocket.send(mess.encode())
        except socket.error:
            print("Client disconnected")
            clientSocket.close()
            return
        except IndexError:
            print("Client disconnected")
            clientSocket.close()
            return
            
def runServer(port):
    #read in database file
    dbFile = open("database.txt","r")
    for e in dbFile:
        eSplit = e.split()
        database.update({eSplit[2]:eSplit[0]+" "+eSplit[1]})
    #create server socket
    serverSocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    
    #bind server socket to all interfaces and the specified port
    serverSocket.bind(('',int(port)))
    
    #listen for max 10 connections
    serverSocket.listen(10)
    print("Listening on port "+port)

    #Accept connections and thread them
    while True:
        clientSocket,address = serverSocket.accept()
        print(str(address) + " connected")
        start_new_thread(clientThread, (clientSocket,))
runServer(80)
