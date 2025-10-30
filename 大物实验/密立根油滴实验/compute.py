import math

rho = 981
g = 9.79
eta = 1.83e-5
b = 6.17e-6
p = 76
d = 5.00e-3
l = 1.5e-3
pi = 3.14

def compute(u, t):
    """
    计算油滴电荷量
    
    参数:
    u -- 平衡电压 (V)
    t -- 下落时间 (s)
    
    返回:
    q -- 油滴电荷量 (C)
    """
    # 初始估计半径（忽略修正项）
    r_initial = math.sqrt(9 * eta * l / (2 * rho * g * t))
    
    # 迭代计算更精确的半径（考虑修正项）
    r = r_initial
    for i in range(5):
        r = math.sqrt(9 * eta * l / (2 * rho * g * t * (1 + b/(p*r))))
    
    # 计算电荷量
    q = (18 * math.pi / math.sqrt(2 * rho * g)) * (eta * l / (t * (1 + b/(p*r))))**1.5 * (d / u)

    n = round(q / 1.6e-19)

    q_approx = q / n
    # print(f"n={n} q_approx={q_approx:.4e} C")
    # 输出误差
    # print(f"误差={abs(1.6e-19 -  q_approx)/1.6e-21:.2}%")
    return q
data = [
    (183, 1.2),
    (159, 3.02),
    (81, 7.95),
    (44, 11.01),
    (85, 3.55),
    (150, 6.65),
    (168, 9.98),
    (224, 23.15),
    (166, 9.78),
    (169, 11.09),
    (105, 10.04),
    (92, 15.71),
    (70,16.77),
    (55,15.55),
    (143,10.17),
    (205,12.28),
    (168,14.07),
    (174,13.45),
    (183,12.37),
    (155,12.01),
]
i=0
val = []
for u, t in data:
    i+=1
    _q = compute(u, t)
    # q保留3位有效数字
    q = round(_q*1e19, 2)
    if q < 30:
        val.append(q)
    n = round(_q / 1.6e-19)

    q_approx = _q / n

    if False or n < 15:
        continue
        print(f"([{i}], [{u}], [{t:.2f}], [{q:.2f}], [{n}]),")

val.sort()
print(val)
for i in range(len(val)):
    # print(f"([{i+1}], [{val[i]}], [{val[i+1]-val[i]:.2f}]),")
    print(f"([{i+1}], [{val[i]}], [{val[i]/1.58:.2f}],[{round(val[i]/1.58)}],[{val[i]/round(val[i]/1.58):.2f}]),")
