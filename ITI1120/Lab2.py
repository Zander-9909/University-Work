#Lab 2 - Griffin Taylor#
import math
#Exercise 1#
def AgeCheck(data):
    x = False
    if(data>=18 and data<=55):
        x = True
    if(x):
        print("Transaction Accepted")
    else:
        print("Transaction Refused")

age = int(input("What is your age?  "))
AgeCheck(age)
print("\n")

#Exercise 2#
def ActivityChoice(temp):
    if(temp>=80):
        activity = 1
    elif(temp>=60):
        activity = 2
    elif(temp>=40):
        activity = 3
    else:
        activity = 4
    x = ["Swimming","Soccer","Volley Ball","Skiing"]        
    print("We recommend "+x[activity-1]+" as a good activity today!")
tempToCheck = int(input("What is the temperature in Farhenheit today?  "))
ActivityChoice(tempToCheck)
print("\n")

#Exercise 3#
def isDivisible(value):
    if(value%2 == 0 and value%3 == 0):
        x = 1
    elif(value%2 == 0 or value%3 == 0):
        x = 2
    else:
        x = 0
    yesornoList = ["is not divisible by 2 or 3.","is divisible by both 2 and 3.","is divisible by 2 or 3."]
    print(value,yesornoList[x])
print("This portion checks if a number is divisible by one or both of 2 and 3.")
value = int(input("What integer would you like to check?  "))
isDivisible(value)
print("\n")

#Exercise 4#
def rootFinder(a,b,c):
    d = int(math.pow(b,2)-4*a*c)#Casting it to an int because of it treating a small value (-0.000000002) as not zero (Effectively is)
    if(d < 0 ):
        x = 0
    elif(d == 0):
        x = 1
    else:
        x = 2
    if(x == 2 or x == 0):
        print("There are "+str(x)+" roots")
    else:
        print("There is "+str(x)+" root")
a = float(input("What is the 'a' coefficient? "))
b = float(input("What is the 'b' coefficient? "))
c = float(input("What is the 'c' coefficient? "))
rootFinder(a,b,c)
