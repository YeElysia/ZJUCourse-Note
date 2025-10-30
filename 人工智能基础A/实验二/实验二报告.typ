#import "@local/Typwork-some:0.1.1": styles


#show: styles.work.with(
  course: "人工智能基础A",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "实验报告二",
  level: "submit",
)

= 1.Python安装

#figure(
  image("image.png"),
  caption: [
    python官网下载地址
  ],
)

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


#box(
  width: 45%,
  figure(
    image("image-15.png"),
    caption: [
      Anaconda Prompt
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-25.png"),
    caption: [
      Anaconda Navigator
    ],
  ),
)

= 3.Anaconda的使用

== 3.1 虚拟环境管理
#image("image-35.png", width: 80%)

== 3.2 IDE安装
#box(
  width: 45%,
  figure(
    image("image-26.png"),
    caption: [
      Pycharm
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-27.png"),
    caption: [
      Visual Studio Code
    ],
  ),
)
== 3.3 Jupyter Notebook

#box(
  width: 75%,
  figure(
    image("image-19.png"),
    caption: [
      Jupyter Notebook
    ],
  ),
)

= 5. Python科学计算常用包的使用

== 5.1 Pandas
#image("image-28.png")

== 5.2 Numpy
#image("image-29.png")

== 5.3 Matplotlib
#image("image-30.png")


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
def Lorenz(t, state, sigma=10, rho=28, beta=8/3):
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
sol = solve_ivp(Lorenz, t_span, initial_state, t_eval=t_eval)

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
== 展示
#figure(
  image("image-31.png", height: 30%),
  caption: [
    Lorenz Attractor animation
  ],
)
#figure(
  image("image-32.png", height: 25%),
  caption: [
    Rossler Attractor animation
  ],
)

#figure(
  image("image-34.png", height: 25%),
  caption: [
    Tsucs animation
  ],
)



== 实验感受
通过本次《人工智能基础A》课程的实验二，我对人工智能开发环境的搭建及使用有了较为深入的了解和实践，收获颇丰，同时也遇到了一些问题，以下是具体的实验感受：

===== 一、收获
1. * 开发环境搭建技能提升 * ：成功搭建了Python开发环境，包括Python本身的安装以及Anaconda平台的部署，掌握了虚拟环境的创建、管理与切换，这为后续的人工智能项目开发奠定了坚实的基础。通过实践，我更加熟悉了命令行操作以及相关工具的使用，提升了对开发环境的掌控能力。
2. * IDE使用与代码编写效率 * ：安装并使用了PyCharm和Visual Studio Code这两种编程IDE，它们都提供了强大的代码编辑、调试等功能，极大地提高了代码编写的效率和质量。例如，代码自动补全、语法检查、断点调试等功能，让我能够更快速地定位和解决问题，减少了代码错误，提高了开发效率。
3. * Jupyter Notebook的便捷性体验 * ：Jupyter Notebook作为一个交互式计算环境，让我能够方便地进行数据分析、模型测试等操作。其可视化界面和交互式特性，使得代码的运行和结果展示更加直观，便于理解和分享。通过在Jupyter Notebook中编写和运行代码，我能够更好地进行实验和探索，快速验证想法和算法。
4. * 常用Python库的初步应用 * ：学习了pandas、numpy、matplotlib等常用Python库的使用方法，并通过具体的代码示例进行了实践。这些库在数据分析、科学计算和数据可视化方面具有强大的功能，让我能够更加高效地处理数据、进行数学计算以及绘制图表，为后续深入学习人工智能算法和模型提供了有力的支持。

==== 二、疑问
1. * 环境配置问题 * ：在安装和配置开发环境的过程中，遇到了一些兼容性和依赖问题。例如，某些Python包在特定版本的Anaconda环境中安装失败，需要尝试不同的版本或解决依赖冲突。这让我意识到环境配置的复杂性，也让我更加注重版本管理和依赖关系的处理。

==== 三、总结
本次实验是一次宝贵的学习经历，让我对人工智能开发环境的搭建和使用有了更深入的理解和实践。通过解决实验过程中遇到的问题，我不仅提升了自己的技术能力，也培养了解决问题的思维和方法。在后续的学习中，我将继续深入探索人工智能领域的知识和技术，不断优化和提升自己的开发水平，为未来的人工智能项目开发做好充分的准备。
