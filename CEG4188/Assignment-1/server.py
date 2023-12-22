#Python 2.7, Griffin Taylor 300122587

import socket
import string
import utils
from thread import *
import threading
import sys

clients = []
channelList = []

def padMessage(message):
    while len(message) < utils.MESSAGE_LENGTH:
        message += " "
    return message[:utils.MESSAGE_LENGTH]

def broadcast(message, user, channel,jOrL=False):
    if(not jOrL):message = "["+user+"] "+message
    msgPadded = padMessage(message)
    for client in clients:
        if client.get("channel")==channel and client.get("name") != user:
            client.get("socket").send(msgPadded.encode())

def joinChannel(cSocket, channel):
    for client in clients:
        if client.get("socket") == cSocket:
            oldChannel = client.get("channel")
            if(oldChannel != ""):broadcast(utils.SERVER_CLIENT_LEFT_CHANNEL.format(client.get("name")),client.get("name"),oldChannel,True)
            client.update({"channel":channel})
            broadcast(utils.SERVER_CLIENT_JOINED_CHANNEL.format(client.get("name")),client.get("name"),channel,True)
            print(client.get("name")+" joined "+channel)

def clientThread (clientSocket):
    #receive response from client
    while True:
        try:
            received = clientSocket.recv(200)
            recvMess= received.decode().strip()
            if(recvMess[0]=="/"):# Command
                if(recvMess=="/list"):
                    if(len(channelList)==0):
                        clientSocket.send(padMessage("No Channels").encode())
                    else:
                        msg = ""
                        for channel in channelList:
                            msg += channel + ", "
                        clientSocket.send(padMessage(msg[:-2]).encode())
                elif(recvMess[0:5]=="/join"):
                    if(recvMess[6:] in channelList):
                        joinChannel(clientSocket,recvMess[6:])
                elif(recvMess[0:7]=="/create"):
                    if(len(recvMess)<=8):
                        mess = utils.SERVER_INVALID_CONTROL_MESSAGE.format(recvMess)
                        clientSocket.send(padMessage(mess).encode())
                    elif (recvMess[8:] in channelList):
                        mess = utils.SERVER_CHANNEL_EXISTS.format(recvMess[8:])
                        clientSocket.send(padMessage(mess).encode())
                    else:
                        channelList.append(recvMess[8:])
                        joinChannel(clientSocket,recvMess[8:])
                else:
                    mess = utils.SERVER_INVALID_CONTROL_MESSAGE.format(recvMess)
                    clientSocket.send(padMessage(mess).encode())
            else:
                name = ""
                channel = ""
                for client in clients:
                    if clientSocket == client.get("socket"):
                        name = client.get("name")
                        channel = client.get("channel")
                if(channel == ""):
                    mess = utils.SERVER_CLIENT_NOT_IN_CHANNEL
                    clientSocket.send(padMessage(mess).encode())
                else:
                    broadcast(recvMess,name,channel)

        except socket.error,e:
            print("Client left")
            clientSocket.close()
            return
        except IndexError,e:
            print("Client disconnected")
            clientSocket.close()
            return
            
def runServer(port):
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
        recv = clientSocket.recv(200).decode().strip()
        userDict = {"name":recv,"socket":clientSocket,"channel":""}
        clients.append(userDict)
        print("Added new client:" +str(userDict))
        start_new_thread(clientThread, (clientSocket,))

args = sys.argv
if len(args) != 2:
    print ("Please supply a server port.")
    sys.exit()
runServer(args[1])