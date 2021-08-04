#Lab 8 - Griffin Taylor
#Exercise 1
import random
def LinSearch(inputList,v):
    nSteps = 1
    vExists = False
    for i in range(0,len(inputList)):
        if(v == inputList[i]):
            vExists = True
            print("Number of steps:",nSteps)
            return vExists
        else:
            nSteps+=1
    print("Number of Steps:",nSteps)
    return vExists
inputList = []
N = 100
for i in range(N):
    v = random.randrange(1,N+1)
    inputList.append(v)
print(inputList)
v = int(input("What value would you like to search for? "))
print(LinSearch(inputList,v))

#Exercise 2
def LinSearchArray(inputArray,v):
    nSteps = 1
    vExists = False
    for i in range(len(inputArray)):
        for j in range(len(inputArray[i])):            
            if(v == inputArray[i][j]):
                vExists = True
                print("Number of steps:",nSteps)
                return vExists
            else:
                nSteps+=1
    print("Number of Steps:",nSteps)
    return vExists
inputArray = []
inputList2 = []
rows = 3
columns = 3
for i in range(rows):
    inputList2 = []
    for i in range(columns):
        r = random.randrange(1,columns+1)
        inputList2.append(r)
    inputArray.append(inputList2)
print(inputArray)
v = int(input("What value would you like to search for? "))
print(LinSearchArray(inputArray,5))

#Exercise 3
def CountArray(inputArray,v):
    nSteps = 1
    vCount = 0
    for i in range(len(inputArray)):
        for j in range(len(inputArray[i])):            
            if(v == inputArray[i][j]):
                vCount += 1
            nSteps+=1
    print("Number of Steps:",nSteps)
    return vCount
inputArray = []
inputList2 = []
rows = 4
columns = 6
for i in range(rows):
    inputList2 = []
    for i in range(columns):
        r = random.randrange(1,columns+1)
        inputList2.append(r)
    inputArray.append(inputList2)
print(inputArray)
v = int(input("What value would you like to search for? "))
print(CountArray(inputArray,v))

#Exercise 4
def BinarySearch(inputList,v):#Cuts list in half, and checks if the median is larger
    nSteps = 1 #or smaller than the value you want, and acts accordingly
    vExists = False
    f = len(inputList)//2
    if(inputList[f]>v):#starts at beginning of list to the pivot point
        for i in range(f):
            if(v == inputList[i]):
                vExists = True
                print("Number of steps:",nSteps)
                return vExists
            else:
                nSteps+=1
    elif(v > inputList[len(inputList)-1]or v < inputList[0]):#if the value is out of the range of the loop
        return False
    elif(v == inputList[f]):
        print("Number of Steps:",nSteps)
        return vExists
    else:
        for i in range(f,len(inputList)):#starts at pivot to the end of the list
            if(v == inputList[i]):
                vExists = True
                print("Number of steps:",nSteps)
                return vExists
            else:
                nSteps+=1
    print("Number of Steps:",nSteps)
    return vExists
#inputList = [1, 2, 3, 4, 4, 5, 7, 9, 10, 13]
inputList = []
N = 100
for i in range(N):
    v = random.randrange(1,N+1)
    inputList.append(v)
v = int(input("What value would you like to search for? "))
print(BinarySearch(inputList,v))


#Exercise 5
def Sort(inputList):#Selection Sort
    count = 1
    for i in range(len(inputList)):
        minI = i
        for j in range(i+1,len(inputList)):
            if(inputList[minI]>inputList[j]):
                minI = j
        inputList[i],inputList[minI] = inputList[minI],inputList[i]
        count += 1
    print("Steps taken:",count)
    return inputList
inputList = []
N = 10
for i in range(N):
    v = random.randrange(1,N+1)
    inputList.append(v)
print(inputList)
print(Sort(inputList))
#python's .sort() uses tim sort, which is a mixture of merge and insertion sort

#Exercise 6
def InsertionSort(inputList):
    count = 1
    for i in range(1,len(inputList)):
        v = inputList[i]
        j = i-1
        while ((j >=0) and (v < inputList[j])):
            inputList[j+1] = inputList[j]
            j -= 1
            count+=1
        inputList[j+1] = v
    print("Number of steps:",count)
    return inputList
inputList = []
N = 10
for i in range(N):
    v = random.randrange(1,N+1)
    inputList.append(v)
print(inputList)
print(InsertionSort(inputList))   
