#Griffin Taylor ITI1100[C] Lab #1 (labeled as Lab #2)
import math
print("Exercise 1\n")
#Exercise 1#
value1 = int(input("Please input a number  "))
value2 = int(input("Please input a second number  "))
print("This is value 1 divided by value 2")
print(value1//value2)#Printing the integer division quotient
print("This is the remainder of value 1 divided by value 2  ")
print(value1%value2)#Printing the integer division remainder
############

print("Exercise 2\n")
#Exercise 2
inputF = float(input("Input a temperature in Farhenheit to be converted  "))
def convertToCel(tempF):#Converting from Farhenheit to Celcius
    tempC = 5/9 * (tempF - 32)
    return tempC
print(str(inputF)+" degrees in Farhenheit is "+str(convertToCel(inputF)))
inputC = convertToCel(inputF)
def convertToFar(tempC):#Converting from Celcius to Farhenheit
    output = tempC * 9 / 5 + 32
    return output
print(str(inputC)+" degrees Celcius is "+str(convertToFar(inputC))+" Farhenheit")
print("30 degrees Celcius is "+str(convertToFar(30))+" Farhenheit")
print("40 degrees Celcius is "+str(convertToFar(40))+" Farhenheit")
print("50 degrees Celcius is "+str(convertToFar(50))+" Farhenheit")
print("60 degrees Celcius is "+str(convertToFar(60))+" Farhenheit")
############

print("Exercise 3\n")
#Exercise 3#
hw_average = float(input("What was your homework average?  "))
midterm = float(input("What was your midterm mark?  "))
final = float(input("What was your final mark?  "))
def compute(hw_average,midterm,final):#Calculating the final average from the given percentages
    finalMark = hw_average*0.25+midterm*0.25+final*0.5
    return finalMark
finalMark = compute(hw_average,midterm,final)
print("Your final mark is "+str(finalMark))
############

print("Exercise 4\n")
#Exercise 4#
side1 = float(input("What is the first side length?  "))
side2 = float(input("What is the second side length?  "))
side3 = float(input("What is the third side length?  "))
def computeArea(side1,side2,side3):#Calculating area from the inputted values, using the equation given
    p = float(side1+side2+side3)
    area = p * (p - 2*side1) * (p - 2*side2) * (p - 2*side3)
    area = math.sqrt(area)/4
    area = round(area,2)
    return area
print("The area is: "+str(computeArea(side1,side2,side3))jjjjjjjjjjjjjjjjjjjjjjjjjjkkkk.=)
############
