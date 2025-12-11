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
    ("33.4", "4.805"),
    ("38.4", "4.914"),
    ("43.8", "5.015"),
    ("48.8", "5.122"),
    ("53.3", "5.215"),
    ("58.5", "5.328"),
    ("63.3", "5.450"),
    ("68.8", "5.572"),
    ("73.4", "5.688"),
    ("78.3", "5.802"),
]
sum = 0.0
for i in range(1, 10):
    alpha = (float(data[i][1]) - float(data[i - 1][1])) / (
        float(data[i - 1][1]) * (float(data[i][0]) - float(data[i - 1][0]))
    )
    sum += alpha
    print(f"{alpha:.2e},", end="")
print(f"\n平均值: {sum/9:.2e}")
