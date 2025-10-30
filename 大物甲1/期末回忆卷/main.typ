#import "@preview/cetz:0.4.2"

#set text(12pt, font: ("Maple Mono NF", "LXGW WenKai"))
#set par(justify: true, leading: 1em, first-line-indent: 2em)
#set par(spacing: 1.24em)
#set page(header: {
  set text(10pt, baseline: 8pt, spacing: 3pt)
  grid(
    columns: (auto, 1fr),
    align(left, "大学物理 I"), align(right, "猫娘小蛋糕烘培组/暮云"),
  )

  line(length: 100%, stroke: 0.7pt)
})

#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,
    right: 3cm,
  ),
)

#set heading(numbering: "一、")
#set enum(numbering: "1.A.")
#align(center)[
  #text(size: 20pt, weight: "regular")[浙江大学 2024-2025 学年春夏学期]
  #v(-1em)
  #text(size: 14pt, weight: "regular")[《大学物理 I》期末回忆卷]
]

= 选择题
+ 有一质点做匀速率圆周运动，则它的动量和角动量变化情况为（）：
  + 动量不变，角动量不变
  + 动量不变，角动量变化

  + 动量变化，角动量不变
  + 动量变化，角动量变化
+ 长2l的刚性轻杆可绕通过杆的一端并与杆垂直的光滑水平轴在竖直平面内转动，在杆上离轴l处和另一端分别有一个质量为4m的小球a和质量为m的小球b（均可视作质点）。现将杆在水平位置无初速度释放，当小球b运动至最低点时，下列描述正确的是：
  #grid(
    columns: (auto, auto),
    gutter: 10em,
    [
      + 系统机械能不守恒
      + 棒不做功
      + A对B做功
      + B对A做功
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        //line((-1, 1), (1, 1), stroke: 1pt)
        arc((0.3, 0.3), start: 0deg, delta: -180deg, radius: 0.3, mode: "CLOSE")
        line((0, 0), (4, 0), stroke: 2pt)
        circle((2, 0), radius: 0.2, fill: white, name: "A")
        circle((4, 0), radius: 0.2, fill: white, name: "B")
        content("A.south", [A], anchor: "north", padding: 4pt)
        content("B.south", [B], anchor: "north", padding: 4pt)
        line((0, 0), (0, -4), stroke: (thickness: 2pt, dash: "dashed"))
      })
    ],
  )

+ 假设一粒子的速度v与时刻t满足$v=v_0 sqrt(1-(t/T)^2)$，其中T为常量，则该粒子在时间[0,T]内的平均速度为:
  + $v_0$
  + $v_0/2$
  + $pi/4 v_0$
  + 待后续讨论（

+ 一飞船以0.8c（c是光速）飞离地球，飞船上的人测得飞船长度为90m。现有一光脉冲从船头发射，在船尾接收，则在地球上观测的发射和接收两个事件的空间间隔是:
  + 54m
  + 90m
  + 126m
  + 270m

+ 两个小球的静止质量均为m。若其中一个以0.8c（c是光速）的速度与另一个静止的发生完全非弹性碰撞，，则碰后黏合体的静止质量是:
  + $m$
  + $4/3 m$
  + $frac(4sqrt(3), 9) m$
  + $8/3 m$

+ 一简谐波沿绳传播，a，b是绳上两点，它们的振动曲线如图所示，则和b相比，a的相位:
  #grid(
    columns: (auto, auto),
    gutter: 10em,
    [
      + 落后$pi$
      + 落后$pi/2$
      + 超前$pi/2$
      + 超前$pi$
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        //line((-1, 1), (1, 1), stroke: 1pt)
        line((-1, 0), (8, 0), mark: (end: "straight"), name: "x")
        line((0, -1), (0, 2), mark: (end: "straight"), name: "y")
        bezier((0, 0), (3.14, 0), (1.57, 2), stroke: 1pt)
        bezier((3.14, 0), (6.28, 0), (4.71, -2), stroke: 1pt)
        bezier((-1.57, 0), (1.57, 0), (0, 2), stroke: (thickness: 1pt, dash: "dashed"))
        bezier((1.57, 0), (4.71, 0), (3.14, -2), stroke: (thickness: 1pt, dash: "dashed"))
        bezier((4.71, 0), (7.85, 0), (6.28, 2), stroke: (thickness: 1pt, dash: "dashed"))
        rect((-1.57, 0.05), (-0.02, 1.05), fill: white, stroke: 0pt)
        rect((-1.57, 0.05), (-0.02, 1.05), fill: white, stroke: 0pt)
        rect((6.26, 0.05), (7.77, 1.05), fill: white, stroke: 0pt)
        rect((-1.58, -1), (-1, 1), fill: white, stroke: 0pt)

        content("x.end", [t], anchor: "west", padding: 2pt)
        content("y.end", [y], anchor: "west", padding: 2pt)
      })
    ],
  )


+ 一简谐波沿绳传播，a,b为绳上相距20m的两点。已知t=2s时，a在波峰，b在平衡位置；t=4s时，a在波谷，b在平衡位置。则关于该简谐波，下列说法正确的是:
  + 最小频率为$0.25H z$
  + 波长为$40m$
  + 波长可能为$40/3m$
  + 最小波速为$20 m \/ s$

+ 一波源的频率为100kHz。现有一辆汽车朝向波源行驶，并反射该波，波源接受到的反射波的频率是110kHz。假设波传播的速度为340m/s，则车的速度为:
  选项待后续讨论修改
+ 一定量的气体在刚性容器中绝热自由膨胀，膨胀后的体积是膨胀前的2倍，设膨胀前后的温度分别为$T_1$,$T_2$,气体平均自由程为$lambda_1$,$lambda_2$,则:
  + $T_1 eq T_2, lambda_1 eq lambda_2$
  + $T_1 eq T_2, lambda_1 eq 2lambda_2$
  + $T_1 eq 2T_2, lambda_1 eq lambda_2$
  + $T_1 eq 2T_2, lambda_1 eq 2lambda_2$

  #v(6em)
+ 如图是a,b过程的p-V曲线，则:

  #grid(
    columns: (auto, auto),
    gutter: 4em,
    [
      + a是吸热过程，b是吸热过程
      + a是吸热过程，b是放热过程
      + a是放热过程，b是吸热过程
      + a是放热过程，b是放热过程
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        //line((-1, 1), (1, 1), stroke: 1pt)
        line((-0.5, 0), (2, 0), mark: (end: "straight"), name: "x")
        line((0, -0.5), (0, 2), mark: (end: "straight"), name: "y")
        bezier((0.2, 1.6), (1.6, 0.2), (0.2, 0.2), stroke: 1pt, name: "a1")
        content("x.end", [p], anchor: "west", padding: 2pt)
        content("y.end", [V], anchor: "west", padding: 2pt)
        //content("a1.mid", [a1], anchor: "south east", padding: 2pt)
        content("x.mid", [绝热], anchor: "north", padding: 5pt)
        content("y.start", [a], anchor: "north", padding: 5pt)
        line((3.5, 0), (6, 0), mark: (end: "straight"), name: "x1")
        line((4, -0.5), (4, 2), mark: (end: "straight"), name: "y1")
        bezier((4.2, 1.6), (5.6, 0.2), (4.2, 0.2), stroke: 1pt, name: "a2")
        content("x1.end", [p], anchor: "west", padding: 2pt)
        content("y1.end", [V], anchor: "west", padding: 2pt)
        //content("a1.mid", [a1], anchor: "south east", padding: 2pt)
        content("x1.mid", [等温], anchor: "north", padding: 5pt)
        content("y1.start", [b], anchor: "north", padding: 5pt)
      })
    ],
  )



+ 如图所示，外壁均绝热的A、B两室，A室的上壁是一可自由滑动的绝热活塞，两室中间有一可导热的固定隔板，板上有一阀门，开始时，阀门关闭，A室内装有1 mol 温度为$T_1$的平衡态单原子理想气体，B室内为真空，此时A、B两室的容积相同，若将A、B间阀门微微打开，则气体逐渐进入B室， A室活塞也随之下降，最后达到一新的平衡态，问熵变$Delta S$?
  + $0$
  + $3/2 R ln(5/3)$
  + $5/2 R ln(7/5)$
  + $7/2 R ln(9/7)$

+ 真空中有两个固定的点电荷，大小分别是+2q与-q，则在两个点电荷的连线（不包括点电荷）上，场强的分布情况为
  + 存在一点场强大小为0
  + 最多有两点场强大小相同，且方向相反
  + 最多有三点场强大小相同，且方向不完全相同
  + 最多有三点场强大小相同，且方向完全相同


= 计算题

+ 有两无限长电容板，A板带负电$-q_1 eq -17.7 times 10^(-8)$，B板带正电$q_2 eq 35.4 times 10^(-8)$，求:两板间及两边的电场强度。
  #cetz.canvas({
    import cetz.draw: *
    line((0, -0.5), (0, 2), name: "y")
    line((2, -0.5), (2, 2), name: "y1")
    content("y.end", [A], anchor: "south", padding: 5pt)
    content("y1.end", [B], anchor: "south", padding: 5pt)
  })

  #v(10em)
+
  如图所示，固定斜面上有一重M的实心圆轮，连接在轻质弹簧一端，弹簧另一端固定，劲度系数k，原长为l。初始状态弹簧与鞋面垂直，此时为原长。现圆轮从鞋面上滚下

  (1) 求弹簧铅直时圆轮的速度v;

  (2) 若圆轮做纯滚动，问$mu$的限制。
  #image("007.jpg", width: 10em)

+ 一简谐波，50Hz,200m/s。t=0时，x=0处质点在平衡位置向y正方向运动。求:

  (1) y(4,t)

  (2) v(4,2)

+ 原点正方向上有一点P,距原点距离为d, 已知P点振动如图

  (1) 写出P点的振动方程

  (2) 求原点波动方程

  (3) 若$d eq lambda/2$, 求原点振动方程
  #cetz.canvas({
    import cetz.draw: *
    //line((-1, 1), (1, 1), stroke: 1pt)
    line((-1, 0), (9, 0), mark: (end: "straight"), name: "x")
    line((0, -2), (0, 2), mark: (end: "straight"), name: "y")
    bezier((-1.57, 0), (1.57, 0), (0, -2), stroke: (thickness: 1pt))
    bezier((1.57, 0), (4.71, 0), (3.14, 2), stroke: (thickness: 1pt))
    bezier((4.71, 0), (7.85, 0), (6.28, -2), stroke: (thickness: 1pt))
    rect((-1.57, -0.05), (-0.02, -1.05), fill: white, stroke: 0pt)
    rect((-1.57, -0.05), (-0.02, -1.05), fill: white, stroke: 0pt)
    //rect((6.26, -0.05), (7.77, -1.05), fill: white, stroke: 0pt)
    rect((-1.58, 1), (-1, -1), fill: white, stroke: 0pt)

    circle((1.57, 0), radius: 0, fill: white, name: "1")
    content("1", [1], anchor: "north", padding: 5pt)

    circle((0, -1), radius: 0, fill: white, name: "1")
    content("1", [-A], anchor: "east", padding: 5pt)

    content("x.end", [t], anchor: "west", padding: 2pt)
    content("y.end", [y], anchor: "west", padding: 2pt)
  })

  #v(8em)

+ 下图为某气体分子（原子？）的速率分布曲线，求：

  (1) $f(v)$

  (2) $a$

  (3) $Delta N, v in (0.5v_0, 1.2v_0)$

  (4) $overline(v)$

  #cetz.canvas({
    import cetz.draw: *
    //line((-1, 1), (1, 1), stroke: 1pt)
    line((-1, 0), (6, 0), mark: (end: "straight"), name: "x")
    line((0, -1), (0, 3), mark: (end: "straight"), name: "y")

    line((0, 0), (2, 2))
    line((2, 2), (4, 2))

    line((0, 2), (2, 2), stroke: (dash: "dashed"), name: "1")
    line((2, 0), (2, 2), stroke: (dash: "dashed"), name: "2")
    line((4, 0), (4, 2), stroke: (dash: "dashed"), name: "3")

    content("1.start", [$a$], anchor: "east", padding: 2pt)
    content("2.start", [$v_0$], anchor: "north", padding: 2pt)
    content("3.start", [$2v_0$], anchor: "north", padding: 2pt)
    content("x.end", [$v$], anchor: "west", padding: 2pt)
    content("y.end", [$f(v)$], anchor: "west", padding: 2pt)
  })

+ 有一容器顶部为$0 ℃, 1 a t m$,活塞从顶部绝热压缩至$1/3$处，再加热膨胀至$2/3$处，然后绝热膨胀至顶部。取消容器绝热，使其慢慢恢复至原状态。

  (1) 画出p-V图

  (2) 算出各状态温度

  (3) 求吸放热。

  #cetz.canvas({
    import cetz.draw: *
    //line((-1, 1), (1, 1), stroke: 1pt)
    line((1.3, 4), (0, 4), (0, 0), (4, 0), (4, 4), (2.7, 4))
    line((2, 5), (2, 1.4))
    line((0, 1.4), (4, 1.4), stroke: 2pt)
    line((0, 1.2), (4, 1.2), stroke: 2pt)
  })
