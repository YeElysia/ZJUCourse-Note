#import "utils.typ": Red, eq
#import "models.typ": (
  andGate, arrow_I, capacitorH, capacitorV, constSourceH, constSourceV, controlledSourceH, controlledSourceV, diode,
  inductorH, inductorV, loop, nandGate, node, norGate, notGate, orGate, ph, resistorH, resistorV, xorGate,
)
#import "Callouts.typ" as callouts
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

= 集成运算放大器
== 集成运放的基本组成
集成运放是一种具有很高的电压放大倍数, 性能优越, 集成化的多级放大电器。
#figure(
  cetz.canvas({
    import cetz.draw: *
    rect((0, 0), (2, 1.5))
    content((1, 0.75), [输入端])
    rect((3, 0), (5, 1.5))
    content((4, 0.75), [中间层])
    rect((6, 0), (8, 1.5))
    content((7, 0.75), [输出端])
    arrow_I((2, 0.75), (3, 0.75))
    arrow_I((5, 0.75), (6, 0.75))

    rect((2.5, -2), (5.5, -1))
    content((4, -1.5), [偏置电路])
    line((2.5, -1.5), (1, -1.5))
    arrow_I((1, -1.5), (1, 0))
    line((5.5, -1.5), (7, -1.5))
    arrow_I((7, -1.5), (7, 0))
    arrow_I((4, -1), (4, 0))

    line((-1, 0.5), (0, 0.5))
    line((-1, 1), (0, 1))
    content((-1.4, 0.5), [$u_+$])
    content((-1.4, 1), [$u_-$])
    content((0.2, 0.5), [+])
    content((0.2, 1), [-])
    arrow_I((8, 0.75), (9, 0.75))
    content((9.4, 0.75), [$u_o$])
  }),
  caption: "集成运放的基本组成",
)
输入级: 高输人电阻、低漂移和高抗干扰能力等, 常采用差分放大电路。

中间级: 提供很高的电压放大倍数, 常采用多级放大电路。

输出级: 提供一定的输出电压与电流, 输出电阻小, 常采用互补对称电路。

偏置电路: 为各级电路提供偏置电流。

多级放大器的耦合方式: 阻容耦合, 直接耦合, 变压器耦合。

放大器采用直接耦合。
=== 差分放大电路
#figure(
  image("assets/差分放大电路.png", width: 50%),
  caption: "差分放大电路",
)
稳压管$D_Z$使得$i_(C 3)$基本不变。
==== 静态分析
由对称性, 显然$u_o = 0$
==== 动态分析
===== 差模信号输入
$u_(i 1)=-u_(i 2)$, 因此$i_(b 1)$、$i_(c 1)$分别与$u_(b 2)$、$u_(c 2)$大小相同, 但方向相反, 因此$u_o = u_(o 1)-u_(o 2)$。

所以有输出电压, 具有放大作用, 记差模放大倍数$display(A_d = u_o/u_(i 1))$。
===== 共模信号输入
$u_(i 1)=u_(i 2)$, 因此电路仍完全对称, $u_o = u_(o 1)-u_(o 2) = 0$。无放大作用。实际共模放大倍数$A_c$由于电路不可能完全对称, 不为0。

记共模抑制比$display(K_(C M R) = A_d/A_c)$, 其中$A_c$为共模放大倍数。

综上, 差分放大电路对差模信号有放大作用, 对共模信号(干扰信号)无放大作用。
=== 互补对称电路
#figure(
  image("assets/互补对称电路.png", width: 50%),
  caption: [互补对称电路],
)
==== 静态分析
$u_i=0$时, 三极管都不导通, 故负载输出为0。
==== 动态分析
$u_i>0$, $T_1$导通, $T_2$不导通; $u_i<0$, $T_1$不导通, $T_2$导通。从而实现了输出电压与输入电压同相的放大作用。

没有电压放大作用, 但具有电流(功率)放大作用。
=== 集成运放的图形符号和信号输入方式
#grid(
  columns: 2,
  gutter: 1em,
  align: horizon,
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (3, 4))
      node((-2, 1), fill: none)
      line((-1.9, 1), (0, 1))
      content((-2.4, 1), [$u_+$])
      content((-1.4, 0.6), [$I N_+$])
      content((0.4, 1), [+])

      node((-2, 3), fill: none)
      line((-1.9, 3), (0, 3))
      content((-2.4, 3), [$u_-$])
      content((-1.4, 3.3), [$I N_-$])
      content((0.4, 3), [-])

      node((5, 2), fill: none)
      line((3, 2), (4.9, 2))
      content((3.7, 2.3), [$O U T$])
      content((5.4, 2), [$u_o$])
      content((2.6, 2), [+])

      line((1, 3), (1.5, 3.3), (1, 3.6), close: true)
      content((2, 3.3), [$A_0$])
    }),
    caption: "集成运放的图形符号",
  ),
  [
    同向输入: 输入信号接在同相输入端, 反相输入端接地。

    反向输入: 输入信号接在反相输入端, 同相输入端接地。

    差分输入: 输入信号分别接在同相输入端和反相输入端。
  ],
)
#pagebreak()
== 集成运放的基本特性
// === 理想运放




=== 主要参数
- 输入失调电压 $U_(I O)$: 使输出电压为0,需要在输入端加的补偿电压。
- 输入失调电流 $I_(I O)$: 输入静态电流之差的绝对值。
- 输入偏置电流 $I_(I B)$: 输入静态电流的平均值。
- 开环差模电压放大倍数 $A_O$
- 最大差模输入电压 $U_(i d"max")$: 两输入端之间所能承受的最大电压值。
- 最大共模输入电压 $U_(i c"max")$: 集成运放所能承受的共模输入电压最大值。
- 共模抑制比 $K_(C M R)$
- 最大输出电压 $U_(o m a x)$: 不出现明显非线性失真的最大输出电压峰值。
- 最大输出电流 $I_(o m a x)$
- 输入电阻 $r_i$ 和输出电阻 $r_o$
- 电源电压 $plus.minus U_(C C)$

=== 电压传输特性

$ u_O = f(u_I)"    "(u_I = u_+ - u_-) $
线性区: $u_O = A_u u_I$, 因$A_u$很大, 故线性区很小(毫伏级)

饱和区:
$
  u_i > U_i^+, u_o = U_o^+ "    正饱和" \
  u_i < U_i^-, u_o = U_o^- "    负饱和"
$
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  align: horizon + center,
  figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      // 设置绘图区域
      plot.plot(
        size: (6, 4),
        x-tick-step: none,
        y-tick-step: none,
        x-label: [$U_I$],
        y-label: [$U_O$],
        x-min: -3,
        x-max: 3,
        y-min: -1.2,
        y-max: 1.2,
        axis-style: "school-book",
        name: "plot",
        {
          plot.add(
            domain: (-3, -0.5),
            style: (stroke: 1.5pt),
            x => -1,
          )
          plot.add(
            domain: (-0.5, 0.5),
            style: (stroke: 1.5pt),
            x => 2 * x,
          )
          plot.add(
            domain: (0.5, 3),
            style: (stroke: 1.5pt),
            x => 1,
          )
          plot.add-hline(1, min: 0, style: (stroke: (paint: black, dash: "dashed")))
          plot.add-hline(-1, max: 0, style: (stroke: (paint: black, dash: "dashed")))
          plot.add-vline(0.5, min: 0, max: 1, style: (stroke: (paint: black, dash: "dashed")))
          plot.add-vline(-0.5, max: 0, min: -1, style: (stroke: (paint: black, dash: "dashed")))
          plot.add-anchor("1", (0.5, -0.3))
          plot.add-anchor("2", (-0.5, 0.2))
          plot.add-anchor("4", (0.5, -1))
          plot.add-anchor("3", (-0.5, 1))
        },
      )
      content("plot.1", [$U_i^+$])
      content("plot.2", [$U_i^-$])
      content("plot.3", [$U_o^+$])
      content("plot.4", [$U_o^-$])
    }),
    caption: "集成运放的电压传输特性",
  ),
  figure(
    cetz.canvas({
      import cetz.draw: *

      node((0, 0), fill: none)
      node((0, 4), fill: none)
      line((0.1, 0), (2, 0), (2, 1.6))
      resistorV((2, 2))
      line((2, 2.4), (2, 4), (0.1, 4))

      rect((1, -0.5), (5, 4.5), stroke: (dash: "dashed"))

      controlledSourceV((3, 2))
      line((5.9, 0), (3, 0), (3, 1.6))
      line((3, 2.4), (3, 4), (3.6, 4))
      resistorH((4, 4))
      line((4.4, 4), (5.9, 4))
      node((6, 4), fill: none)
      node((6, 0), fill: none)
      line((6, -0.1), (6, -0.4))
      line((5.6, -0.4), (6.4, -0.4))

      content((-0.4, 0), [$u_+$])
      content((-0.4, 4), [$u_-$])
      content((1.5, 2), [$r_i$])
      content((4, 2), [$A_o u_i$])
      content((6, 2), [$u_o$])
      content((4, 3.6), [$r_o$])
      content((0, 2), [$u_i$])

      content((0, 0.4), [+])
      content((0, 3.6), [-])
      content((3.4, 1.5), [-])
      content((3.4, 2.5), [+])
      content((6, 0.4), [-])
      content((6, 3.6), [+])
    }),
    caption: "集成运放线性区的电路模型",
  ),
)
=== 集成运放的理想特性
#grid(
  columns: (1fr, 1fr),
  [
    ==== 理想化参数
    - 开环电压增益 $A_0 arrow infinity$
    - 输入电阻 $r_i = infinity$
    - 输出电阻 $r_o = 0$
    - 共模抑制比 $K_(C M R) = infinity$
  ],
  [
    ==== 特性
    - 虚短: $u_+ = u_-$ (工作在线性区)
    - 虚断: $i_+ = i_- = 0$
    - 理想电压传输特性只有饱和区。
  ],
)
==== 工作状态判断
- 开环和闭环正反馈: 工作在饱和区。
- 闭环负反馈: 工作在线性区。
== 放大电路中的负反馈
=== 反馈的基本概念
- #Red[反馈]: 将电路输出量(电压或电流)的一部分或全部通过一定的电路(反馈电路)引回到输入回路, 与外加输入信号共同作用产生净输入量。

- 正反馈: 反馈信号增强原输入信号, 使净输入增加。#Red()[用于振荡电路。]
- 负反馈: 反馈信号削弱原输入信号, 使净输入减小。#Red()[用于放大电路。]
#figure(
  cetz.canvas({
    import cetz.draw: *

    line((0, 1.6), (0, 0), (2, 0))
    circle((0, 2), radius: 0.4)
    arrow_I((0, 0), (0, 1.1))
    content((0.5, 0.8), [$x_F$])
    content((-0.8, 0.8), text(size: 8pt)[反馈信号])
    arrow_I((0.4, 2), (2, 2))
    content((1, 2.4), [$x_D$])
    content((1, 1.5), text(size: 8pt)[净输入#linebreak()信号])
    content((0, 2), [$sum$])
    arrow_I((-2, 2), (-0.4, 2))
    content((-2.4, 2), [$x_I$])
    content((-2.4, 1.5), text(size: 8pt)[输入信号])
    content((0, 2.7), text(size: 8pt)[比较环节])
    line((5, 0), (6, 0), (6, 2))
    arrow_I((5, 2), (7, 2))
    content((7, 1.6), [$x_O$])
    content((6.4, 2.4), text(size: 8pt)[输出信号])

    rect((2, -0.8), (5, 0.8))
    content((3.5, -0.1), align(center)[反馈电路#linebreak()$F$])
    rect((2, 1.2), (5, 2.8))
    content((3.5, 1.9), align(center)[基本放大电路#linebreak()$A_0$])
  }),
  caption: [反馈放大电路框图],
)
#grid(
  columns: (10fr, 0.01fr, 10fr),
  // gutter: 1em,
  align: horizon,
  [$
      "净输入信号 "x_D & = x_I - x_F \
    "开环放大倍数" A_0 & = x_O/x_D \
    "闭环放大倍数" A_f & = x_O/x_I \
          "反馈系数" F & = x_F/x_O \
  $],

  [$arrow.double$],

  [
    $
      "             "x_I & = x_D + x_F = (1 + F A_0) x_D \
    $
    $
      A_f & = x_O/x_I = A_0/(1 + F A_0)
    $<5.3.1>
  ],
)
因此, 负反馈使得闭环放大倍数 $A_f$ 降低。若为理想运放($A_0 = infinity$), 则@eqt:5.3.1 可以改写为$A_f = display(1/F)$, 称为深度负反馈。
// === 反馈极性的判别——瞬时极性法
// 假设在某瞬时, 在输入端加上一个正信号, 按信号传输方向逐步判断各级输出的瞬时极性, 最后看反馈信号的极性是增强还是削弱净输入信号。

// ==== 判别步骤
// 1. 假设输入端瞬时极性为正(+)。
// 2. 沿信号传输方向, 判断各级输出的瞬时极性。
// 3. 判断反馈信号的极性。
// 4. 比较反馈信号与输入信号的极性关系: 若反馈信号削弱净输入, 则为负反馈; 若增强, 则为正反馈。

// ==== 判别示例
// 对于反相输入运放电路:
// - 输入端 $u_+$ 为正(+), 则 $u_-$ 也为正(+)(虚短)。
// - 输出端 $u_o$ 为负(-)(反相放大)。
// - 反馈信号从输出端引回到反相输入端, 为负(-)。
// - 反馈信号削弱了净输入 $u_+ - u_-$, 因此为负反馈。

=== 负反馈的四种类型
#grid(
  columns: (1fr, 1fr),
  row-gutter: 0.5em,
  align: bottom,
  [#figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (1.5, 2))
      content((0.2, 0.6), [+])
      content((0.2, 1.4), [-])
      content((1.3, 1), [+])
      line((0.5, 1.4), (0.5, 1.8), (0.8, 1.6), close: true)
      content((1.15, 1.55), [$A_0$])

      line((-1.8, 1), (-1.8, 1.4), (-1.4, 1.4))
      line((-2, 1), (-1.6, 1))
      rect((-1.4, 1.5), (-0.8, 1.3))
      line((-0.8, 1.4), (0, 1.4))
      content((-1.1, 1.1), text(size: 10pt)[$R$])
      content((-1.1, 1.75), text(size: 10pt)[$u_F$])
      content((-1.5, 1.7), [-])
      content((-0.7, 1.7), [+])
      line((-0.4, 0.6), (0, 0.6))
      rect((-1, 0.7), (-0.4, 0.5))
      content((-0.7, 0.2), text(size: 10pt)[$R_b$])
      line((-1.4, 0.6), (-1, 0.6))
      circle((-1.45, 0.6), radius: 0.05)
      content((-1.8, 0.6), [$u_i$])


      line((-0.4, 1.4), (-0.4, 2.5), (0.45, 2.5))
      rect((0.45, 2.6), (1.05, 2.4))
      content((0.75, 2.9), text(size: 10pt)[$R_f$])
      line((1.05, 2.5), (1.9, 2.5), (1.9, 1))
      line((1.5, 1), (2.3, 1), (2.3, 0.8))
      rect((2.2, 0.8), (2.4, 0.2))
      content((2.7, 0.5), text(size: 10pt)[$R_L$])
      line((2.3, 0.2), (2.3, 0))
      line((2.1, 0), (2.5, 0))

      content((2.5, 1.2), text(size: 10pt)[$u_O$])
    }),
    caption: "电压串联负反馈",
  )<电压串联负反馈>],
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (1.5, 2))
      content((0.2, 0.6), [+])
      content((0.2, 1.4), [-])
      content((1.3, 1), [+])
      line((0.5, 1.4), (0.5, 1.8), (0.8, 1.6), close: true)
      content((1.15, 1.55), [$A_0$])

      //line((-1.8, 1), (-1.8, 1.4), (-1.4, 1.4))
      //line((-2, 1), (-1.6, 1))
      //rect((-1.4, 1.5), (-0.8, 1.3))
      line((-0.4, 1.4), (0, 1.4))
      line((-0.4, 0.6), (0, 0.6))
      rect((-1, 0.7), (-0.4, 0.5))
      content((-0.7, 0.2), text(size: 10pt)[$R_b$])
      line((-1.4, 0.6), (-1, 0.6))
      circle((-1.45, 0.6), radius: 0.05)
      content((-1.8, 0.6), [$u_i$])


      line((-0.4, 1.4), (-0.4, 2.5), (1.05, 2.5))
      line((1.05, 2.5), (2.7, 2.5), (2.7, 0.1), (2.3, 0.1))
      line((1.5, 1), (2.3, 1), (2.3, 0.8))
      rect((2.2, 0.8), (2.4, 0.2))
      content((1.9, 0.5), text(size: 10pt)[$R_L$])
      line((2.3, 0.2), (2.3, 0))
      rect((2.2, 0), (2.4, -0.6))
      content((1.9, -0.3), text(size: 10pt)[$R$])
      line((2.3, -0.6), (2.3, -0.8))
      line((2.1, -0.8), (2.5, -0.8))

      arrow_I((1.7, 1), (2, 1))
      content((2.1, 1.3), text(size: 10pt)[$i_O$])
    }),
    caption: "电流串联负反馈",
  ),

  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (1.5, 2))
      content((0.2, 0.6), [+])
      content((0.2, 1.4), [-])
      content((1.3, 1), [+])
      line((0.5, 1.4), (0.5, 1.8), (0.8, 1.6), close: true)
      content((1.15, 1.55), [$A_0$])

      circle((-2.05, 1.4), radius: 0.05)
      line((-2, 1.4), (-1.4, 1.4))
      line((-1.8, 1.4), (-1.55, 1.4), mark: (end: ">", stroke: 0.5pt, fill: black))
      content((-2.4, 1.4), text(size: 10pt)[$i_I$])
      rect((-1.4, 1.5), (-0.8, 1.3))
      line((-0.8, 1.4), (0, 1.4))
      line((-0.4, 1.4), (-0.15, 1.4), mark: (end: ">", stroke: 0.5pt, fill: black))
      content((-0.25, 1.7), text(size: 10pt)[$i_D$])
      content((-1.1, 1.7), text(size: 10pt)[$R$])
      line((-0.4, 0.6), (0, 0.6))
      rect((-1, 0.7), (-0.4, 0.5))
      content((-0.7, 0.2), text(size: 10pt)[$R_b$])
      line((-1.4, 0.3), (-1.4, 0.6), (-1, 0.6))
      line((-1.6, 0.3), (-1.2, 0.3))


      line((-0.6, 1.4), (-0.6, 2.5), (0.45, 2.5))
      line((-0.6, 2.5), (0.05, 2.5), mark: (end: ">", stroke: 0.5pt, fill: black))
      content((0.1, 2.8), text(size: 10pt)[$i_F$])
      rect((0.45, 2.6), (1.05, 2.4))
      content((0.75, 2.9), text(size: 10pt)[$R_f$])
      line((1.05, 2.5), (1.9, 2.5), (1.9, 1))
      line((1.5, 1), (2.3, 1), (2.3, 0.8))
      rect((2.2, 0.8), (2.4, 0.2))
      content((2.7, 0.5), text(size: 10pt)[$R_L$])
      line((2.3, 0.2), (2.3, 0))
      line((2.1, 0), (2.5, 0))

      content((2.5, 1.2), text(size: 10pt)[$u_O$])
    }),
    caption: "电压并联负反馈",
  ),
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (1.5, 2))
      content((0.2, 0.6), [+])
      content((0.2, 1.4), [-])
      content((1.3, 1), [+])
      line((0.5, 1.4), (0.5, 1.8), (0.8, 1.6), close: true)
      content((1.15, 1.55), [$A_0$])

      circle((-2.05, 1.4), radius: 0.05)
      line((-2, 1.4), (-1.4, 1.4))
      line((-1.8, 1.4), (-1.55, 1.4), mark: (end: ">", stroke: 0.5pt, fill: black))
      content((-2.4, 1.4), text(size: 10pt)[$i_I$])
      rect((-1.4, 1.5), (-0.8, 1.3))
      line((-0.8, 1.4), (0, 1.4))
      line((-0.4, 1.4), (-0.15, 1.4), mark: (end: ">", stroke: 0.5pt, fill: black))
      content((-0.25, 1.7), text(size: 10pt)[$i_D$])
      content((-1.1, 1.75), text(size: 10pt)[$R_1$])
      line((-0.4, 0.6), (0, 0.6))
      rect((-1, 0.7), (-0.4, 0.5))
      content((-0.7, 0.2), text(size: 10pt)[$R_b$])
      line((-1.4, 0.3), (-1.4, 0.6), (-1, 0.6))
      line((-1.6, 0.3), (-1.2, 0.3))

      line((-0.6, 1.4), (-0.6, 2.5), (0.45, 2.5))
      line((-0.6, 2.5), (0.05, 2.5), mark: (end: ">", stroke: 0.5pt, fill: black))
      content((0.1, 2.8), text(size: 10pt)[$i_F$])
      rect((0.45, 2.6), (1.05, 2.4))
      content((0.75, 2.9), text(size: 10pt)[$R_f$])
      line((1.05, 2.5), (2.7, 2.5), (2.7, 0.1), (2.3, 0.1))
      line((1.5, 1), (2.3, 1), (2.3, 0.8))
      rect((2.2, 0.8), (2.4, 0.2))
      content((1.9, 0.5), text(size: 10pt)[$R_L$])
      line((2.3, 0.2), (2.3, 0))
      rect((2.2, 0), (2.4, -0.6))
      content((1.9, -0.3), text(size: 10pt)[$R$])
      line((2.3, -0.6), (2.3, -0.8))
      line((2.1, -0.8), (2.5, -0.8))

      arrow_I((1.7, 1), (2, 1))
      content((2.1, 1.3), text(size: 10pt)[$i_O$])
    }),
    caption: "电流并联负反馈",
  ),
)

#callouts.Tip(title: [反馈类型判断])[
  1. 反馈量接入反相输入端的为负反馈
  2. 反馈量与输入量接入同一输入端的为并联反馈, 接入不同输入端的为串联反馈
  3. 反馈电路接入点与集成运放输入端直接相连的为电压反馈, 否则为电流反馈
]

=== 负反馈对放大电路性能的影响
- 提高放大倍数的稳定性
- 减小非线性失真
- 扩展通频带
- 改变输入电阻: 串联负反馈增大输入电阻, 并联负反馈减小输入电阻。
- 改变输出电阻: 电压负反馈减小输出电阻, 电流负反馈增大输出电阻。

#callouts.Example()[
  如@fig:电压串联负反馈 所示电路中, 设$R_f = 100 "k"Omega$, $R =R_b =10 "k"Omega$, 负载电阻$R_L$不接，输入电压$u_i$为直流电压0.1V, 集成运放的开环电压放大倍数$A_0=10000$, 输入电阻$r_i = 500 "k"Omega$，输出电阻$r_o = 500 Omega$。试用集成运放的电路模型求此电路的输出电压$u_o$, 闭环电压放大倍数$A_f$ 输入电阻$r_"if"$和输出电阻$r_"of"$。

  【解】电路为闭环负反馈, 工作在线性区, 用集成运放的线性区电路模型替换得如下等效电路图。
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((6, 0), (0, 0), (0, 5))
      arrow_I((0, 5), (0, 3.5))
      content((-0.4, 4), [$i_R$])

      line((1, 0), (1, 0.6))
      constSourceV((1, 1))
      content((1.5, 0.6), [-])
      content((1.5, 1.4), [+])
      content((1.8, 1), [$u_i$])
      line((1, 1.4), (1, 2), (1.6, 2))
      arrow_I((1, 1), (1, 1.9))
      content((1, 2.4), [$i_I$])
      resistorH((2, 2))
      content((2, 2.5), [$R_b$])
      line((2.4, 2), (3, 2), (3.5, 2), (3.5, 2.6))
      resistorV((3.5, 3))
      content((3.1, 3), [$r_i$])
      line((3.5, 3.4), (3.5, 4), (3, 4), (2.5, 4), (2.5, 5))
      node((3, 2))
      content((3, 1.6), [$u_+$])
      node((3, 4))
      content((3, 4.4), [$u_-$])

      line((0, 5), (0.9, 5))
      resistorH((1.3, 5))
      content((1.3, 5.4), [$R$])
      line((1.7, 5), (2.5, 5))

      line((2.5, 5), (3.6, 5))
      arrow_I((3.6, 5), (2.8, 5))
      content((2.9, 5.4), [$i_F$])
      resistorH((4, 5))
      content((4, 5.4), [$R_"f"$])
      line((5.6, 4), (6, 4), (6, 5), (4.4, 5))
      resistorH((5.2, 4))
      content((5.2, 4.4), [$r_o$])
      line((4.5, 3.4), (4.5, 4), (4.8, 4))
      controlledSourceV((4.5, 3))
      content((5, 2.6), [-])
      content((5, 3.4), [+])
      content((6.3, 3), [$A_0(u_+ -u_-)$])
      line((4.5, 2.6), (4.5, 2), (6, 2), (6, 0))

      line((6, 0), (6, -0.4))
      line((5.6, -0.4), (6.4, -0.4))

      line((6, 0), (6.9, 0))
      node((7, 0), fill: none)
      line((6, 4), (6.9, 4))
      node((7, 4), fill: none)
      content((7.4, 4), [+])
      content((7.4, 0), [-])
      content((7.4, 2), [$u$])
    })]
  $
                i_R & = i_I + i_F \
                u_i & = i_I (R_b +r_i) + i_R R \
    A_0 dot i_I r_i & = i_F (R_f + r_o) + i_R R \
  $
  解得
  $
    i_I = u_i /((R_b + r_i +R) + (A_0 r_i -R)/(R_f +r_0+R) R) = 2.207 times 10^(-10) "A" \
  $
  $
    i_F & = u_i/(((R_f+r_o+R)(R_b+r_i+R))/(A_0r_i-R)+R) = 9.989 times 10^(-6) "A" \
    i_R & = i_I + i_F = 9.989 times 10^(-6) "A" \
  $
  因此
  $
       u_o & = A_0(u_+-u_-) -i_F r_o= A_0 i_I r_i -i_F r_o= 1.099 "V" \
       A_f & = u_o/u_i = 10.99 \
    r_"if" & = u_i/i_I = 4.53 "M"Omega \
  $
]

== 集成运放在模拟信号运算方面的运用
=== 比例运算电路
==== 反相输入比例运算电路
#figure(
  cetz.canvas({
    import cetz.draw: *
    // 运放符号
    rect((0, 0), (3, 4))
    content((1.5, 2), [$A_0$])
    // 同相输入端
    line((-1, 1), (0, 1))
    content((-1.5, 1), [$0$])
    content((0.3, 1), [+])
    // 反相输入端
    line((-1, 3), (0, 3))
    content((-1.5, 3), [$u_i$])
    content((0.3, 3), [-])
    // 反馈电阻
    resistorH((3, 3))
    line((5, 3), (5, 1))
    line((5, 1), (3, 1))
    // 输入电阻
    resistorH((-1, 3))
    line((-3, 3), (-3, 3))
    // 输出
    line((3, 2), (5, 2))
    content((5.5, 2), [$u_o$])
    // 接地
    line((-1, 1), (-1, 0))
    line((-1.5, 0), (-0.5, 0))
  }),
  caption: "反相输入比例运算电路",
)

虚短和虚断: $u_+ = u_- = 0$, $i_+ = i_- = 0$。

由 $display(i_1 = (u_i - 0)/R_1)$, $display(i_f = (0 - u_o)/R_f)$, 且 $i_1 = i_f$, 得:
$ u_o = -R_f/R_1 dot u_i $

电压增益: $display(A_f = u_o/u_i = -R_f/R_1)$

特点: 反相输入, 输入电阻为 $R_1$, 共模输入为零。

==== 同相输入比例运算电路
#figure(
  cetz.canvas({
    import cetz.draw: *
    // 运放符号
    rect((0, 0), (3, 4))
    content((1.5, 2), [$A_0$])
    // 同相输入端
    line((-1, 1), (0, 1))
    content((-1.5, 1), [$u_i$])
    content((0.3, 1), [+])
    // 反相输入端
    line((-1, 3), (0, 3))
    content((-1.5, 3), [地])
    content((0.3, 3), [-])
    // 反馈电阻
    resistorH((3, 3))
    line((5, 3), (5, 1))
    line((5, 1), (3, 1))
    // 电阻
    resistorH((-1, 1))
    line((-3, 1), (-3, 0))
    // 输出
    line((3, 2), (5, 2))
    content((5.5, 2), [$u_o$])
    // 接地
    line((-1, 3), (-1, 4))
    line((-1.5, 4), (-0.5, 4))
  }),
  caption: "同相输入比例运算电路",
)

虚短: $u_+ = u_- = u_i$, 虚断: $i_+ = i_- = 0$。

$ u_- = R_1/(R_1 + R_f) dot u_o $

$ u_o = (1 + R_f/R_1) dot u_i $

电压增益: $display(A_f = 1 + R_f/R_1)$

特点: 同相输入, 输入电阻高, 共模输入等于 $u_i$。

==== 电压跟随器
$R_1 = infinity, R_f = 0$, $A_f = 1$, $u_o = u_i$。输入电阻高, 输出电阻低, 用于阻抗变换。

=== 加法运算电路
#figure(
  cetz.canvas({
    import cetz.draw: *
    // 运放符号
    rect((0, 0), (3, 4))
    content((1.5, 2), [$A_0$])
    // 同相输入端
    line((-1, 1), (0, 1))
    content((-1.5, 1), [地])
    content((0.3, 1), [+])
    // 反相输入端
    line((-1, 3), (0, 3))
    content((0.3, 3), [-])
    // 输入电阻 R1
    resistorH((-1, 3))
    content((-3.5, 3), [$u_(i 1)$])
    // 输入电阻 R2
    resistorH((-1, 2.5))
    content((-3.5, 2.5), [$u_(i 2)$])
    // 输入电阻 R3
    resistorH((-1, 2))
    content((-3.5, 2), [$u_(i 3)$])
    // 反馈电阻
    resistorH((3, 3))
    line((5, 3), (5, 1))
    line((5, 1), (3, 1))
    // 输出
    line((3, 2), (5, 2))
    content((5.5, 2), [$u_o$])
    // 接地
    line((-1, 1), (-1, 0))
    line((-1.5, 0), (-0.5, 0))
  }),
  caption: "加法运算电路",
)

由虚短虚断, $u_- = u_+ = 0$, $i_1 + i_2 + i_3 = i_f$:
$ (u_(i 1))/R_1 + (u_(i 2))/R_2 + (u_(i 3))/R_3 = (0 - u_o)/R_f $

$ u_o = -(R_f/R_1 u_(i 1) + R_f/R_2 u_(i 2) + R_f/R_3 u_(i 3)) $

当 $R_1 = R_2 = R_3 = R$ 时: $u_o = -R_f/R (u_(i 1) + u_(i 2) + u_(i 3))$

=== 减法运算电路(差分输入)
#figure(
  cetz.canvas({
    import cetz.draw: *
    // 运放符号
    rect((0, 0), (3, 4))
    content((1.5, 2), [$A_0$])
    // 同相输入端
    line((-1, 1), (0, 1))
    content((0.3, 1), [+])
    // 反相输入端
    line((-1, 3), (0, 3))
    content((0.3, 3), [-])
    // 输入电阻 R1
    resistorH((-1, 3))
    content((-3.5, 3), [$u_(i 1)$])
    // 反馈电阻
    resistorH((3, 3))
    line((5, 3), (5, 1))
    line((5, 1), (3, 1))
    // 同相输入端电阻
    resistorH((-1, 1))
    content((-3.5, 1), [$u_(i 2)$])
    // 同相输入端接地电阻
    resistorH((-3, 1))
    line((-3, 0), (-3, -0.5))
    line((-3.5, -0.5), (-2.5, -0.5))
    // 输出
    line((3, 2), (5, 2))
    content((5.5, 2), [$u_o$])
  }),
  caption: "减法运算电路(差分输入)",
)

利用叠加定理:

当 $u_(i 1)$ 单独作用时($u_(i 2) = 0$): $u_o' = -R_f/R_1 u_(i 1)$

当 $u_(i 2)$ 单独作用时($u_(i 1) = 0$): $u_o'' = (1 + R_f/R_1) dot R_3/(R_2 + R_3) u_(i 2)$

当 $R_1 = R_2$, $R_f = R_3$ 时:
$ u_o = R_f/R_1 (u_(i 2) - u_(i 1)) $

特别地, 当 $R_1 = R_f$ 时: $u_o = u_(i 2) - u_(i 1)$

=== 积分运算电路
#figure(
  cetz.canvas({
    import cetz.draw: *
    // 运放符号
    rect((0, 0), (3, 4))
    content((1.5, 2), [$A_0$])
    // 同相输入端
    line((-1, 1), (0, 1))
    content((-1.5, 1), [地])
    content((0.3, 1), [+])
    // 反相输入端
    line((-1, 3), (0, 3))
    content((-1.5, 3), [$u_i$])
    content((0.3, 3), [-])
    // 输入电阻
    resistorH((-1, 3))
    // 反馈电容
    capacitorV((3, 3))
    line((3, 3), (5, 3))
    line((5, 3), (5, 1))
    line((5, 1), (3, 1))
    // 输出
    line((3, 2), (5, 2))
    content((5.5, 2), [$u_o$])
    // 接地
    line((-1, 1), (-1, 0))
    line((-1.5, 0), (-0.5, 0))
  }),
  caption: "积分运算电路",
)

用电容 $C$ 替换反馈电阻, 由虚短虚断 $u_- = u_+ = 0$:

$ i_1 = i_f = u_i/R_1 $

$ u_o = -u_C = -1/C integral i_f d t = -1/(R_1 C) integral u_i d t $

输出与输入的积分成正比。当 $u_i$ 为常数时, $u_o$ 为线性变化的电压。

=== 微分运算电路
#figure(
  cetz.canvas({
    import cetz.draw: *
    // 运放符号
    rect((0, 0), (3, 4))
    content((1.5, 2), [$A_0$])
    // 同相输入端
    line((-1, 1), (0, 1))
    content((-1.5, 1), [地])
    content((0.3, 1), [+])
    // 反相输入端
    line((-1, 3), (0, 3))
    content((-1.5, 3), [$u_i$])
    content((0.3, 3), [-])
    // 输入电容
    capacitorV((-1, 3))
    // 反馈电阻
    resistorH((3, 3))
    line((5, 3), (5, 1))
    line((5, 1), (3, 1))
    // 输出
    line((3, 2), (5, 2))
    content((5.5, 2), [$u_o$])
    // 接地
    line((-1, 1), (-1, 0))
    line((-1.5, 0), (-0.5, 0))
  }),
  caption: "微分运算电路",
)

将积分电路中的 $R_1$ 和 $C$ 互换位置:

$ i_C = C (d u_i)/(d t) $

$ u_o = -i_f R_f = -R_f C (d u_i)/(d t) $

输出与输入的微分成正比。

#pagebreak()
== 集成运放在幅值比较方面的运用
=== 电压比较器的基本原理
电压比较器: 将模拟输入电压与参考电压进行比较, 输出高电平或低电平。

运放工作在开环状态, 处于非线性区, 利用虚断特性, 但虚短不再成立。

=== 单限比较器
==== 过零比较器
$U_R = 0$, 当 $u_i > 0$ 时输出低电平, $u_i < 0$ 时输出高电平。

==== 一般单限比较器
参考电压 $U_R$ 接同相输入端:
- $u_i > U_R$: 输出低电平 $-U_(O M)$
- $u_i < U_R$: 输出高电平 $+U_(O M)$

门限电压 $U_T = U_R$。

=== 迟滞比较器(施密特触发器)
#figure(
  grid(
    columns: 2,
    gutter: 2em,
    cetz.canvas({
      import cetz.draw: *
      // 运放符号
      rect((0, 0), (3, 4))
      content((1.5, 2), [$A_0$])
      // 同相输入端
      line((-1, 1), (0, 1))
      content((-1.5, 1), [$U_R$])
      content((0.3, 1), [+])
      // 反相输入端
      line((-1, 3), (0, 3))
      content((-1.5, 3), [$u_i$])
      content((0.3, 3), [-])
      // 正反馈电阻 R1
      resistorH((4, 1))
      content((4, 1.3), text(8pt)[$R_1$])
      line((5, 1), (5, 3))
      line((5, 3), (3, 3))
      line((3, 1), (3.6, 1))
      line((4.4, 1), (5, 1))
      // 正反馈电阻 R2
      resistorV((5, 0))
      content((5.4, 0), text(8pt)[$R_2$])
      line((5, 1), (5, 0.4))
      line((5, -0.4), (5, -1.5))
      line((4.5, -1.5), (5.5, -1.5))
      // 输出
      line((3, 2), (5, 2))
      content((5.5, 2), [$u_o$])
    }),
    [
      迟滞比较器电路

      引入正反馈, 使电路具有迟滞特性, 抗干扰能力强。
    ],
  ),
  caption: "迟滞比较器",
)

==== 门限电压的计算
设输出高电平为 $+U_Z$, 低电平为 $-U_Z$。

同相输入端电压:
$ u_+ = R_2/(R_1 + R_2) U_R + R_1/(R_1 + R_2) u_o $

当 $u_o = +U_Z$ 时, 上门限电压:
$ U_(T+) = R_2/(R_1 + R_2) U_R + R_1/(R_1 + R_2) U_Z $

当 $u_o = -U_Z$ 时, 下门限电压:
$ U_(T-) = R_2/(R_1 + R_2) U_R - R_1/(R_1 + R_2) U_Z $

回差电压:
$ Delta U = U_(T+) - U_(T-) = (2 R_1 U_Z)/(R_1 + R_2) $

==== 电压传输特性
#grid(
  columns: 2,
  figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (6, 4),
        x-tick-step: none,
        y-tick-step: none,
        x-label: [$u_i$],
        y-label: [$u_o$],
        x-min: -3,
        x-max: 3,
        y-min: -1.2,
        y-max: 1.2,
        axis-style: "school-book",
        name: "plot",
        {
          // 上行曲线
          plot.add(
            domain: (-3, -0.3),
            style: (stroke: 1.5pt),
            x => -1,
          )
          plot.add(
            domain: (-0.3, 3),
            style: (stroke: 1.5pt),
            x => 1,
          )
          // 下行曲线
          plot.add(
            domain: (-3, 0.3),
            style: (stroke: (paint: black, dash: "dashed")),
            x => -1,
          )
          plot.add(
            domain: (0.3, 3),
            style: (stroke: (paint: black, dash: "dashed")),
            x => 1,
          )
          plot.add-anchor("up1", (-1.5, -1))
          plot.add-anchor("up2", (1.5, 1))
          plot.add-anchor("down1", (-1.5, -1))
          plot.add-anchor("down2", (1.5, 1))
        },
      )
      content("plot.up1", text(8pt)[上行])
      content("plot.up2", text(8pt)[上行])
      content("plot.down1", text(8pt)[下行])
      content("plot.down2", text(8pt)[下行])
    }),
    caption: "迟滞比较器的电压传输特性",
  ),
)

- 上门限电压 $U_(T+)$: 由低电平翻转为高电平时的输入电压
- 下门限电压 $U_(T-)$: 由高电平翻转为低电平时的输入电压

回差电压 $Delta U = U_(T+) - U_(T-)$, 迟滞比较器抗干扰能力强, 适用于有噪声干扰的场合。
