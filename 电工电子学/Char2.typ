#import "utils.typ": Red, eq, three_line_table
#import "models.typ": arrow, constSourceH, constSourceV, controlledSourceV, loop, node, resistorH, resistorV
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
      arrow((0, 2.4), (0, 3.2))
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
      arrow((1.4, 4), (2, 4))
      content((1.7, 4.4), [I])

      line((2, 0), (2, 0.8))
      arrow((2, 0.8), (2, 0.2))
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
      arrow((0, 2.8), (0, 3.6))
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
      arrow((4, 3.8), (4, 3))
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
      arrow((5.1, 4), (4.5, 4))
      content((4.8, 3.6), [$beta I_1$])
      line((5.9, 4), (6.5, 4))
      arrow((6.5, 3.2), (6.5, 3.9))
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
      arrow((0, 2.4), (0, 3.2))
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
      arrow((1.5, 3.2), (1.5, 3.8))
      content((1.1, 3.6), [$I_1$])
      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((2.6, 2), [$R_2$])
      line((3, 2.4), (3, 4))
      arrow((3, 3.4), (3, 2.6))
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
      arrow((1.5, 3.2), (1.5, 3.8))
      content((1.1, 3.6), [$I_11$])
      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((2.6, 2), [$R_2$])
      line((3, 2.4), (3, 4))
      arrow((3, 3.4), (3, 2.6))
      content((2.6, 3), [$I_21$])
      line((0, 4), (3, 4))
    }),
    [+],
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0, 1.6))
      constSourceH((0, 2))
      content((0.4, 2.8), [$I_S$])
      arrow((0, 2.4), (0, 3.2))
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
      arrow((1.5, 3.2), (1.5, 3.8))
      content((1.1, 3.6), [$I_12$])
      line((3, 0), (3, 1.6))
      resistorV((3, 2))
      content((2.6, 2), [$R_2$])
      line((3, 2.4), (3, 4))
      arrow((3, 3.4), (3, 2.6))
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
        arrow((2.5, 3.2), (3.3, 3.2))
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
      arrow((4, 1.1), (4, 1.9))
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
==== 戴维南定理
对外电路来说, 一个线性有源二端网络可用一个电压源和电阻的串联电路来等效, 该电压源的电压等于此有源二端网络的开路电压$U_(O C)$, 串联电阻等于此有源二端网络将独立电源置零后在其端口处的等效电阻$R_0$。
==== 诺顿定理
对外电路来说, 一个线性有源二端网络可用一个电流源和电阻的并联电路来等效, 该电流源的电流等于此有源二端网络的短路电流$I_(S C)$, 并联电阻等于此有源二端网络将独立电源置零后在其端口处的等效电阻$R_0$。


#grid(
  columns: 5,
  gutter: 1em,
  align: center + horizon,
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
  }),
  cetz.canvas({
    import cetz.draw: *
    rect((0, 0), (1, 4))
    content((0.5, 2.6), [外

      电

      路])
    rect((-3, 0), (-2, 4))
    content((0.5, 2.6), [外

      电

      路])
  }),
  cetz.canvas({
    import cetz.draw: *
    rect((0.5, 0), (1.5, 4))
    content((1, 2.6), [外

      电

      路])
    line((0, 0.2), (-2, 0.2), (-2, 1.6))
    constSourceH((-2, 2))
    arrow((-2, 2.4), (-2, 3.2))
    content((-1.5, 2.8), [$I_(S C)$])
    line((-2, 2.4), (-2, 3.8), (0, 3.8))
    line((-1, 3.8), (-1, 2.4))
    resistorV((-1, 2))
    content((-0.5, 2), [$R_0$])
    line((-1, 1.6), (-1, 0.2))
  }),
)
