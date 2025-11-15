# 计算A类不确定度


def A_type_uncertainty(data):
    import math

    n = len(data)
    if n < 2:
        raise ValueError("数据点数量必须至少为2以计算不确定度。")

    mean = sum(data) / n
    print("平均值:", mean)
    # mean = round(mean, 2)
    variance = sum((x - mean) ** 2 for x in data) / (n**2 - n)
    stddev = math.sqrt(variance)
    uncertainty = round(stddev, 4)
    print("A类不确定度:", uncertainty)


# test
data = [
    1.58,
    1.54,
    1.56,
    1.59,
    1.48,
    1.60,
    1.66,
    1.57,
    1.57,
    1.64,
    1.53,
    1.63,
    1.60,
    1.56,
]

# 示波器1
data = [196.960, 197.240, 197.273, 197.395, 197.560, 197.317]
data = [201.1, 200.7, 201.2, 201.05, 200.88, 200.533]
# 示波器2
data = [49.970, 50.096, 50.084, 50.032, 50.004, 50.034]
A_type_uncertainty(data)
