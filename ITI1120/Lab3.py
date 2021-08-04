#Lab 3 - ITI1120 - Griffin Taylor
#Exercise 1
counter = 10
while(counter > 0):#Changed >= to > (only from 10 to 1, not 10 to 0)
    print(counter)
    counter = counter-1 #Changed + to -

#Exercise 2
n = int(input("Please give a value you would like to end at.  "))
def printerWhile(n):
    counter = 1
    while(counter<=n):
        print(counter)
        counter+=1
printerWhile(n)
def printerFor(n):
    for x in range (1,n+1):#Have to add +1 for inclusivity
        print(x)
printerFor(n)

print("\n")
#Exercise 3
import random
value = random.randint(1,10)
def guess(value):
    counter = 1
    gValue = int(input("Please guess a number between 1 and 10.  "))
    while(gValue!=value):
        counter+= 1
        if(gValue > value):
            print("Too large")
        else:
            print("Too small")
        gValue = int(input("That was incorrect, please guess again.  "))
    
    print("That was correct! It took you "+str(counter),"tries to guess it. ")
guess(value)

print("\n")
#Exercise 4
input4 = int(input("Provide a positive number.  "))
while(input4<0):
    input4 = int(input("That is negative. Please provide a positive number.  "))
def ComputeFact(input4):
    factorial = 1
    if(input4 > 1):
        for x in range(2,input4+1):
            factorial*= x
    print("The factorial of "+str(input4),"is "+str(factorial))
ComputeFact(input4)
