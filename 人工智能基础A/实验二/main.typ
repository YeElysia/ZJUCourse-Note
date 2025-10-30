#import "@local/Typwork-some:0.1.0": homework

#let question = homework.question

#show: homework.style.with(
  course: "人工智能基础",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "实验二食用指南",
  level: "post",
)

#show raw.where(block: true): block.with(
  width: 100%,
  stroke: 1pt,
  radius: 5pt,
  breakable: true,
  inset: 5pt,
)



= 1.Python安装
python官网下载地址 #link("https://www.python.org/downloads/")

#figure(
  image("image.png"),
  caption: [
    python官网下载地址
  ],
)
\
这里不对python版本做出要求，因为后续会用conda管理虚拟环境，届时会对python的版本做出指定。你可以直接点击#highlight(`Download Python 3.13.2 `)安装最新可用版\

下载完成后双击打开安装包，勾选 #text(fill:red,`Add python.exe to Path`)并选择Customize installation\
如果你对python的安装路径没有特殊要求，可以在勾选后直接点击Install Now\
#box(
  width: 45%,
  figure(
    image("image-1.png"),
    caption: [
      python安装
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-3.png"),
    caption: [
      python安装
    ],
  ),
)

安装完成后win+R打开命令提示符，输入``` cmd```并回车，输入```bash  Python --version```，你会得到

#box(
  width: 45%,
  figure(
    image("image-2.png"),
    caption: [
      python安装完成
    ],
  ),
)

= 2.安装Anaconda
Anaconda官网下载地址 #link("https://www.anaconda.com/download")
#box(
  width: 45%,
  figure(
    image("image-4.png"),
    caption: [
      Anaconda官网下载
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-5.png"),
    caption: [
      Anaconda官网下载
    ],
  ),
)

点击绿色按钮下方的skip registration,点击Windows下方的 64-Bit Graphical Installer开始下载。\
不过我更推荐前往镜像站下载，如https://mirrors.zju.edu.cn/docs/anaconda/ ,国内镜像站下载速度更快\
点击文件列表-> achives/，找到Anaconda3-2024.10.-1-Windows-x86_64.exe，点击下载
#grid(
  columns: 2,
  grid(
    rows: auto,
    columns: auto,
    box(image("image-20.png")),
    box(image("image-21.png")),
  ),
  box(
    height: 45%,
    image("image-23.png"),
  ),
)
\
下载完成后双击打开安装包\

#box(
  width: 45%,
  figure(
    image("image-7.png"),
    caption: [
      安装界面
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-9.png"),
    caption: [
      安装界面
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-10.png"),
    caption: [
      安装界面
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-14.png"),
    caption: [
      安装界面
    ],
  ),
)
选择安装位置时可以选择任意自己喜欢的位置，但是保险起见请不要在路径中出现空格和中文字符，你可以使用最简单的路径，如 D:\/\/Anaconda\
考虑到观看此文档群众对anaconda的后续需求，#highlight("不推荐勾选Add Anaconda3 to my PATH environment variable")， 使用conda时请打开Anaconda Prompt\

// #image("image-11.png")
然后安装结束时这两项可选可不选。\
#box(
  width: 45%,
  figure(image("image-12.png")),
)

安装完成后点击win键，找到或搜素anaconda，打开Anaconda Prompt终端
#box(
  width: 45%,
  figure(
    image("image-13.png"),
    caption: [
      开始菜单
    ],
  ),
)

输入```bash conda -V``` 或 ```bash conda --version``` ，你会得到类似于下面的输出

#box(
  figure(
    image("image-15.png"),
    caption: [
      Anaconda Prompt
    ],
  ),
)

= 【附】 环境变量配置

你也可以在安装完成后，手动配置环境变量，从而在cmd中使用conda命令\

在设置中搜索 查看高级系统设置并打开

#box(
  width: 40%,
  figure(
    image("image-16.png"),
    caption: [
      设置
    ],
  ),
)
#box(
  width: 55%,
  figure(
    image("image-17.png"),
    caption: [
      高级系统设置
    ],
  ),
)

点击环境变量，找到下方系统变量中的Path，点击编辑
#grid(
  columns: 2,
  box(
    width: 80%,
    figure(
      image("image-18.png"),
      caption: [
        环境变量
      ],
    ),
  ),
  box(
    figure(
      align(left)[
        点击新建并增加以下五条目录（注意根据实际安装目录更改）

        - D:\\\\Anaconda

        - D:\\\\Anaconda\\Scripts

        - D:\\\\Anaconda\\Library\\mingw-w64\\bin

        - D:\\\\Anaconda\\Library\\usr\\bin

        - D:\\\\Anaconda\\Library\\bin

        然后你可以在cmd或powershell中使用conda
      ],
    ),
  ),
)

= 3.Anaconda的使用

== 3.1 虚拟环境管理
我#text(fill:red,"不推荐")使用Anaconda Navigator来可视化管理虚拟环境，并衷心希望你能学会使用命令行工具。
所以请打开一个能使用conda的终端，如Anaconda Prompt，并利用以下命令来管理虚拟环境\

- 创建虚拟环境
```bash
conda create -n [虚拟环境名称] python=[python版本]
conda create -n zju-yee python=3.10.16
# 如果你不指定python版本，conda会默认安装最新版本的python。
```
- 查看所有虚拟环境
```bash
conda env list
conda info --envs
#两者输出一致，如下所示。base是默认的虚拟环境，已经安装好了大多数常见的python包
# conda environments:
#
#base                 * /home/yee/conda
#zju                   /home/yee/conda/envs/zju-yee
```
- 激活虚拟环境
```bash
conda activate [虚拟环境名称]
conda activate zju-yee
# 打开终端时默认激活base环境，需要手动激活你需要的虚拟环境
```
- 退出虚拟环境
```bash
conda deactivate
# 退出当前虚拟环境，返回到base环境。你也可以选择conda activate base切换到base环境，效果一致
```
- 删除虚拟环境
```bash
conda remove -n [虚拟环境名称] --all
conda remove -n zju-yee --all

# 你也可以移除虚拟环境中的所有包来重新配置一个虚拟环境
# conda remove zju-yee --all --keep-env
# 如果你遗忘了conda remove的参数，可以使用conda remove -h查看帮助
```

接下来我将教你如何安装一些常用的python包\
首先进行换源配置，我常用的源是清华源，中科大源，如果你想的话，也可以使用浙大的源。\

先更换pip源，打开你的终端，挑选输入以下的一个命令即可
```bash
pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple # 清华源
pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple # 中科大源
pip config set global.index-url https://mirrors.zju.edu.cn/pypi/web/simple # 浙大源
```
更换pip源的原因是我更推荐使用pip来安装python包，conda源能查找到的包有限，非pytorch相关包我都推荐使用pip来安装\

接下来更换conda源，先打开终端，输入以下命令
```bash
conda config --set show_channel_urls yes
# windows系统限制了 .condarc 文件的权限, 你无法直接新建它
```
然后打开资源管理器，在地址栏输入```bash %USERPROFILE% ```，找到并打开` .condarc `文件，你可以在打开方式中选择记事本。\
选其一输入
```yaml
# 清华
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

```yaml
# 中科大
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/main
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/r
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.ustc.edu.cn/anaconda/cloud
  bioconda: https://mirrors.ustc.edu.cn/anaconda/cloud
```

```yaml
# 浙大
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.zju.edu.cn/anaconda/pkgs/main
  - https://mirrors.zju.edu.cn/anaconda/pkgs/r
  - https://mirrors.zju.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.zju.edu.cn/anaconda/cloud
  msys2: https://mirrors.zju.edu.cn/anaconda/cloud
  bioconda: https://mirrors.zju.edu.cn/anaconda/cloud
  menpo: https://mirrors.zju.edu.cn/anaconda/cloud
  pytorch: https://mirrors.zju.edu.cn/anaconda/cloud
  pytorch-lts: https://mirrors.zju.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.zju.edu.cn/anaconda/cloud
  nvidia: https://mirrors.zju.edu.cn/anaconda-r
```
之后运行```bash conda clean -i ```清除缓存, 你就可以使用国内镜像源来安装python包了\

\ \

接下来安装一些常用的python包
```bash
# 安装numpy
pip install numpy
# 安装pandas
pip install pandas
# 安装matplotlib
pip install matplotlib
# 安装scipy

# 如果你安装错了某个包，可以使用以下命令来删除它
pip uninstall [包名]
pip uninstall numpy

# 你也可以指定版本号来安装
pip install numpy==[版本号]
pip install numpy==2.2.3
pip install numpy>=2.2.3
# 你可以使用以下运算符来限定版本：==、>=、<=、>、<。
```

== 3.2 IDE安装
这里跳过ide安装。如果对ide安装确有问题的，联系我补充该条目

== 3.3 Jupyter Notebook
Jupyter Notebook可以在Anaconda Navigator中点击Launch打开，也可以直接在下方位置点击Jupyter Notebook打开，然后浏览器会弹出类似于以下的界面，

#box(
  width: 24%,
  figure(
    image("image-13.png"),
    caption: [
      开始菜单
    ],
  ),
)
#box(
  width: 75%,
  figure(
    image("image-19.png"),
    caption: [
      Anaconda Navigator
    ],
  ),
)

原始目录在C:\Users\zju-yee(C:\Users\%username%)，zju-yee是我的用户名，在你的电脑上是你的用户名

如果想在其他目录打开，可以在命令行中输入 `jupyter notebook [项目路径]`
= 4. Mo平台的使用
实验2.doc 中提到的mo课程好像没有， \
但是可以fork该项目 https://mo.zju.edu.cn/explore/66df275f634e8cd1b0bc0458?type=app 的 notebook。

= 5. Python科学计算常用包的使用

== 5.1 Pandas
Pandas是python中最常用的数据分析库，提供了一维数据结构Series和二维数据结构DataFrame，以及配套的数据处理和数据分析的函数。

具体使用方法可以参考官方文档 #link("https://pandas.pydata.org/docs/")
我只贴出实验二中的作业代码
```python
# 题目
import pandas as pd
data = {
    "products" : ["Phone", "Laptop","Pad", "Earphone", "Smart Watch",
    "Camera", "Television", "Speaker", "Printer", "Router"],
    "Sales" : [150, 80, 90,200,120, 60,50,130,70,40],
    "Prices($)" : [3000, 6000, 2000, 800, 1500, 5000, 4000, 1500, 1000, 600],
    "Sold Date" : pd.date_range(start="2025-01-01", periods=10, freq='D')
}
df = pd.DataFrame(data)
print(df)

# (1)筛选出销售量大于 100 的产品
print(df[df["Sales"]>100])

# (2)按销售量从大到小排序并输出
print(df.sort_values(by='Sales', ascending=False)) # ascending=False表示降序

# (3)计算所有产品的平均销售量
print(df['Sales'].mean())

# (4)计算每种产品的总销售额，并添加总销售额为新列
df['Total Sales($)'] = df['Sales'] * df['Prices($)']
print(df)
```

== 5.2 Numpy
Numpy是python中最常用的数值计算库，提供了多维数组对象ndarray和配套的数学函数库。
具体使用方法可以参考官方文档 #link("https://numpy.org/doc/stable/")

我只贴出实验二中的作业代码
```python
import numpy as np

#（1)	创建一个从1到20 的NumPy 一维数组，并筛选出偶数
a=np.arange(1,21)
print(a)
b=a[a%2==0]
print(b)

#（2)	计算并输出一维数组的均值、标准差、最大值、最小值
mean = a.mean()
std = a.std()
max = a.max()
min = a.min()
print(f"均值:{mean}, 标准差:{std}, 最大值:{max}, 最小值:{min}")

#（3)	任意创建一个NumPy 二维数组，然后进行形状变换
c = np.array([[1,2,3],[4,5,6],[7,8,9]])
print(c)
d = c.reshape(1,9)
print(d)

#（4)	再创建一个二维数组（注意如何设定形状才能进行矩阵乘法），与上面的二维数组进行矩阵乘法运算
e = np.array([[4,5,6],[7,8,9],[1,2,3]])
result = c @ e  # result = np.dot(c,e)
print(result)

#（5)	生成4行3列的随机数组
f = np.random.rand(4,3)
#你也可以生成随机整数，函数参数分别为最小值、最大值、形状
# f = np.random.randint(0,10,(4,3))
print(f)
```

== 5.3 Matplotlib
Matplotlib是python中最常用的绘图库，提供了丰富的绘图函数和配套的绘图工具。
具体使用方法可以参考官方文档 #link("https://matplotlib.org/stable/users/index.html")

我只贴出实验二中的作业代码
```python
# 以下代码来自官方文档
# https://matplotlib.org/stable/gallery/mplot3d/lorenz_attractor.html

import matplotlib.pyplot as plt
import numpy as np


def lorenz(xyz, *, s=10, r=28, b=2.667):
    """
    Parameters
    ----------
    xyz : array-like, shape (3,)
       Point of interest in three-dimensional space.
    s, r, b : float
       Parameters defining the Lorenz attractor.

    s is the Prandtl number, 普朗特数
    r is the Rayleigh number,  瑞利数
    b is the aspect ratio,
    These parameters define the system's behavior. 这些参数定义了系统的行为

    Returns
    -------
    xyz_dot : array, shape (3,)
       Values of the Lorenz attractor's partial derivatives at *xyz*.
    """
    x, y, z = xyz
    x_dot = s*(y - x)
    y_dot = r*x - y - x*z
    z_dot = x*y - b*z
    return np.array([x_dot, y_dot, z_dot])


dt = 0.01
num_steps = 10000


xyzs = np.empty((num_steps + 1, 3))  # Need one more for the initial values 需要多一个初始值
xyzs[0] = (0., 1., 1.05)  # Set initial values 设定初始值
# Step through "time", calculating the partial derivatives at the current point
# dt，计算当前点的偏导数
# and using them to estimate the next point 使用它们来估计下一个点
for i in range(num_steps):
    xyzs[i + 1] = xyzs[i] + lorenz(xyzs[i]) * dt

# Plot
ax = plt.figure().add_subplot(projection='3d')

ax.plot(*xyzs.T, lw=0.5)
ax.set_xlabel("X Axis")
ax.set_ylabel("Y Axis")
ax.set_zlabel("Z Axis")
ax.set_title("Lorenz Attractor")

plt.show()
```

它的输出如下
#image("image-24.png")

=== other
```python ax.plot()``` 中，lw表示线宽，ls表示线型，color表示颜色\
例：
```python ax.plot(x, y, lw=0.5, ls='solid', color='blue')```\
```python ax.plot(x, y, lw=0.5, ls='dashed', color='red')```\
如果想更改figure朝向，可以使用```py ax.view_init(elev=30, azim=45, roll=45) ```来调整视角。\

= Animation
```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from scipy.integrate import solve_ivp

# 洛伦兹吸引子
def lorenz(t, state, sigma=10, rho=28, beta=8/3):
    x, y, z = state
    dx = sigma * (y - x)
    dy = x * (rho - z) - y
    dz = x * y - beta * z
    return [dx, dy, dz]
#  0.1 0.1 0.1

def Rossler(t, state, a=0.2, b=0.2, c=5.7):
    x, y, z = state
    dx = -y - z
    dy = x + a * y
    dz = b + z * (x - c)
    return [dx, dy, dz]
# 0.1 0.1 0.1

# https://www.researchgate.net/publication/265811017_A_New_Three-Scroll_Unified_Chaotic_System_Coined

def Tsucs(t, state, a=40, c=0.833, d = 0.5, e = 0.65, f = 20):
    x, y, z = state
    dx = a *( y - x) + d * x * z
    dy =  -x *z + f * y
    dz = -e * x * x + x * y +c * z
    return [dx, dy, dz]
# 0.1 1.0 -0.1

# 初始条件
initial_state = [0.1, 0.1, 0.1]
t_span = (0, 50) # 时间范围
t_eval = np.linspace(*t_span, 500) # 时间点, initial_state较小时，建议调小

# 数值求解
sol = solve_ivp(Rossler, t_span, initial_state, t_eval=t_eval)

# 获取计算结果
x, y, z = sol.y

# 创建 3D 图形
fig = plt.figure(figsize=(8, 6))
ax = fig.add_subplot(projection='3d')
ax.set_xlim(min(x), max(x))
ax.set_ylim(min(y), max(y))
ax.set_zlim(min(z), max(z))
ax.set_xlabel("X Axis")
ax.set_ylabel("Y Axis")
ax.set_zlabel("Z Axis")
ax.set_title("Lorenz Attractor - 3D Animation")

# 轨迹线（动态更新）
line, = ax.plot([], [], [], lw=0.7, color='blue')

# 初始化函数
def init():
    line.set_data([], [])
    line.set_3d_properties([])
    return line,

# 动画更新函数
def update(frame):
    line.set_data(x[:frame], y[:frame])
    line.set_3d_properties(z[:frame])
    return line,

# 创建动画
ani = animation.FuncAnimation(fig, update, frames=len(t_eval), blit=False, interval=10)

# 显示动画
plt.show()

```
