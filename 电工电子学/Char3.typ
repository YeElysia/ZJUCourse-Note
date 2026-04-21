#import "utils.typ": Red, eq, three_line_table
#import "models.typ": (
  arrow_I, capacitorH, capacitorV, constSourceH, constSourceV, controlledSourceH, controlledSourceV, diode, inductorH,
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
=== 动态分析
动态分析就是分析输人信号变化时, 电路中各种变化量的变动情况和相互关系。

$U_(B E)$的波动比较小时, 可以近似认为输入特性曲线是线性的, 因此可以用三极管的微变等效模型(@fig:晶体管微变等效模型)来分析电路的动态特性:
- 电压放大倍数$A_u$
- 输入电阻$R_i$ #Red()[(输入电阻越大越好, 它决定了接收外界信号的能力)]
- 输出电阻$R_o$ #Red()[(输出电阻越小越好, 它决定了驱动负载的能力)]
==== 图解法

#figure(grid(
  columns: 2,
  rows: 2,
  image("assets/动态分析图解法-1.png"), image("assets/动态分析图解法-2.png"),
  [$
    u_(B E) & = U_(B E) + u_(b e) \
        i_B & = I_B + i_b \
  $],
  [$
    u_(C E) & = U_(C E) + u_(c e) \
        i_C & = I_C + i_c \
  $],
))
所以输出电压 $u_o = u_(C E) - U_(C E) = u_(c e)$

如果忽略耦合电容对交流分量的容抗和直流电源$U_(C C)$的内阻, 可以认为
$
  u_(c e) = - R_C i_c
$
#v(-5pt)
#block(inset: 12pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  注意静态工作点的选取, 避免饱和失真和截止失真。
]
==== 微变等效电路分析
① 短路耦合电容$C_1$和$C_2$, 直流电源$U_(C C)$置零。

② 将三极管用微变等效模型替换, 得到如下电路:
#grid(
  columns: 2,
  gutter: 2em,
  cetz.canvas({
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
    line((5.4, 2.5), (6, 2.5))
    // node((6, 2.5), fill: none)
    line((4, 4), (5.9, 4))
    node((6, 4), fill: none)
    line((4, 0), (6, 0))
    // node((6, 0), fill: none)
    line((6, 2.5), (6, 1.65))
    line((6, 0), (6, 0.85))
    resistorV((6, 1.25))

    content((0, 0.4), [-])
    content((0, 1.6), [+])
    content((0, 1), [$u_i$])
    content((6.5, 0), [-])
    content((6.5, 2.5), [+])
    content((6.5, 1.25), [$u_o$])
    content((0.8, 2.6), [$C_1$])
    content((1.5, 3), [$"R"_"B"$])
    content((3.5, 3.2), [$"R"_"C"$])
    content((5, 3.1), [$C_2$])
    content((6.8, 4), [$+ U_(C C)$])
    content((5.5, 1.25), [$R_L$])
  }),
  cetz.canvas({
    import cetz.draw: *
    node((-0.5, 0), fill: none)
    node((-0.5, 4), fill: none)

    line((-0.4, 0), (7, 0))
    line((-0.4, 4), (2.5, 4))
    line((4, 4), (7, 4))

    line((1, 0), (1, 1.6))
    resistorV((1, 2))
    line((1, 2.4), (1, 4))
    line((2.5, 0), (2.5, 1.6))
    resistorV((2.5, 2))
    line((2.5, 2.4), (2.5, 4))
    line((4, 0), (4, 1.6))
    controlledSourceH((4, 2))
    line((4, 2.4), (4, 4))
    line((5.5, 0), (5.5, 1.6))
    resistorV((5.5, 2))
    line((5.5, 2.4), (5.5, 4))
    line((7, 0), (7, 1.6))
    resistorV((7, 2))
    line((7, 2.4), (7, 4))

    line((3.25, 0), (3.25, -0.4))
    line((2.85, -0.4), (3.65, -0.4))

    content((-0.5, 2), [$dot(U)_i$])
    content((-0.5, 3.6), [+])
    content((-0.5, 0.4), [-])
    content((7.5, 2), [$dot(U)_o$])
    content((7.5, 3.6), [+])
    content((7.5, 0.4), [-])
    content((0.5, 2), [$R_B$])
    content((2, 2), [$r_(b e)$])
    content((5, 2), [$R_C$])
    content((6.5, 2), [$R_L$])
    arrow_I((4, 1.6), (4, 0.8))
    content((3.5, 0.9), [$beta dot(I)_b$])

    arrow_I((0, 4), (0.5, 4))
    content((0.4, 3.5), [$dot(I)_i$])
    arrow_I((1.5, 4), (2, 4))
    content((1.9, 3.5), [$dot(I)_b$])
    arrow_I((5, 4), (4.5, 4))
    content((4.6, 3.5), [$dot(I)_c$])
  }),
)
由@eqt:r_be 可得$r_(b e)$, 则:
$
   r_(b e) & = r_b (200 Omega) + (1+beta) 26/I_E \
  dot(U)_i & = r_(b e) dot(I)_b \
  dot(U)_o & = - (R_C \/\/ R_L) dot beta dot(I)_b \
       A_u & = dot(U)_o/dot(U)_i = - beta (R_C \/\/ R_L) / r_(b e) \
$
$A_u$为负值说明共射极放大电路具有倒相作用。

另可以发现, 负载$R_L$使电压放大倍数下降。
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  align: center + horizon,
  [输入电阻
    $
      R_i = dot(U)_i/dot(I)_i = R_B \/\/ r_(b e)
    $],
  [输出电阻
    $
      R_o = dot(U)_o/dot(I)_o = R_C
    $],
)
#callouts.Info[
  经典的共射极放大电路的输入电阻通常不高, 导致其接收外界信号的能力不强。
]
#grid(
  columns: (0.88fr, 1fr),
  align: horizon,
  gutter: 1em,
  image("assets/输入电阻和输出电阻.png"),
  [
    $
      U_i = R_i / (R_S + R_i) U_S \
    $
    因此$R_i$是衡量放大电路对输入电压衰减程度的重要指标
    $
      r_o = (U_o^'/U_o-1) R_L
    $
    可以用外加电源法求解。
  ],
)
#callouts.Question()[
  #grid(
    columns: 2,
    gutter: 1em,
    [
      电路如图所示, 设$u_i$为正弦信号, $U_(B E) = 0.7V$, $beta = 80$, 求:
      #set enum(numbering: "1)")
      1. 不接负载时的电压放大倍数;
      2. 接入负载$R_L$时的电压放大倍数;
      3. 放大电路的输入电阻和输出电阻。

    ],
    cetz.canvas({
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
      line((5.4, 2.5), (6, 2.5))
      // node((6, 2.5), fill: none)
      line((4, 4), (5.9, 4))
      node((6, 4), fill: none)
      line((4, 0), (6, 0))
      // node((6, 0), fill: none)
      line((6, 2.5), (6, 1.65))
      line((6, 0), (6, 0.85))
      resistorV((6, 1.25))

      content((0, 0.4), [-])
      content((0, 1.6), [+])
      content((0, 1), [$u_i$])
      content((6.5, 0), [-])
      content((6.5, 2.5), [+])
      content((6.5, 1.25), [$u_o$])
      content((0.8, 2.6), [$C_1$])
      content((1, 1.2), [$47 mu F$])
      content((1.5, 3), [$"R"_"B"$])
      content((2.7, 2.5), [$470 k Omega$])
      content((3.5, 3.2), [$"R"_"C"$])
      content((4.6, 3.2), [$3 k Omega$])
      content((5.5, 2.8), [$C_2$])
      content((5, 1.8), [$47 mu F$])
      content((6.8, 4), [$+ U_(C C)$])
      content((6, 3.5), [$12V$])
      content((5.5, 1.25), [$R_L$])
      content((5.3, 0.7), [$5.1 k Omega$])
    }),
  )
  【解】

  先进行静态分析
  $
        I_B & = (U_(C C)-U_(B E))/(R_B) = 0.024 "mA" \
        I_C & = beta I_B = 1.92 "mA" \
    U_(C E) & = U_(C C) - R_C I_C = 6.24 "V" \
  $
  (1) 不接负载时,
  $
    r_(b e) & = 200 + 26/I_B = 1.283 "k"Omega \
        A_u & = - beta R_C / r_(b e) = - 187.06
  $
  (2) 接入负载$R_L$时,
  $ A_u = - beta (R_C \/\/ R_L) / r_(b e) = -117.78 $
  (3) 输入电阻和输出电阻
  $
    R_i = R_B \/\/ r_(b e) = 1.280 "k"Omega \
    R_o = R_C = 3 "k"Omega
  $
]
#block(inset: 12pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  共射极放大电路具有电流放大的功能。
]
=== 静态工作点的稳定
当温度升高时, 三极管$beta$增加, 导致集电极电流$I_C$增加, 使静态工作点将沿直流负载线上移。因此需要采取措施稳定静态工作点。如@fig:img3-1-3 所示。
#figure(
  cetz.canvas({
    import cetz.draw: *
    node((0, 0), fill: none)
    node((0, 2.5), fill: none)
    line((0.1, 2.5), (0.6, 2.5))
    capacitorH((1, 2.5))
    content((1.3, 2.7), [+])
    line((1.4, 2.5), (2, 2.5), (3.5, 2.5))
    line((3.5, 2.9), (3.5, 2.1))
    line((3.5, 2.65), (4, 3), (4, 3.85))
    line((3.5, 2.35), (4, 2), mark: (end: ">", fill: black))

    line((4, 2), (4, 1.1))
    resistorV((4, 0.7))
    line((4, 0.3), (4, -0.4))
    line((4, 1.5), (5, 1.5), (5, 1.1))
    capacitorV((5, 0.7))
    content((4.8, 1), [+])
    content((5.65, 0.6), [$C_E$])
    line((5, 0.3), (5, 0))

    line((2, 2.5), (2, 2.5 - 1.7 / 2))
    resistorV((2, 2.5 / 2))
    line((2, 1.7 / 2), (2, 0))

    node((4, 0))
    line((0.1, 0), (4, 0))
    line((3.6, -0.4), (4.4, -0.4))
    line((2, 2.5), (2, 3.1 + 0.25))
    resistorV((2, 3.5 + 0.25))
    line((2, 3.9 + 0.25), (2, 5), (4, 5), (4, 3.65 + 1))
    resistorV((4, 3.75 + 0.5))
    line((4, 3.5), (4.6, 3.5))
    capacitorH((5, 3.5))
    content((4.7, 2.7 + 1), [+])
    line((5.4, 2.5 + 1), (6, 2.5 + 1))
    // node((6, 2.5), fill: none)
    line((4, 5), (5.9, 5))
    node((6, 5), fill: none)
    line((4, 0), (6, 0))
    // node((6, 0), fill: none)
    line((6, 3.5), (6, 3.5 - 2.7 / 2))
    line((6, 0), (6, 0.85 + 0.5))
    resistorV((6, 1.25 + 0.5))

    content((0, 0.4), [-])
    content((0, 1.6), [+])
    content((0, 1), [$u_i$])
    content((6.5, 0), [-])
    content((6.5, 2.5 + 1), [+])
    content((6.5, 3.5 / 2), [$u_o$])
    content((0.8, 2.6 + 0.5), [$C_1$])
    content((1.5, 3.75), [$"R"_("B"1)$])
    content((1.5, 2.5 / 2), [$"R"_("B"2)$])
    content((3.5, 4.2), [$"R"_"C"$])
    content((3.5, 0.7), [$"R"_"E"$])
    content((5, 4.2), [$C_2$])
    content((6.8, 5), [$+ U_(C C)$])
    content((5.5, 1.25 + 0.5), [$R_L$])

    arrow_I((4, 3.85), (4, 3.05))
    content((3.6, 3.25), [$I_C$])
    arrow_I((4, 1.85), (4, 1.55))
    content((3.6, 1.65), [$I_E$])
    arrow_I((2, 2.85), (2, 2.7))
    content((2.4, 2.85), [$I_1$])
    arrow_I((2, 2.5), (2, 1.9))
    content((1.6, 2.05), [$I_2$])
    arrow_I((2, 2.5), (3, 2.5))
    content((2.9, 2.1), [$I_B$])

    line((3.15, -0.5), (3.15, 5.5), stroke: (dash: "dashed", paint: gray))
  }),
  caption: [静态工作点稳定的电路(负反馈)],
)<img3-1-3>
因为$I_B$数量级远小于$I_1$、$I_2$, 因此$I_B approx 0$, $I_1 approx I_2$, 则
$
  U_B approx R_"B2" / (R_("B1") + R_"B2") U_(C C) \
  I_E = (U_B - U_(B E))/R_E approx U_B/R_E \
$
因此$I_E$几乎不受温度和三极管参数影响, 只取决于外电路参数, 静态工作点近似不变。

本质上是#Red[负反馈]: $T arrow.t " "arrow.double" " I_C arrow.t " "arrow.double" " U_E arrow.t " "arrow.double" " U_(B E) arrow.b " "arrow.double" " I_b arrow.b " "arrow.double" " I_C arrow.b$, 从而稳定$I_C$。

且由于$C_E$存在,$X_(C E) << R_E$, $R_E$相当于短路, 交流信号基本不受负反馈影响。

求解静态参数时, 将虚线左侧作戴维宁等效即可。

动态分析如下图:
#figure(
  cetz.canvas({
    import cetz.draw: *
    node((-2, 0), fill: none)
    node((-2, 4), fill: none)

    line((-1.9, 0), (7, 0))
    line((-1.9, 4), (2.5, 4))
    line((4, 4), (7, 4))

    line((-0.5, 0), (-0.5, 1.6))
    resistorV((-0.5, 2))
    line((-0.5, 2.4), (-0.5, 4))

    line((1, 0), (1, 1.6))
    resistorV((1, 2))
    line((1, 2.4), (1, 4))
    line((2.5, 0), (2.5, 1.6))
    resistorV((2.5, 2))
    line((2.5, 2.4), (2.5, 4))
    line((4, 0), (4, 1.6))
    controlledSourceH((4, 2))
    line((4, 2.4), (4, 4))
    line((5.5, 0), (5.5, 1.6))
    resistorV((5.5, 2))
    line((5.5, 2.4), (5.5, 4))
    line((7, 0), (7, 1.6))
    resistorV((7, 2))
    line((7, 2.4), (7, 4))

    line((3.25, 0), (3.25, -0.4))
    line((2.85, -0.4), (3.65, -0.4))

    content((-2, 2), [$dot(U)_i$])
    content((-2, 3.6), [+])
    content((-2, 0.4), [-])
    content((7.5, 2), [$dot(U)_o$])
    content((7.5, 3.6), [+])
    content((7.5, 0.4), [-])
    content((-1, 2), [$R_"B1"$])
    content((0.5, 2), [$R_"B2"$])
    content((2, 2), [$r_(b e)$])
    content((5, 2), [$R_C$])
    content((6.5, 2), [$R_L$])
    arrow_I((4, 1.6), (4, 0.8))
    content((3.5, 0.9), [$beta dot(I)_b$])

    // arrow_I((0, 4), (0.5, 4))
    // content((0.4, 3.5), [$dot(I)_i$])
    arrow_I((1.5, 4), (2, 4))
    content((1.9, 3.5), [$dot(I)_b$])
    arrow_I((5, 4), (4.5, 4))
    content((4.6, 3.5), [$dot(I)_c$])
  }),
  caption: [@fig:img3-1-3 的微变等效电路],
)
#grid(
  columns: (1fr, 1fr),
  // gutter: 2em,
  [
    更进一步, 将发射极电路改为@fig:img3-1-5 所示。

    虽然降低了电压放大倍数, 但在稳定静态工作点的同时, 可以大大增大输入电阻, 并在$beta$变化时稳定电压放大倍数。
  ],
  [#figure(
    cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0, 0.4))
      resistorV((0, 0.8))
      line((0, 1.2), (0, 2))
      resistorV((0, 2.4))
      line((0, 2.8), (0, 3.2))

      line((0, 1.6), (1, 1.6), (1, 1.2))
      capacitorV((1, 0.8))
      line((1, 0.4), (1, 0), (0, 0))
      content((0.8, 1.1), [+])

      line((0, 0), (0, -0.4))
      line((-0.4, -0.4), (0.4, -0.4))
    }),
    caption: [],
  )<img3-1-5>],
)
#v(1em)
=== 频率特性
#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    rows: 2,
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      // 使用对数刻度的模拟：x 轴代表 lg(f)
      plot.plot(
        size: (5, 3),
        x-label: [$f$],
        y-label: [$|A_u|$],
        x-tick-step: none,
        y-tick-step: none,
        x-min: 0,
        x-max: 7,
        y-min: 0,
        y-max: 2,
        axis-style: "school-book",
        name: "plot",
        {
          let fl = 1.5
          let fh = 5.5
          let Aum = 1.0

          // 幅频曲线
          plot.add(
            domain: (0.5, 6.5),
            samples: 200,
            style: (stroke: blue + 1.5pt),
            x => {
              // 使用更陡峭的传递函数模拟平坦中频段
              let l = 1 / calc.sqrt(1 + calc.pow(10, 2 * (fl - x)))
              let h = 1 / calc.sqrt(1 + calc.pow(10, 2 * (x - fh)))
              Aum * l * h * 2
            },
          )
          plot.add-hline(2, min: 0, max: 2, style: (stroke: (dash: "dashed")))
          plot.add-hline(1.414, min: 0, style: (stroke: (dash: "dashed")))
          plot.add-vline(1.5, 5.5, min: 0, max: 1.414, style: (stroke: (dash: "dashed")))

          plot.add-hline(0.4, min: 1.5, max: 5.5, style: (mark: (start: ">", end: ">", fill: black)))
          plot.add-anchor("pt1", (3.5, 0.6))
          plot.add-anchor("pt2", (1.5, -0.2))
          plot.add-anchor("pt3", (5.5, -0.2))
          plot.add-anchor("pt4", (-0.8, 2))
          plot.add-anchor("pt5", (-0.8, 1.414))
        },
      )
      content("plot.pt1", [$f_(B W)$])
      content("plot.pt2", [$f_L$])
      content("plot.pt3", [$f_H$])
      content("plot.pt4", [$|A_(u m )|$])
      content("plot.pt5", [$(|A_(u m )|)/sqrt(2)$])
    }),

    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      plot.plot(
        size: (5, 3),
        x-label: [$f$ (Hz)],
        y-label: [$phi$],
        x-min: 0.8,
        x-max: 7,
        y-min: -90,
        y-max: 90,
        x-tick-step: none,
        y-tick-step: none,
        axis-style: "school-book",
        name: "plot",
        {
          let fl = 1.5
          let fh = 5.5

          plot.add(
            domain: (0.8, 6.2),
            samples: 200,
            style: (stroke: blue + 1.5pt),
            x => {
              // 使用 atan 模拟 S 型相位变化
              let p_low = calc.atan(calc.pow(10, (fl - x) * 2)) / 1deg
              let p_high = calc.atan(calc.pow(10, (x - fh) * 2)) / 1deg
              p_low - p_high
            },
          )
          plot.add-hline(90, -90, min: 0.8, style: (stroke: (dash: "dashed")))
          plot.add-anchor("pt1", (0, 90))
          plot.add-anchor("pt2", (0, 0))
          plot.add-anchor("pt3", (0, -90))
        },
      )
      content("plot.pt1", [$270 degree$])
      content("plot.pt2", [$180 degree$])
      content("plot.pt3", [$90 degree$])
    }),
    [幅频特性],

    [相频特性],
  ),
  caption: [电容耦合单管共发射极放大电路的频率特性],
)
因此正弦波信号$u_i$的频率不能太高也不能太低。

== 共集电极放大电路
#grid(
  columns: (1fr, 1fr),
  // align: horizon,
  [#cetz.canvas({
      import cetz.draw: *
      node((0, -1), fill: none)
      node((0, 2), fill: none)
      line((0.1, 2), (0.6, 2))
      capacitorH((1, 2))
      content((1.3, 2.2), [+])
      line((1.4, 2), (2, 2), (3.5, 2))
      line((3.5, 2.4), (3.5, 1.6))
      line((3.5, 2.15), (4, 2.5), (4, 4))
      line((3.5, 1.85), (4, 1.5), mark: (end: ">", fill: black))

      line((4, 1.5), (4, 0.4))
      resistorV((4, 0))
      line((4, -0.4), (4, -1.4))

      node((4, -1))
      line((0.1, -1), (6, -1))
      line((3.6, -1.4), (4.4, -1.4))
      line((2, 2), (2, 2.6))
      resistorV((2, 3))
      line((2, 3.4), (2, 4), (5.9, 4))

      line((4, 1), (4.6, 1))
      capacitorH((5, 1))
      content((4.7, 1.2), [+])
      line((5.4, 1), (6, 1))

      node((6, 4), fill: none)

      line((6, 1), (6, 0.4))
      line((6, -0.4), (6, -1))
      resistorV((6, 0))

      content((0, -0.6), [-])
      content((0, 1.6), [+])
      content((0, 0.5), [$u_i$])
      content((6.5, -1), [-])
      content((6.5, 1), [+])
      content((6.5, 0), [$u_o$])
      content((0.8, 2.6), [$C_1$])
      content((1.5, 3), [$"R"_"B"$])
      content((5, 1.6), [$C_2$])
      content((6.8, 4), [$+ U_(C C)$])
      content((5.5, 0), [$R_L$])
      content((3.5, 0), [$R_E$])
    })

    静态分析
    $
      I_B & = (U_(C C) - U_(B E)) / (R_B + (1 + beta)R_E) \
    $],
  [#cetz.canvas({
      import cetz.draw: *
      node((-0.5, 0), fill: none)
      node((-0.5, 4), fill: none)

      line((-0.4, 0), (7, 0))
      line((-0.4, 4), (1, 4))
      line((4, 4), (7, 4))

      line((1, 0), (1, 1.6))
      resistorV((1, 2))
      line((1, 2.4), (1, 4))
      content((0.5, 2), [$R_B$])

      line((1, 4), (2.1, 4))
      resistorH((2.5, 4))
      line((2.9, 4), (4, 4))
      content((2.5, 3.6), [$r_(b e)$])

      line((4, 0), (4, 1.6))
      controlledSourceH((4, 2))
      line((4, 2.4), (4, 4))
      line((5.5, 0), (5.5, 1.6))
      resistorV((5.5, 2))
      line((5.5, 2.4), (5.5, 4))
      line((7, 0), (7, 1.6))
      resistorV((7, 2))
      line((7, 2.4), (7, 4))

      line((3.25, 0), (3.25, -0.4))
      line((2.85, -0.4), (3.65, -0.4))

      content((-0.5, 2), [$dot(U)_i$])
      content((-0.5, 3.6), [+])
      content((-0.5, 0.4), [-])
      content((7.5, 2), [$dot(U)_o$])
      content((7.5, 3.6), [+])
      content((7.5, 0.4), [-])


      content((5, 2), [$R_E$])
      content((6.5, 2), [$R_L$])
      arrow_I((4, 2.4), (4, 3.2))
      content((3.5, 3.1), [$beta dot(I)_b$])
      arrow_I((1, 4), (1.8, 4))
      content((1.6, 3.5), [$dot(I)_b$])
    })

    动态分析
    $
      dot(U)_i & = dot(I)_b r_(b e) + dot(I)_e (R_E\/\/R_L) \
      dot(U)_o & = dot(I)_e (R_E\/\/R_L) \
           A_u & = dot(U)_o/dot(U)_i = ((1 +beta)(R_E\/\/R_L)) / (r_(b e)+(1 +beta)(R_E\/\/R_L)) \
           r_i & = R_B \/\/ [r_(b e) + (1 + beta)(R_E\/\/R_L)] \
           r_o & = R_E \/\/ (r_(b e)+R_B\/\/R_S)/(1+beta)
    $],
)
#grid(
  columns: (1fr, 1fr),
)

因为$A_u$趋近于1, 因此该电路又称射极跟随器。$r_i$较大, 常用于多级放大电路的输入级。
$r_o$较小, 带负载能力强, 因此也常用作小功率多级放大电路的输出级。
#figure(image("assets/共基极放大电路.png", width: 51%), caption: [共基极(不考)])
== 共源极放大电路
#image("assets/共源极放大电路.png")
// 静态分析: $U_(G S)$, $I_D$, $U_(D S)$
#grid(
  columns: (1fr, 1fr),
  [$
    U_(G S) & = U_G - U_S \
            & = 0 - R_S I_D
  $],
  [$
        U_G & = U_G' = R_(G 2)/(R_(G_1)+R_(G 2)) U_(D D) \
    U_(G S) & = U_G - U_S \
            & = R_(G 2)/(R_(G_1)+R_(G 2)) U_(D D) - R_S I_D \
        I_D & = I_(D S S) (1- U_(G S)/U_(G S (o f f)))^2
  $],
)
#image("assets/共源极微变等效.png")
$
  A_U & = dot(U)_o/dot(U)_i = (-g_m R_L^' dot(U)_(g s))/dot(U)_(g s) = - g_m R_L^' \
  r_i & = dot(U)_i/dot(I)_i = R_G + R_(G 1)\/\/R_(G 2) #h(4em) r_o = R_D
$

== 分立元件组成的基本门电路
=== 二极管与门电路
#grid(
  columns: (1fr, 1fr, 1fr),
  align: horizon + center,
  figure(
    cetz.canvas({
      import cetz.draw: *
      node((0, 0), fill: none)
      node((0, 1), fill: none)
      line((0.1, 1), (2.4, 1))
      diode((1.6, 1), (0.8, 1), "l")
      line((0.1, 0), (2.4, 0))
      diode((1.6, 0), (0.8, 0), "l")
      line((2.4, 0), (2.4, 1.6))
      resistorV((2.4, 2))
      line((2.4, 2.4), (2.4, 2.9))
      node((2.4, 3), fill: none)
      node((2.4, 1))
      line((2.4, 1), (3.1, 1))
      node((3.2, 1), fill: none)
      content((-0.4, 0), [B])
      content((-0.4, 1), [A])
      content((3.6, 1), [F])
      content((2.4, 3.4), [$U_(C C)$])
      content((2.8, 2), [R])
    }),
    caption: [二极管与门电路],
  ),

  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (0.6, 0.8))
      content((0.3, 0.4), [&])
      line((-0.6, 0.2), (0, 0.2))
      line((-0.6, 0.6), (0, 0.6))
      line((0.6, 0.4), (1.2, 0.4))
      content((-0.8, 0.2), [B])
      content((-0.8, 0.6), [A])
      content((1.4, 0.4), [F])

      line((0, -1.5), (0, 2.4), stroke: none)
    }),
    caption: [与门图形符号],
  ),
  figure(caption: [逻辑状态表])[
    #table(
      columns: (1fr, 1fr, 1fr),
      align: horizon + center,
      stroke: (x, y) => (
        left: if x == 2 { 1pt } else { 0pt },
        right: 0pt,
        top: if y <= 1 { 1pt } else { 0pt },
        bottom: if y == 4 { 1pt } else { 0pt },
      ),
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header([A], [B], [F]),
      [0], [0], [0],
      [0], [1], [0],
      [1], [0], [0],
      [1], [1], [1],
      table.vline(x: 2),
    )
  ],
)
#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  逻辑函数表达式
  $
    F = "A" dot "B"
  $]
=== 二极管或门电路
#grid(
  columns: (1fr, 1fr, 1fr),
  align: horizon + center,
  figure(
    cetz.canvas({
      import cetz.draw: *
      node((0, 0), fill: none)
      node((0, 1), fill: none)
      line((0.1, 1), (2.4, 1))
      diode((0.8, 1), (1.6, 1), "r")
      line((0.1, 0), (2.4, 0))
      diode((0.8, 0), (1.6, 0), "r")

      line((2.4, 1), (2.4, -0.6))
      resistorV((2.4, -1))
      line((2.4, -1.4), (2.4, -1.9))
      node((2.4, -2), fill: none)
      node((2.4, 0))
      line((2.4, 0), (3.1, 0))
      node((3.2, 0), fill: none)
      content((-0.4, 0), [B])
      content((-0.4, 1), [A])
      content((3.6, 0), [F])
      content((2.4, -2.4), [$- U_(C C)$])
      content((2.8, -1), [R])
    }),
    caption: [二极管或门电路],
  ),

  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (0.6, 0.8))
      content((0.3, 0.4), text(size: 8pt)[>=1])
      line((-0.6, 0.2), (0, 0.2))
      line((-0.6, 0.6), (0, 0.6))
      line((0.6, 0.4), (1.2, 0.4))
      content((-0.8, 0.2), [B])
      content((-0.8, 0.6), [A])
      content((1.4, 0.4), [F])

      line((0, -1.5), (0, 2.4), stroke: none)
    }),
    caption: [或门图形符号],
  ),
  figure(caption: [逻辑状态表])[
    #table(
      columns: (1fr, 1fr, 1fr),
      align: horizon + center,
      stroke: (x, y) => (
        left: if x == 2 { 1pt } else { 0pt },
        right: 0pt,
        top: if y <= 1 { 1pt } else { 0pt },
        bottom: if y == 4 { 1pt } else { 0pt },
      ),
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header([A], [B], [F]),
      [0], [0], [0],
      [0], [1], [1],
      [1], [0], [1],
      [1], [1], [1],
      table.vline(x: 2),
    )
  ],
)
#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  逻辑函数表达式
  $
    F = "A" + "B"
  $
]

=== 晶体管及场效晶体管非门电路
==== 晶体管非门
#grid(
  columns: (1fr, 1fr, 1fr),
  align: horizon + center,
  figure(
    cetz.canvas({
      import cetz.draw: *

      line((3.5, 2.4), (3.5, 1.6))
      line((3.5, 2.15), (4, 2.5), (4, 2.85))
      line((3.5, 1.85), (4, 1.5), mark: (end: ">", fill: black))
      line((4, 1.5), (4, 0.5))
      line((3.7, 0.5), (4.3, 0.5))

      line((3.5, 2), (3, 2))
      line((3, 2), (3, 1.8))
      resistorV((3, 1.4))
      line((3, 1), (3, 0.6))
      node((3, 0.5), fill: none)
      content((2.4, 0.6), [$U_(B B)$])

      line((3, 2), (2.6, 2))
      resistorH((2.2, 2))
      line((1.8, 2), (1.4, 2))
      node((1.3, 2), fill: none)
      content((0.9, 2), [A])

      line((4, 2.85), (4, 3.05))
      resistorV((4, 3.45))
      line((4, 3.85), (4, 4.05))
      node((4, 4.15), fill: none)
      content((3.2, 4.1), [$+ U_(C C)$])
      line((4, 2.85), (4.9, 2.85))
      node((5, 2.85), fill: none)
      content((5.4, 2.85), [F])
    }),
    caption: [二极管或门电路],
  ),

  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (0.6, 0.8))
      content((0.3, 0.4), text(size: 8pt)[1])
      line((-0.6, 0.4), (0, 0.4))
      line((0.8, 0.4), (1.2, 0.4))
      node((0.7, 0.4), fill: none)
      content((-0.8, 0.4), [A])
      content((1.4, 0.4), [F])

      line((0, -1.5), (0, 2.4), stroke: none)
    }),
    caption: [或门图形符号],
  ),
  figure(caption: [逻辑状态表])[
    #table(
      columns: (1fr, 1fr),
      align: horizon + center,
      stroke: (x, y) => (
        left: if x == 1 { 1pt } else { 0pt },
        right: 0pt,
        top: if y <= 1 { 1pt } else { 0pt },
        bottom: if y == 2 { 1pt } else { 0pt },
      ),
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header([A], [F]),
      [0], [1],
      [1], [0],
    )
  ],
)

#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  逻辑函数表达式
  $
    F = overline("A")
  $
]
