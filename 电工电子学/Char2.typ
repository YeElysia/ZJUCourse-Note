#import "utils.typ": Red, eq, three_line_table
#import "models.typ": (
  arrow_I, capacitorH, capacitorV, constSourceH, constSourceV, controlledSourceH, controlledSourceV, inductorH,
  inductorV, loop, node, ph, resistorH, resistorV,
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


      $U_(s 1) = 8V$, $I_(s 2)=12A$时,$U_X = 24V$,

      $U_(s 1) = -8V$,$I_(s 2)=4A$时, $U_X = 0V$,

      求:$U_(s 1) = 20V$,$I_(s 2)=20A$时,$U_X = ?$
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

假设正弦电压$u = sqrt(2) U sin(omega t + phi_u)$, 则其相量表示为$dot(U) = U ph(phi_u)$, 其中$dot(U)$是一个复数, 复数的模$U$是电路的有效值,辐角$phi_u$是初相位。转换成代数表达式为$dot(U) = U (cos phi_u + j sin phi_u)$, 其中$j$是虚数单位。从而我们把复杂的相量运算转换成了简单的复数运算。

#callouts.Question(title: [例 2.3.1])[
  已知正弦电流$i_1= 2 sqrt(2) sin(100 pi t + 60 degree)A$, $i_2 = 3 sqrt(2) sin(100 pi t + 30 degree)A$, 试用相量法求$i_1 + i_2$, 并画出相量图。

  【解】
  #grid(
    columns: 2,
    gutter: 5em,
    [
      $
        dot(I) & = dot(I)_1 + dot(I)_2 =(1 + j 1.732) + (2.598 + j 1.5) A \
               & = 3.598 + j 3.232 A \
               & = 4.836 ph(41.9 degree) A \
      $
    ],
    [
      #v(-3em)
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (rel: (60deg, 2)), mark: (end: ">"), fill: black)
        line((), (rel: (30deg, 3)), stroke: (dash: "dashed"), fill: black)
        line((0, 0), (rel: (30deg, 3)), mark: (end: ">"), fill: black)
        line((), (rel: (60deg, 2)), stroke: (dash: "dashed"), fill: black)
        line((0, 0), (rel: (41.9deg, 4.836)), mark: (end: ">"), fill: black)
        line((0, 0), (5, 0), mark: (end: ">"), fill: black)
        arc((0.5, 0), start: 0deg, stop: 60deg, radius: 0.5)
        content((1.25, 1.4), [#text(8pt)[$60 degree$]])
        content((0.85, 2), [#text(8pt)[$I_1$]])
        arc((1, 0), start: 0deg, stop: 41.9deg, radius: 1)
        content((2.15, 1.5), [#text(8pt)[$41.9 degree$]])
        content((3.75, 2.8), [#text(8pt)[$I$]])
        arc((1.5, 0), start: 0deg, stop: 30deg, radius: 1.5)
        content((1.95, 0.4), [#text(8pt)[$30 degree$]])
        content((2.8, 1.3), [#text(8pt)[$I_2$]])

        content((4.8, -0.3), [#text(8pt)[$+1$]])
      })],
  )
]
=== 电阻、电感、电容元件上电压与电流关系的相量形式
#figure()[
  #three_line_table(table(
    columns: 5,
    inset: 0.8em,
    table.header([元件名称], [相量关系], [电抗], [有效值关系], [相位关系]),
    [电阻], [$dot(U) = R dot(I)$], [], [$U = R I$], [$phi = 0$],
    [电感], [$dot(U) = j X_L dot(I)$], [$X_L = omega L$], [$U = X_L I$], [$phi_u - phi_i = 90 degree$],
    [电容], [$dot(U) = - j X_C dot(I)$], [$X_C = 1/(omega C)$], [$I = X_C U$], [$phi_i - phi_u = 90 degree$],
  ))
]
==== 电阻
显然
==== 电感
设流过电感的电流为$i = sqrt(2) I sin(omega t + phi_i)$,
则电感两端的电压为
$
  u & = L display(("d"i)/("d"t)) =sqrt(2) I omega L cos(omega t + phi_i) \
    & = sqrt(2) I omega L sin(omega t + phi_i + 90 degree) \
    & = sqrt(2) U sin(omega t + phi_u) \
$
从而$dot(I) = I ph(phi_i)$, $dot(U) = U ph(phi_u)= omega L I ph(phi_i + 90 degree) = omega L ph(90 degree) I ph(phi_i) = j omega L dot(I) = j X_L dot(I)$
#callouts.Info[
  感抗是表征电感对正弦电流所呈现的“阻碍”能力大小的一个参数。对L一定的电感来说, $X_L = omega L = 2 pi f L$, 频率越高, 感抗越大。故当频率为0即直流时, 感抗为0, 电感表现为短路。
]
==== 电容
设电容两端的电压为$u = sqrt(2) U sin(omega t + phi_u)$, 则流过电容的电流为
$
  i & = C display(("d"u)/("d"t)) = sqrt(2) U omega C cos(omega t + phi_u) \
    & = sqrt(2) U omega C sin(omega t + phi_u + 90 degree) \
    & = sqrt(2) I sin(omega t + phi_i) \
$
从而$dot(U) = U ph(phi_u)$, $dot(I) = I ph(phi_i) = omega C U ph(phi_u + 90 degree) = omega C ph(90 degree) U ph(phi_u) = j omega C dot(U) =- display((dot(U))/( j X_C ))$
(注意$1= -j^2$ 即 $display(1/(j)) = -j$)

=== 简单正弦交流电路的计算
==== 基尔霍夫定律
对于正弦交流电路, 基尔霍夫定律同样适用
$
  sum dot(I) = 0 \
  sum dot(U) = 0 \
$
==== 阻抗(复阻抗)
对于一个RCL电路, 其电压与电流的相量关系为
$
  dot(U) & = dot(U)_R + dot(U)_L + dot(U)_C \
         & = R dot(I) + j X_L dot(I) - j X_C dot(I) = [ R + j(X_L - X_C)] dot(I) \
         & = (R + j X) dot(I) = Z dot(I) \
$
其中$Z = R + j X$被称为电路的阻抗, $X = X_L - X_C$被称为电路的电抗。

阻抗是复数，有模长 |z| = $sqrt(R^2 + (X_L-X_C)^2)$ 和幅角$phi = arctan((X_L-X_C)/R)$，不是相量。其复数形式为:
$
  Z & = (dot(U))/(dot(I)) = (U ph(phi_u))/(I ph(phi_i)) = (U/I) ph(phi_u - phi_i) \
    & = |Z| ph(phi) \
$
可见电压与电流的有效值之比等于阻抗, 电压与电流之间的相位差等于阻抗角。

当辐角$phi$为0时, 电压与电流同相, 电路表现为纯电阻性, 形成串联谐振；当$phi$为正时, 电压超前于电流, 电路表现为感性；当$phi$为负时, 电压滞后于电流, 电路表现为容性。

所有RCL元件都可以视为阻抗, 从而将其像电阻一样进行串并联计算。

#callouts.Tip(title: [正弦交流电路的基本计算方法(Savia)])[
  基本目标：由已知的元件参数、电压、电流等，求出未知的电压、电流（包括有效值和相位）

  - 首先要选择参考相量，建议选择与其它相量联系紧密的相量(如串联电路中的总电流，并联电路中的总电压，混联电路中并联部分的电压等)。
  - 然后根据电路中的元件关系以及基尔霍夫定律、题给条件等，建立各相量间的关系，画出相量图借助相量图可以较为轻松地解题。
]

#callouts.Question[

  #grid(
    columns: 2,
    gutter: 4em,
    [
      如图所示电路中, $I_C = 6 A$, $I_R = 8 A$, $X_L = 10 Omega$, $dot(U) 与 dot(I)$同相。求$R、X_C$。
    ],
    [#v(-2.5em)
      #cetz.canvas({
        import cetz.draw: *
        circle((0, 0.8), radius: 0.1)
        line((0.1, 0.8), (4.8, 0.8))
        circle((0, 3), radius: 0.1)
        line((0.1, 3), (1.2, 3))
        inductorH((1.8, 3))
        line((2.4, 3), (3.2, 3))
        line((), (3.2, 1.9))
        capacitorV((3.2, 1.5))
        line((3.2, 1.1), (3.2, 0.8))
        line((3.2, 3), (4.8, 3), (4.8, 1.9))
        resistorV((4.8, 1.5))
        line((4.8, 1.1), (4.8, 0.8))

        arrow_I((0.2, 3), (0.8, 3))
        content((0.6, 2.5), [$dot(I)$])

        arrow_I((3.2, 3), (3.2, 2.2))
        content((2.8, 2.4), [$dot(I)_C$])

        arrow_I((4.8, 3), (4.8, 2.2))
        content((4.4, 2.4), [$dot(I)_R$])

        content((0, 2.6), [+])
        content((0, 1.2), [-])
        content((0, 1.9), [$dot(U)$])
        content((1.2, 2.8), [+])
        content((2.4, 2.8), [-])
        content((1.8, 2.5), [$dot(U)_L$])

        content((2.6, 1.5), [C])
        content((4.4, 1.5), [R])
        content((3.2, 3.3), [a])
        content((3.2, 0.5), [b])
      })],
  )
  【解】
  选$dot(U)_(a b)$为参考相量, 则有
  $
    dot(I)_C = j dot(U)_(a b)/X_C = I_C ph(90 degree) \
    dot(I)_R = dot(U)_(a b)/R = I_R ph(0 degree)
  $
  由节点A处KCL, $dot(I) - dot(I)_C - dot(I)_R = 0$, $dot(I) = 10A ph(37 degree)$, $dot(U)_L = j X_L dot(I) = 100 V ph(127 degree)$

  #grid(
    columns: 2,
    gutter: 2em,
    align: horizon,
    [#h(2em)由KVL, $dot(U) = dot(U)_L + dot(U)_(a b)$, $dot(U)和 dot(I)$同相, 画出相量图:],
    align(center)[
      #v(-1.5em)
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (rel: (0deg, 5 / 3 * 1.5)), mark: (end: ">"), fill: black)
        line((), (rel: (127deg, 1 * 1.5)), mark: (end: ">"), stroke: gray, fill: gray)
        line((0, 0), (rel: (127deg, 1 * 1.5)), mark: (end: ">"), fill: black)
        line((0, 0), (rel: (0deg, 0.8 * 1.5)), mark: (end: ">"), stroke: green, fill: green)
        line((), (rel: (90deg, 0.6 * 1.5)), mark: (end: ">"), stroke: green, fill: green)
        line((0, 0), (rel: (37deg, 4 / 3 * 1.5)), mark: (end: ">"), stroke: black, fill: black)
        line((0, 0), (rel: (37deg, 1 * 1.5)), mark: (end: ">"), stroke: red, fill: red)

        content((1, -0.5), [$dot(I)_R$])
        content((1.6, 0.3), [$dot(I)_C$])
        content((0.5, 0.8), [$dot(I)$])
        content((1.5, 1.4), [$dot(U)$])
        content((2.4, 0.8), [$dot(U)_L$])
        content((-1, 0.6), [$dot(U)_L$])
        content((2.5, -0.5), [$dot(U)_(a b)$])
      })],
  )
  因此解得$dot(U)_(a b) = 500/3 V ph(0 degree)$, $R = U_(a b)/I_R = 500/24approx 20.83 Omega$, $X_C = U_(a b)/I_C = 500/18 approx 27.78 Omega$。
]

=== 交流电路的功率
==== 瞬时功率 p
电路某一时刻吸收或放出的功率。即: (不能用相量计算)
$
  p = u i
$
#callouts.Info[
  当$p>0$时, 电路吸收功率; 当$p<0$时, 电路放出功率。

  假设电源$i = sqrt(2) I sin(omega t)$, $u = sqrt(2) U sin(omega t + phi)$, 则:
  #eq("(2.3.1)", $ p = u i = U I cos phi (1 - cos 2 omega t) + U I sin phi sin 2 omega t $)
  当电路为纯电阻电路时, $phi = 0$, $p = U I (1 - cos 2 omega t) > 0$, 电路始终吸收功率；

  当电路为纯电感或纯电容电路时, $|phi| = 90 degree$, $p = plus.minus U I sin 2 omega t$, 电路在一个周期内既吸收功率又放出功率，平均功率为0。

  对于一般电路, 由于带有电阻, 负载吸收功率总是大于放出功率。

]
==== 有功功率、无功功率与视在功率

1. #Red[有功功率(平均功率) P]: 电路在电流变化一个周期内负载吸收功率的平均值。#Red[功率表显示电路的有功功率]。

  例如式(2.3.1),
  $
    P = 1/T integral_0^T p "d"t = U I cos phi
  $
  其中,$cos phi$称为功率因数($lambda$), $phi$称为功率因数角。由上已知电感和电容元件不消耗功率, 因此#Red[$P$等于电路中电阻元件的功率($I^2R$)]。
2. #Red[无功功率 Q]: 储能元件与电源进行能量交换的瞬时功率最大值($I^2 X$), 单位为乏(var)。感性无功功率和容性无功功率可以相互补偿, 即可以代数相加。
  $
    Q = U I sin phi
  $
3. #Red[视在功率 S]: 电路两端的电压有效值与电流有效值的乘积。单位为伏·安(V·A)。表示电源设备的容量。
  $
    S = U I
  $
由此我们将式(2.3.1)改写为以下形式
$
  p = P (1 - cos 2 omega t) + Q sin 2 omega t \
$
显然在电源容量一定的情况下, 功率因数越大, 电路的有功功率越大, 电路的效率越高, 且损耗越小。因此在实际电路中, 常常通过并联电容等方式来提高功率因数。

#callouts.Tip[
  #grid(
    columns: 2,
    gutter: 4em,
    [
      P、Q、S三者的关系可以用一个直角三角形来表示。
    ],
    [#v(-3em)
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (3, 0))
        line((3, 0), (3, 1.5))
        line((0, 0), (3, 1.5))
        content((2, 0.3), [P])
        content((3.3, 0.6), [Q])
        content((1.5, 1.2), [S])
      })],
  )
]

#callouts.Question[
  电流$dot(I) = 5 ph(20 degree) A$, 求提供给阻抗$X= 8 - j 11 Omega$的平均功率。

  【解】将阻抗看成一个电阻和电容的串联, 因此平均功率$P = I^2 R = 200 W$
]
#callouts.Question[
  一台接在工频电源($220V, 50H z$)上的单相异步电动机, $P=700W$, $lambda_1 = cos phi_1 = 0.7$(电感性)。要求并联一电容器，使得$lambda_2 = cos phi_2 = 0.9$, 求所需电容量。

  #grid(
    columns: 2,
    gutter: 1em,
    [
      【解1】

      并联电容不影响有功功率,因此$Q_1 = P tan phi_1$, $Q_2 = P tan phi_2$,

      $Q_C = Q_1 - Q_2 = U^2/X_C = 2 pi f C U^2$

      解得 $C = 2.47 times 10^(-5) F$


    ],
    cetz.canvas({
      import cetz.draw: *
      line((0.1, 0), (2.4, 0))
      line((2.4, 0), (4, 0), (4, 1.4), stroke: (dash: "dashed"))
      line((2.4, 0), (2.4, 1), (1.6, 1), (1.6, 2.6), (3.2, 2.6), (3.2, 1), (2.4, 1))
      content((2.4, 1.8), [700W])
      line((2.4, 2.6), (2.4, 3.6))
      line((0.1, 3.6), (2.4, 3.6))
      line((2.4, 3.6), (4, 3.6), (4, 2.2), stroke: (dash: "dashed"))
      capacitorV((4, 1.8))
      content((4.4, 1.4), [C])

      arrow_I((4, 3), (4, 2.6))
      content((4.4, 2.6), [$dot(I)_C$])
      arrow_I((2.4, 3.6), (2.4, 2.8))
      content((2.8, 3), [$dot(I)_1$])

      circle((0, 0), radius: 0.1)
      circle((0, 3.6), radius: 0.1)
      content((0, 0.4), [-])
      content((0, 3.2), [+])
      content((0, 1.8), [$220 ph(0 degree) V$])
    }),
  )
  #grid(
    columns: (25em, auto),
    gutter: 1em,
    [
      【解2】(相量法) // ,我没搞懂,  解出$dot(I)_2 -dot(I)_1$吗?

      // 那我为什么不直接用$1/X_2= 1/Xe_1 + 1/X_C$?
    ],
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (4.4, 0), mark: (end: ">"), fill: black)
      line((0, 0), (rel: (-45.57deg, 4.55)), mark: (end: ">"), fill: black)
      line((), (rel: (0, 1.71)), mark: (end: ">"), fill: black)
      line((0, 0), (rel: (-25.84deg, 3.54)), mark: (end: ">"), fill: black)

      content((2, -3), [$dot(I)_1$])
      content((3, -1), [$dot(I)_2$])
      content((3.6, -2.5), [$dot(I)_C$])
      content((4.2, -0.5), [$dot(U)$])
    }),
  )
]

=== RCL串联电路的谐振
==== 串联谐振(电压谐振)

#grid(
  columns: 2,
  gutter: 2em,
  [
    在RCL串联电路中, 当$X_L = X_C$时, $dot(U)和 dot(I)$同相, 整个电路呈电阻性, 电路的这种工作状态称为串联谐振。此时:$f_0 = display(1/(2 pi sqrt(L C)))$, $Z = R$取到最小, $I = U/R$取到最大, $P = I^2 R$取到最大。
    - 谐振时的感抗或容抗(特性阻抗): $rho = omega L = 1/(omega C) = sqrt(L/C)$
    - 品质因数: $Q = U_L / U = 1/ (2 pi f_0 C R) = rho/R$
  ],
  [#v(-2em)
    #cetz.canvas({
      import cetz.draw: *
      line((0, 0), (3, 0), mark: (end: ">"), fill: black)
      content((3.4, 0), [$dot(I)$])
      line((0, 0), (0, 2), mark: (end: ">"), fill: black)
      content((0.4, 1.8), [$dot(U)_L$])
      line((0, 0), (0, -2), mark: (end: ">"), fill: black)
      content((0.4, -1.8), [$dot(U)_C$])
      line((0, 0), (1.5, 0), mark: (end: ">"), fill: black)
      content((1.4, 0.4), [$dot(U)_R = dot(U)$])
    })],
)
#grid(
  columns: 2,
  gutter: 2em,
  [如右图, 频率离$f_0$越远, 对应的电流越小。假如外电源由两个不同频率的正弦交流电串联组成, 则总电流应该是两个频率分别的电流的叠加。电源的有效值相同, 但是电流的幅度不同。显然的, 频率离$f_0$越远, 就越容易被削弱, 由此呈现出滤波的效果。

    定义一个半功率点$I = I_0/sqrt(2)$, 认为电路通频带$f_(B W) = f_H - f_L$, 可以证明$f_(B W) = f_0/Q$。因此$Q$越大, 电路的通频带越窄, 电路对频率的选择性越好。
  ],
  align(center)[#cetz.canvas({
      import cetz-plot: *
      import cetz.draw: *

      plot.plot(
        size: (4, 3),
        x-tick-step: none,
        y-tick-step: none,
        x-label: [$f$],
        y-label: [$I$],
        x-min: 0,
        x-max: 3,
        y-min: 0,
        y-max: 1,
        axis-style: "school-book",
        name: "plot",
        {
          // let diff = 3.14
          let I = 1
          let Q = 2
          let F_0 = 1 / (2 * calc.pi * calc.sqrt(0.1 * 0.1))
          plot.add(
            domain: (0.00001, 5),
            style: (stroke: (paint: blue, thickness: 1.5pt)),
            x => I / calc.sqrt(1 + Q * Q * calc.pow(x / F_0 - F_0 / x, 2)),
          )

          // 添加关键点标注：U_GS(off)
          //plot.add-anchor("cutoff", (diff, 0))

          // plot.add(domain: (0, 4 * calc.pi), calc.sin)
          plot.add-vline(1.2426, 2.0384, min: 0, max: 0.707, style: (stroke: (paint: red, dash: "dashed")))
          plot.add-vline(1.5914, min: 0, max: 1, style: (stroke: (dash: "dashed", paint: black)))
          plot.add-hline(0.707, min: 0, max: 2.0384, style: (stroke: (dash: "dashed", paint: black)))
          plot.add-hline(1, min: 0, max: 1.5914, style: (stroke: (dash: "dashed", paint: black)))
          // plot.add-vline(2, 8.28, style: (stroke: (paint: black, dash: "dashed")))
          // // plot.add-hline(1, min: 2, max: 8.28, style: (stroke: (paint: black)))
          plot.add-anchor("pt1", (1.2426, -0.1))
          plot.add-anchor("pt2", (1.5914, -0.1))
          plot.add-anchor("pt3", (2.0384, -0.1))
          plot.add-anchor("pt4", (-0.2, 0.707))
          plot.add-anchor("pt5", (-0.2, 1))
          // line(((1, 1.5), (1, 8)))
        },
      )
      content("plot.pt1", text(size: 10pt)[$f_L$])
      content("plot.pt2", text(size: 10pt)[$f_0$])
      content("plot.pt3", text(size: 10pt)[$f_H$])
      content("plot.pt4", text(size: 10pt)[$I_0/sqrt(2)$])
      content("plot.pt5", text(size: 10pt)[$I_0$])
    })
    电流谐振曲线
  ],
)

==== 并联谐振(电流谐振)

#grid(
  columns: 3,
  gutter: 2em,
  [
    在RCL并联电路中, 总电流$dot(I)$和端电压$dot(U)$同相, 电路的这种工作状态称为并联谐振。
    - 阻抗较大, $Z_0 = R_0 = (R^2 + (2 pi f L)^2)/R = L/(R C)$
    - 总电流很小。
    - R=0, $f_0$时$dot(I) = 0$, $I_(R L)$和$I_C$大小相等方向相反。
  ],
  cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.1)
    line((0.1, 0), (4, 0))
    circle((0, 4), radius: 0.1)
    line((0.1, 4), (4, 4))

    line((2, 4), (2, 2.8))
    inductorV((2, 2.2))
    line((2, 1.6), (2, 1))
    resistorV((2, 0.6))
    line((2, 0.2), (2, 0))
    arrow_I((2, 4), (2, 3.2))
    content((2.4, 3.4), [$I_(R L)$])
    content((2.6, 2.2), [$j omega L$])
    content((2.4, 0.6), [$R$])

    line((4, 4), (4, 2.4))
    capacitorV((4, 2))
    line((4, 1.6), (4, 0))
    arrow_I((4, 4), (4, 3.2))
    content((4.4, 3.4), [$I_C$])
    content((4.8, 2), [$display(1/(j omega C))$])

    content((0, 3.6), [+])
    content((0, 0.4), [-])
    content((0, 2), [$dot(U)$])
    arrow_I((0.5, 4), (1.3, 4))
    content((1, 3.4), [$dot(I)$])
  }),
  cetz.canvas({
    import cetz.draw: *
    line((0, 0), (2, 0), mark: (end: ">"), fill: black)
    content((2.4, 0), [$dot(U)$])
    line((0, 0), (0, 2), mark: (end: ">"), fill: black)
    content((0.4, 1.8), [$dot(I)_C$])
    line((0, 0), (1, -2), mark: (end: ">"), fill: black)
    content((0.4, -1.8), [$dot(I)_(R L)$])
    line((0, 0), (1, 0), mark: (end: ">"), fill: black)
    content((1.4, 0.4), [$dot(I)$])
    line((0, 2), (1, 0), (1, -2), stroke: (dash: "dashed"))
  }),
)
由电路图:
$
  dot(I) & = dot(I)_(R L) + dot(I)_C \
         & =dot(U) / (R + j 2pi f L) + j 2 pi f C dot(U) \
         & = (R/(R^2 + (2 pi f L)^2) + j (2 pi f C - 2 pi f L/(R^2 + (2 pi f L)^2))) dot(U) \
$
设并联谐振频率为$f_0$, 则有
$
  f_0 = 1/(2 pi sqrt(L C)) sqrt(1- C/L R^2)
$
当$R lt.double 2 pi f_0 L 时$, 可以近似认为$f_0 = 1/(2 pi sqrt(L C))$。

#callouts.Question(title: [2.3.16])[

  #grid(
    columns: 2,
    gutter: 1em,
    [
      如图所示电路接于$U=10V$的信号源上, $C = 1 mu F$, 当信号源的$omega = 1000 r a d \/ s$时, $U_R =0$, 当$omega = 2000 r a d \/ s$时, $U_R = 10 V$, 求$L_1、L_2$。
    ],
    [#v(-2.5em)
      #cetz.canvas({
        import cetz.draw: *
        circle((0, 0), radius: 0.1)
        line((0.1, 0), (0.8, 0))
        resistorH((1.2, 0))
        content((1.2, 0.4), [R])
        content((0.6, -0.4), [-])
        content((1.8, -0.4), [+])
        content((1.3, -0.6), [$dot(U)_R$])

        line((1.6, 0), (4.8, 0))
        arrow_I((3.2, 0), (2.2, 0))
        content((2.6, 0.4), [$dot(I)_R$])

        circle((0, 3), radius: 0.1)
        line((0.1, 3), (1.2, 3))
        inductorH((1.8, 3))
        line((2.4, 3), (3.2, 3))
        line((), (3.2, 1.9))
        capacitorV((3.2, 1.5))
        line((3.2, 1.1), (3.2, 0))

        line((3.2, 3), (4.8, 3), (4.8, 2.1))
        inductorV((4.8, 1.5))
        line((4.8, 0.9), (4.8, 0))

        content((0, 2.6), [+])
        content((0, 1.2), [-])
        content((0, 1.9), [$dot(U)$])

        content((1.8, 3.6), [$j omega L_1$])
        content((2.4, 1.35), [$display(1/(j omega C))$])
        content((4.3, 1.5), [$display(j omega L_2)$])
      })],
  )
  【解】$U_R= 0 arrow.double I_R= 0$, 说明C和$L_2$谐振并联谐振。由$omega/(2 pi) = 1/(2 pi sqrt(L_2 C))$得$L_2 = 1 H$。

  $U_R = 10V = U$说明$j omega L_1 + 1/(j omega C) \/\/ j omega L_2 = 0$, 解得$L_1 = 0.33 H$。

  (或将C和$L_2$视作$0.75 mu F$的电容$C_2$, 由串联谐振$omega = 1/sqrt(L_1 C_2)$, 解得$L_1 = 0.33 H$)

]

#pagebreak()
== 三相交流电路
=== 三相交流电源
三相电源来自变压器二次侧的三个绕组

三个绕组的三个始端引出的线称为相线或端线, 又称#Red[火线]。中性点(连接点)引出的线称为中性线, 又称#Red[零线]。

相线与中性线之间的电压称为相电压, 相线与相线之间的电压称为线电压。
#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    node((0, 0))
    line((0, 0), (0, 0.9))
    inductorV((0, 1.5))
    content((0.4, 2.1), [+])
    content((0.4, 0.9), [-])
    content((0.6, 1.4), [$dot(U)_U$])
    line((0, 2.1), (0, 2.9))
    circle((0, 3), radius: 0.1)
    line((rel: (0.1, 0)), (5.9, 3))
    circle((rel: (0.1, 0)), radius: 0.1)
    content((rel: (0.6, 0)), [$L 1$])
    content((-0.4, 3), [$U 1$])
    content((0.4, 0.4), [$U 2$])

    line((0, 0), (-30deg, 0.9))
    arc((-30deg, 0.9), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.2), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.5), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.8), radius: 0.15, start: 150deg, stop: 330deg)
    line((-30deg, 2.1), (-30deg, 2.9))
    circle((-30deg, 3), radius: 0.1)
    line((rel: (0.1, 0)), (5.9, -1.5))
    circle((rel: (0.1, 0)), radius: 0.1)
    content((rel: (0.6, 0)), [$L 2$])
    content((-3.1, -1.5), [$W 1$])
    content((-0.4, 0.4), [$W 2$])
    content((-1.6, -0.2), [$dot(U)_W$])
    content((-2, -0.65), [+])
    content((-1, -0.2), [-])

    line((0, 0), (-150deg, 0.9))
    arc((-150deg, 0.9), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.2), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.5), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.8), radius: 0.15, start: 30deg, stop: 210deg)
    line((-150deg, 2.1), (-150deg, 2.9))
    circle((-150deg, 3), radius: 0.1)
    line((rel: (0, -0.1)), (rel: (0, -1.4)))
    line((), (5.9, -3))
    circle((rel: (0.1, 0)), radius: 0.1)
    content((rel: (0.6, 0)), [$L 3$])
    content((2.7, -1.9), [$V 1$])
    content((0, -0.4), [$V 2$])
    content((1.1, -1.3), [$dot(U)_V$])
    content((1.7, -1.35), [+])
    content((0.6, -0.6), [-])

    line((0, 0), (5.9, 0))
    circle((rel: (0.1, 0)), radius: 0.1)
    content((rel: (0.6, 0)), [$N$])

    content((3.4, 2.8), text(red)[+])
    content((3.4, -1.3), text(red)[-])
    content((3.4, 0.75), text(red)[$dot(U)_(U V)$])

    content((3.4, -1.7), text(blue)[+])
    content((3.4, -2.8), text(blue)[-])
    content((3.4, -2.25), text(blue)[$dot(U)_(V W)$])

    content((5, 2.8), text(purple)[-])
    content((5, -2.8), text(purple)[+])
    content((5, -0.75), text(purple)[$dot(U)_(W U)$])
  })
]
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    三相电源相电压可以表示为
    $
      dot(U)_U & = U_P ph(0 degree) \
      dot(U)_V & = U_P ph(-120 degree) \
      dot(U)_W & = U_P ph(-240 degree) \
    $],
  [
    由此可以得到线电压
    $
      dot(U)_(U V) & = dot(U)_U - dot(U)_V = sqrt(3) U_P ph(30 degree) \
      dot(U)_(V W) & = dot(U)_V - dot(U)_W = sqrt(3) U_P ph(-90 degree) \
      dot(U)_(W U) & = dot(U)_W - dot(U)_U = sqrt(3) U_P ph(-210 degree) \
    $],
)
=== 三相电路的计算
==== 负载星形联结
#figure(
  cetz.canvas({
    import cetz.draw: *

    node((0, 0))
    line((0, 0), (0, 0.9))
    inductorV((0, 1.5))

    line((0, 2.1), (0, 3))
    //circle((0, 3), radius: 0.1)
    line((rel: (0, 0)), (6.5, 3))

    line((0, 0), (-30deg, 0.9))
    arc((-30deg, 0.9), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.2), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.5), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.8), radius: 0.15, start: 150deg, stop: 330deg)
    line((-30deg, 2.1), (-30deg, 3))
    line((), (rel: (0, -0.5)))
    line((), (6.5, -2))

    line((0, 0), (-150deg, 0.9))
    arc((-150deg, 0.9), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.2), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.5), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.8), radius: 0.15, start: 30deg, stop: 210deg)
    line((-150deg, 2.1), (-150deg, 3))
    // circle((-150deg, 3), radius: 0.1)
    line((rel: (0, 0)), (rel: (0, -1.5)))
    line((), (0, -3))


    line((0, 0), (6.5, 0))

    content((0.4, 2.1), [+])
    content((0.4, 0.9), [-])
    content((0.6, 1.4), [$dot(U)_U$])
    content((1.1, -1.3), [$dot(U)_V$])
    content((1.7, -1.35), [+])
    content((0.6, -0.6), [-])
    content((-1.6, -0.2), [$dot(U)_W$])
    content((-2, -0.65), [+])
    content((-1, -0.2), [-])
    content((0, -0.4), [N])

    node((6.5, 0))
    line((6.5, 0), (rel: (-150deg, 1.1)))
    line((), (rel: (120deg, 0.1)))
    line((), (rel: (-150deg, 0.8)))
    line((), (rel: (-60deg, 0.2)))
    line((6.5, 0), (rel: (-150deg, 1.1)))
    line((), (rel: (-60deg, 0.1)))
    line((), (rel: (-150deg, 0.8)))
    line((), (rel: (120deg, 0.1)))
    line((), (rel: (-150deg, 1.1)))
    line((), (rel: (0, -1.5)))
    line((), (0, -3))

    line((6.5, 0), (rel: (-30deg, 1.1)))
    line((), (rel: (60deg, 0.1)))
    line((), (rel: (-30deg, 0.8)))
    line((), (rel: (-120deg, 0.2)))
    line((6.5, 0), (rel: (-30deg, 1.1)))
    line((), (rel: (-120deg, 0.1)))
    line((), (rel: (-30deg, 0.8)))
    line((), (rel: (60deg, 0.1)))
    line((), (rel: (-30deg, 1.1)))
    line((), (rel: (0, -0.5)))
    line((), (6.5, -2))

    line((6.5, 0), (6.5, 1.1))
    resistorV((6.5, 1.5))
    line((6.5, 1.9), (6.5, 3))

    arrow_I((3, -3), (3.6, -3))
    content((3.4, -2.6), [$dot(I)_W$])
    arrow_I((3, -2), (3.6, -2))
    content((3.4, -1.6), [$dot(I)_V$])
    arrow_I((3, 0), (3.6, 0))
    content((3.4, 0.4), [$dot(I)_N$])
    arrow_I((3, 3), (3.6, 3))
    content((3.4, 2.4), [$dot(I)_U$])

    content((6.1, 2.1), [+])
    content((6.1, 0.9), [-])
    content((6, 1.4), [$dot(U)_u$])
    content((7, 1.4), [$Z_u$])

    content((5.5, -1.2), [$dot(U)_W$])
    content((4.8, -1.35), [+])
    content((5.9, -0.6), [-])
    content((6.5 - 1.6, -0.4), [$Z_w$])

    content((6.5 + 1.6, -0.2), [$dot(U)_v$])
    content((8.5, -0.65), [+])
    content((7.5, -0.2), [-])
    content((7.6, -1.2), [$Z_V$])

    content((6.9, 0.2), [$"N"'$])
  }),
  caption: [负载星形电路三相四线制电路],
) <2.4.1>
#v(1em)
显然有$display(dot(I)_U = dot(U)_u/Z_u = dot(U)_U/Z_u)$, $display(dot(I)_V = dot(U)_v/Z_v = dot(U)_V/Z_v)$, $display(dot(I)_W = dot(U)_w/Z_w = dot(U)_W/Z_w)$, $dot(I)_N = - (dot(I)_U + dot(I)_V + dot(I)_W)$。

当各相负载阻抗(模和辐角)完全相等(即对称负载)时, 各相电流大小相等、相位互差120$degree$, 故 $dot(I)_N = 0$。
#callouts.Tip[
  对于对称负载星形电路, 由于$dot(I)_N =0$, 说明中性线不影响电路运行, 如三相异步电动机。

  因此三相三线制电路和三相四线制电路等效, 从而把电路简化为三个独立的回路进行求解。
]
若负载不对称且中性线存在(如@fig:2.4.1), 由负载相电压=电源相电压, 可逐一计算各相电流。

若负载不对称且中性线不存在, 则根据KCL和KVL列出方程组求解。
$
  dot(I)_U + dot(I)_V + dot(I)_W = 0 \
  dot(U)_U = dot(I)_U #h(4pt) Z_u + dot(U)_(N N') \
  dot(U)_V = dot(I)_V #h(4pt) Z_v + dot(U)_(N N') \
  dot(U)_W = dot(I)_W #h(4pt) Z_w + dot(U)_(N N') \
$
解得
$
  dot(U)_(N N') = (display(dot(U)_U /Z_u) + display(dot(U)_V /Z_v) + display(dot(U)_W /Z_w)) / (display(1/Z_u) + display(1/Z_v) + display(1/Z_w)) \
$
进而可以求得各相电流。

==== 负载三角形联结
#v(-0.5em)
#figure(
  cetz.canvas({
    import cetz.draw: *
    import cetz-plot: *

    node((0, 0))
    line((0, 0), (0, 0.9))
    inductorV((0, 1.5))

    line((0, 2.1), (0, 3))
    //circle((0, 3), radius: 0.1)
    line((rel: (0, 0)), (10, 3))

    line((0, 0), (-30deg, 0.9))
    arc((-30deg, 0.9), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.2), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.5), radius: 0.15, start: 150deg, stop: 330deg)
    arc((-30deg, 1.8), radius: 0.15, start: 150deg, stop: 330deg)
    line((-30deg, 2.1), (-30deg, 3))
    //line((), (rel: (0, -0.5)))
    line((), (rel: (0.5, -1.5)), (calc.sqrt(27 / 4) + 10, -3), (rel: (0, 1.5)), (rel: (120deg, 1)))

    arrow_I((), (rel: (-60deg, 0.5)))
    content((rel: (-0.6, 0)), [$dot(I)_(u v)$])

    line((0, 0), (-150deg, 0.9))
    arc((-150deg, 0.9), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.2), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.5), radius: 0.15, start: 30deg, stop: 210deg)
    arc((-150deg, 1.8), radius: 0.15, start: 30deg, stop: 210deg)
    line((-150deg, 2.1), (-150deg, 3))
    // circle((-150deg, 3), radius: 0.1)
    line((rel: (0, 0)), (rel: (0, -1.5)))
    line((), (calc.sqrt(27 / 4), -3), (rel: (0.5, 1.5)), (9, -1.5))

    content((0.4, 2.1), [+])
    content((0.4, 0.9), [-])
    content((0.6, 1.4), [$dot(U)_U$])
    content((1.1, -1.3), [$dot(U)_V$])
    content((1.7, -1.35), [+])
    content((0.6, -0.6), [-])
    content((-1.6, -0.2), [$dot(U)_W$])
    content((-2, -0.65), [+])
    content((-1, -0.2), [-])
    content((0, -0.4), [N])

    content((3.6, 2.8), text(red)[-])
    content((3.6, -1.3), text(red)[+])
    content((3.6, 0.75), text(red)[$dot(U)_(W U)$])

    content((3.6, -1.7), text(blue)[-])
    content((3.6, -2.8), text(blue)[+])
    content((3.6, -2.25), text(blue)[$dot(U)_(V W)$])

    content((4.7, 2.8), text(purple)[+])
    content((4.7, -2.8), text(purple)[-])
    content((4.7, -0.75), text(purple)[$dot(U)_(U V)$])

    line((10, 3), (rel: (-120deg, calc.sqrt(27 / 4) - 0.4)))
    line((), (rel: (150deg, 0.1)))
    line((), (rel: (-120deg, 0.8)))
    line((), (rel: (-30deg, 0.1)))
    line((10, 3), (rel: (-120deg, calc.sqrt(27 / 4) - 0.4)))
    line((), (rel: (-30deg, 0.1)))
    line((), (rel: (-120deg, 0.8)))
    line((), (rel: (150deg, 0.1)))
    line((), (rel: (-120deg, calc.sqrt(27 / 4) - 0.4)))

    line((), (rel: (0deg, calc.sqrt(27 / 4) - 0.4)))
    resistorH((10, -1.5))
    line((rel: (0, 0.1)), (rel: (0deg, calc.sqrt(27 / 4) - 0.4)))

    line((), (rel: (120deg, calc.sqrt(27 / 4) - 0.4)))
    line((), (rel: (-150deg, 0.1)))
    line((), (rel: (120deg, 0.8)))
    line((), (rel: (30deg, 0.1)))

    line((10, 3), (rel: (-60deg, calc.sqrt(27 / 4) - 0.4)))
    line((), (rel: (30deg, 0.1)))
    line((), (rel: (-60deg, 0.8)))
    line((), (rel: (-150deg, 0.1)))

    arrow_I((5, 3), (6.5, 3))
    content((6.4, 3.5), [$dot(I)_U$])
    arrow_I((5, -1.5), (6.5, -1.5))
    content((6.4, -1.1), [$dot(I)_W$])
    arrow_I((5, -3), (6.5, -3))
    content((6.4, -2.6), [$dot(I)_V$])

    content((8.1, 1), [$dot(U)_(w u)$])
    content((7.8, 0.4), [+])
    content((8.4, 1.4), [-])
    content((9.2, 0.4), [$Z_(w u)$])
    line((10, 3), (rel: (-120deg, calc.sqrt(27 / 4) - 0.4)))
    arrow_I((), (rel: (60deg, 1.5)))
    content((rel: (-0.6, 0)), [$dot(I)_(w u)$])


    content((10, -2.1), [$dot(U)_(v w)$])
    content((9.4, -1.9), [-])
    content((10.6, -1.9), [+])
    content((10, -1), [$Z_(v w)$])
    arrow_I((9, -1.5), (8, -1.5))
    content((8.4, -2.1), [$dot(I)_(v w)$])

    content((11.9, 1), [$Z_(u v)$])
    content((10.4, 1), [+])
    content((11.2, 0), [-])
    content((10.8, 0.4), [$dot(U)_(u v)$])
  }),
  caption: [负载星形电路三相四线制电路],
)
// #v(4em)
对于负载三角形联结的电路, 负载的相电压等于电源的线电压, 由此可知负载相电流, 根据KCL可知线电流大小。
对称负载时, 各线电流大小等于相电流$sqrt(3)$倍, 相位落后30$degree$。
=== 三相电路的功率
三相电路的有功功率等于各相有功功率之和。
$
  P &= P_U + P_V + P_W = U_U #h(4pt) I_U cos phi_U + U_V #h(4pt) I_V cos phi_V + U_W #h(4pt) I_W cos phi_W \
  P &= P_(U V) + P_(V W) + P_(W U) = U_(U V) #h(4pt) I_(U V) cos phi_(U V) + U_(V W) #h(4pt) I_(V W) cos phi_(V W) + U_(W U) #h(4pt) I_(W U) cos phi_(W U)
$
其中$phi$为相电压与相电流的相位差。

特别的, 对称负载时, 有: ($U_L$为线电压, $I_L$为线电流)
$
  P = 3 U_P #h(4pt) I_P cos phi = sqrt(3) U_L #h(4pt) I_L cos phi
$
同样的, 对称三相电路的无功功率等于各相无功功率之和。
$
  Q = 3 U_P #h(4pt) I_P sin phi = sqrt(3) U_L #h(4pt) I_L sin phi
$
对称三相电路的视在功率为
$
  S = sqrt(P^2 + S^2) = sqrt(3) U_L #h(4pt) I_L
$

#callouts.Tip[
  如无特别指明, 三相电路的电压和电流均指线电压和线电流。
]
#callouts.Question(title: [2.4.5])[
  如图所示三相四线制电路, 已知电源相电压$dot(U)_U = 220 ph(0 degree) V$, $dot(U)_V = 220 ph(-120 degree)$, $dot(U)_W = 220 ph(-240 degree)$, 供给两组对称的三相负载和一组单相负载。第一组三相负载为星形联结, 每相阻抗为 $Z_1= 22 Omega$, 经过阻抗 $Z_0= 5 Omega$ 接到中性线。第二组三相负载为三角形联结, 每相阻抗为 $Z_2 = -j 76 Omega$。单相负载 $R = 10 Omega$, 接在U相和中性线之间。求各线电流 $dot(I)_U、dot(I)_V、dot(I)_W$ 和中性线电流 $dot(I)_N$。

  #cetz.canvas({
    import cetz.draw: *
    node((0, 0), fill: none)
    line((0.1, 0), (7, 0))
    line((0.1, 0), (0.7, 0), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((0.6, 0.4), [$dot(I)_W$])

    node((0, 1.5), fill: none)
    line((0.1, 1.5), (6, 1.5))
    line((0.1, 1.5), (0.7, 1.5), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((0.6, 1.9), [$dot(I)_V$])

    node((0, 3), fill: none)
    line((0.1, 3), (7, 3))
    line((0.1, 3), (0.7, 3), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((0.6, 3.4), [$dot(I)_U$])

    node((0, -3), fill: none)
    line((0.1, -3), (3.5, -3))
    content((0.6, -2.6), [$dot(I)_N$])

    line((3.5, -3), (0.5, -3), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((1.2, 2.4), [$dot(I)_R$])
    line((1.5, 3), (1.5, -1.95))
    line((1.5, 3), (1.5, 2.3), mark: (end: ">", fill: black, stroke: 0.1pt))
    rect((1.4, -1.95), (1.6, -2.55))
    line((1.5, -2.55), (1.5, -3))
    content((1.9, -2.2), [R])

    line((2.5, 0), (2.5, -0.45))
    line((2.5, 0), (2.5, -0.3), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((2, -0.4), [$dot(I)_(1W)$])
    rect((2.4, -0.45), (2.6, -1.05))
    content((3, -0.8), [$Z_1$])
    line((2.5, -1.05), (2.5, -1.5))

    line((3.5, 1.5), (3.5, -0.45))
    line((3.5, 1.5), (3.5, 0.8), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((3, 0.7), [$dot(I)_(1V)$])
    rect((3.4, -0.45), (3.6, -1.05))
    content((4, -0.8), [$Z_1$])
    line((3.5, -1.05), (3.5, -1.5))

    line((4.5, 3), (4.5, -0.45))
    line((4.5, 3), (4.5, 2.3), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((4, 2.2), [$dot(I)_(1U)$])
    rect((4.4, -0.45), (4.6, -1.05))
    content((5, -0.8), [$Z_1$])
    line((4.5, -1.05), (4.5, -1.5))

    line((2.5, -1.5), (4.5, -1.5))
    node((3.5, -1.5))
    line((3.5, -1.5), (3.5, -1.95))
    rect((3.4, -1.95), (3.6, -2.55))
    line((3.5, -2.55), (3.5, -3))
    content((4, -2.3), [$Z_0$])

    line((6, 3), (6, 2.55))
    rect((5.9, 2.55), (6.1, 1.95))
    line((6, 1.95), (6, 1.05))
    rect((5.9, 1.05), (6.1, 0.45))
    line((6, 0.45), (6, 0))

    line((7, 3), (7, 1.8))
    rect((6.9, 1.8), (7.1, 1.2))
    line((7, 1.2), (7, 0))

    line((0.1, 0), (5.3, 0), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((5.2, 0.4), [$dot(I)_(2W)$])

    line((0.1, 1.5), (5.3, 1.5), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((5.2, 1.9), [$dot(I)_(2V)$])

    line((0.1, 3), (5.3, 3), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((5.2, 3.4), [$dot(I)_(2U)$])

    line((6, 3), (6, 2.7), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((5.5, 2.6), [$dot(I)_(u v)$])
    content((6.5, 2.2), [$Z_2$])

    line((6, 1.5), (6, 1.2), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((5.5, 1.1), [$dot(I)_(v w)$])
    content((6.5, 0.7), [$Z_2$])

    line((7, 2.2), (7, 2.9), mark: (end: ">", fill: black, stroke: 0.1pt))
    content((7.5, 2.5), [$dot(I)_(w u)$])
    content((7.5, 1.4), [$Z_2$])

    content((-0.6, 3), [L1])
    content((-0.6, 1.5), [L2])
    content((-0.6, 0), [L3])
    content((-0.6, -3), [N])
  })
  #v(1em)
  【解】
  $
    dot(I)_N & = dot(I)_R = dot(U)_U / R = 22 ph(0 degree) A \
    dot(I)_(U) & = dot(I)_R + dot(I)_(1U) + dot(I)_(2U) = dot(I)_R + dot(I)_(1U)+dot(I)_(u v) - dot(I)_(w u) \
    & = dot(U)_U / R + dot(U)_U / Z_1 + dot(U)_(U V) / Z_2 - dot(U)_(W U) / Z_2 = 22 ph(0 degree) A + 10 ph(0degree) + 5 ph(120 degree) - 5 ph(240 degree) \
    & = 33.15 ph(15.14 degree)\
    dot(I)_(V) & = dot(I)_(1V) + dot(I)_(2V) = dot(I)_(1V)+dot(I)_(v w) - dot(I)_(u v)\ & =10 ph(-120 degree) + 5 ph(0 degree) - 5 ph(120 degree)\
    & = 13.23 ph(-79.11 degree) \
    dot(I)_(W) & = dot(I)_(1W) + dot(I)_(2W) = dot(I)_(1W)+dot(I)_(w u) - dot(I)_(v w)\ & =10 ph(120 degree) + 5 ph(240 degree) - 5 ph(0 degree) \
    & = 13.23 ph(160.89 degree)
  $
]
#callouts.Info(title: [相量图一图流])[
  #grid(
    columns: (1fr, 1fr),
    rows: 2,
    align: center + horizon,
    gutter: 2em,
    row-gutter: 2em,
    [
      #set text(size: 10pt)
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        line((0, 0), (2.2, 0), mark: (end: ">", fill: black, stroke: 1pt))
        content((2.5, -0.1), [$dot(U)_U$])

        line((0, 0), (rel: (-120deg, 2.2)), mark: (end: ">", fill: black, stroke: 1pt))
        content((-1.25, -1.5), [$dot(U)_V$])

        line((0, 0), (rel: (120deg, 2.2)), mark: (end: ">", fill: black, stroke: 1pt))
        content((-1.25, 1.5), [$dot(U)_W$])

        line((0, 0), (rel: (30deg, 3.8)), mark: (end: ">", fill: black, stroke: 1pt))
        content((2.25, 1.75), [$dot(U)_(U V)$])

        line((0, 0), (rel: (150deg, 3.8)), mark: (end: ">", fill: black, stroke: 1pt))
        content((-2.75, 1), [$dot(U)_(W U)$])
        line((0, 0), (rel: (-90deg, 3.8)), mark: (end: ">", fill: black, stroke: 1pt))
        content((-0.5, -3.45), [$dot(U)_(V W)$])
      })

    ],
    [
      #set text(size: 10pt)
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        line((0, 0), (3.8, 0), mark: (end: ">", fill: black, stroke: 1pt))
        content((4.4, -0.1), [$dot(U)_(U V)$])

        line((0, 0), (rel: (-120deg, 3.8)), mark: (end: ">", fill: black, stroke: 1pt))
        content((-2.25, -2.5), [$dot(U)_(V W)$])

        line((0, 0), (rel: (120deg, 3.8)), mark: (end: ">", fill: black, stroke: 1pt))
        content((-2.25, 2.5), [$dot(U)_(W U)$])

        line((0, 0), (50deg, 3.4), mark: (end: ">", fill: black, stroke: 1pt))
        content((2.4, 2), [$dot(I)_(W)$])

        line((0, 0), (rel: (-70deg, 3.4)), mark: (end: ">", fill: black, stroke: 1pt))
        content((1.65, -2.8), [$dot(I)_(U)$])

        line((0, 0), (rel: (-190deg, 3.4)), mark: (end: ">", fill: black, stroke: 1pt))
        content((-2.75, 0.8), [$dot(I)_(V)$])

        line((0, 0), (80deg, 2), mark: (end: ">", fill: black, stroke: 1pt))
        line((), (50deg, 3.4), stroke: (dash: "dashed"))
        content((0.4, 2.5), [$dot(I)_(w u)$])

        line((0, 0), (rel: (-40deg, 2)), mark: (end: ">", fill: black, stroke: 1pt))
        line((), (-70deg, 3.4), stroke: (dash: "dashed"))
        content((2.05, -1.5), [$dot(I)_(u v)$])

        line((0, 0), (rel: (-160deg, 2)), mark: (end: ">", fill: black, stroke: 1pt))
        line((), (-190deg, 3.4), stroke: (dash: "dashed"))
        content((-1.95, -1.2), [$dot(I)_(v w)$])

        arc((50deg, 0.7), start: 50deg, stop: 80deg, radius: 0.7)
        content((60deg, 1.2), [$30 degree$])
        arc((-70deg, 0.7), start: -70deg, stop: -40deg, radius: 0.7)
        content((-54deg, 1.2), [$30 degree$])
        arc((-190deg, 0.7), start: -190deg, stop: -160deg, radius: 0.7)
        content((-175deg, 1.2), [$30 degree$])

        arc((80deg, 0.9), start: 80deg, stop: 120deg, radius: 0.9)
        content((100deg, 1.2), [$phi$])
        arc((-40deg, 0.9), start: -40deg, stop: 0deg, radius: 0.9)
        content((-20deg, 1.2), [$phi$])
        arc((-160deg, 0.9), start: -160deg, stop: -120deg, radius: 0.9)
        content((-140deg, 1.2), [$phi$])
      })
    ],

    [电源相电压线电压], [三角形对称负载线电压, 电流],
  )
]
