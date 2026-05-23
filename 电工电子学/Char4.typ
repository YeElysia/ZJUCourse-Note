#import "utils.typ": Red, eq, three_line_table
#import "models.typ": (
  andGate, arrow_I, capacitorH, capacitorV, constSourceH, constSourceV, controlledSourceH, controlledSourceV, diode,
  inductorH, inductorV, loop, nandGate, node, norGate, notGate, orGate, ph, resistorH, resistorV, xorGate,
)
#import "Callouts.typ" as callouts
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

= 数字集成电路
== 逻辑代数运算规则

逻辑变量只有真（True，1）和假（False，0）两种值，只能参与逻辑运算（与或非）

数字电路用信号电位的高低表示逻辑变量，通过门电路等元件让信号参与逻辑运算
#figure(caption: [逻辑状态表])[
  #table(
    columns: (1fr, 1fr, 1fr),
    align: horizon + center,
    fill: (_, y) => if calc.odd(y) { rgb("EAF2F5") },
    // stroke: frame(1pt + rgb("21222C")),
    stroke: (x, y) => (
      left: if x == 1 { 1pt } else { 0pt },
      right: 0pt,
      top: if (y <= 1 or y == 6) { 1pt } else { 0pt },
      bottom: if y == 4 { 1pt } else { 0pt },
    ),
    // column-gutter: 1em,
    inset: 0.6em,
    // column-gutter: 1em,
    table.header([], [与], [或]),
    [自等律], [A•1=A], [A+0=A],
    [0-1 律], [A•0=0], [A+1=1],
    [互补律], [A+#overline[A]=1], [A•#overline[A]=0],
    [重叠律], [A+A=A], [A•A=A],

    [还原律], move(dx: 55%)[#block()[#overline(offset: -1em)[#overline[A]]=A]], [],
    [交换律], [AB=BA], [A+B=B+A],
    [结合律], [(AB)C=A(BC)], [A+(B+C)=(A+B)+C],
    [分配律], [A(B+C)=AB+AC], [A+BC=(A+B)(A+C)],
    [吸收律], [A+AB=A], [A(A+B)=A],
    [], [A+#overline[A]B=A+B], [A(#overline[A]+B)=AB],
    [反演律],
    [#overline[ABC]=#overline[A]+#overline[B]+#overline[C]],
    [#overline[A+B+C]=#overline[A]•#overline[B]•#overline[C]],
  )
]
== 逻辑函数的表示与化简

=== 逻辑函数的表示方法
- 逻辑状态表
- 逻辑表达式
- 逻辑图
// @门电路 逻辑门电路

以逻辑表达式 F = A#overline[B] + #overline[A]B 为例，
#grid(
  columns: (1fr, 1fr),
  rows: 2,
  align: center + horizon,
  row-gutter: 1em,

  [逻辑状态表], [逻辑图],
  [
    #figure(table(
      columns: (1fr, 1fr, 1fr),
      align: horizon + center,
      fill: (_, y) => if calc.odd(y) { rgb("EAF2F5") },
      // stroke: frame(1pt + rgb("21222C")),
      stroke: (x, y) => (
        left: if x == 2 { 1pt } else { 0pt },
        right: 0pt,
        top: if (y <= 1 or y == 6) { 1pt } else { 0pt },
        bottom: if y == 4 { 1pt } else { 0pt },
      ),
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header([A], [B], [F]),
      [0], [0], [0],
      [0], [1], [1],
      [1], [0], [1],
      [1], [1], [0],
    )) <xorgate>],
  [#figure()[
    #cetz.canvas({
      import cetz.draw: *
      andGate((2, 0))

      andGate((2, 2))

      notGate((0, -0.2))
      line((0.5, -0.2), (1.7, -0.2))

      notGate((0, 2.2))
      line((0.5, 2.2), (1.7, 2.2))

      line((-1.5, 0.7), (0.8, 0.7), (0.8, 1.8), (1.7, 1.8))
      line((-1, 0.7), (-1, -0.2), (-0.3, -0.2))
      content((-1.8, 0.7), [B])
      line((-1.5, 1.3), (0, 1.3), (1.2, 1.3), (1.2, 0.2), (1.7, 0.2))
      line((-1, 1.3), (-1, 2.2), (-0.3, 2.2))
      content((-1.8, 1.3), [A])

      line((2.3, 2), (3, 2), (3, 1.2), (3.5, 1.2))

      line((2.3, 0), (3, 0), (3, 0.8), (3.5, 0.8))
      orGate((3.8, 1))
      line((4.1, 1), (4.7, 1))
      content((5, 1), [F])
    })
  ]],
)
#pagebreak()
=== 逻辑函数的代数化简法

#callouts.Question()[
  试化简 F = AB + #overline[A]C + BCDE

  【解】

  $
    F & = A B + overline(A)C + B C D E \
      & = A B + C (overline(A) + B D E) \
      & = A B + C (overline(A) + A B D E) "    (吸收律)" \
      & = A B(1+ C D E) + overline(A)C \
      & = A B + overline(A)C
  $
]

== 集成门电路
=== 集成门电路的类型
门电路是数字电路的基本逻辑单元, 包括TTL门电路和CMOS门电路。
#grid(
  columns: (1fr, 1fr, 1fr),
  rows: 6,
  align: center + horizon,
  row-gutter: 1.2em,
  [#cetz.canvas({
    import cetz.draw: *
    andGate((0, 0))
    line((-1, 0.2), (-0.3, 0.2))
    line((-1, -0.2), (-0.3, -0.2))
    line((1, 0), (0.3, 0))
  })],
  [#cetz.canvas({
    import cetz.draw: *
    orGate((0, 0))
    line((-1, 0.2), (-0.3, 0.2))
    line((-1, -0.2), (-0.3, -0.2))
    line((1, 0), (0.3, 0))
  })],
  [#cetz.canvas({
    import cetz.draw: *
    notGate((0, 0))
    line((1, -0), (-0.3, 0))
    line((1, 0), (0.5, 0))
  })],

  [F = AB], [F = A+B], [F = #overline(offset: -1em)[A]],

  [与门], [或门], [非门],
  [#cetz.canvas({
    import cetz.draw: *
    nandGate((0, 0))
    line((-1, 0.2), (-0.3, 0.2))
    line((-1, -0.2), (-0.3, -0.2))
    line((1, 0), (0.5, 0))
  })],
  [#cetz.canvas({
    import cetz.draw: *
    norGate((0, 0))
    line((-1, 0.2), (-0.3, 0.2))
    line((-1, -0.2), (-0.3, -0.2))
    line((1, 0), (0.5, 0))
  })],
  [#cetz.canvas({
    import cetz.draw: *
    xorGate((0, 0))
    line((-1, 0.2), (-0.3, 0.2))
    line((-1, -0.2), (-0.3, -0.2))
    line((1, 0), (0.3, 0))
  })],

  [F = #overline(offset: -1em)[AB]],
  [F = #overline(offset: -1em)[A+B]],
  [F = A#overline(offset: -1em)[B] + #overline(offset: -1em)[A]B],

  [与非门], [或非门], [异或门],
)
=== TTL与非门电路
#grid(
  columns: 2,
  [#figure(image("assets/TTL与非门电路.png", height: 12em), caption: [TTL与非门电路])],
  [#figure(image("assets/TTL与非门的电压传输特性.png", height: 12em), caption: [TTL与非门的电压传输特性])],
)
==== 输出高电平 $U_(O H)$ 和输出低电平 $U_(O L)$
规定了高电平的下限值及低电平的上限值, TTL与非门中$U_(O H) >= 2.4V$ 和 $U_(O L) <= 0.4V$
==== 开门电压 $U_(O N)$ 和关门电压 $U_(O F F)$
保证了门电路的输入电压在开门电压以下时输出高电平，在关门电压以上时输出低电平。TTL与非门中一般$U_(O N) = 1.8V$ 和 $U_(O F F) = 0.8V$
==== 输入低电平噪声容限 $U_(N L)$ 和输入高电平噪声容限 $U_(N H)$
表征了与非门电路的抗干扰能力。干扰信号幅度在噪声容限内不会引起输出状态的改变。
$
  U_(N L) = U_(O F F) - U_(O L) \
  U_(N H) = U_(O H) - U_(O N)
$
==== 扇出系数 $N_0$
带负载的能力, 定义为一个与非门能带同类门的最大数目。通俗的说就是后面还能再接多少个门电路。TTL与非门中一般$N_0 >=8$。
==== 平均传输延迟时间$t_(p d)$
TTL 与非门工作时, 由于晶体管从导通到截止或者从截止到导通都需要一定的时间, 因此输出脉冲相对于输入脉冲来说总有一定的延迟, 称为传输延迟。
#figure(image("assets/TTL与非门波形的传输延迟时间.png", width: 40%))
$
  t_(p d) = (t_(p H L) + t_(p L H)) / 2
$
$t_(p d)$越小, 门电路的开关速度越快。

=== TTL三态与非门电路
#v(-1em)
#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (1.2, 1.6))
      content((0.6, 1.3), [&])
      content((1, 0.8), [$gradient$])
      content((0.3, 0.3), [EN])
      node((-0.1, 0.4), fill: none)
      line((-1, 0.4), (-0.2, 0.4))
      line((-1, 0.8), (0, 0.8))
      line((-1, 1.2), (0, 1.2))
      node((1.3, 0.8), fill: none)
      line((1.4, 0.8), (2.4, 0.8))

      content((-1.3, 1.2), [A])
      content((-1.3, 0.8), [B])
      content((-1.3, 0.2), [#overline(offset: -1em)[EN]])
      content((2.7, 0.8), [F])
    }),
    caption: [TTL三态与非门图形符号],
  ),
  figure(image("assets/TTL三态与非门电路.png"), caption: [TTL三态与非门电路]),
)
#overline(offset: -1em)[EN]及其输入端的圈代表低电平有效;


#overline(offset: -1em)[EN]=0时, 输出为与非门的正常输出; #overline(offset: -1em)[EN]=1时, 输出为高阻态,相当于开路悬空。

三态门接于总线, 可实现数据或信号的轮流传输。#Red[时分复用]

== 逻辑组合电路
把门电路按一定规律加以组合，可以构成具有各种逻辑功能的逻辑电路。
它的输出状态只与当前的输入状态有关，与原输出状态无关。

=== 组合逻辑电路的分析
1. 根据已知逻辑电路图写出逻辑表达式;
2. 利用代数法化简为最简表达式;
3. 根据最简表达式列出逻辑状态表;
4. 根据逻辑状态表分析电路的功能。
#callouts.Question(title: [例4.4.1])[
  #grid(
    columns: (1fr, 1fr),
    [分析图示组合逻辑电路的功能。],
    [#figure()[
      #cetz.canvas({
        import cetz.draw: *
        nandGate((0, 0))
        nandGate((2, -1))
        nandGate((2, 1))
        nandGate((4, 0))

        line((-1.5, 0.2), (-0.3, 0.2))
        line((-1, 0.2), (-1, 1.2), (1.7, 1.2))
        line((0.5, 0), (1, 0), (1, 0.8), (1.7, 0.8))
        line((2.5, 1), (3, 1), (3, 0.2), (3.7, 0.2))

        line((-1.5, -0.2), (-0.3, -0.2))
        line((-1, -0.2), (-1, -1.2), (1.7, -1.2))
        line((0.5, 0), (1, 0), (1, -0.8), (1.7, -0.8))
        line((2.5, -1), (3, -1), (3, -0.2), (3.7, -0.2))

        line((4.5, 0), (5, 0))

        content((-1.8, 0.2), [A])
        content((-1.8, -0.2), [B])
        content((5.3, 0), [F])
      })
    ]],
  )
  【解】易知逻辑表达式 $F = overline(overline(overline(A B) A) " " overline(overline(A B) B))$, 化简得
  $
    F & = (overline(A)+overline(B))A + (overline(A)+overline(B))B \
      & = A overline(B) + overline(A)B
  $
  逻辑状态表可见@tbl:xorgate, 电路功能为异或门。

]
=== 组合逻辑电路的设计
1. 根据逻辑功能定义逻辑变量
2. 根据逻辑功能列出逻辑状态表
3. 根据逻辑状态表写出逻辑表达式
4. 利用代数法化简为最简表达式
5. 根据最简表达式画出逻辑电路图
#callouts.Tip(title: [利用反演律将逻辑表达式转换成与非-与非表达式])[
  $
    F & = A B + B C + A C \
      & = overline(overline(A B) " " overline(B C) " " overline(A C)) \
  $
]

#block(inset: 12pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb("#fbf2eb"))[
  典型的组合逻辑电路: #Red[加法器，编码器，译码器，数据选择器，数据分配器]
]
#pagebreak()

=== 加法器
算术运算的基本单元, 用于实现二进制数的加法运算。

==== 半加器
只求本位相加, 不计低位进位。
#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: horizon + center,
      fill: (_, y) => if (calc.even(y) and y > 1) { rgb("EAF2F5") },
      // stroke: frame(1pt + rgb("21222C")),
      stroke: (x, y) => (
        left: if x == 2 { 1pt } else { 0pt },
        right: 0pt,
        top: if (y <= 2 or y == 6) { 1pt } else { 0pt },
        bottom: if y == 4 { 1pt } else { 0pt },
      ),
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header([加数], [被加数], [和], [进位数]),
      [A], [B], [S], [C],
      [0], [0], [0], [0],
      [0], [1], [1], [0],
      [1], [0], [1], [0],
      [1], [1], [0], [1],
    ),
    caption: [半加器逻辑状态表],
  ),
  [
    S = A#overline(offset: -1em)[B] + #overline(offset: -1em)[A]B

    C = AB
    #v(1em)
    #figure(
      cetz.canvas({
        import cetz.draw: *
        rect((0, 0), (1.2, 1.6))

        line((-1, 0.4), (0, 0.4))
        line((-1, 1.2), (0, 1.2))
        line((1.2, 0.4), (2.2, 0.4))
        line((1.2, 1.2), (2.2, 1.2))

        content((-1.3, 1.2), [A])
        content((-1.3, 0.4), [B])
        content((2.5, 1.2), [S])
        content((2.5, 0.4), [C])

        content((0.6, 1.2), [$sum$])
        content((0.9, 0.4), text(0.7em)[$C O$])
      }),
      // caption: [TTL三态与非门图形符号],
    )
  ],
)

==== 全加器
考虑进位输入的加法器。
#grid(
  columns: (2fr, 1fr),
  align: center + horizon,
  figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      align: horizon + center,
      fill: (_, y) => if (calc.even(y) and y > 1) { rgb("EAF2F5") },
      // stroke: frame(1pt + rgb("21222C")),
      stroke: (x, y) => (
        left: if x == 3 { 1pt } else { 0pt },
        right: 0pt,
        top: if (y <= 2) { 1pt } else { 0pt },
        bottom: if y == 4 { 1pt } else { 0pt },
      ),
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header([加数], [被加数], [进位输入], [和], [进位输出]),
      [A], [B], [$C_(n-1)$], [S], [$C_(n)$],
      [0], [0], [0], [0], [0],
      [0], [0], [1], [1], [0],
      [0], [1], [0], [1], [0],
      [0], [1], [1], [0], [1],
      [1], [0], [0], [1], [0],
      [1], [0], [1], [0], [1],
      [1], [1], [0], [0], [1],
      [1], [1], [1], [1], [1],
    ),
  ),
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (1.5, 2))

      line((-1, 0.5), (0, 0.5))
      line((-1, 1), (0, 1))
      line((-1, 1.5), (0, 1.5))
      line((1.5, 0.5), (2.2, 0.5))
      line((1.5, 1.5), (2.2, 1.5))

      content((-1.4, 1.5), [$A_n$])
      content((-1.4, 1), [$B_n$])
      content((-1.5, 0.5), [$C_(n-1)$])
      content((2.5, 1.5), [$S_n$])
      content((2.5, 0.5), [$C_n$])

      content((0.75, 1.6), [$sum$])
      content((1.2, 0.5), text(0.7em)[$C O$])
      content((0.3, 0.5), text(0.7em)[$C I$])
    }),
    // caption: [TTL三态与非门图形符号],
  ),
)

=== 编码器、译码器和数字显示
编码就是用二进制代码来表示一个给定的十进制数或字符。完成这一功能的逻辑电路称为编码器。最常用的一种二-十进制编码是 8421 BCD 码, 编码规则如下:
$
  "十进制数" = D times 8 + C times 4 + B times 2 + A
$
译码是编码的逆过程，即是将代码所表示的信息翻译过来的过程。实现译码功能的电路称为译码器。

数字显示多用七段显示器, 由七个发光二极管组成, 通过组合逻辑电路实现十进制数到七段显示的译码功能。

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: horizon + center,
    fill: (x, y) => if (calc.even(y) and y > 1 and x > 0) { rgb("EAF2F5") } else if (x == 0 and y > 1) {
      rgb("fbf2eb")
    },
    // stroke: frame(1pt + rgb("21222C")),
    stroke: (x, y) => (
      left: if x == 1 { 1pt } else { 0pt },
      right: 0pt,
      top: if (y == 0 or y == 2 or (y == 1 and x != 0)) { 1pt } else { 0pt },
      bottom: if y == 4 { 1pt } else { 0pt },
    ),
    // column-gutter: 1em,
    inset: 0.6em,
    // column-gutter: 1em,
    table.header(move(dy: 1em)[十进制数], [], move(dx: 4em)[8421 BCD码], [], []),
    [], [D], [C], [B], [A],
    [0], [0], [0], [0], [0],
    [1], [0], [0], [0], [1],
    [2], [0], [0], [1], [0],
    [3], [0], [0], [1], [1],
    [4], [0], [1], [0], [0],
    [5], [0], [1], [0], [1],
    [6], [0], [1], [1], [0],
    [7], [0], [1], [1], [1],
    [8], [1], [0], [0], [0],
    [9], [1], [0], [0], [1],
  ),
  caption: [8421 BCD 编码表],
)
=== 数据选择器
从一组输入信号中选择一个输出的组合逻辑电路。若有N个地址输入, 则数据输入端最多可有$2^N$个, 输出端1个。

== 集成触发器
#block(inset: 12pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb("#fbf2eb"))[
  时序逻辑电路: 输出状态不仅与当前输入状态有关, 还与原输出状态有关。]

#block(inset: 12pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb("#fbf2eb"))[
  集成触发器: 构成时序逻辑电路的基本部件。
]
触发器具有 0 和 1两个稳定状态，在触发信号作用下，可以从原来的一种稳定状态转换到另一种稳定状态。触发信号撤除后, 稳定状态保持。
=== 基本RS触发器
RS触发器由两个与非门组成, 具有两个输入端R和S, 两个输出端Q和#overline(offset: -1em)[Q]。
#v(1em)
#grid(
  columns: (1fr, 1fr),
  rows: 2,
  row-gutter: 1em,
  align: center + horizon,
  cetz.canvas({
    import cetz.draw: *
    nandGate((0, 0))
    nandGate((0, 2))

    line((-1.3, -0.2), (-0.3, -0.2))
    line((-1.3, 2.2), (-0.3, 2.2))
    line((0.5, 0), (0.8, 0), (0.8, 0.4), (-0.8, 1.5), (-0.8, 1.8), (-0.3, 1.8))
    line((0.5, 2), (0.8, 2), (0.8, 1.6), (-0.8, 0.5), (-0.8, 0.2), (-0.3, 0.2))
    line((0.8, 0), (1.5, 0))
    line((0.8, 2), (1.5, 2))

    content((-1.6, -0.2), [#overline(offset: -1em)[R]])
    content((-1.6, 2.2), [#overline(offset: -1em)[S]])
    content((1.8, 2), [Q])
    content((1.8, 0), [#overline(offset: -1em)[Q]])
  }),
  cetz.canvas({
    import cetz.draw: *
    rect((0, 0), (1.2, 1.6))

    line((-1, 0.4), (-0.2, 0.4))
    line((-1, 1.2), (-0.2, 1.2))
    line((1.4, 0.4), (2.2, 0.4))
    line((1.2, 1.2), (2.2, 1.2))
    node((-0.1, 0.4), fill: none)
    node((-0.1, 1.2), fill: none)
    node((1.3, 0.4), fill: none)


    content((-1.3, 1.2), [#overline(offset: -1em)[S]])
    content((-1.3, 0.4), [#overline(offset: -1em)[R]])
    content((0.3, 1.2), [S])
    content((0.3, 0.4), [R])
    content((2.5, 1.2), [Q])
    content((2.5, 0.4), [#overline(offset: -1em)[Q]])
  }),

  [基本RS触发器], [基本RS触发器图形符号],
)

#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: horizon + center,
      fill: (x, y) => if (calc.odd(y)) { rgb("EAF2F5") },
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header(
        [#overline(offset: -1em)[S]], [#overline(offset: -1em)[R]], [$Q^(n+1)$], [功能],
        [0], [0], [不定], [],
        [0], [1], [1], [置1],
        [1], [0], [0], [置0],
        [1], [1], [$Q^n$], [保持],
      ),
    ),
    caption: [基本RS触发器的逻辑状态转换表],
  ),
  figure(
    cetz.canvas({
      import cetz.draw: *
      line((0, 0.7), (2, 0.7), (2, 0), (4, 0), (4, 0.7), (5, 0.7))
      line((0, 1), (2, 1), (2, 1.7), (5, 1.7))

      line((0, 3.7), (2, 3.7), (2, 3), (3, 3), (3, 3.7), (4, 3.7), (4, 3), (5, 3), (5, 3.7), (6, 3.7))
      line((0, 4), (1, 4), (1, 4.7), (4, 4.7), (4, 4), (5, 4), (5, 4.7), (6, 4.7))

      line((6, 0), (5, 0), (5, 0.7), (6, 0.7), stroke: (dash: "dashed"))
      line((6, 1), (5, 1), (5, 1.7), (6, 1.7), stroke: (dash: "dashed"))
      for i in (1, 2, 3, 4, 5) {
        line((i, 3.7), (i, -1), stroke: (dash: "dashed"))
      }

      content((0.5, -0.7), [置0])
      content((1.5, -0.7), [保持])
      content((2.5, -0.7), [置1])
      content((3.5, -0.7), [保持])
      content((4.5, -0.7), [避免])
      content((5.5, -0.7), [不定])
      content((-0.2, 0.3), [#overline[Q]])
      content((-0.2, 1.3), [Q])
      content((-0.2, 3.3), [#overline[S]])
      content((-0.2, 4.3), [#overline[R]])
    }),
    caption: [基本RS触发器的波形图],
  ),
)

=== 同步RS触发器
在数字系统中往往要求触发器的动作时刻和其他部件相一致，这就必须有一个同步信号, 以协调触发器和触发器、触发器和其他数字逻辑部件的动作。同步信号是一种脉冲信号, 通常称为时钟脉冲(CP)。

具有同步脉冲的触发器称为同步触发器。

#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (3, 2))
      node((0.3, -0.1), fill: none)
      node((2.7, -0.1), fill: none)
      line((0.3, -1), (0.3, -0.2))
      line((0.9, -1), (0.9, 0))
      line((1.5, -1), (1.5, 0))
      line((2.1, -1), (2.1, 0))
      line((2.7, -1), (2.7, -0.2))

      line((1, 2), (1, 3))
      line((2, 2.2), (2, 3))
      node((2, 2.1), fill: none)
      content((0.3, 0.3), [S])
      content((0.9, 0.3), [1S])
      content((1.5, 0.3), [C1])
      content((2.1, 0.3), [1R])
      content((2.7, 0.3), [R])
      content((0.3, -1.3), [$overline(S)_d$])
      content((0.9, -1.3), [S])
      content((1.5, -1.3), [CP])
      content((2.1, -1.3), [R])
      content((2.7, -1.3), [$overline(R)_d$])
      content((1, 3.3), [Q])
      content((2, 3.3), [#overline(offset: -1em)[Q]])
    }),
    caption: [同步RS触发器图形符号],
  ),
  figure(image("assets/同步RS触发器波形图.png", width: 80%), caption: [同步RS触发器波形图]),
)
#v(0.5em)

$overline(R)_d$和$overline(S)_d$是异步输入端, 其输入信号不受时钟脉冲的控制, 可直接使触发器置位或复位。当$overline(S)_d=0$和$overline(R)_d=1$时,Q=1, 直接置位; 当$overline(S)_d=1$和$overline(R)_d=0$时,Q=0, 直接复位; 不作用时$overline(S)_d=1$和$overline(R)_d=1$; 尽量避免$overline(S)_d$和$overline(R)_d$同时为0的情况。

=== D触发器
==== 同步D触发器(D锁存器)
#v(-1em)
#grid(
  columns: (1fr, 1fr),
  [
    #v(1.5em)
    同步D触发器又称为D锁存器, 当CP=1时,Q=D; 当CP=0时,Q保持不变。

    特性方程为:
    $
      Q^(n+1) = D
    $
  ],
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (3, 2))
      node((0.3, -0.1), fill: none)
      node((2.7, -0.1), fill: none)
      line((0.3, -1), (0.3, -0.2))
      line((1.1, -1), (1.1, 0))
      line((1.9, -1), (1.9, 0))
      line((2.7, -1), (2.7, -0.2))

      line((1, 2), (1, 3))
      line((2, 2.2), (2, 3))
      node((2, 2.1), fill: none)
      content((0.3, 0.3), [S])
      content((1.1, 0.3), [C1])
      content((1.9, 0.3), [1D])
      content((2.7, 0.3), [R])
      content((0.3, -1.3), [$overline(S)_d$])
      content((1.1, -1.3), [CP])
      content((1.9, -1.3), [D])
      content((2.7, -1.3), [$overline(R)_d$])
      content((1, 3.3), [Q])
      content((2, 3.3), [#overline(offset: -1em)[Q]])
    }),
    caption: [同步D触发器图形符号],
  ),
)
==== 正边沿触发的D触发器
在很多情况下(如计数), 要求对应于一个时钟脉冲触发器只能翻转一次。同时，为了提高触发器工作的可靠性, 增强抗干扰能力,可以采用边沿触发的触发器。

边沿触发使得触发器的次态仅由时钟脉冲的上升沿或下降沿来到时的输入信号决定，在此以前或以后输入信号的变化不会影响触发器的状态。
#grid(
  columns: (1fr, 0.7fr),
  align: center + horizon,
  [#figure(
      cetz.canvas({
        import cetz.draw: *
        let x(num) = 0.8 * num
        let y = 1
        for i in range(9) {
          line((x(i), 3.7), (x(i), 0), stroke: (dash: "dashed", paint: gray))
        }
        for i in range(1, 9, step: 2) {
          rect((x(i), 0), (x(i) + x(1), 3.7), fill: rgb(99, 211, 226, 70), stroke: none)
        }
        for i in range(4) {
          line(
            (0 + i * 2 * x(1), 3),
            (x(1) + i * 2 * x(1), 3),
            (x(1) + i * 2 * x(1), 3.7),
            (2 * x(1) + i * 2 * x(1), 3.7),
            (2 * x(1) + i * 2 * x(1), 3),
            (3 * x(1) + i * 2 * x(1), 3),
          )
        }

        line(
          (0, 2),
          (x(2.5), 2),
          (x(2.5), 2.7),
          (x(4.5), 2.7),
          (x(4.5), 2),
          (x(5.3), 2),
          (x(5.3), 2.7),
          (x(5.7), 2.7),
          (x(5.7), 2),
          (x(6.5), 2),
          (x(6.5), 2.7),
          (x(7.5), 2.7),
          (x(7.5), 2),
          (x(9), 2),
        )
        line(
          (0, 1),
          (x(3), 1),
          (x(3), 1.7),
          (x(5), 1.7),
          (x(5), 1),
          (x(5.3), 1),
          (x(5.3), 1.7),
          (x(5.7), 1.7),
          (x(5.7), 1),
          (x(7), 1),
          (x(7), 1.7),
          (x(7.5), 1.7),
          (x(7.5), 1),
          (x(9), 1),
        )
        line((0, 0), (x(3), 0), (x(3), 0.7), (x(5), 0.7), (x(5), 0), (x(7), 0), (x(7), 0.7), (x(9), 0.7))
        content((-0.5, 3.3), [CP])
        content((-0.5, 2.3), [D])
        content((-0.5, 1.3), [$Q$])
        content((-0.5, 0.3), [$Q'$])
      }),
    )
    #text(gray)[

      $Q$ 电平触发器输出波形

      $Q'$ 正边沿D锁存器输出波形
    ]
  ],
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (3, 2))
      node((0.3, -0.1), fill: none)
      node((2.7, -0.1), fill: none)
      line((0.3, -1), (0.3, -0.2))
      line((1.1, -1), (1.1, 0))
      line((1.9, -1), (1.9, 0))
      line((2.7, -1), (2.7, -0.2))

      line((1, 2), (1, 3))
      line((2, 2.2), (2, 3))
      node((2, 2.1), fill: none)
      content((0.3, 0.5), [S])
      content((1.1, 0.5), [C1])
      line((0.95, 0), (1.1, 0.2), (1.25, 0), stroke: (paint: red))
      content((1.9, 0.5), [1D])
      content((2.7, 0.5), [R])
      content((0.3, -1.3), [$overline(S)_d$])
      content((1.1, -1.3), [CP])
      content((1.9, -1.3), [D])
      content((2.7, -1.3), [$overline(R)_d$])
      content((1, 3.3), [Q])
      content((2, 3.3), [#overline(offset: -1em)[Q]])
    }),
    caption: [正边沿D触发器图形符号],
  ),
)

=== 负边沿触发的JK触发器

#grid(
  columns: (2fr, 1.4fr),
  gutter: 2em,
  align: horizon,
  figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: horizon + center,
      fill: (x, y) => if (calc.odd(y)) { rgb("EAF2F5") },
      // column-gutter: 1em,
      inset: 0.6em,
      // column-gutter: 1em,
      table.header(
        [J], [K], [$Q^(n+1)$], [功能],
        [0], [0], [$Q^n$], [保持],
        [0], [1], [0], [置0],
        [1], [0], [1], [置1],
        [1], [1], [$overline(Q^n)$], [取反],
      ),
    ),
    caption: [JK触发器的逻辑状态转换表],
  ),
  figure(
    cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (4, 2))
      node((0.4, -0.1), fill: none)
      node((3.6, -0.1), fill: none)
      node((2, -0.1), fill: none, color: red)

      line((0.4, -1), (0.4, -0.2))
      line((1.2, -1), (1.2, 0))
      line((2, -1), (2, -0.2))
      line((2.8, -1), (2.8, 0))
      line((3.6, -1), (3.6, -0.2))

      line((1, 2), (1, 2.7))
      line((3, 2.2), (3, 2.7))
      node((3, 2.1), fill: none)
      content((0.4, 0.5), [S])
      content((2, 0.5), [C1])
      line((1.85, 0), (2, 0.2), (2.15, 0), stroke: (paint: red))
      content((1.2, 0.5), [1J])
      content((2.8, 0.5), [1K])
      content((3.6, 0.5), [R])
      content((0.4, -1.3), [$overline(S)_d$])
      content((1.2, -1.3), [J])
      content((2, -1.3), [CP])
      content((2.8, -1.3), [K])
      content((3.6, -1.3), [$overline(R)_d$])
      content((1, 3), [Q])
      content((3, 3), [#overline(offset: -1em)[Q]])
    }),
    caption: [负边沿JK触发器],
  ),
)

#grid(
  columns: (2fr, 1.4fr),
  gutter: 2em,
  [特性方程:
    $
      Q^(n+1) = J overline(Q^n) + overline(K)Q^n
    $
    #figure(
      cetz.canvas({
        import cetz.draw: *
        let x(num) = 0.6 * num
        let y = 1
        for i in range(2, 13, step: 2) {
          line((x(i), 3.7), (x(i), -1), stroke: (dash: "dashed", paint: gray))
        }
        for i in range(2, 13, step: 2) {
          rect((x(i), -1), (x(i) + x(1), 3), fill: rgb(99, 211, 226, 70), stroke: none)
        }
        for i in range(6) {
          line(
            (0 + i * 2 * x(1), 3),
            (x(1) + i * 2 * x(1), 3),
            (x(1) + i * 2 * x(1), 3.7),
            (2 * x(1) + i * 2 * x(1), 3.7),
            (2 * x(1) + i * 2 * x(1), 3),
            (3 * x(1) + i * 2 * x(1), 3),
          )
        }
        line((0, 2), (x(0.5), 2), (x(0.5), 2.7), (x(3.5), 2.7), (x(3.5), 2), (x(6.5), 2), (x(6.5), 2.7), (x(13), 2.7))

        line((0, 1), (x(2.5), 1), (x(2.5), 1.7), (x(5.5), 1.7), (x(5.5), 1), (x(7), 1), (x(7), 1.7), (x(13), 1.7))

        line(
          (0, 0),
          (x(2), 0),
          (x(2), 0.7),
          (x(4), 0.7),
          (x(4), 0),
          (x(8), 0),
          (x(8), 0.7),
          (x(10), 0.7),
          (x(10), 0),
          (x(12), 0),
          (x(12), 0.7),
          (x(13), 0.7),
        )
        line(
          (0, -0.3),
          (x(2), -0.3),
          (x(2), -1),
          (x(4), -1),
          (x(4), -0.3),
          (x(8), -0.3),
          (x(8), -1),
          (x(10), -1),
          (x(10), -0.3),
          (x(12), -0.3),
          (x(12), -1),
          (x(13), -1),
        )
        content((-0.5, 3.3), [CP])
        content((-0.5, 2.3), [J])
        content((-0.5, 1.3), [K])
        content((-0.5, 0.3), [Q])
        content((-0.5, -0.7), [#overline(offset: -1em)[Q]])
      }),
      caption: [负边沿触发JK触发器波形图],
    )],
  callouts.Tip[
    注意正边沿触发和负边沿触发在符号上的区别。
  ],
)
// #block(inset: 12pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb("#fbf2eb"))[
//   #Red[时序逻辑必考一道大题]
// ]
=== T触发器
#grid(
  columns: (2fr, 1.4fr),
  gutter: 2em,
  [特性方程(分频,$2^n$次):
    $
      Q^(n+1) = T overline(Q^n) + overline(T)Q^n
    $
  ],
  [
    #v(-10em)
    #figure(
      cetz.canvas({
        import cetz.draw: *
        rect((0, 0), (4, 2))
        node((0.4, -0.1), fill: none)
        node((3.6, -0.1), fill: none)
        node((2, -0.1), fill: none, color: red)

        line((0.4, -1), (0.4, -0.2))
        line((1.2, -1), (1.2, 0))
        line((2, -1), (2, -0.2))
        line((1.2, -0.6), (2.8, -0.6), (2.8, 0))
        line((3.6, -1), (3.6, -0.2))

        line((1, 2), (1, 2.7))
        line((3, 2.2), (3, 2.7))
        node((3, 2.1), fill: none)
        content((0.4, 0.5), [S])
        content((2, 0.5), [C1])
        line((1.85, 0), (2, 0.2), (2.15, 0), stroke: (paint: red))
        content((1.2, 0.5), [1J])
        content((2.8, 0.5), [1K])
        content((3.6, 0.5), [R])
        content((0.4, -1.3), [$overline(S)_d$])
        content((1.2, -1.3), [T])
        content((2, -1.3), [CP])
        content((3.6, -1.3), [$overline(R)_d$])
        content((1, 3), [Q])
        content((3, 3), [#overline(offset: -1em)[Q]])
      }),
      caption: [T触发器图形符号],
    )],
)
== 时序逻辑电路
=== 时序逻辑电路的分析方法
1. 写出特性方程
2. 写出驱动方程  (触发器输入端表达式)
3. 把驱动方程代入特性方程, 得到状态方程
4. 列出状态转换表、波形图，判断时序逻辑电路的基本功能
#callouts.Question(title: [例 4.6.1])[
  分析下图所示时序逻辑电路的功能。
  #image("assets/例4.6.1.png", width: 80%)

  1. D触发器的特性方程为$Q^(n+1) = D$。
  2. 驱动方程
    #grid(
      columns: (1fr, 1fr),
      $
        D_A = M D_R + overline(M) Q_B^n \
        D_B = M Q_A^n + overline(M) Q_C^n
      $,
      $
        D_C = M Q_B^n + overline(M) Q_D^n \
        D_D = M Q_C^n + overline(M) D_L
      $,
    )
  3. 状态方程
    #grid(
      columns: (1fr, 1fr),
      $
        Q_A^(n+1) = M D_R + overline(M) Q_B^n \
        Q_B^(n+1) = M Q_A^n + overline(M) Q_C^n
      $,
      $
        Q_C^(n+1) = M Q_B^n + overline(M) Q_D^n \
        Q_D^(n+1) = M Q_C^n + overline(M) D_L
      $,
    )
  4. 分析发现, M=1时, 数码右移; M=0时, 数码左移。#Red[双向移位寄存器]
  // #image("assets/image.png", width: 80%)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    figure(
      table(
        columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        fill: rgb("EAF2F5"),
        align: horizon + center,
        stroke: (x, y) => (
          left: if (x == 1 or x == 5) { 1pt } else if (x > 1 and y > 0) { 1pt } else { 0pt },
          right: 0pt,
          top: if (y == 0 or y == 2 or (y == 1 and x != 0)) { 1pt } else { 0pt },
          bottom: if y == 5 { 1pt } else { 0pt },
        ),
        // column-gutter: 1em,
        inset: 0.6em,
        // column-gutter: 1em,
        table.header(move(dy: 1em)[$D_R$], [], [现], [态], [], [], [次], [态], []),
        [],
        text(0.7em)[$Q_A^(n)$],
        text(0.7em)[$Q_B^(n)$],
        text(0.7em)[$Q_C^(n)$],
        text(0.7em)[$Q_D^(n)$],
        text(0.7em)[$Q_A^(n+1)$],
        text(0.7em)[$Q_B^(n+1)$],
        text(0.7em)[$Q_C^(n+1)$],
        text(0.7em)[$Q_D^(n+1)$],

        [$D_0$], [1], [0], [1], [0], [$D_0$], [1], [0], [1],
        [$D_1$], [$D_0$], [1], [0], [1], [$D_1$], [$D_0$], [1], [0],
        [$D_2$], [$D_1$], [$D_0$], [1], [0], [$D_2$], [$D_1$], [$D_0$], [1],
        [$D_3$], [$D_2$], [$D_1$], [$D_0$], [1], [$D_3$], [$D_2$], [$D_1$], [$D_0$],
      ),
      caption: [M=1],
    ),
    figure(
      table(
        columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        fill: rgb("EAF2F5"),
        align: horizon + center,
        stroke: (x, y) => (
          left: if (x == 1 or x == 5) { 1pt } else if (x > 1 and y > 0) { 1pt } else { 0pt },
          right: 0pt,
          top: if (y == 0 or y == 2 or (y == 1 and x != 0)) { 1pt } else { 0pt },
          bottom: if y == 5 { 1pt } else { 0pt },
        ),
        // column-gutter: 1em,
        inset: 0.6em,
        // column-gutter: 1em,
        table.header(move(dy: 1em)[$D_L$], [], [现], [态], [], [], [次], [态], []),
        [],
        text(0.7em)[$Q_A^(n)$],
        text(0.7em)[$Q_B^(n)$],
        text(0.7em)[$Q_C^(n)$],
        text(0.7em)[$Q_D^(n)$],
        text(0.7em)[$Q_A^(n+1)$],
        text(0.7em)[$Q_B^(n+1)$],
        text(0.7em)[$Q_C^(n+1)$],
        text(0.7em)[$Q_D^(n+1)$],

        [$D_0$], [1], [0], [1], [0], [0], [1], [0], [$D_0$],
        [$D_1$], [0], [1], [0], [$D_0$], [1], [0], [$D_0$], [$D_1$],
        [$D_2$], [1], [0], [$D_0$], [$D_1$], [0], [$D_0$], [$D_1$], [$D_2$],
        [$D_3$], [0], [$D_0$], [$D_1$], [$D_2$], [$D_0$], [$D_1$], [$D_2$], [$D_3$],
      ),
      caption: [M=0],
    ),
  )
]<例4.6.1>

#callouts.Question(title: [例4.6.2])[
  #image("assets/例4.6.2.png")
  1. JK触发器的特性方程为$Q^(n+1) = J overline(Q^n) + overline(K)Q^n$。
  2. 驱动方程
    #grid(
      columns: (1fr, 1fr),
      $
        J_A & = 1 \
        J_B & = Q_A^n overline(Q)_D^n \
        J_C & = Q_A^n Q_B^n \
        J_D & = Q_A^n Q_B^n Q_C^n \
      $,
      $
        K_A & = 1 \
        K_B & = Q_A^n \
        K_C & = Q_A^n Q_B^n \
        K_D & = Q_A^n \
      $,
    )
  3. 状态方程
    $
      Q_A^(n+1) & = overline(Q_A^n) \
      Q_B^(n+1) & = Q_A^n overline(Q)_D^n overline(Q)_B^n + overline(Q_A^n) Q_B^n \
      Q_C^(n+1) & = Q_A^n Q_B^n overline(Q)_C^n + overline(Q_A^n Q_B^n) Q_C^n \
      Q_D^(n+1) & = Q_A^n Q_B^n Q_C^n overline(Q_D^n) + overline(Q_A^n) Q_D^n \
    $
  4. 状态转换表
  #figure(
    table(
      columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, auto),
      fill: rgb("EAF2F5"),
      align: horizon + center,
      stroke: (x, y) => (
        left: if (x == 1 or x == 5 or x == 9) { 1pt } else { 0pt },
        right: 0pt,
        top: if (y == 0 or y == 2 or y == 12 or (y == 1 and x != 0)) { 1pt } else { 0pt },
        bottom: if (y == 1 or y == 17) { 1pt } else { 0pt },
      ),
      // column-gutter: 1em,
      inset: 0.5em,
      // column-gutter: 1em,
      table.header(
        move(dy: 1em)[序号], [], [现], [态], [], [], [次], [态], [], [进位],
        [],
        text(0.7em)[$Q_A^(n)$],
        text(0.7em)[$Q_B^(n)$],
        text(0.7em)[$Q_C^(n)$],
        text(0.7em)[$Q_D^(n)$],
        text(0.7em)[$Q_A^(n+1)$],
        text(0.7em)[$Q_B^(n+1)$],
        text(0.7em)[$Q_C^(n+1)$],
        text(0.7em)[$Q_D^(n+1)$],
        [$C$],
      ),

      [0], [0], [0], [0], [0], [0], [0], [0], [1], [0],
      [1], [0], [0], [0], [1], [0], [0], [1], [0], [0],
      [2], [0], [0], [1], [0], [0], [0], [1], [0], [0],
      [3], [0], [0], [1], [1], [0], [1], [0], [1], [0],
      [4], [0], [1], [0], [0], [0], [1], [1], [1], [0],
      [5], [0], [1], [0], [1], [0], [1], [1], [1], [0],
      [6], [0], [1], [1], [0], [0], [1], [1], [1], [0],
      [7], [0], [1], [1], [1], [1], [0], [0], [0], [0],
      [8], [1], [0], [0], [0], [1], [0], [0], [1], [0],
      [9], [1], [0], [0], [1], [0], [0], [0], [0], [1],
      [10], [1], [0], [1], [0], [1], [0], [1], [1], [0],
      [11], [1], [0], [1], [1], [0], [1], [0], [0], [1],
      [12], [1], [1], [0], [0], [1], [1], [0], [1], [0],
      [13], [1], [1], [0], [1], [0], [1], [0], [0], [1],
      [14], [1], [1], [1], [0], [1], [1], [1], [1], [0],
      [15], [1], [1], [1], [1], [0], [0], [0], [0], [1],
    ),
    caption: [逻辑状态转换表],
  )

  5. 状态转换图
  #figure(
    cetz.canvas(length: 27pt, {
      import cetz.draw: *
      for x in range(5) {
        for y in (0, 4) {
          circle((x * 2, y), radius: 0.6)
        }
      }
      for x in (0, 6, 8) {
        circle((x, 2), radius: 0.6)
      }
      for x in (0, 2, 8) {
        circle((x, 6), radius: 0.6)
      }
      content((0, 0), [1000])
      arrow_I((0, 0.6), (0, 1.4))
      content((0, 2), [1001])
      arrow_I((0, 2.6), (0, 3.4))
      content((0, 4), [0000])
      content((2, 4), [0001])
      content((4, 4), [0010])
      content((6, 4), [0011])
      content((6, 2), [0100])
      content((6, 0), [0101])
      content((4, 0), [0110])
      content((2, 0), [0111])
      for x in (0.6, 2.6, 4.6) {
        arrow_I((x, 4), (x + 0.8, 4))
      }
      for x in (0.6, 2.6, 4.6) {
        arrow_I((x + 0.8, 0), (x, 0))
      }
      arrow_I((6, 3.4), (6, 2.6))
      arrow_I((6, 1.4), (6, 0.6))
      content((0, 6), [1111])
      arrow_I((0, 5.4), (0, 4.6))
      content((2, 6), [1110])
      arrow_I((1.4, 6), (0.6, 6))
      content((8, 6), [1010])
      arrow_I((8, 5.4), (8, 4.6))
      content((8, 4), [1011])
      arrow_I((rel: (-120deg, 0.6)), (rel: (-135deg, 1.7)))
      content((8, 2), [1101])
      arrow_I((7.4, 2), (6.6, 2))
      content((8, 0), [1100])
      arrow_I((8, 0.6), (8, 1.4))
    }),
    caption: [],
  )<例4.6.2>
  6. 波形图
  #figure(cetz.canvas({
    import cetz.draw: *
    let x(num) = 0.6 * num
    let y = 1
    for i in range(2, 22, step: 2) { line((x(i), 3.7), (x(i), -2), stroke: (dash: "dashed", paint: gray)) }
    for i in range(2, 22, step: 2) { rect((x(i), -2), (x(i) + x(1), 3), fill: rgb(99, 211, 226, 70), stroke: none) }
    for i in range(10) {
      line(
        (0 + i * 2 * x(1), 3),
        (x(1) + i * 2 * x(1), 3),
        (x(1) + i * 2 * x(1), 3.7),
        (2 * x(1) + i * 2 * x(1), 3.7),
        (2 * x(1) + i * 2 * x(1), 3),
        (3 * x(1) + i * 2 * x(1), 3),
      )
    }
    for i in range(5) {
      line(
        (0 + i * 4 * x(1), 2),
        (x(2) + i * 4 * x(1), 2),
        (x(2) + i * 4 * x(1), 2.7),
        (x(4) + i * 4 * x(1), 2.7),
        (x(4) + i * 4 * x(1), 2),
        //(x(6) + i * 4 * x(1), 2),
      )
    }
    line((), (x(21), 2))

    for i in range(2) {
      line(
        (0 + i * x(8), 1),
        (x(4) + i * x(8), 1),
        (x(4) + i * x(8), 1.7),
        (x(8) + i * x(8), 1.7),
        (x(8) + i * x(8), 1),
        //(x(6) + i * 4 * x(1), 1),
      )
    }
    line((), (x(21), 1))

    line((0, 0), (x(8), 0), (x(8), 0.7), (x(16), 0.7), (x(16), 0), (x(21), 0))

    line(
      (0, -1),
      (x(16), -1),
      (x(16), -0.3),
      (x(20), -0.3),
      (x(20), -1),
      (x(21), -1),
    )
    line(
      (0, -2),
      (x(18), -2),
      (x(18), -1.3),
      (x(20), -1.3),
      (x(20), -2),
      (x(21), -2),
    )
    content((-0.5, 3.3), [CP])
    content((-0.5, 2.3), [$Q_A$])
    content((-0.5, 1.3), [$Q_B$])
    content((-0.5, 0.3), [$Q_C$])
    content((-0.5, -0.7), [$Q_D$])
    content((-0.5, -1.7), [C])
  }))
  显然这是一个同步十进制加法计数器
]
=== 寄存器

由N个触发器组成, 用于存储N位二进制信息。

==== 数码寄存器
所有触发器由相同 CP 控制，触发器状态允许翻转时，输入端的N位数据进入输出端
==== 移位寄存器
移位脉冲作用下，寄存器内的 1 和 0 向特定方向移位（移位方向有单向/双向）。如#link(<例4.6.1>)[例 4.6.1] 所示。

- 串行：数据按照位次依次从一个端输入或输出
- 并行：数据从多个端同时输入或输出

=== 计数器
- 通过N个输出的组合表示对脉冲个数进行计数

- M进制计数器需要N个触发器，其中 M < 2N

- 设计时序电路使得电路在M个状态(有效状态)间循环, 其它状态(无效状态)不在循环内。如果从任意一个状态启动, 最后都能进入有效状态循环, 则称计数器是可以#Red[自启动]的。如@fig:例4.6.2 所示的计数器就是一个自启动的十进制计数器。

- 或改造 N 位二进制计数器, 使得电路出现无效状态时通过外电路瞬间切换回第1个状态。
#pagebreak()
