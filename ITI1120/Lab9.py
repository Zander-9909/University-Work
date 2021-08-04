#Lab 9 - Griffin Taylor
#Exercise 1
class Time:
    def __init__(self, hh=12, mm=0, s=0):
        '''(Time)-> None'''
        self.setTime(hh,mm,s)
    def setTime(self, hh=12, mm=0, s=0):
        '''(Time)-> None'''
        self.hour = hh%24
        if(mm>=0 and mm<=59):
            self.minute = mm
        else:
            self.minute = mm%60
            self.hour += mm//60
            self.hour = self.hour%24
        if(s
           >=0 and s<=59):
            self.second = s
        else:
            self.second = s%60
            self.minute += s//60
            self.hour += self.minute//60
            self.minute = self.minute%60
            self.hour = self.hour%24
    def display(self):
        print("{0}:{1}:{2}".format(self.hour,self.minute,self.second))
    def __repr__(self):
        return (str(self.hour) +":" +str(self.minute) +":"+str(self.second))
    def __eq__(self, other):
        '''(Time)-> bool'''
        return self.hour == other.hour and self.minute == other.minute and self.second == other.second
    def isBefore(self,other):
        if(self.hour<other.hour):
            return True
        elif(self.hour == other.hour and self.minute<other.minute):
            return True
        elif(self.hour == other.hour and self.minute == other.minute and self.second < other.second):
            return True
        else:
            return False
    def duration(self,other):
        h = abs(self.hour - other.hour)
        m = abs(self.minute - other.minute)
        s = abs(self.second - other.second)
        return Time(h,m,s)
time1 = Time(12,4,0)
time2 = Time(12,25,2)
print(time1)
print(time2.isBefore(time1))
x = time1.duration(time2)
x.display()

#Exercise 2
class Car:
    def __init__(self,b = "Ford",c = "Red"):
        self.brand = b
        self.colour = c
        self.driver = "person"
        self.speed = 0
    def __eq__(self,other):
        return self.brand == other.brand and self.colour == other.colour and self.driver == other.driver and self.speed == other.speed
    def __repr__(self):
        print(str(self.colour)+" "+str(self.brand)+" driven by "+str(self.driver)+", speed = "+str(self.speed)+" m/s")
    def choose_driver(self,name):
        self.driver = name
    def accelerate(self,flow,duration):
        if(self.driver != "person"):
            self.speed = self.speed + flow*duration
        else:
            print("This car does not have a driver!")
    def displayall(self):
        print(str(self.colour)+" "+str(self.brand)+" driven by "+str(self.driver)+", speed = "+str(self.speed)+" m/s")
a1 = Car('Peugeot', 'blue')
a2 = Car(c = 'green')
a3 = Car('Mercedes')
a3.displayall()
a1.displayall()
a1.choose_driver("Griffin")
a1.accelerate(2.3,30)
a1.displayall()

#Exercise 3
class BankAccount:
    def __init__(self,n = "Dupont",b = 1000):
        self.name = n
        self.balance = b
    def __eq__(self,other):
        return self.name == other.name and self.balance == other.balance
    def __repr__(self):
        print("Name: "+str(self.name)+" | Balance: $"+"{:.2f}".format(self.balance,2))
    def display(self):
        print("Name: "+str(self.name)+" | Balance: $"+"{:.2f}".format(self.balance,2))
    def deposit(self,num):
        self.balance += num
    def withdraw(self,num):
        self.balance -= num
class SavingsAccount(BankAccount):
    def __init__(self,n = "Dupont",b = 1000):
        BankAccount.__init__(self,n,b)
        self.interest = 0.003
    def deposit(self,num):
        self.balance += num
    def withdraw(self,num):
        self.balance -= num
    def changeRate(self,value):
        self.interest = value/100
    def capitalisation(self,month):
        self.balance = self.balance*(1+self.interest)**month
        print("Capitalisation at "+str(self.interest)+"% for "+str(month)+" months")
x = BankAccount("Griffin",950)
x.display()
x.deposit(20)
x.withdraw(15)
x.display()
y = SavingsAccount("Griffin",950)
y.display()
y.capitalisation(12)
y.display()
y.changeRate(0.5)
y.capitalisation(12)
y.display()
