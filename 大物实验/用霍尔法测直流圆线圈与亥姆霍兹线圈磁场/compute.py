# 计算单线圈理论磁场强度分布
mu = 4e-7 * 3.141592653589793  # 真空磁导率μ0
I = 0.4  # 电流强度，单位安培
R = 0.1 # 圆线圈半径，单位米
N_0 = 400  # 圆线圈匝数

def B(X):
    z = X / 100  # 位置，单位米
    return (mu * I * N_0 * R**2) / (2 * (R**2 + z**2)**(3/2)) * 1e6  # 磁场强度公式

def compute_single_coil():
    # 计算单个圆线圈的轴向磁场强度分布
    for x in range(-10,11):
        B_x = B(x)
        print(f"x={x/100:.2f} m, B={B_x:.1f} T")

# compute_single_coil()

# 亥姆霍兹线圈
def B_HH(X):
    d = 10  # 亥姆霍兹线圈间距等于线圈半径
    return B(X - d/2) + B(X + d/2)

for x in range(-12,13):
    B_hh = B_HH(x)
    print(f"x={x/100:.2f} m, B_HH={B_hh:.1f} T")