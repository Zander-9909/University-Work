#Lab 7 - Griffin Taylor
#Exercise 1
def transpose(m):
    n = []
    y = []
    for i in range(len(m[0])):
        for j in range(len(m)):
            y.append(m[j][i])
        n.append(y)
        y = []
    return n
m = [[1,2,3],[4,5,6]]
n = transpose(m)
print(n)

#Exercise 2
def sum_matrices(x,y):
    for i in range(len(x)):
        for j in range(len(x[0])):
            x[i][j]+= y[i][j]
    return x
m = [[1,2],[3,4]]
n = [[1,1],[1,1]]
r = sum_matrices(m,n)
print(r)

#Exercise 3
def product_matrices(m,n):
    r = []
    y = []
    for i in range(len(m)):
        for j in range(len(n[0])):
            y.append(0)
        r.append(y)
        y = []
    for i in range(len(m)):
        for j in range(len(n[0])):
            for k in range(len(n)):
                r[i][j]+=m[i][k]*n[k][j]
    return r
m = [[1,2,3],[4,5,6]]
n = [[1,2],[3,4],[5,6]]
if(len(m)==len(n[0])):
   r = product_matrices(m,n)
   print(r)
else:
    print("Matrices cannot be multiplied.")
    
