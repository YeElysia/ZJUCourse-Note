#import "utils.typ": Red, eq, three_line_table
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
=== 主要参数
……
=== 电压传输特性
#grid(
  columns: 2,
  gutter: 2em,
  figure(cetz.canvas({
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
  })),
)
== 放大电路中的负反馈
== 集成运放在模拟信号运算方面的运用
== 集成运放在幅值比较方面的运用
