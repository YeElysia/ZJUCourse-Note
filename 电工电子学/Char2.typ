#import "utils.typ": Red, eq, three_line_table
#import "models.typ": (
  arrow_I, constSourceH, constSourceV, controlledSourceH, controlledSourceV, loop, node, ph, resistorH, resistorV,
)
#import "Callouts.typ" as callouts
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

= 电路分析基础
== 基尔霍夫定律
=== 基尔霍夫定律
==== 电路结构概念
#grid(
  columns: 2,
  align: horizon,
  gutter: 0em,
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-0.1, -0.1), (7.1, -0.1), (7.1, 4.1), (-0.1, 4.1), (-0.1, -0.1), stroke: (paint: green, thickness: 2pt))
      content((4, -0.4), [#text(green)[回路]])
      line((0.1, 0.1), (0.1, 3.9), (1.9, 3.9), (1.9, 0.1), (0.1, 0.1), stroke: (paint: blue, thickness: 2pt))
      content((1, 0.4), [#text(blue)[网孔]])

      line((0, 1.6), (0, 0), (2, 0), (2, 1.6))
      line((2, 2.4), (2, 4), (0, 4), (0, 2.4))
      constSourceH((0, 2))
      arrow_I((0, 2.4), (0, 3.2))
      resistorV((2, 2))

      line((2, 0), (6, 0), (6, 1.6))
      resistorV((6, 2))
      line((6, 2.4), (6, 4))
      line((2, 4), (2.8, 4), stroke: red)
      line((3.6, 4), (4.4, 4), stroke: red)
      line((5.2, 4), (6, 4), stroke: red)
      content((4, 4.8), [#Red[支路]])
      node((2, 4))
      content((2, 4.4), [节点])
      node((6, 4))
      rect((1.8, 0.2), (6.2, -0.2), stroke: (dash: "dashed"))
      content((4, 0.6), [节点])
      resistorH((3.2, 4))
      constSourceH((4.8, 4))
      content((4.4, 4.4), [-])
      content((5.2, 4.4), [+])

      line((6, 0), (7, 0), (7, 1.6))
      resistorV((7, 2))
      line((7, 2.4), (7, 4), (6, 4))
    })],

  [
    节点：三个或三个以上电路元件的连接点。

    支路：连接两个节点之间的电路。

    回路：电路中任一闭合路径称为回路。

    网孔：电路中最简单的单孔回路(内部无支路)。
  ],
)

==== 基尔霍夫电流定律 (KCL)
在任何电路中, 任何节点上的所有支路电流的代数和在任何时刻都等于零。

#eq("(2.1.1)", $ sum i= 0 $)
在式(2.1.1)中, 参考方向离开节点的电流带正号; 参考方向指向节点的电流带负号。

广义的 KCL: 任何穿过该曲面的电流的代数和在任何时刻都等于零。
==== 基尔霍夫电压定律 (KVL)
在任何电路中, 任何回路上的所有电压的代数和在任何时刻都等于零。
#eq("(2.1.2)", $ sum u= 0 $)
在式(2.1.2)中, 当支路电压参考方向和回路循行方向一致时带正号, 反之为负号。


#callouts.Question(
  title: [例 2.1.1],
)[
  电路及参数如图所示，取b点为电位的参考点(即零电位点)，试求：
  (1) $U_i = 3V$时a点的电位$V_a$,  (2)$V_a = -0.5V$时的$U_i$ 。
  #grid(
    columns: (24em, auto),
    // align: horizon,
    [
      (1)
      $
        & R_1 I + R_2 I - U_s - U_i = 0 "  "(K C L) \
        & V_a = U_(a b) = U_i - R_1 I = 1.5 V
      $
      (2)
      $
        & V_a = U_(a b) = R_2I - U_s \
        & U_i = R_1 I + V_a = 0.6 V
      $

    ],
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0, 1.6))
      constSourceV((0, 2))
      content((-0.5, 2.4), [+])
      content((-0.5, 1.6), [-])
      content((-0.8, 2), [$U_i$])
      content((0.8, 2), [3V])
      line((0, 2.4), (0, 4))

      line((0, 0), (2, 0))

      line((0, 4), (0.6, 4))
      resistorH((1, 4))
      content((1, 4.4), [$R_1$])
      content((1, 3.6), [$2k Omega$])
      line((1.4, 4), (2, 4))
      arrow_I((1.4, 4), (2, 4))
      content((1.7, 4.4), [I])

      line((2, 0), (2, 0.8))
      arrow_I((2, 0.8), (2, 0.2))
      content((2.4, 0.4), [I])
      constSourceV((2, 1.2))
      content((1.5, 1.6), [-])
      content((1.5, 0.8), [+])
      content((1.2, 1.2), [$U_s$])
      content((2.8, 1.2), [6V])
      line((2, 1.6), (2, 2.4))
      resistorV((2, 2.8))
      content((1.6, 2.8), [$R_2$])
      content((2.7, 2.8), [$10k Omega$])
      line((2, 3.2), (2, 4))

      node((2, 0))
      line((2, 0), (2, -0.4))
      line((1.6, -0.4), (2.4, -0.4))
      line((2, 0), (3.9, 0))
      circle((4, 0), radius: 0.1)
      line((2, 4), (3.9, 4))
      circle((4, 4), radius: 0.1)
      content((4, 2), [$U_(a b)$])
      content((4, 3.6), [+])
      content((4, 0.4), [-])
      content((4.4, 4), [a])
      content((4.4, 0), [b])
    }),
  )
]



=== 支路电流法
==== 解题步骤
1. 标出各支路电流参考方向。设支路数目为b, 则有b个支路电流, 应有b个独立方程式。
2. 根据基尔霍夫电流定律(KCL)列写节点的电流方程式。设有n个节点, 则可建立n-1个独立方程式。第n个节点的电流方程式可以从已列出的个方程式求得, 不是独立的。
3. 标出回路的循行方向, 根据基尔霍夫电压定律(KVL)列写回路的电压方程式。电压方程式的数目为b-(n-1)个。如按网孔列写方程式, 则恰 好建立b-(n-1)个独立的电压方程式。
4. 解联立方程组, 求出各支路电流。

#callouts.Question(title: [例 2.1.2])[
  图示电路中, $U_(s 1) = U_(s 2) = 6 V$, $R_1=75 k Omega$, $R_2 = 1 k Omega$, $R_3 = 2 k Omega$, 受控电流源的比例系数 $beta= 50, U_(o n) = 0.7 V$。 试计算各支路的电流$I_1、I_2、I_3$及受控源两端的电压$U$。

  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0, 1.6))
      constSourceV((0, 2))
      content((-0.5, 2.4), [+])
      content((-0.5, 1.6), [-])
      content((0.8, 2.4), [$U_(s 1)$])
      content((0.8, 1.7), [6V])
      line((0, 2.4), (0, 4))
      arrow_I((0, 2.8), (0, 3.6))
      content((-0.4, 3.2), [$I_1$])


      line((0, 0), (4, 0))
      line((0, 4), (0.8, 4))
      resistorH((1.2, 4))
      content((1.2, 4.4), [$R_1$])
      content((1.2, 3.6), [$75 k Omega$])
      line((1.6, 4), (2.4, 4))
      constSourceH((2.8, 4))
      content((2.4, 4.5), [+])
      content((3.2, 4.5), [-])
      content((2.8, 4.8), [$U_(o n)$])
      content((2.8, 3.2), [$0.7 V$])
      line((3.2, 4), (4, 4))


      line((4, 4), (4, 2.4))
      arrow_I((4, 3.8), (4, 3))
      content((3.6, 3.4), [$I_3$])
      resistorV((4, 2))
      content((3.6, 2.4), [$R_3$])
      content((3.4, 1.7), [$2 k Omega$])
      line((4, 1.6), (4, 0))

      line((4, 4), (5.1, 4))
      controlledSourceV((5.5, 4))
      content((5.1, 4.4), [-])
      content((5.9, 4.4), [+])
      content((5.5, 4.8), [$U$])
      arrow_I((5.1, 4), (4.5, 4))
      content((4.8, 3.6), [$beta I_1$])
      line((5.9, 4), (6.5, 4))
      arrow_I((6.5, 3.2), (6.5, 3.9))
      content((6.9, 3.6), [$I_2$])
      line((6.5, 4), (6.5, 3.2))
      resistorV((6.5, 2.8))
      content((6.1, 2.8), [$R_2$])
      content((7.1, 2.8), [$1 k Omega$])
      line((6.5, 2.4), (6.5, 1.6))
      constSourceV((6.5, 1.2))
      content((6, 1.6), [+])
      content((6, 0.8), [-])
      content((7.3, 1.5), [$U_(s 2)$])
      content((7.3, 0.9), [$6V$])
      line((6.5, 0.8), (6.5, 0), (4, 0))

      node((4, 4), fill: blue)
      content((4, 4.4), [#text(blue)[$a$]])

      loop((1.2, 0.4), (2.8, 2.8), 1)
      loop((4.4, 0.4), (5.7, 3), 2)
    })]
  【解】

  列KCL:
  #eq([节点a], $I_1 + beta I_2 = I_3$)
  列KVL:
  #eq([回路1], $U_(s 1) - R_1 I_1 - U_(o n) -I_3 R_3= 0$)
  #eq([回路2], $R_3 I_3 + U + R_2 I_2 - U_(s 2) = 0$)
  解得:
  $
    I_1 & = (U_(s 1) -U_(o n))/(R_1 + R_3(1+beta)) = 0.0299 m A approx 0.03m A \
    I_2 & =beta I_1 = 1.5 m A \
    I_3 & = I_1 + I_2 = 1.53m A \
      U & = U_(s 2) - R_2I_2 - R_3I_3 = 1.44 V
  $
]
#v(2em)

== 叠加定理与等效源定理
=== 叠加定理
#Red[线性电路]#h(-1em) (只含有线性元件)中任意支路电流/电压等于各个独立电源单独作用时该支路电流/电压的代数和(注意参考方向)。

计算某一独立电源作用时，其余电源置零(电流源开路，电压源短路)。功率不能叠加。
#figure(
  grid(
    columns: 5,
    align: horizon,
    gutter: 1em,
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0, 1.6))
      constSourceH((0, 2))
      content((0.4, 2.8), [$I_S$])
      arrow_I((0, 2.4), (0, 3.2))
      line((0, 2.4), (0, 4))
      line((0, 0), (3, 0))
      line((1.5, 0), (1.5, 0.8))
      constSourceV((1.5, 1.2))
      content((1, 1.6), [+])
      content((1, 0.8), [-])
      content((0.8, 1.2), [$U_S$])
      line((1.5, 1.6), (1.5, 2.4))
      resistorV((1.5, 2.8))
      content((1.1, 2.8), [$R_1$])
      line((1.5, 3.2), (1.5, 4))
      arrow_I((1.5, 3.2), (1.5, 3.8))
      content((1.1, 3.6), [$I_1$])
      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((2.6, 2), [$R_2$])
      line((3, 2.4), (3, 4))
      arrow_I((3, 3.4), (3, 2.6))
      content((2.6, 3), [$I_2$])
      line((0, 4), (3, 4))
    }),
    [=],
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0, 1.5))
      // constSourceH((0, 2))
      // content((0.4, 2.8), [$I_S$])
      // arrow((0, 2.4), (0, 3.2))
      circle((0, 1.6), radius: 0.1)
      circle((0, 2.4), radius: 0.1)
      line((0, 2.5), (0, 4))
      line((0, 0), (3, 0))
      line((1.5, 0), (1.5, 0.8))
      constSourceV((1.5, 1.2))
      content((1, 1.6), [+])
      content((1, 0.8), [-])
      content((0.8, 1.2), [$U_S$])
      line((1.5, 1.6), (1.5, 2.4))
      resistorV((1.5, 2.8))
      content((1.1, 2.8), [$R_1$])
      line((1.5, 3.2), (1.5, 4))
      arrow_I((1.5, 3.2), (1.5, 3.8))
      content((1.1, 3.6), [$I_11$])
      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((2.6, 2), [$R_2$])
      line((3, 2.4), (3, 4))
      arrow_I((3, 3.4), (3, 2.6))
      content((2.6, 3), [$I_21$])
      line((0, 4), (3, 4))
    }),
    [+],
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0, 1.6))
      constSourceH((0, 2))
      content((0.4, 2.8), [$I_S$])
      arrow_I((0, 2.4), (0, 3.2))
      line((0, 2.4), (0, 4))
      line((0, 0), (3, 0))
      line((1.5, 0), (1.5, 0.7))
      circle((1.5, 0.8), radius: 0.1)
      // constSourceV((1.5, 1.2))
      // content((1, 1.6), [+])
      // content((1, 0.8), [-])
      // content((0.8, 1.2), [$U_S$])
      line((1.5, 0.9), (1.5, 1.5))
      circle((1.5, 1.6), radius: 0.1)
      line((1.5, 1.7), (1.5, 2.4))
      resistorV((1.5, 2.8))
      content((1.1, 2.8), [$R_1$])
      line((1.5, 3.2), (1.5, 4))
      arrow_I((1.5, 3.2), (1.5, 3.8))
      content((1.1, 3.6), [$I_12$])
      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((2.6, 2), [$R_2$])
      line((3, 2.4), (3, 4))
      arrow_I((3, 3.4), (3, 2.6))
      content((2.6, 3), [$I_22$])
      line((0, 4), (3, 4))
    }),
  ),
  caption: [叠加定理图示],
)


#callouts.Question(title: [2.2.4])[
  #grid(
    columns: 2,
    gutter: 3em,
    [如图, N为无源线性网络。现已知:


      $U_(s 1) = 8V$, $I_(s 2)=12A$时, $U_X = 24V$,

      $U_(s 1) = -8V$, $I_(s 2)=4A$时, $U_X = 0V$,

      求: $U_(s 1) = 20V$, $I_(s 2)=20A$时, $U_X = ?$
    ],
    [
      #v(-2.5em)
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (0, 0.6))
        constSourceV((0, 1))
        content((-0.5, 1.4), [+])
        content((-0.5, 0.6), [-])
        content((-0.8, 1), [$U_(s 1)$])
        line((0, 1.4), (0, 2))
        line((0, 0), (1, 0))
        line((0, 2), (1, 2))
        rect((1, -0.2), (4, 2.2))
        content((2.5, 1), [N])

        line((1.3, 2.2), (1.3, 3.2), (1.7, 3.2))
        constSourceV((2.1, 3.2))
        arrow_I((2.5, 3.2), (3.3, 3.2))
        content((2.9, 2.8), [$I_(s 2)$])
        line((3.3, 3.2), (3.7, 3.2))
        line((3.7, 3.2), (3.7, 2.2))

        line((4, 2), (4.9, 2))
        circle((5, 2), radius: 0.1)
        content((5.4, 2), [+])
        line((4, 0), (4.9, 0))
        circle((5, 0), radius: 0.1)
        content((5.4, 0), [-])
        content((5.4, 1), [$U_X$])
      })],
  )
  【解】设$U_(s 1)$作用时的比例系数为$a$, $I_(s 2)$作用时的比例系数为$b$, 根据
  $U_X = a U_(s 1) + b I_(s 2)$, 有:
  $
    8a + 12b = 24 \
    -8a + 4b = 0
  $
  解得: $a = 0.75$, $b = 1.5$, 则$U_X = 0.75 times 20 + 1.5 times 20 = 45V$。
]


=== 等效电源定理
==== 二端网络
#align(center)[
  #grid(
    columns: 3,
    rows: 2,
    gutter: 1em,
    align: center + horizon,
    cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.1)
      content((-0.4, 0), [b])
      line((0.1, 0), (4, 0))
      circle((0, 3), radius: 0.1)
      content((-0.4, 3), [a])
      line((0.1, 3), (1.1, 3))
      resistorH((1.5, 3))
      content((1.5, 2.5), [$R_1$])

      line((1.9, 3), (4, 3))
      line((3, 3), (3, 1.9))
      resistorV((3, 1.5))
      content((2.6, 1.5), [$R_2$])
      line((3, 1.1), (3, 0))

      line((4, 3), (4, 1.9))
      resistorV((4, 1.5))
      content((3.6, 1.5), [$R_3$])
      line((4, 1.1), (4, 0))
    }),
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (4, 0))

      line((0, 0), (0, 0.3))
      constSourceV((0, 0.7))
      content((-0.5, 1.1), [+])
      content((-0.5, 0.3), [-])
      content((-0.8, 0.7), [$U_(S 1)$])
      line((0, 1.1), (0, 1.9))
      resistorV((0, 2.3))
      content((-0.4, 2.3), [$R_1$])
      line((0, 2.7), (0, 3))

      line((1, 0), (1, 0.3))
      constSourceV((1, 0.7))
      content((1.5, 1.1), [+])
      content((1.5, 0.3), [-])
      content((1.8, 0.7), [$U_(S 2)$])
      line((1, 1.1), (1, 1.9))
      resistorV((1, 2.3))
      content((0.6, 2.3), [$R_2$])
      line((1, 2.7), (1, 3))

      line((0, 3), (1.5, 3))
      circle((1.6, 3), radius: 0.1)
      content((1.6, 2.6), [a])
      circle((2.4, 3), radius: 0.1)
      content((2.4, 2.6), [b])
      line((2.5, 3), (2.9, 3))

      line((4, 0), (4, 0.3))
      constSourceH((4, 0.7))
      content((3.6, 1.5), [$I_S$])
      arrow_I((4, 1.1), (4, 1.9))
      line((4, 1.6), (4, 3))
      resistorH((3.3, 3))
      content((3.3, 2.5), [$R_3$])
      line((4, 3), (3.7, 3))
    }),
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (2, 3))
      content((1, 1.5), [N])
      line((2, 0.4), (3.9, 0.4))
      circle((4, 0.4), radius: 0.1)
      content((4, 0.8), [b])
      line((2, 2.6), (3.9, 2.6))
      circle((4, 2.6), radius: 0.1)
      content((4, 2.2), [a])
    }),

    [无源二端网络($N_P$)], [有源二端网络($N_A$)], [一般二端网络($N$)],
  )
]
凡是具有两个接线端的部分电路, 就称为二端网络。在计算分析中, 我们可以用一个最简单的等效电路来代替一个复杂的二端网络, 使计算简化。

显然的，无源二端网络可以用一个电阻来等效。
==== 戴维宁定理
对外电路来说, 一个线性有源二端网络可用一个电压源和电阻的串联电路来等效, 该电压源的电压等于此有源二端网络的开路电压$U_(O C)$, 串联电阻等于此有源二端网络将独立电源置零后在其端口处的等效电阻$R_0$。
==== 诺顿定理
对外电路来说, 一个线性有源二端网络可用一个电流源和电阻的并联电路来等效, 该电流源的电流等于此有源二端网络的短路电流$I_(S C)$, 并联电阻等于此有源二端网络将独立电源置零后在其端口处的等效电阻$R_0$。

#align(center)[
  #grid(
    columns: 5,
    gutter: 1em,
    align: horizon,
    cetz.canvas({
      import cetz.draw: *
      rect((1, 0), (2, 4))
      content((1.5, 2.6), [外

        电

        路])
      line((0.4, 0.2), (-2, 0.2), (-2, 1.6))
      constSourceV((-2, 2))
      content((-1.5, 1.6), [-])
      content((-1.5, 2.4), [+])
      content((-1, 2), [$U_(O C)$])
      line((-2, 2.4), (-2, 3.8), (-1.4, 3.8))
      resistorH((-1, 3.8))
      content((-1, 3.3), [$R_0$])
      line((-0.6, 3.8), (0.4, 3.8))
      circle((0.5, 3.8), radius: 0.1)
      line((0.6, 3.8), (1, 3.8))
      circle((0.5, 0.2), radius: 0.1)
      line((0.6, 0.2), (1, 0.2))
      rect((-2.6, 4.5), (0, -0.5), stroke: (dash: "dashed"))
    }),
    cetz.canvas({
      import cetz.draw: *
      line(
        (0, 0),
        (1, 0),
        (1, -0.2),
        (1.3, 0.1),
        (1, 0.4),
        (1, 0.2),
        (0, 0.2),
        (0, 0.4),
        (-0.3, 0.1),
        (0, -0.2),
        (0, 0),
      )
      content((0.5, 0.7), [戴维宁])
      //line((0, 0.2), (1, 0.2))
    }),
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (1, 4))
      content((0.5, 2.6), [外

        电

        路])
      rect((-2, 0), (-1, 4))
      content((-1.5, 2), [$N_A$])
      line((0, 0.2), (-1, 0.2))
      line((0, 3.8), (-1, 3.8))
    }),
    cetz.canvas({
      import cetz.draw: *
      line(
        (0, 0),
        (1, 0),
        (1, -0.2),
        (1.3, 0.1),
        (1, 0.4),
        (1, 0.2),
        (0, 0.2),
        (0, 0.4),
        (-0.3, 0.1),
        (0, -0.2),
        (0, 0),
      )
      content((0.5, 0.7), [诺顿])
      //line((0, 0.2), (1, 0.2))
    }),
    cetz.canvas({
      import cetz.draw: *
      rect((1, 0), (2, 4))
      content((1.5, 2.6), [外

        电

        路])
      line((0.4, 0.2), (-2, 0.2), (-2, 1.6))
      constSourceH((-2, 2))
      arrow_I((-2, 2.4), (-2, 3.2))
      content((-1.5, 2.8), [$I_(S C)$])
      line((-2, 2.4), (-2, 3.8), (0, 3.8))
      line((-1, 3.8), (-1, 2.4))
      resistorV((-1, 2))
      content((-0.5, 2), [$R_0$])
      line((-1, 1.6), (-1, 0.2))
      line((-0.6, 3.8), (0.4, 3.8))
      circle((0.5, 3.8), radius: 0.1)
      line((0.6, 3.8), (1, 3.8))
      circle((0.5, 0.2), radius: 0.1)
      line((0.6, 0.2), (1, 0.2))
      rect((-2.6, 4.5), (0, -0.5), stroke: (dash: "dashed"))
    }),
  )
]
#callouts.Tip(title: [等效电阻求解(例2.2.3)])[
  1. 电阻串并联(无受控源)
  2. 开路电压除以短路电流
  #grid(
    columns: 2,
    gutter: 1em,
    cetz.canvas({
      import cetz.draw: *

      line((0, 0), (0, 0.8))
      constSourceV((0, 1.2))
      content((0.5, 0.8), [-])
      content((0.5, 1.6), [+])
      content((-1, 1.2), [$1.5 V$])
      content((0.8, 1.2), [$U_S$])
      line((0, 1.6), (0, 2.4))
      resistorV((0, 2.8))
      content((0.5, 3.2), [$R_1$])
      content((0.8, 2.4), [$1200 Omega$])
      line((0, 3.2), (0, 4))

      line((2, 0), (2, 1.6))
      controlledSourceH((2, 2))
      arrow_I((2, 2.4), (2, 3.2))
      content((2.5, 2.8), [$beta I_1$])
      line((2, 2.4), (2, 4))

      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((3.5, 2.2), [$R_2$])
      content((3.8, 1.4), [$2000 Omega$])

      line((3, 2.4), (3, 4))
      arrow_I((3, 3.6), (3, 2.8))
      content((3.4, 3), [$I_2$])

      line((0, 0), (4.9, 0))
      line((0, 4), (4.9, 4))
      arrow_I((0.5, 4), (1.3, 4))
      content((1.3, 3.6), [$I_1$])
      circle((5, 0), radius: 0.1)
      content((5, 0.4), [-])
      content((5, -0.4), [b])
      circle((5, 4), radius: 0.1)
      content((5, 4.4), [a])
      content((5, 3.6), [+])
      content((5, 2), [$U_(O C)$])
    }),
    [
      $
                       & U_S = I_1 R_1 + (1 + beta) I_1 R_2 \
        arrow.r.double & U_(O C) = I_2 R_2 = ((1+beta)R_2)/(R_1 + (1+beta)R_2) U_S = 1.48 V \
                       & I_(S C) = (1+beta) I_1 = (1+beta) U_S/R_1 = 63.75 m A \
                       & R_0 = U_(O C)/I_(S C) = 23.22 Omega
      $
    ],
  )
  3. 外加电源法(除去原有独立源)
  #grid(
    columns: 2,
    gutter: 1em,
    cetz.canvas({
      import cetz.draw: *

      line((0, 0), (0, 0.7))
      // constSourceV((0, 1.2))
      // content((0.5, 0.8), [-])
      // content((0.5, 1.6), [+])
      // content((-1, 1.2), [$1.5 V$])
      // content((0.8, 1.2), [$U_S$])
      circle((0, 0.8), radius: 0.1)
      line((0, 0.9), (0, 1.5))
      circle((0, 1.6), radius: 0.1)
      line((0, 1.7), (0, 2.4))
      resistorV((0, 2.8))
      content((0.5, 3.2), [$R_1$])
      content((0.8, 2.4), [$1200 Omega$])
      line((0, 3.2), (0, 4))

      line((2, 0), (2, 1.6))
      controlledSourceH((2, 2))
      arrow_I((2, 2.4), (2, 3.2))
      content((2.5, 2.8), [$beta I_1$])
      line((2, 2.4), (2, 4))

      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((3.5, 2.2), [$R_2$])
      content((3.8, 1.4), [$2000 Omega$])

      line((3, 2.4), (3, 4))
      arrow_I((3, 3.6), (3, 2.8))
      content((3.4, 3), [$I_2$])

      line((0, 0), (4.9, 0))
      line((0, 4), (4.9, 4))
      arrow_I((0.5, 4), (1.3, 4))
      content((1.3, 3.6), [$I_1$])
      circle((5, 0), radius: 0.1)
      // content((5, 0.4), [-])
      // content((5, -0.4), [b])
      circle((5, 4), radius: 0.1)
      // content((5, 4.4), [a])
      // content((5, 3.6), [+])
      // content((5, 2), [$U_(O C)$])
      line((5, 0.1), (5, 1.6))
      constSourceV((5, 2))
      content((5.5, 1.6), [-])
      content((5.5, 2.4), [+])
      content((4.2, 2), [$U$])
      line((5, 2.4), (5, 3.9))
      arrow_I((4.8, 4), (4, 4))
      content((4.4, 3.6), [$I$])
    }),
    [
      $U_(O C)$解法同上
      $
                       & I= I_2 - (1+beta) I_1 = U/R_2 - (1+beta) (- U/R_1) \
        arrow.r.double & R_0 = U/I = 1/(1/R_2 + (1+beta)/R_1) = (R_1 R_2)/(R_1 + (1+beta)R_2) = 23.26 Omega
      $
    ],
  )
]

=== 额外习题插入
#Red[【声明】本部分选题来自SAVIA]

==== (叠加定理)
如图所示所有电阻均为R, 求I
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (0, 1))
    line((0, 0), (2.4, 0))
    constSourceV((2.8, 0))
    line((3.2, 0), (5.6, 0))
    arrow_I((2, 0), (1.2, 0))
    content((1.2, 0.4), [1A])

    line((0, 1), (0.8, 1))
    resistorH((1.2, 1))
    line((1.6, 1), (2.4, 1))
    resistorH((2.8, 1))
    line((3.2, 1), (4, 1))
    resistorH((4.4, 1))
    line((4.8, 1), (5.6, 1))

    line((0, 1), (0, 2.6))
    resistorV((0, 3))
    line((0, 3.4), (0, 5), (2.4, 5))
    resistorH((2.8, 5))
    line((3.2, 5), (5.6, 5), (5.6, 3.4))
    resistorV((5.6, 3))
    line((5.6, 2.6), (5.6, 0))

    line((0, 5), (3.6, 1))
    line((5.6, 5), (2, 1))
    circle((2.8, 1.888888), radius: 0.1, fill: white)
    line((1.98, 2.625), (2.88, 1.625), stroke: (thickness: 0.2, paint: white))
    line((5.6, 5), (2, 1))
    circle((1.8, 3), radius: 0.4, fill: white)
    line((1.5, 2.73), (2.1, 3.27))
    circle((3.8, 3), radius: 0.4, fill: white)
    line((4.1, 2.73), (3.5, 3.27))
    arrow_I((2.25, 2.5), (2.61, 2.1))
    content((2, 2.2), [1A])
    arrow_I((3.35, 2.5), (2.99, 2.1))
    content((3.6, 2.2), [3A])

    arrow_I((3.5, 5), (4.3, 5))
    content((4.2, 5.4), [I])
  })
  // #image("assets/image.png", width: 90%)
]
#grid(
  columns: 3,
  gutter: 4em,
  // align: horizon,
  cetz.canvas({
    import cetz.draw: *
    line((0, 0), (0, 1))
    line((0, 0), (2.4, 0))
    constSourceV((2.8, 0))
    line((3.2, 0), (5.6, 0))
    arrow_I((2, 0), (1.2, 0))
    content((1.2, 0.4), [1A])

    line((0, 1), (0.8, 1))
    resistorH((1.2, 1))
    line((1.6, 1), (2.4, 1))
    resistorH((2.8, 1))
    line((3.2, 1), (4, 1))
    resistorH((4.4, 1))
    line((4.8, 1), (5.6, 1))

    line((0, 1), (0, 2.1))
    resistorV((0, 2.5))
    line((0, 2.9), (0, 4), (2.4, 4))
    resistorH((2.8, 4))
    line((3.2, 4), (5.6, 4), (5.6, 2.9))
    resistorV((5.6, 2.5))
    line((5.6, 2.1), (5.6, 0))
    arrow_I((3.5, 4), (4.3, 4))
    content((4.2, 4.4), [$I_1$])
  }),
  cetz.canvas({
    import cetz.draw: *
    // line((0, 0), (0, 1))
    // line((0, 0), (2.4, 0))
    // constSourceV((2.8, 0))
    // line((3.2, 0), (5.6, 0))
    // arrow_I((2, 0), (1.2, 0))
    // content((1.2, 0.4), [1A])

    line((0, 1), (0.8, 1))
    resistorH((1.2, 1))
    line((1.6, 1), (2.4, 1))
    resistorH((2.8, 1))
    line((3.2, 1), (4, 1))
    resistorH((4.4, 1))
    line((4.8, 1), (5.6, 1))

    line((0, 1), (0, 2.6))
    resistorV((0, 3))
    line((0, 3.4), (0, 5), (2.4, 5))
    resistorH((2.8, 5))
    line((3.2, 5), (5.6, 5), (5.6, 3.4))
    resistorV((5.6, 3))
    line((5.6, 2.6), (5.6, 1))

    line((0, 5), (3.6, 1))
    // line((5.6, 5), (2, 1))
    // circle((2.8, 1.888888), radius: 0.1, fill: white)
    // line((1.98, 2.625), (2.88, 1.625), stroke: (thickness: 0.2, paint: white))
    // line((5.6, 5), (2, 1))
    circle((1.8, 3), radius: 0.4, fill: white)
    line((1.5, 2.73), (2.1, 3.27))
    // circle((3.8, 3), radius: 0.4, fill: white)
    // line((4.1, 2.73), (3.5, 3.27))
    arrow_I((2.25, 2.5), (2.61, 2.1))
    content((2, 2.2), [1A])
    // arrow_I((3.35, 2.5), (2.99, 2.1))
    // content((3.6, 2.2), [3A])

    arrow_I((3.5, 5), (4.3, 5))
    content((4.2, 5.4), [$I_2$])
  }),
  cetz.canvas({
    import cetz.draw: *
    // line((0, 0), (0, 1))
    // line((0, 0), (2.4, 0))
    // constSourceV((2.8, 0))
    // line((3.2, 0), (5.6, 0))
    // arrow_I((2, 0), (1.2, 0))
    // content((1.2, 0.4), [1A])

    line((0, 1), (0.8, 1))
    resistorH((1.2, 1))
    line((1.6, 1), (2.4, 1))
    resistorH((2.8, 1))
    line((3.2, 1), (4, 1))
    resistorH((4.4, 1))
    line((4.8, 1), (5.6, 1))

    line((0, 1), (0, 2.6))
    resistorV((0, 3))
    line((0, 3.4), (0, 5), (2.4, 5))
    resistorH((2.8, 5))
    line((3.2, 5), (5.6, 5), (5.6, 3.4))
    resistorV((5.6, 3))
    line((5.6, 2.6), (5.6, 1))

    // line((0, 5), (3.6, 1))
    line((5.6, 5), (2, 1))
    // circle((2.8, 1.888888), radius: 0.1, fill: white)
    // line((1.98, 2.625), (2.88, 1.625), stroke: (thickness: 0.2, paint: white))
    line((5.6, 5), (2, 1))
    // circle((1.8, 3), radius: 0.4, fill: white)
    // line((1.5, 2.73), (2.1, 3.27))
    circle((3.8, 3), radius: 0.4, fill: white)
    line((4.1, 2.73), (3.5, 3.27))
    // arrow_I((2.25, 2.5), (2.61, 2.1))
    // content((2, 2.2), [1A])
    arrow_I((3.35, 2.5), (2.99, 2.1))
    content((3.6, 2.2), [3A])

    arrow_I((3.5, 5), (4.3, 5))
    content((4.2, 5.4), [$I_3$])
  }),
)
$
  I & = I_1 + I_2 + I_3 \
    & = 0.5 A + (-0.5 A) + 1.5 A = 1.5 A
$
==== (等效电源1)
如图(a)所示直流电路, 求电流I
#align(center)[#grid(
  columns: 2,
  rows: 2,
  gutter: 1em,
  align: center + horizon,
  cetz.canvas({
    import cetz.draw: *
    line((0, 0), (1.5, 0))
    line((0, 0), (0, 0.3))
    constSourceV((0, 0.7))
    content((-0.5, 0.3), [-])
    content((-0.5, 1.1), [+])
    content((-0.8, 0.7), [$U_S$])
    content((0.8, 0.7), [12V])
    line((0, 1.1), (0, 1.9))
    resistorV((0, 2.3))
    line((0, 2.7), (0, 3), (1.5, 3))

    line((1.5, 0), (1.5, 1.1))
    resistorV((1.5, 1.5))
    line((1.5, 1.9), (1.5, 4.5), (2.6, 4.5))
    resistorH((3, 4.5))
    line((3.4, 4.5), (4.5, 4.5), (4.5, 3))
    line((1.5, 3), (2.6, 3))
    controlledSourceV((3, 3))
    line((3.4, 3), (5, 3), (5, 1.9))
    resistorV((5, 1.5))
    line((5, 1.1), (5, 0), (1.5, 0))

    arrow_I((3.4, 3), (4.2, 3))
    content((4.1, 3.4), [$2 I_1$])
    content((3, 4.1), [$1 Omega$])
    content((4.6, 1.5), [$5 Omega$])
    content((0.5, 2.3), [$2 Omega$])
    content((2, 1.5), [$4 Omega$])
    arrow_I((1.5, 3), (1.5, 2.3))
    content((1.9, 2.3), [$I_1$])

    node((4.5, 3), fill: white)
    content((4.5, 2.6), [a])
    node((4.5, 0), fill: white)
    content((4.5, 0.4), [b])

    node((1.5, 3))

    arrow_I((0, 3), (1, 3))
    content((1, 3.4), [$I_2$])
    arrow_I((1.5, 4.5), (1.5, 3.5))
    content((1.9, 3.5), [$I_3$])
  }),
  cetz.canvas({
    import cetz.draw: *
    line((0, 0), (1.5, 0))
    line((0, 0), (0, 0.3))
    constSourceV((0, 0.7))
    content((-0.5, 0.3), [-])
    content((-0.5, 1.1), [+])
    content((-0.8, 0.7), [$U_S$])
    content((0.8, 0.7), [12V])
    line((0, 1.1), (0, 1.9))
    resistorV((0, 2.3))
    line((0, 2.7), (0, 3), (1.5, 3))

    line((1.5, 0), (1.5, 1.1))
    resistorV((1.5, 1.5))
    line((1.5, 1.9), (1.5, 4.5), (2.6, 4.5))
    resistorH((3, 4.5))
    line((3.4, 4.5), (4.5, 4.5), (4.5, 3))
    line((1.5, 3), (2.6, 3))
    controlledSourceV((3, 3))
    line((3.4, 3), (4.5, 3))
    //line((3.4, 3), (5, 3), (5, 1.9))
    //resistorV((5, 1.5))
    //line((5, 1.1), (5, 0), (1.5, 0))

    arrow_I((3.4, 3), (4.2, 3))
    content((4.1, 3.4), [$2 I_1$])
    content((3, 4.1), [$1 Omega$])
    // content((4.6, 1.5), [$5 Omega$])
    content((0.5, 2.3), [$2 Omega$])
    content((2, 1.5), [$4 Omega$])
    arrow_I((1.5, 3), (1.5, 2.3))
    content((1.9, 2.3), [$I_1$])

    node((4.5, 3), fill: white)
    content((4.5, 2.6), [a])
    node((1.5, 0), fill: white)
    content((1.9, 0), [b])

    node((1.5, 3))

    arrow_I((0, 3), (1, 3))
    content((1, 3.4), [$I_2$])
    arrow_I((1.5, 4.5), (1.5, 3.5))
    content((1.9, 3.5), [$I_3$])
  }),

  [(a)], [(b)],
)]
断开ab(如图(b)所示), 显然$I_2 = I_1$, $I_3 = 2 I_1$, $display(I_1 = (U_s)/(2 Omega +4 Omega) = 2A)$, 则$U_(O C) = I_1 dot 4 Omega + I_3 dot 1 Omega = 12 V$

短路ab, 将电压源$U_s$等效为电流源, 如下图:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (0, 1.1))
    constSourceH((0, 1.5))
    arrow_I((0, 1.9), (0, 2.7))
    content((-0.5, 2.7), [$I_S$])
    content((-0.5, 2.1), [$6A$])
    line((0, 1.9), (0, 3), (1.5, 3), (1.5, 1.9))
    resistorV((1.5, 1.5))
    content((1, 1.5), [$2 Omega$])
    line((1.5, 1.1), (1.5, 0))
    arrow_I((1.5, 3), (1.5, 2.2))
    content((1.9, 2.2), [$I_2$])

    line((1.5, 3), (3, 3), (3, 1.9))
    resistorV((3, 1.5))
    content((2.5, 1.5), [$4 Omega$])
    line((3, 1.1), (3, 0))
    arrow_I((3, 3), (3, 2.2))
    content((3.4, 2.2), [$I_1$])

    line((3, 3), (4.5, 3), (4.5, 1.9))
    controlledSourceH((4.5, 1.5))
    line((4.5, 1.1), (4.5, 0))
    arrow_I((4.5, 3), (4.5, 2.2))
    content((5, 2.2), [$2 I_1$])

    line((4.5, 3), (6, 3), (6, 1.9))
    resistorV((6, 1.5))
    content((5.5, 1.5), [$1 Omega$])
    line((6, 1.1), (6, 0))
    arrow_I((6, 3), (6, 2.2))
    content((6.4, 2.2), [$I_3$])

    line((0, 0), (6, 0))
    arrow_I((4.5, 0), (3.5, 0))
    content((3.7, 0.4), [$I_(S C)$])
  })
]
由
$
  I_2 dot 2 Omega = I_1 dot 4 Omega = I_3 dot 1 Omega \
  I_S = I_2 + I_1 + 2I_2 + I_3 = 9 I_1 = 6A \
$
解得$ I_(S C) = 2I_1 + I_3 = 6 I_1 = 4A $
所以$R_0 = display(U_(O C)/I_(S C)) = 3 Omega$, 因此化简原电路为下图
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (0, 0.5))
    constSourceV((0, 0.9))
    content((0.5, 1.3), [+])
    content((0.5, 0.5), [-])
    content((-1, 0.9), [$12V$])
    line((0, 1.3), (0, 1.8), (1, 1.8))
    resistorH((1.4, 1.8))
    content((1.4, 2.2), [$3 Omega$])
    line((1.8, 1.8), (2.8, 1.8), (2.8, 1.3))
    resistorV((2.8, 0.9))
    content((3.3, 0.9), [$5 Omega$])
    line((2.8, 0.5), (2.8, 0), (0, 0))
  })
]
易知电流$I = display((12V)/(8 Omega)) = 1.5 A$
== 正弦交流电路
=== 正弦量的三要素
#grid(
  columns: (1fr, 1fr),
  [正弦交流电可以表示为
    $
      u = U_m sin(omega t + phi_u) \
      i = I_m sin(omega t + psi_i) \
    $
  ],
  [
    #v(-2em)
    #cetz.canvas({
      import cetz-plot: *
      import cetz.draw: *

      plot.plot(
        size: (8, 3),
        x-tick-step: none,
        y-tick-step: none,
        x-label: [$omega t$],
        y-label: [$u$],
        x-min: -0.6,
        x-max: 10,
        y-min: -1.2,
        y-max: 1.2,
        axis-style: "school-book",
        name: "plot",
        {
          // let diff = 3.14
          plot.add(
            domain: (-0.5, 10),
            style: (stroke: (paint: blue, thickness: 1.5pt)),
            x => calc.sin(x + 0.5),
          )

          // 添加关键点标注：U_GS(off)
          //plot.add-anchor("cutoff", (diff, 0))

          // plot.add(domain: (0, 4 * calc.pi), calc.sin)
          plot.add-vline(-0.5, calc.pi, 2 * calc.pi, min: 0, max: 0.15, style: (stroke: (paint: black)))
          plot.add-hline(1, min: 0, max: 0.15, style: (stroke: (paint: black)))
          plot.add-vline(2, 8.28, style: (stroke: (paint: black, dash: "dashed")))
          // plot.add-hline(1, min: 2, max: 8.28, style: (stroke: (paint: black)))
          plot.add-anchor("pt1", (2, 1.2))
          plot.add-anchor("pt2", (8.28, 1.2))
          plot.add-anchor("pt3", (2, -1.2))
          plot.add-anchor("pt4", (8.28, -1.2))
          // line(((1, 1.5), (1, 8)))
        },
      )
      line((0.5, 2.75), (1.07, 2.75), stroke: (dash: "dashed"))
      content((-0.1, 3), [$U_m$])
      line("plot.pt1", "plot.pt2", mark: (start: ">", end: ">"), fill: black)
      line("plot.pt3", "plot.pt4", mark: (start: ">", end: ">"), fill: black)
      content((4.4, 3.5), [T])
      content((4.4, -0.5), [$2 pi$])
      content((-0.3, 1.8), [$phi_u$])
      content((2.9, 2.2), [$pi$])
      content((5.5, 1.2), [$2 pi$])
      content((8.5, 2), [t])

      // 在 plot 外部手动添加文字标注，对齐更精准
      // content("plot.cutoff", [ $U_(G S (o f f))$ ], anchor: "north", padding: .2)
    })],
)


==== 周期、频率和角频率
#grid(
  columns: (1.6fr, 1fr),
  [
    - 周期 $T$: 正弦交流电重复变化一次所需的时间。
    - 频率 $f$: 正弦交流电每秒内变化的周期数。
    - 角频率 $omega$: 正弦交流电相位每秒内变化的角度。
  ],
  $
    T = 1/f \
    omega = 2 pi f
  $,
)
==== 相位、初相位和相位差
#grid(
  columns: (1.4fr, 1fr),
  [
    - 相位: $omega t + phi_u$, $omega t + phi_i$
    - 初相位 $phi_0$: 正弦交流电在时间 $t=0$ 时的相位。
    - 相位差 $phi$: 两个同频率正弦量的相位之差。
  ],
  [
    $phi_u > phi_i$时称$u$超前于$i$,或$i$滞后于$u$

    $phi_u = phi_i$时称$u$与$i$同相，

    $|phi_u - phi_i| = 180degree$ 时称$u$与$i$反相。

    $|phi_u - phi_i| = 90 degree$时称$u$与$i$正交。

  ],
)
==== 瞬时值、最大值和有效值

- 瞬时值($i、u$): 正弦交流电在某一瞬时的量值。
- 最大值($I_m、U_m$): 正弦交流电在变化过程中出现的最大瞬时值。
- 有效值($I、U$): 正弦交流电在一个周期内的平均功率等效的直流值。
由有效值定义,
$
                 & i = I_m sin(omega t + phi_i) \
                 & R I^2 T = integral_0^T R i^2 "d" t \
  arrow.r.double & I = I_m sqrt(1/T integral_0^T sin^2(omega t + phi_i) "d"t) = I_m/sqrt(2) \
$
同理$U = display(U_m/sqrt(2))$

=== 正弦量的相量表示法
相量法的实质是用复数来表述正弦量。
假设正弦电压$u = sqrt(2) U sin(omega t + phi_u)$, 则其相量表示为$dot(U) = U ph(phi_u)$, 其中$U$是一个复数, $U_m$是复数的模, $phi_u$是复数的辐角。
