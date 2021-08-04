#Lab 5 - Griffin Taylor - 300122587
#Exercise 1
s1,s2,s3 = "good","bad","crazy"
if 'azy' in s3: #a
    print(True)
else:
    print(False)
if  ' ' not in s1:#b
    print(True)
else:
    print(False)
concat = s1 + s2 + s3#c
print(concat)
if ' ' in concat:#d
    print(True)
else:
    print(False)
concat2 = s3*10#e
print(concat2)
print(len(concat))#f

input("enter any value to continue ")

#Exercise 2
aha = "abcdefgh"
print(aha[:4])#a
print(aha[3:6])#b
print(aha[len(aha)-1])#c
print(aha[5:len(aha)-1])#d
print(aha[3:])#e
print(aha[-3:])#f
print(aha[::3])#g
print(aha[1:5:2])#h

input("enter any value to continue ")
    
#Exercise 3
s = ''' In 1815, M. Charles-François-Bienvenu Myriel was a bishop in Digne. He was
a seventy five years old man; he held that position in Digne since 1806. … '''

nS = s.replace('.',' ')#a
nS = nS.replace(',',' ')
nS = nS.replace(';',' ')
nS = nS.replace('\n',' ')
print(nS)

nS = nS.strip()#b
print(nS)

nS = nS.lower()#c
print(nS)

print(nS.count("in"))#d

nS = nS.replace("was","is")#e
print(nS)

input("enter any value to continue ")
    
#Exercise 4
def count1(s,a):
    return s.count(a)
def count2(s,a):
    occur = 0
    for x in range(len(s)):
           if(s[x]==a):
               occur+=1
    return occur
x = input("Please provide a string. ")
y = input("Please provide a character to test. ")
print(y,"occurs",count1(x,y),"many times in",x)
print(y,"occurs",count2(x,y),"many times in",x)

input("enter any value to continue ")
#Exercise 5
def spaces(s):
    news = ""
    for x in range(len(s)):
        news+=s[x]+" "
    return news.strip()
inputS = input("Please provide a string. ")
print(spaces(inputS))

input("enter any value to continue ")
#Exercise 6
def code(s):
    news = ""
    for x in range(0,len(s),2):
        if(x+1!=len(s)):
            i = s[x]
            j = s[x+1]
            news+=j
            news+=i
        else:
            news+=s[x]
    return news
sString = input("Provide a string to be coded. ")
print(code(sString))
