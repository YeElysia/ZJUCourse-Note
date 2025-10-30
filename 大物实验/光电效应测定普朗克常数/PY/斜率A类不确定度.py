y = [-1.792,-1.450,-1.266,-0.73,-0.606]
x = [8.211,7.400,6.874,5.489,5.194]

x_ = sum(x)/5

def f(x):
    return -0.3949 * x + 1.45634

tmp1 = [0,0,0,0,0]
tmp2 = [0,0,0,0,0]
tmp3 = [0,0,0,0,0]
for i in range(5):
    tmp1[i] = (y[i] - f(x[i]))**2
    tmp2[i] = (x[i] - x_)**2
    tmp3[i] = x[i]**2
u_k = ((1/3) * (sum(tmp1)) / (sum(tmp2)))**0.5
u_b = ((1/3) * (sum(tmp1)) * sum(tmp3) / (sum(tmp2) / 5))**0.5
print(u_k)
print(u_b)