# 计算a类不确定度

from math import sqrt

def calculate_type_a_uncertainty(B_values):
    n = len(B_values)
    mean_B = sum(B_values) / n
    return sqrt(sum((B - mean_B) ** 2 for B in B_values) / (n * (n - 1)))


# 地磁场数据

A = [-33, -29, -29, -32, -28, -26]
type_a_uncertainty_A = calculate_type_a_uncertainty(A)
print(f"A类不确定度: {type_a_uncertainty_A:.2f} mu T")

B = [28,25,23,24,28]
type_a_uncertainty_B = calculate_type_a_uncertainty(B)
print(f"B类不确定度: {type_a_uncertainty_B:.2f} mu T")
