str = ""
while len(str)<200:
    str += " "
print(len(bytes(str.encode())))

str = "/create hmm"
print(str[8:])
channelList = ["ch"]

userDict = {"name":"Griffin","socket":"Socky","channel":""}
userDict.update("name","Hmm")

recvMess = "/join ch"
if(recvMess[0:5]=="/join"):
    if(recvMess[6:] in channelList):
        print(recvMess[6:])
        ##
        #for client in clients:
            #if client.get("socket")==clientSocket:
                #client.update("channel",recvMess[7:])
                #print("Joining "+recvMess[7:])