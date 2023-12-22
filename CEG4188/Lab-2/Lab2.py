from socket import *
from thread import *
import threading


def exercise1():  # TCP socket client
    serverName = "127.0.0.1"  # localhost
    serverPort = 8814  # server host port

    # creating client socket, using an IPv4 address and SOCK_Stream (TCP) type
    clientSocket = socket(AF_INET, SOCK_STREAM)

    # connect to server, using tuple (serverName,serverPort)
    clientSocket.connect((serverName, serverPort))

    # received text from server and print the value
    receivedText = clientSocket.recv(4096)
    print(receivedText.decode())

    # create request string, and send
    username = raw_input("Enter username in format: <Name> <WS> <Identification_No> \n")
    clientSocket.send(username.encode())

    # receive final response and print it
    receivedText = clientSocket.recv(4096)
    print(receivedText.decode())

    # close socket
    clientSocket.close()


def exercise2():
    serverName = "127.0.0.1"  # localhost
    serverPort = 4188  # server host port

    # creating client socket, using an IPv4 address and SOCK_Stream (TCP) type
    clientSocket = socket(AF_INET, SOCK_DGRAM)

    # grab username and send to server
    username = raw_input("Enter username in format: <Name> <WS> <Identification_No>")
    clientSocket.sendto(username.encode(), (serverName, serverPort))

    # receive instructions from server and print
    receivedTuple = clientSocket.recvfrom(4096)
    instructions = receivedTuple[0].decode()
    print(instructions)

    # Get bet and Prediction and send
    while True:
        betAndPred = raw_input(
            "Please enter a bet and a prediction (K,Q,M,T,P), in the format <Bet> <WS> <Prediction>, or QUIT to end game \n"
        )
        if betAndPred == "QUIT":
            break
        clientSocket.sendto(betAndPred.encode(), (serverName, serverPort))
        receivedTuple = clientSocket.recvfrom(4096)
        print(receivedTuple[0].decode())
    clientSocket.close()


def clientThread(clientSocket):
    # this is the client thread that will be open and ran per connection
    # Make welcome message and send
    welcomeMsg = "Welcome to my server"
    clientSocket.send(welcomeMsg.encode())

    # receive response from client
    received = clientSocket.recv(4096)
    print(received.decode())

    # send final message, and close connection
    finalMsg = "Closing connection"
    clientSocket.send(finalMsg.encode())
    print(finalMsg)
    clientSocket.close()


def exercise3():
    # create server socket
    serverSocket = socket(AF_INET, SOCK_STREAM)

    # bind server socket to all interfaces and port 8815
    serverSocket.bind(("", 8815))

    # listen for max 5 connection
    serverSocket.listen(5)
    print("Listening on port 8815")

    # Accept connections and thread them
    while True:
        clientSocket, address = serverSocket.accept()
        print(str(address) + " connected")
        start_new_thread(clientThread, (clientSocket,))


def ex3Client():
    serverName = "127.0.0.1"  # localhost
    serverPort = 8815  # server host port

    # creating client socket, using an IPv4 address and SOCK_Stream (TCP) type
    clientSocket = socket(AF_INET, SOCK_STREAM)

    # connect to server, using tuple (serverName,serverPort)
    clientSocket.connect((serverName, serverPort))

    # received text from server and print the value
    receivedText = clientSocket.recv(4096)
    print(receivedText.decode())

    # create request string, and send
    username = raw_input("Please enter a response to send to the server \n")
    clientSocket.send(username.encode())

    # receive final response and print it
    receivedText = clientSocket.recv(4096)
    print(receivedText.decode())

    # close socket
    clientSocket.close()


inputValue = raw_input(
    "Which exercise to run (1-3), or 4 to run the exercise 3 client\n"
)

if inputValue == "1":
    exercise1()
elif inputValue == "2":
    exercise2()
elif inputValue == "3":
    exercise3()
elif inputValue == "4":
    ex3Client()
else:
    print("Invalid, exiting")
