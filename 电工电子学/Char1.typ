#import "utils.typ": Red, three_line_table
#import "Callouts.typ" as callouts
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

= 电路和电路元件

== 电路和电路的基本物理量
=== 电流和电压的参考方向和实际方向
正负号与参考方向有关, 正值表示实际方向与参考方向相同, 负值表示相反。

电流参考方向从电压参考方向 + 流向 - ， 称为#Red()[关联参考方向]。通常电源的端电压和流过电源的电流采用非关联参考方向。

=== 电路功率
功率是电场力在单位时间里所做的功，即：
$
  p = ("d"w)/("d"t) = ("d"w)/("d"q) dot ("d"q)/("d"t) = u dot i
$



#callouts.Tip[
  若关联参考方向, p为正, 则电路元件吸收功率; p为负, 则电路元件提供功率。

  若不关联参考方向, 则相反。
]

#callouts.Question(title: [例 1.1.1 ])[
  #grid(
    columns: 2,
    align: horizon,
    gutter: 1em,
    [
      如图，d为电位参考点，已知$I_1=2A$,$I_2 = -1.25A$, $I_3 = 0.75A$, 求：

      1). a、b、c各点的电位$V_a$、$V_b$、$V_c$

      2). 电压$U_(a b)$、$U_(b c)$

      3). $E_1$、$E_2$输出的功率$P_(E 1)$、$P_(E 2)$
    ],
    [
      #set text(size: 9pt)
      #cetz.canvas({
        import cetz.draw: *

        circle((0, 0), radius: 0.2em, fill: black)
        content((0.3, 0.3), [d])
        line((-2, 1.4), (-2, 0), (2, 0), (2, 1.4))
        line((0, 0.8), (0, -0.3))
        line((-0.2, -0.3), (0.2, -0.3))

        line((-2.2, 1.4), (-1.8, 1.4))
        line((-2.4, 1.6), (-1.6, 1.6))

        line((2.2, 1.4), (1.8, 1.4))
        line((2.4, 1.6), (1.6, 1.6))

        line((-2, 1.6), (-2, 3), (-1.6, 3))
        rect((-1.6, 3.1), (-0.8, 2.9))
        line((-0.8, 3), (-0.4, 3), mark: (end: "straight", stroke: 1pt))
        line((-0.8, 3), (0.8, 3))
        line((0.4, 3), (0.8, 3), mark: (start: "straight", stroke: 1pt))
        rect((0.8, 3.1), (1.6, 2.9))
        line((1.6, 3), (2, 3), (2, 1.6))
        rect((-0.1, 1.6), (0.1, 0.8))
        line((0, 3), (0, 2.2), mark: (end: "straight", stroke: 1pt))
        line((0, 3), (0, 1.6))
        circle((0, 3), radius: 0.2em, fill: black)
        circle((2, 3), radius: 0.2em, fill: black)
        circle((-2, 3), radius: 0.2em, fill: black)

        content((-2, 3.4), [$a$])
        content((-1.2, 3.4), [$R_1$])
        content((-1.2, 2.6), [$0.5Omega$])
        content((-0.5, 3.3), [$I_1$])
        content((0, 3.3), [$b$])
        content((0.5, 3.3), [$I_2$])
        content((1.2, 3.3), [$R_2$])
        content((1.2, 2.6), [$0.8Omega$])
        content((2, 3.3), [$c$])
        content((1.3, 1.7), [$E_2$])
        content((-1.3, 1.7), [$E_1$])
        content((1.3, 1.3), [$8V$])
        content((-1.3, 1.3), [$10V$])
        content((0.5, 1.4), [$R_3$])
        content((0.5, 1), [$12Omega$])
      })],
  )
  【解】:

  1).
  $
    V_a & = E_1 = 10V，V_c = E_2 = 8V \
    V_b & = U_(b d) = R_3 I_3= 9V
  $
  2).
  $
    U_(a b) & = V_a - V_b = 1V \
    U_(b c) & = V_b - V_c = 1V
  $

  3).
  $
    P_(E 1) & = E_1 I_1 = 20W \
    P_(E 2) & = E_2 I_2 = -10W ("吸收功率，即充电")
  $
]
== 电阻、电感和电容元件
#link("https://savia7582.github.io/Exterior/Engineering/EE/1/")[点击跳转savia的电路基本概念与定律]
#v(1em)
#figure(caption: [线性电阻、电感和电容元件(关联参考方向)的电压-电流关系和能量关系])[
  #three_line_table(table(
    columns: 4,
    //row-gutter: 1em,
    inset: 1em,
    table.header([元件名称], [电压电流关系], [能量关系], [元件性质]),

    [电阻], [$display(u = R i)$], [$display(W_R = integral_(t_1)^(t_2) R i^2"d"t)$], [耗能],
    [电感], [$display(u = L ("d"i)/("d"t))$], [$W_L = display(1/2) L I^2$], [储能],
    [电容], [$display(i = C ("d"u)/("d"t))$], [$W_C = display(1/2) C U^2$], [储能],
  ))
]
== 独立电源元件
=== 电压源和电流源
(理想)电压源（#Red()[不能短路]），输出电压$U$等于源电压$U_S$，与输出电流和外电路的情况无关，电压源的符号是参考方向。

(理想)电流源（#Red()[不能开路]），输出电流$I$等于源电流$I_S$，与输出电压和外电路的情况无关，电流源的符号是参考方向。
#align(center)[
  #grid(
    columns: 2,
    rows: 2,
    align: center + horizon,
    gutter: 1em,
    [
      #cetz.canvas({
        import cetz.draw: *

        line((-2, 3), (-2, 0), (-0.1, 0))
        circle((-2, 1.5), radius: 0.4)
        content((-1.4, 2), [+])
        content((-1.3, 1.5), [$U_S$])
        content((-1.4, 1), [-])
        line((-2, 3), (-1, 3), mark: (end: "straight", stroke: 1pt))

        circle((0, 0), radius: 0.1)
        line((0.1, 0), (1.5, 0), (1.5, 1.1), stroke: (dash: "dashed"))
        rect((1.4, 1.9), (1.6, 1.1))
        line((1.5, 1.9), (1.5, 3), (0.1, 3), stroke: (dash: "dashed"))
        circle((0, 3), radius: 0.1)
        line((-0.1, 3), (-2, 3))

        content((0, 2.6), [+])
        content((0, 1.5), [U])
        content((0, 0.4), [-])
        content((1.9, 1.5), [R])
      })
    ],
    [      #cetz.canvas({
      import cetz.draw: *
      line((-2, 3), (-2, 1.9))
      line((-2, 1.9), (-2, 2.5), mark: (end: "straight", stroke: 1pt))
      circle((-2, 1.5), radius: 0.4)
      line((-2.4, 1.5), (-1.6, 1.5))
      content((-1.3, 1.5), [$I_S$])
      line((-2, 1.1), (-2, 0), (-0.1, 0))
      circle((0, 0), radius: 0.1)
      line((0.1, 0), (1.5, 0), (1.5, 1.1), stroke: (dash: "dashed"))
      rect((1.4, 1.9), (1.6, 1.1))
      line((1.5, 1.9), (1.5, 3), (0.1, 3), stroke: (dash: "dashed"))
      circle((0, 3), radius: 0.1)
      line((-0.1, 3), (-2, 3))

      content((0, 2.6), [+])
      content((0, 1.5), [U])
      content((0, 0.4), [-])
      content((1.9, 1.5), [R])
    })],

    [理想电压源], [理想电流源],
  )]
=== 实际电源的模型
#align(center)[
  #grid(
    columns: 3,
    rows: 2,
    align: center + horizon,
    gutter: 1em,
    [
      #cetz.canvas({
        import cetz.draw: *
        rect((-2, 3.3), (-1, -0.3))
        line((-1, 0), (-0.1, 0))
        circle((0, 0), radius: 0.1)
        line((0.1, 0), (1.5, 0), (1.5, 1.1))
        rect((1.4, 1.9), (1.6, 1.1))
        line((1.5, 1.9), (1.5, 3), (0.1, 3))
        circle((0, 3), radius: 0.1)
        line((-0.1, 3), (-1, 3))

        line((0.1, 3), (0.7, 3), mark: (end: "straight", stroke: 1pt))

        content((-1.5, 2.5), [
          #set par(spacing: -0.3em)
          实

          际

          电

          源])
        content((0, 3.4), [a])
        content((0, 2.6), [+])
        content((0, 1.5), [U])
        content((0, 0.4), [-])
        content((0, -0.4), [b])
        content((1.9, 1.5), [R])
      })
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        rect((-2.1, 4.3), (-0.4, -0.3), stroke: (dash: "dashed"))

        line((-1.5, 4), (-1.5, 3.2))
        rect((-1.6, 3.2), (-1.4, 2.4))
        line((-1.5, 2.4), (-1.5, 0))
        circle((-1.5, 1.2), radius: 0.4)

        line((-1.5, 0), (-0.1, 0))
        circle((0, 0), radius: 0.1)
        line((0.1, 0), (1.5, 0), (1.5, 1.6))
        rect((1.4, 2.4), (1.6, 1.6))
        line((1.5, 2.4), (1.5, 4), (0.1, 4))
        circle((0, 4), radius: 0.1)
        line((-0.1, 4), (-1.5, 4))

        line((0.1, 4), (0.7, 4), mark: (end: "straight", stroke: 1pt))

        content((0, 4.4), [a])
        content((0, 3.6), [+])
        content((0, 2), [U])
        content((0, 0.4), [-])
        content((0, -0.4), [b])
        content((1.9, 1.5), [R])

        content((-1.1, 2.8), [$R_0$])
        content((-1.1, 1.6), [+])
        content((-1.1, 0.8), [-])
        content((-0.7, 1.2), [$U_S$])
      })
    ],
    [    #cetz.canvas({
      import cetz.draw: *
      rect((-3.8, 4.3), (-0.4, -0.3), stroke: (dash: "dashed"))

      line((-3, 4), (-3, 2.4))
      line((-3, 1.6), (-3, 0))
      circle((-3, 2), radius: 0.4)
      line((-3.4, 2), (-2.6, 2))
      line((-3, 2.4), (-3, 3.2), mark: (end: "straight", stroke: 1pt))
      content((-2.6, 2.8), [$I_S$])

      line((-1.5, 4), (-1.5, 2.4))
      rect((-1.6, 2.4), (-1.4, 1.6))
      line((-1.5, 1.6), (-1.5, 0))
      content((-1.1, 2), [$R_0$])

      line((-3, 0), (-0.1, 0))
      circle((0, 0), radius: 0.1)
      line((0.1, 0), (1.5, 0), (1.5, 1.6))
      rect((1.4, 2.4), (1.6, 1.6))
      line((1.5, 2.4), (1.5, 4), (0.1, 4))
      circle((0, 4), radius: 0.1)
      line((-0.1, 4), (-3, 4))

      line((0.1, 4), (0.7, 4), mark: (end: "straight", stroke: 1pt))

      content((0, 4.4), [a])
      content((0, 3.6), [+])
      content((0, 2), [U])
      content((0, 0.4), [-])
      content((0, -0.4), [b])
      content((1.9, 1.5), [R])
    })],

    [(a)实际电源], [(b)电压源模型], [(c)电流源模型],
  )
]

两种实际电源模型对外电路等效可换，且$U_S = I_S R_0$时, 电压源模型与电流源模型可以等价变换。(见2.2.2等效电源原理)
== 二极管
=== PN结及其单向导电性
仅需要知道二极管单向导通即可
=== 二极管的特性和主要参数
#grid(
  columns: (1fr, 1fr),
  [
    硅二极管导通压降为0.7V，

    锗二极管导通压降为0.3V

    #callouts.Tip()[
      可以认为硅二极管在正向导通时电压恒为0.7V，电流可以从0到无穷大，在$-infinity < U< 0.7V$不导通；锗管同理。
    ]
  ],
  align(center)[
    #v(-5em)
    #image("assets/二极管伏安特性曲线.png")],
)

=== 二极管的工作点和理想特性
#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  image("assets/二极管工作曲线.png"),

  image("assets/二极管理想特性.png"),
)
静态电阻: $R_D = U_D/I_D$, 动态电阻: $r_D = ("d"U_D)/("d"I_D)$

#callouts.Question(title: "如何判断二极管电路导通性")[
  对于多二极管电路，可以通过假设二极管是否导通来分析电路，验证假设是否自洽来判断二极管的状态。导通的二极管可以视为一个0.7V的电压源，截止的二极管可以视为一个无穷大的电阻或开路。

  显然的，#Red[正确的假设有且仅有一个]，验证到一个正确的假设就无需继续分析了

  #callouts.Example[
    如图所示电路，二极管的导通电压为0.7V。已知输入$u_i$=4V，电压源大小为7V，则u$""_o$的大小为 #underline("     ") V。D1为 #underline("     ") （导通、截止）状态；D2为 #underline("     ") （导通、截止）状态。
    #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      [
        【解】：

        假设D$""_1$导通，D$""_2$截止，则u$""_A$=4.7V, u$""_B$=7V，与假设矛盾，舍弃。

        假设D$""_1$导通，D$""_2$导通，则u$""_A$=4.7V, u$""_B$=5.4V，电路自洽，接受。

        所以u$""_o$=5.4V，D$""_1$导通，D$""_2$导通。
      ],
      [
        #cetz.canvas({
          import cetz.draw: *

          circle((0, 0), radius: 0.1)
          line((0.1, 0), (6.9, 0))
          circle((7, 0), radius: 0.1)
          content((0, 0.4), [-])
          content((7, 0.4), [-])

          circle((0, 3), radius: 0.1)
          line((0.1, 3), (6.9, 3))
          circle((7, 3), radius: 0.1)
          content((0, 2.6), [+])
          content((7, 2.6), [+])
          line((1.1, 2.6), (1.1, 3.4))
          line((1.1, 3), (1.9, 3.4), (1.9, 2.6), close: true)

          content((1.5, 2.2), [D$""_1$])
          line((4.1, 2.6), (4.1, 3.4))
          line((4.1, 3), (4.9, 3.4), (4.9, 2.6), close: true)
          content((4.5, 2.2), [D$""_2$])

          circle((3, 4.6), radius: 0.1)
          content((3.6, 4.6), [+6V])
          line((3, 4.5), (3, 4.2))
          rect((2.9, 4.2), (3.1, 3.4))
          content((3.5, 3.8), [R$""_1$])
          line((3, 3.4), (3, 3))
          circle((3, 3), radius: 0.08, fill: black)
          content((3, 2.6), [A])

          circle((6, 3), radius: 0.08, fill: black)
          content((6, 3.4), [B])
          line((6, 3), (6, 2.6))
          rect((5.9, 2.6), (6.1, 1.8))
          content((5.5, 2.2), [R$""_2$])
          line((6, 1.8), (6, -0.4))
          circle((6, 0.8), radius: 0.4)
          content((6.5, 1.2), [+])
          content((6.5, 0.4), [-])
          content((5, 0.8), [7V])
          line((5.7, -0.4), (6.3, -0.4))

          content((0, 1.5), [u$""_i$])
          content((7, 1.5), [u$""_o$])
        })
      ],
    )]
]
=== 稳压二极管
#image("assets/稳压二极管.png")
工作在反向击穿区，且不同稳压二极管$U_Z$可变。正常参考方向从阴极指向阳极。用途是保护工作元件（右图$R_L$）
=== 发光二极管
正向导通时发光，压降一般大于1.4V。
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (2, 0))
    line((0.6, -0.4), (0.6, 0.4), (1.4, 0), close: true)
    line((1.4, -0.4), (1.4, 0.4))
    line((1, 0.4), (0.6, 0.6), mark: (end: "straight", stroke: 1pt))
    line((1.3, 0.4), (0.9, 0.6), mark: (end: "straight", stroke: 1pt))
  })
]
=== 光电二极管
反向接入电路，光照时导通，暗时截止。
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (2, 0))
    line((0.6, -0.4), (0.6, 0.4), (1.4, 0), close: true)
    line((1.4, -0.4), (1.4, 0.4))
    line((1, 0.4), (0.6, 0.6), mark: (start: "straight", stroke: 1pt))
    line((1.3, 0.4), (0.9, 0.6), mark: (start: "straight", stroke: 1pt))
  })
]
#pagebreak()
== 双极晶体管
=== 基本结构和电流放大作用
#image("assets/三极管结构.png")
$
  I_E = I_C + I_B \
  I_B << I_C = beta I_B approx I_E
$
其中$beta$为晶体管的电流放大系数，通常在几十到几百之间。
=== 特性曲线和主要参数
#image("assets/三极管特性曲线.png")
#v(1em)
对于NPN管，u$""_(B E)$ > 0时，发射结正偏，u$""_(B C)$ > 0时，集电结正偏。
#figure()[
  #three_line_table(table(
    columns: 3,
    inset: 0.6em,
    table.header([发射结], [集电结], [晶体管状态]),

    [反向偏置], [反向偏置], [截止],
    [正向偏置], [反向偏置], [放大],
    [正向偏置], [正向偏置], [饱和],
  ))
]
放大系数：
$
  overline(beta) & = (I_C - I_(C E O))/I_B approx I_C/I_B ("直流") \
            beta & = ("d"I_C)/("d"I_B) ("交流")
$

=== 简化的小信号模型
==== 受控源
#grid(
  columns: 4,
  rows: 2,
  align: center + horizon,
  gutter: 4em,
  row-gutter: 1em,
  [
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.1)
      line((0.1, 0), (1, 0))
      content((1, 0.4), [-])
      circle((0, 3), radius: 0.1)
      line((0.1, 3), (1, 3))
      content((1, 2.6), [+])
      content((1, 1.5), [U$""_1$])

      line((3.9, 0), (2, 0), (2, 3), (3.9, 3))
      circle((4, 0), radius: 0.1)
      circle((4, 3), radius: 0.1)
      line((2, 1.1), (1.6, 1.5), (2, 1.9), (2.4, 1.5), close: true)
      content((2.4, 1.1), [-])
      content((2.4, 1.9), [+])
      content((3.4, 1.45), [U$""_2$=$mu$U$""_1$ ])
    })
  ],
  [    #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.1)
    line((0.1, 0), (1, 0))
    content((1, 0.4), [-])
    circle((0, 3), radius: 0.1)
    line((0.1, 3), (1, 3))
    content((1, 2.6), [+])
    content((1, 1.5), [U$""_1$])

    line((3.9, 0), (2, 0), (2, 1.1))
    line((2, 1.9), (2, 3), (3.9, 3))
    line((1.6, 1.5), (2.4, 1.5))
    line((2, 1.1), (2, 0.5), mark: (end: "straight", stroke: 1pt))
    circle((4, 0), radius: 0.1)
    circle((4, 3), radius: 0.1)
    line((2, 1.1), (1.6, 1.5), (2, 1.9), (2.4, 1.5), close: true)
    content((3.4, 1.45), [I$""_2$=$g$U$""_1$ ])
  })],
  [    #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.1)
    line((0.1, 0), (1, 0))
    circle((0, 3), radius: 0.1)
    line((0.1, 3), (1, 3))
    line((1, 0), (1, 3))
    content((0.6, 1.5), [I$""_1$])
    line((1, 3), (1, 1.5), mark: (end: "straight", stroke: 1pt))


    line((3.9, 0), (2, 0), (2, 3), (3.9, 3))
    circle((4, 0), radius: 0.1)
    circle((4, 3), radius: 0.1)
    line((2, 1.1), (1.6, 1.5), (2, 1.9), (2.4, 1.5), close: true)
    content((2.4, 1.1), [-])
    content((2.4, 1.9), [+])
    content((3.4, 1.45), [U$""_2$=$gamma$I$""_1$ ])
  })],

  [    #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.1)
    line((0.1, 0), (1, 0))
    circle((0, 3), radius: 0.1)
    line((0.1, 3), (1, 3))
    line((1, 0), (1, 3))
    content((0.6, 1.5), [I$""_1$])
    line((1, 3), (1, 1.5), mark: (end: "straight", stroke: 1pt))

    line((3.9, 0), (2, 0), (2, 1.1))
    line((2, 1.9), (2, 3), (3.9, 3))
    line((1.6, 1.5), (2.4, 1.5))
    line((2, 1.1), (2, 0.5), mark: (end: "straight", stroke: 1pt))
    circle((4, 0), radius: 0.1)
    circle((4, 3), radius: 0.1)
    line((2, 1.1), (1.6, 1.5), (2, 1.9), (2.4, 1.5), close: true)
    content((3.4, 1.45), [I$""_2$=$beta$I$""_1$ ])
  })],

  [电压控制电压源(VCVS)], [电压控制电流源(VCCS)], [电流控制电压源(CCVS)], [电流控制电流源(CCCS)],
)
==== 晶体管的简化小信号模型
#image("assets/晶体管简化小信号模型.png")
当输入信号变化较小时，可认为晶体管的工作点Q基本不变，因此可以用一个线性模型来近似晶体管的输入特性曲线。此时有动态电阻$r_(b e) = display((Delta U_(B E))/(Delta I_B))$。常温下：
$
  r_(b e) = r_b (200 Omega) + (1+beta) 26/I_E = r_b + 26/I_B (I"单位"m A)
$
由此可以画出#Red[对变化量而言]的电路模型(c)。
#callouts.Note(title: [$r_(b e)$如何得到])[
  (来源于gemini) 基极到发射极的压降主要来自于基区的电阻和发射结的动态电阻。基区电阻$r_b$是一个常数，典型值为200Ω；发射结的动态电阻$r_e$是发射结这个 PN 结在交流信号下的阻抗。因此我们得到
  $
    U_(b e) = r_b I_B + r_e I_E
  $
  根据肖克利二极管方程，我们可以近似得到$r_e = V_T/I_E$，热电压$V_T$在常温下约为26mV，所以$r_e = 26/I_E$。又因为$I_E = (1+beta) I_B$，所以$r_(b e) = r_b + 26/I_B$。
]
== 绝缘栅场效应晶体管
=== 基本结构和工作原理
#align(center)[
  #grid(
    columns: 4,
    rows: 2,
    align: center + horizon,
    gutter: 4em,
    row-gutter: 1em,
    [
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (0, 1))
        line((0, 0.2), (0.4, 0.2), (0.4, -0.6))
        line((0, 0.8), (0.4, 0.8), (0.4, 1.6))
        line((-0.4, 0.2), (-0.2, 0.2), (-0.2, 0.8))
        line((0.8, 0.5), (0, 0.5), mark: (end: "straight", stroke: 1pt))

        content((-0.6, 0.2), [G])
        content((0.6, 1.6), [D])
        content((0.6, -0.6), [S])
        content((1, 0.5), [B])
      })
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (0, 1), stroke: (dash: "dashed"))
        line((0, 0.2), (0.4, 0.2), (0.4, -0.6))
        line((0, 0.8), (0.4, 0.8), (0.4, 1.6))
        line((-0.4, 0.2), (-0.2, 0.2), (-0.2, 0.8))
        line((0.8, 0.5), (0, 0.5), mark: (end: "straight", stroke: 1pt))

        content((-0.6, 0.2), [G])
        content((0.6, 1.6), [D])
        content((0.6, -0.6), [S])
        content((1, 0.5), [B])
      })
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (0, 1))
        line((0, 0.2), (0.4, 0.2), (0.4, -0.6))
        line((0, 0.8), (0.4, 0.8), (0.4, 1.6))
        line((-0.4, 0.2), (-0.2, 0.2), (-0.2, 0.8))
        line((0.8, 0.5), (0, 0.5), mark: (start: "straight", stroke: 1pt))

        content((-0.6, 0.2), [G])
        content((0.6, 1.6), [D])
        content((0.6, -0.6), [S])
        content((1, 0.5), [B])
      })
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (0, 1), stroke: (dash: "dashed"))
        line((0, 0.2), (0.4, 0.2), (0.4, -0.6))
        line((0, 0.8), (0.4, 0.8), (0.4, 1.6))
        line((-0.4, 0.2), (-0.2, 0.2), (-0.2, 0.8))
        line((0.8, 0.5), (0, 0.5), mark: (start: "straight", stroke: 1pt))

        content((-0.6, 0.2), [G])
        content((0.6, 1.6), [D])
        content((0.6, -0.6), [S])
        content((1, 0.5), [B])
      })
    ],

    [耗尽型NMOS], [增强型NMOS], [耗尽型PMOS], [增强型PMOS],
  )]
如果在制造时二氧化硅绝缘层中的正离子很少，不足以形成导电沟道，则称为增强型MOS管，其符号中源极S和漏极D之间的连线是断开的，表示$U_(G S)= 0$时导电沟道没有形成。

如果栅极(G)和源极(S)间的电压增加(或降低)，则垂直于衬底的表面电场强度加强(或减弱)， 从而使导电沟道加宽(或变窄)，引起漏极(D)电流增大(或减小)。

和双极晶体管的共发射极接法相类似，MOS管常采用共源极接法。我们需要让P型衬底(B)和N型沟道(S)之间的PN结始终处于反向偏置，保证MOS管的正常工作
#callouts.Tip[
  和晶体管相比，场效晶体管的源极相当于晶体管的发射极、漏极相当于集电极 、栅极相当于基极。晶体管的集电极电流受基极电流控制，是一种电流控制型器件。而场效晶体管的漏极电流受栅源电压的控制，是一种电压控制型器件。场效晶体管具有输入电阻大、耗电少、噪声低、热稳定性好、抗辐射能力强等优点，在低噪声放大器的前级或环境条件变化较大的场合常被采用。MOS管的制造工艺比较简单，占用芯片面积小，特别适用于制作大规模集成电路。
]
#v(2em)
=== 特性曲线和主要参数
由于MOS管的栅极是绝缘的，栅极电流$I_G=0$,因此不研究$I_(G S)$和$I_G$之间的关系。$I_D$和$U_(D S)、U_(G S)$之间的关系可用输出特性和转移特性来表示。
#align(center)[#image("assets/耗尽型NMOS.png", width: 80%)]
当$u_(G S)$减小(即向负值方向增大)到某一数值时，$i_D approx 0$，称为场效晶体管处于夹断状态(即截止)。通常定义$i_D$为某一微小电流(几十微安)时的$U_(G S)$值为栅源夹断电压$U_(G S(o f f))$

转移特性可以近似表示为
$
  I_D = I_(D S S)(1- U_(G S)/U_(G S(o f f)))^2
$
对于增强型MOS管，使漏极和源极之间开始有电流流过的栅源电压称为开 启电压$U_(G S(t h))$，通常定义$|i_D|=10 mu A$时的栅源电压为开启电压。
#align(center)[#image("assets/增强型NMOS.png", width: 80%)]
PMOS管的工作原理与NMOS管的原理完全相同，只是电流和电压方向不同。以增强型PMOS管为例，它的漏极电源，栅极电源的极性均和增强型NMOS管相反，故其转移特性在第三象限。也就是说,增强型PMOS管漏极和源极间要加负极性电源，栅极电位比源极电位低时，管子才导通，电流从源极流向漏极。
#callouts.Question(title: [24-25春夏])[
  已知MOS管的转移特性曲线如下图，则该MOS管是( C )
  #grid(
    columns: (1fr, 1fr),
    align: horizon,
    gutter: 4em,
    [
      A. 增强型 PMOS 管

      B. 增强型 NMOS 管

      C. 耗尽型 PMOS 管

      D. 耗尽型 NMOS 管
    ],
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      // 设置绘图区域
      plot.plot(
        size: (6, 4),
        x-tick-step: none,
        y-tick-step: none,
        x-label: [$U_(G S)$],
        y-label: [$i_D$],
        x-min: -3,
        x-max: 4,
        y-min: -1,
        y-max: 3,
        axis-style: "school-book",
        name: "plot",
        {
          // 绘制耗尽型 PMOS 转移特性曲线
          // 假设 U_GS(off) = 2.5, I_DSS = 1
          // 当 u_GS < U_GS(off) 时有电流
          let u_gs_off = 2.5
          plot.add(
            domain: (-1.5, u_gs_off),
            style: (stroke: 1.5pt),
            x => calc.pow(1 - x / u_gs_off, 2),
          )

          // 添加关键点标注：U_GS(off)
          plot.add-anchor("cutoff", (u_gs_off, 0))

          // 绘制坐标原点处的辅助（可选）
        },
      )

      // 在 plot 外部手动添加文字标注，对齐更精准
      content("plot.cutoff", [ $U_(G S (o f f))$ ], anchor: "north", padding: .2)
    }),
  )
]
=== 简化的小信号模型
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0.1, 0), (3.9, 0))
    circle((0, 0), radius: 0.1)
    circle((4, 0), radius: 0.1)
    line((0.1, 3), (1, 3))
    circle((0, 3), radius: 0.1)
    content((0, 3.4), [G])
    content((0.6, 3.3), [$Delta I_B$])
    content((1, 2.6), [+])
    content((0.6, 1.5), [$Delta$U$""_(G S)$])
    content((1, 0.3), [-])


    line((2, 0), (2, 1.1))
    line((2, 1.1), (1.6, 1.5), (2, 1.9), (2.4, 1.5), close: true)
    line((1.6, 1.5), (2.4, 1.5))
    line((2, 1.9), (2, 3), (3.9, 3))
    circle((4, 3), radius: 0.1)

    line((2, 1.1), (2, 0), mark: (end: "straight", stroke: 1pt))
    line((3.9, 3), (3, 3), mark: (end: "straight", stroke: 1pt))

    content((1.6, 0.4), [S])
    content((3.5, 1.5), [$g_m Delta U_(G S)$])
    content((2.4, 3.4), [$Delta I_D$])
    content((4, 3.4), [D])
  })
]
场效晶体管的输出特性曲线在线性放大区内比较平坦，可以近似地认为是一族和横轴平行的直线，故$I_D$仅受$U_(G S)$控制，与$U_(D S)$无关。已知$Delta I_D = g_m Delta U_(G S)$, 故可得到图示简化的小信号模型，这是一个电压控制电流源。由于MOS管的栅源输入电阻很大，故可认为G、S间是开路的。

#pagebreak()
