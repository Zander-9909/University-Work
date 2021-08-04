#Lab 4 - Griffin Taylor
#Exercise 1
def AverageCalculator(input1):
    total = 0
    for x in range (0,len(input1)):
        total += int(input1[x])
    return total/len(input1)
inputList = (input("Please provide a list of numbers seperated by commas." )).split(',')
print("The average is",AverageCalculator(inputList))

#Exercise 2
def AverageMarks(inputList):
    for x in range (0,len(inputList)):
        inputList[x]=int(inputList[x])
    results = [1,2,3]#Place Holder values
    results[0]= inputList[0]
    for x in range(1,len(inputList)):#Finding max can also be done with max(inputList)
        if(inputList[x]>results[0]):
           results[0]=inputList[x]
    results[1]= inputList[0]
    for x in range(1,len(inputList)):#Finding min can also be done with min(inputList)
        if(inputList[x]<results[1]):
           results[1]=inputList[x]
    total = 0
    for x in range (0,len(inputList)):
        total +=inputList[x]
    results[2]= total/len(inputList)
    return results
inputList1 = (input("Please provide your marks seperated by commas." )).split(',')
results = AverageMarks(inputList1)\


          
print("Maximum =",results[0])
print("Minimum =",results[1])
print("Average =",results[2])

#Exercise 3
import math
def CalculateDistance(speed):
    distance = [[0 for x in range(2)] for y in range(10)] #Creating an empty array to hold the values
    for x in range(0,10):
        angle = math.pi*x/18#Getting angle
        distance[x][0]= x*10
        distance[x][1]= round(2*pow(speed,2)*math.cos(angle)*math.sin(angle)/9.8,2)
    return distance
speed = float(input("What is the speed of the ball in m/s? "))
distance = CalculateDistance(speed)
for x in range(10):
    print("The distance at",distance[x][0],"degrees is",distance[x][1],"m.")

#Exercise 4
import math
def StndDevtn(values):
    total = 0
    for x in range(0,len(values)):
        total+=float(values[x])
    a = total/len(values)
    top = 0
    for x in range(0,len(values)):
        top+= pow(float(values[x])-a,2)
    s = math.sqrt(top/(len(values)-1))
    return s
values = input("Please provide a list of values seperated by commas.").split(',')
print("The standard deviation is",StndDevtn(values))
