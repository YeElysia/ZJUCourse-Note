from math import e


R = 4.391e-4
# R = 6.024e-4
L = 20.00e-2
# L = 2.699e-1
d = 4.10e-3
pi = 3.141592653589793

rho = R * pi * d**2 / (4 * L)
print("电阻率 rho =", rho, "Ohm m")

u_rho = rho * ((1.2e-6 / R) ** 2 + (2 * 1.2e-5 / d) ** 2 + (2.9e-4 / L) ** 2) ** 0.5
print("电阻率不确定度 u_rho =", u_rho, "Ohm m")

data = [
    ("33.4", "4.935"),
    ("38.4", "5.034"),
    ("43.8", "5.145"),
    ("48.8", "5.242"),
    ("53.3", "5.335"),
    ("58.5", "5.448"),
    ("63.3", "5.550"),
    ("68.8", "5.662"),
    ("73.4", "5.728"),
    ("78.3", "5.782"),
]
sum = 0.0
for i in range(1, 10):
    alpha = (float(data[i][1]) - float(data[0][1])) / (
        float(data[0][1]) * (float(data[i][0]) - float(data[0][0]))
    )
    sum += alpha
    print(f"{alpha:.2e},", end="")
print(f"\n平均值: {sum/9:.2e}")
