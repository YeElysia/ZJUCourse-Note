#import "utils.typ": Red, eq, three_line_table
#import "models.typ": (
  arrow_I, capacitorH, capacitorV, constSourceH, constSourceV, controlledSourceH, controlledSourceV, inductorH,
  inductorV, loop, node, ph, resistorH, resistorV,
)
#import "Callouts.typ" as callouts
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

= 分立元件基本电路
== 共发射极放大电路
有源放大电路。先研究静态过程, 然后在静态分析的基础上研究电压和电流在静态工作点附近波动的问题。
=== 电路组成
#v(-1em)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    node((0, 0), fill: none)
    node((0, 2), fill: none)
    line((0.1, 2), (0.6, 2))
    capacitorH((1, 2))
    content((1.3, 2.2), [+])
    line((1.4, 2), (2, 2), (3.5, 2))
    line((3.5, 2.4), (3.5, 1.6))
    line((3.5, 2.15), (4, 2.5), (4, 2.85))
    line((3.5, 1.85), (4, 1.5), mark: (end: ">", fill: black))
    line((4, 1.5), (4, -0.4))
    node((4, 0))
    line((0.1, 0), (4, 0))
    line((3.6, -0.4), (4.4, -0.4))
    line((2, 2), (2, 2.6))
    resistorV((2, 3))
    line((2, 3.4), (2, 4), (4, 4), (4, 3.65))
    resistorV((4, 3.25))
    line((4, 2.5), (4.6, 2.5))
    capacitorH((5, 2.5))
    content((4.7, 2.7), [+])
    line((5.4, 2.5), (5.9, 2.5))
    node((6, 2.5), fill: none)
    line((4, 4), (5.9, 4))
    node((6, 4), fill: none)
    line((4, 0), (5.9, 0))
    node((6, 0), fill: none)

    content((0, 0.4), [-])
    content((0, 1.6), [+])
    content((0, 1), [$u_i$])
    content((6, 0.4), [-])
    content((6, 2.1), [+])
    content((6, 1.25), [$u_o$])
    content((0.8, 2.6), [$C_1$])
    content((1.5, 3), [$"R"_"B"$])
    content((3.5, 3.2), [$"R"_"C"$])
    content((5, 3.1), [$C_2$])
    content((6.8, 4), [$+ U_(C C)$])
  })
]
- 晶体管: 工作在放大状态
- 直流电源$U_(C C)$: 提供放大所需的能量
- 偏置电阻$R_B$: 调节基极电流。(改变静态工作点位置,$R_B$越小, 工作点越高)
- 集电极负载电阻$R_C$: 将集电极电流变化转换为电压变化送到输出端
- 耦合电容$C_1、C_2$:
由前文已述, 使用电容较大的电解电容(有极性), 隔离直流信号, 保留携带信息的交流信号。并且隔断$U_(C C)$干扰。不适用低频电路。过高也不行, 会影响三极管特性。
=== 静态分析
静态即无输入信号$u_i$时电路的直流工作状态, 简化如下图所示
#figure(
  cetz.canvas({
    import cetz.draw: *
    line((2.9, 2), (3.5, 2))
    resistorH((2.5, 2))
    line((2.1, 2), (1.5, 2), (1.5, 1.4))
    constSourceV((1.5, 1))
    line((1.5, 0.6), (1.5, 0), (4, 0), (4, -0.4))
    line((3.6, -0.4), (4.4, -0.4))

    line((3.5, 2.4), (3.5, 1.6))
    line((3.5, 2.15), (4, 2.5))
    line((3.5, 1.85), (4, 1.5), mark: (end: ">", fill: black))
    line((4, 1.5), (4, 0))
    node((4, 0))

    line((4, 2.5), (4, 4), (6, 4), (6, 3.2))
    resistorV((6, 2.8))
    line((6, 2.4), (6, 1.6))
    constSourceV((6, 1.2))
    line((6, 0.8), (6, 0), (4, 0))
    content((2.5, 2.4), [$"R"_"B"$])
    content((5.5, 2.7), [$"R"_"C"$])
    content((7, 1.15), [$U_(C C)$])
    content((6.4, 1.7), [+])
    content((6.4, 0.7), [-])
    content((0.5, 1), [$U_(C C)$])
    content((1.1, 1.5), [+])
    content((1.1, 0.5), [-])

    arrow_I((4, 0), (2.5, 0))
    content((2.7, 0.4), [$I_B$])
    arrow_I((4, 3.5), (4, 3))
    content((3.6, 3.4), [$I_C$])
    content((4.5, 2), [$U_(C E)$])
    content((4.5, 3.6), [+])
    content((4.5, 0.4), [-])
  }),
  caption: [直流通路],
)<图3.1.1>
#v(-0.2em)
==== 图解法
#grid(
  columns: (1fr, 1fr),
  align: horizon + center,

  cetz.canvas({
    import cetz.draw: *
    import cetz-plot: *
    plot.plot(
      size: (4, 3),
      x-label: [$u_(B E)$],
      y-label: [$i_B$],
      x-tick-step: none,
      y-tick-step: none,
      x-min: 0,
      x-max: 0.8,
      y-min: 0,
      y-max: 1,
      axis-style: "school-book",
      name: "plot",
      {
        let Is = 1e-8 // 饱和电流
        let Vt = 0.026 // 热电压
        // 绘制不同 Vce 下的曲线（通常 Vce > 1V 后曲线基本重合）
        plot.add(
          domain: (0, 0.8),
          style: (stroke: blue + 1.5pt),
          // label: [$V_(C E) eq 1"V"$],
          x => 5e-3 * (calc.exp(x / 0.03) - 1),
        )
        plot.add(
          domain: (0, 0.8),
          style: (stroke: black + 1pt),
          // label: [$V_(C E) eq 1"V"$],
          x => -3 * (x - 0.3),
        )

        plot.add-vline(0.135, min: 0, max: 0.485, style: (stroke: (paint: black, dash: "dashed")))
        plot.add-hline(0.485, min: 0, max: 0.135, style: (stroke: (paint: black, dash: "dashed")))

        plot.add-anchor("pt0", (0.135, 0.485))
        plot.add-anchor("pt1", (-0.1, 0.485))
        plot.add-anchor("pt2", (0.135, -0.1))
        plot.add-anchor("pt3", (0.4, -0.1))
        plot.add-anchor("pt4", (-0.1, 0.9))
        plot.add-anchor("pt5", (0.235, 0.485))
      },
    )
    circle("plot.pt0", radius: 0.08, fill: black)
    content("plot.pt1", [$I_B$])
    content("plot.pt2", [$U_(B E)$])
    content("plot.pt3", [$U_(C C)$])
    content("plot.pt4", [$U_(C C)/R_B$])
    content("plot.pt5", [$Q_B$])
  }),
  cetz.canvas({
    import cetz.draw: *
    import cetz-plot: *
    plot.plot(
      size: (4, 3),
      x-label: [$u_(C E)$],
      y-label: [$i_C$],
      x-tick-step: none,
      y-tick-step: none,
      x-min: 0,
      x-max: 10,
      y-min: 0,
      y-max: 5,
      axis-style: "school-book",
      name: "plot",
      {
        let beta = 100
        let Va = 100 // 厄利电压，控制放大区的倾斜度
        let Vcesat = 0.13 // 饱和压降

        // 绘制一组不同 Ib (20uA, 40uA, 60uA, 80uA) 的曲线
        for ib in (1, 2, 3, 4) {
          let Ib_A = ib * 1e-6
          plot.add(
            domain: (0, 10),
            style: (stroke: blue + 1.2pt),
            // label: eval("$I_B = " + str(ib) + "μA$"),
            // 使用 calc.min 模拟从饱和区到放大区的过渡
            x => ib * calc.tanh(x / 0.8) * (1 + x / 50),
          )
          plot.add(
            domain: (0, 10),
            style: (stroke: black + 1pt),
            // label: [$V_(C E) eq 1"V"$],
            x => -0.7 * (x - 6),
          )
        }
        plot.add-anchor("pt0", (3.0, 2.1))
        plot.add-vline(3, min: 0, max: 2.1, style: (stroke: (paint: black, dash: "dashed")))
        plot.add-hline(2.1, min: 0, max: 3, style: (stroke: (paint: black, dash: "dashed")))
        plot.add-anchor("pt1", (-0.5, 2.1))
        plot.add-anchor("pt2", (3, -0.5))
        plot.add-anchor("pt3", (6.8, -0.5))
        plot.add-anchor("pt4", (-1, 4.2))
        plot.add-anchor("pt5", (3.5, 2.6))
        plot.add-anchor("pt6", (11, 2.3))
      },
    )
    circle("plot.pt0", radius: 0.08, fill: black)
    content("plot.pt1", [$I_C$])
    content("plot.pt2", [$U_(C E)$])
    content("plot.pt3", [$U_(C C)$])
    content("plot.pt4", [$U_(C C)/R_C$])
    content("plot.pt5", [$Q_C$])
    content("plot.pt6", [$I_B$])
  }),
)
==== 估算法
以@fig:图3.1.1 为例,
$
  U_(C C) & = R_B I_B + U_(B E) \
  U_(C C) & = R_C I_C + U_(C E)
$
解得(硅管约为0.7V, 锗管约为0.3V)
$
      I_B & = (U_(C C)-U_(B E))/(R_B) \
      I_C & = beta I_B \
  U_(C E) & = U_(C C) - R_C I_C
$
=== 静态分析
=== 静态工作点的稳定
=== 频率特性
