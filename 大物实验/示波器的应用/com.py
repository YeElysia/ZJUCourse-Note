data1 = [201.1, 401.4, 603.6, 804.2, 1004.4, 1203.2]

sum1 = 0
for i in range(len(data1)):
    fx = data1[i] / (i + 1)
    print(f"n={i+1}, fx={fx}")
    sum1 += fx

average_fx = sum1 / len(data1)
print(f"Average fx = {average_fx}")
print(f"相对误差{(average_fx - 200) / 200 * 100:.3f} %")


data2 = [49.970, 50.096, 50.084, 50.032, 50.004, 50.034]
print(f"{sum(data2)/len(data2)}")
print(f"相对误差{(sum(data2)/len(data2) - 50) / 50 * 100:.3f} %")
