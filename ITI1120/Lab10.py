#Lab 10 - Griffin Taylor
#Exercise 1
def DigitOrNo(A,counter):
    if(counter == 0):#base case
        return 0 <= A[counter] and 9>=A[counter] 
    return 0 <= A[counter-1] and 9>=A[counter-1]and DigitOrNo(A,counter-1)#general case
A = input("Please provide a list of integers seperated by commas. ").split(",")
for i in range(len(A)):
    A[i] = int(A[i])
if(DigitOrNo(A,len(A))):
    print("All of the values are digits ")
else:
    print("At least one value is not a digit ")

#Exercise 2
def CreateList(L,n):
    if(n == 0):#base case
        L.append(n)
        return L.sort()
    
    else:#general case 
        L.append(n)
        L.sort()
        CreateList(L,n-1)
        
    
    return L
L = []
n = int(input("Please provide an integer. "))
print(CreateList(L,n-1))
    
#Exercise 3
def bcd(x,y):
    if(x>=y and x%y == 0):#biggest common divisor
        return y
    elif(x<y):# switching if y is bigger than x initially
        return bcd(y,x)
    else:#because x is being divided,you switch the values so the larger is first
        return bcd(y,x%y)
print("The biggest common divisor is:",bcd(1234,4321))
print("The biggest common divisor is:",bcd(8192,192))
