#import "../phylab.typ": phylab
#import "@preview/cetz:0.4.2"

#show: phylab.with(
  name: "光电效应测定普朗克常量",
  instructor: "熊鹏越",
  class: "机械2402",
  author: "叶畅飞",
  author-id: "3240103132",
  date: datetime(year: 2025, month: 9, day: 23),
  week: "第1周",
  am-pm: "下午",
)

// 此处填写正文，如：


= 预习报告（10分）
== 实验综述（5分）
#grid(columns: (1fr,1.5fr), gutter:3em,inset: 1em,
  
box(stroke: none)[
  #v(1em)
  #h(2em)光电效应实验示意图如左图所示，图中 GD 为光电管，K、A 分别为光电管的阴极、阳极，
G是微检流计，V为电压表，E为电源，R为滑动变阻器，调节R可以得到实验所需要的电位差$𝑈_(A K)$，使光电管的 A、K 之间有从-U到+U连续变化的电压，从而得到截止电压。

  实验中汞灯透过滤光片得到不同波长的单色光照射光电管的阴极 K，使其发射光电子，
光电子在电场力作用下到达阳极 A，形成光电流。

],
box(stroke: none)[
#cetz.canvas({
  import cetz.draw: *
  circle((4, 3), radius: 1, stroke: 1pt, name: "GD")
  content((name: "GD", anchor: 160deg), [#text(15pt)[GD]], anchor: "south-east")
  arc((3.6, 3 + 0.8 * 0.855), start: 120deg, stop: 240deg, radius: 0.8, name: "K")
  content((name: "K", anchor: 270deg), [#text(15pt)[*K*]], anchor: "west", padding: 6pt)
  circle((4, 3), radius: 0.1, name: "A")
  content((name: "A", anchor: 60deg), [#text(15pt)[*A*]], anchor: "south-west", padding: 2pt)
  line((3.8, 3.2), (3.4, 2.8), mark:((end: ">", fill: black,stroke:0pt)))
  line((3.8, 3.4), (3.4, 3), mark:((end: ">", fill: black,stroke:0pt)))
  line((3.8, 3), (3.4, 2.6), mark:((end: ">", fill: black,stroke:0pt)))
  line((0, 3), (3, 3))
  line((4.1, 3), (8, 3))
  line((0, 3), (0, 2))
  circle((0, 1.5), radius: 0.5, stroke: 1pt, name: "G")
  content("G", [#text(20pt)[G]])
  line((0, 1), (0, 0), (3.5, 0))
  circle((4, 0), radius: 0.5, stroke: 1pt, name: "V")
  content("V", [#text(20pt)[V]])
  line((4.5, 0), (8, 0), (8, 3))
  line((0,0),(0,-4),(4,-4),(4,-3))
  line((3,-3),(5,-3))
  line((3,-2.6),(3,-3.4))
  line((2.8,-2.8),(2.8,-3.2))
  line((2.6,-2.6),(2.6,-3.4),name:"E")
  content((name: "E"), [#text(15pt)[*E*]], anchor: "south-east", padding: 8pt)
  content((name: "E"), [#text(15pt)[*-U*]], anchor: "north-east", padding: 8pt)
  line((2.4,-2.8),(2.4,-3.2))
  line((5.6,-2.6),(5.6,-3.4),name:"U")
  line((5.4,-2.8),(5.4,-3.2))
  line((5.2,-2.6),(5.2,-3.4),name:"E")
  content((name: "E"), [#text(15pt)[*E*]], anchor: "south-east", padding: 8pt)
  content((name: "U"), [#text(15pt)[*+U*]], anchor: "north-west", padding: 8pt)
  line((5,-2.8),(5,-3.2))
  line((2.4,-3),(1.4,-3),(1.4,-2),(2.4,-2))
  rect((2.4,-1.8), (6.5,-2.2),name: "R")
  content((name: "R"), [#text(15pt)[*R*]], anchor: "south-east", padding: 8pt)
  line((6.5,-2),(8,-2),(8,-3),(5.6,-3))
  line((8,-2),(8,0))
  line((4.45,-1),(8,-1))
  line((4.45,-1),(4.45,-1.8),mark:((end:">",fill: black)))
  line((4,-4),(4,-4.3))
  line((3.6,-4.3),(4.4,-4.3))
  line((3.75,-4.4),(4.25,-4.4))
  line((3.9,-4.5),(4.1,-4.5))
})
]
)

#v(-5em)
*实验现象*：

    - 无光照时：阴极K无电子发射，回路无电流（G读数为零）。

    - 有光照时：阴极K发射光电子，形成光电流（G有读数）。

        - 当$U_(A K)>0$（阳极A正电压高于阴极K）时，电子被加速飞向阳极，光电流随$U_(A K)$增大而增大，最终达到饱和值$I_H$（与光强成正比）。

        - 当$U_(A  K)<0$（阳极A电压低于阴极K）时，电场阻碍电子运动，光电流减小。

        - 当$U_(A K)=-U_a$（遏止电压）时，光电流刚好为零（最大初动能的光电子也无法到达阳极）。

*实验原理*:

特定频率的光照射在金属材料（阴极K）表面时，会使其发射出电子(即光电效应)，其核心方程为:
$
  1/2 m v_(max)^2=h ν−W
$
\
\

#h(2em)当施加反向电压$U_(A K)$时，电场力对光电子做负功，阻碍其到达阳极。当电场力所做的功恰好等于光电子最大初动能时，即使具有最大动能的光电子也无法到达阳极，此时光电流为零。该关系表示为：
$
e U_a=1/2m v_(max)^2
$
回代可得
$
h ν - W =e U_a arrow.double U_a= h/e ν - W/e
$

*实验方法*:

通过测量不同频率光的遏止电压$U_a$，作$U_a - ν$图像，求出斜率$h/e$，即可测定普朗克常量$h$。

== 实验重点（3分）

- 理解光电效应方程和光量子概念
- 掌握光电效应实验方法并验证实验现象
- 测定普朗克常数
== 实验难点（2分）

- *精确测定遏止电压 $U_a$*。\
  因存在暗电流、本底电流和阳极反向光电子发射，光电流与电压曲线无绝对零点，
- *数据处理与误差分析*。