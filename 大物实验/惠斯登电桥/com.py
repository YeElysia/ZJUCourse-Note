print((222.2 * 222.1) ** 0.5)

print(((0.001 + 0.002 * 6 / 222.1) ** 2 + (0.2 / 31094) ** 2) ** 0.5)

data = [680.7, 679.4, 678.8, 677.9, 683.2, 677.8, 678.5, 682.6]
mean = sum(data) / len(data)
std_dev = (sum((x - mean) ** 2 for x in data) / (len(data) - 1)) ** 0.5
print(mean)
print(std_dev)

print((std_dev / mean) * 100)
