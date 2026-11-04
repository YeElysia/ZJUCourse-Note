#import "utils.typ": Red, zebra
#import "Callouts.typ" as callouts
#import "models.typ": two_mass
#import "@preview/cetz:0.5.3"

#show table: set par(justify: false)

= 第一题：机械系统建模

== 题型
15 分，三问固定：列微分方程、画方块图、求传递函数。

#figure(caption: [第一题历年考法])[
  #table(
    columns: (auto, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([年份], [系统], [难点]),
    [25-26], [双小车，输出 $m_2$ 的位移], [没有弹簧接墙，分母多一个 $s$],
    [24-25], [双质量块，输出 $M_1$ 的位移], [求的是 $Y_1$ 不是 $Y_2$],
    [23-24], [类似课本习题 2-19], [—],
    [22-23], [一维单质量块], [—],
  )
]

== 历年真题
#callouts.Question(title: [25-26 秋第一题])[
  如图，$m_1$、$m_2$ 为物块质量，$k$ 为弹簧刚度，$mu$ 为阻尼系数。输入为力 $f_i (t)$，输出为位移 $x_o (t)$，忽略地面摩擦。
  (1) 列出微分方程；(2) 画出方块图；(3) 求传递函数。
  #figure(image("历年卷/25-26秋回忆卷/T1.png", width: 60%), caption: [25-26 秋第一题])
]
#callouts.Tip(title: [思路提示])[
  先看每个质量块连着什么：$m_1$ 只连 $m_2$，$m_2$ 还经阻尼器连墙。按 @sec-twomass 写成 $A X_1 - B X_o = F$、$-B X_1 + C X_o = 0$，答案就是 $B \/ (A C - B^2)$。
]

解:
(1) 设 $m_1$ 的位移为 $x_1$，$m_2$ 的位移为 $x_o$，正方向向右。对两个质量块写牛顿第二定律：
$
  m_1 dot.double(x)_1 & = f_i - k(x_1 - x_o) - mu(dot(x)_1 - dot(x)_o) \
  m_2 dot.double(x)_o & = k(x_1 - x_o) + mu(dot(x)_1 - dot(x)_o) - mu dot(x)_o
$

(2).  方块图的基本思路是, 输入量经过传递函数$G(x)$得到输出量。

以$X_o$、$X_1$为例, 对(1)式做拉普拉斯变换, 得到
$
  (m_1 s^2 + mu s + k) X_1 - (mu s + k) X_o = F_i \
  -(mu s + k) X_1 + (m_2 s^2 + 2 mu s + k) X_o = 0
$

得到 $X_o = display((mu s + k )/(m_2 s^2 + 2 mu s+ k)) X_1$ , 即
#align(center)[#cetz.canvas({
  import cetz.draw: *

  line((-1, 0.6), (0, 0.6), stroke: 0.7pt, mark: (end: ">", fill: black, stroke: 1.2pt))
  content((-0.5, 1), [$X_1$])

  rect((0, 0), (4, 1.2), stroke: 0.7pt, fill: rgb("EAF2F5"))
  content((2, 0.6))[$display((mu s + k )/(m_2 s^2 + 2 mu s+ k))$]

  line((4, 0.6), (5, 0.6), stroke: 0.7pt, mark: (end: ">", fill: black, stroke: 1.2pt))
  content((4.5, 1), [$X_o$])
})]
同理, 由$X_1 = display(1/(m_1 s^2 + mu s + k)) (F_i + (mu s + k)X_o)$ , 给上图加入反馈输入
#align(center)[#cetz.canvas({
  import cetz.draw: *

  line((-1, 0.6), (0, 0.6), stroke: 0.7pt, mark: (end: ">", fill: black, stroke: 1.2pt))
  content((-0.5, 1), [$X_1$])

  rect((0, 0), (4, 1.2), stroke: 0.7pt, fill: rgb("EAF2F5"))
  content((2, 0.6))[$display((mu s + k )/(m_2 s^2 + 2 mu s+ k))$]

  line((4, 0.6), (5, 0.6), stroke: 0.7pt, mark: (end: ">", fill: black, stroke: 1.2pt))
  content((4.5, 1), [$X_o$])

  rect((-5, 0), (-1, 1.2), stroke: 0.7pt, fill: rgb("EAF2F5"))
  content((-3, 0.6))[$display((1)/(m_1 s^2 + mu s+ k))$]

  line((-6, 0.6), (-5, 0.6), stroke: 0.7pt, mark: (end: ">", fill: black, stroke: 1.2pt))

  circle((-6.3, 0.6), radius: 0.3)
  line((-6.3, 0.6), (rel: (45deg, 0.3)))
  line((-6.3, 0.6), (rel: (135deg, 0.3)))
  line((-6.3, 0.6), (rel: (-45deg, 0.3)))
  line((-6.3, 0.6), (rel: (-135deg, 0.3)))

  line((-7.6, 0.6), (-6.6, 0.6), stroke: 0.7pt, mark: (end: ">", fill: black, stroke: 1.2pt))
  content((-7.1, 1), [$F_i$])

  rect((-2.5, -1.5), (-0.5, -0.3), fill: rgb("EAF2F5"))
  content((-1.5, -0.9), [$mu s+ k$])
  line((4.5, 0.6), (4.5, -0.9), (-0.5, -0.9))
  line((-2.5, -0.9), (-6.3, -0.9), (-6.3, 0.3), mark: (end: ">", fill: black, stroke: 1.2pt))
})]

#Red[当然这是纯代数解法, 实际上呢, 双方块图我们有通用解法🤓👆, 诶嘿, 参考 @sec-twomass 可以写出]

#figure(
  two_mass($ (1)/(m_1s^2) $, $mu s + k$, $ 1/(m_2 s^2 + mu s) $, $F_i$, $X_1$, $X_o$),
  caption: [25-26 秋第一题方块图],
)

可以发现他们是等价的。具体解释可以看后面。

(3)
$
  X_o / F_i = display((mu s +k)/((m_2 s^2 + 2 mu s + k)(m_2 s^2 + mu s + k)))/(1 - display((mu s + k)/((m_2 s^2 + 2 mu s + k)(m_2 s^2 + mu s + k))) (mu s + k))
$
或者
$
  X_o / F_i = display(1/(m_1 s^2) (mu s +k)/(1 + (mu s + k)/(m_2 s^2 + mu s)) 1/(m_2 s^2 + mu s))/(1 + (display(1/(m_1 s^2) (mu s +k)/(1 + (mu s + k)/(m_2 s^2 + mu s)) 1/(m_2 s^2 + mu s))) (m_2 s^2 + mu s))
$
或者
$
  X_o / F_i = B/(A C - B^2) = (mu s + k)/(s [m_1 m_2 s^3 + mu(2 m_1 + m_2) s^2 + ((m_1 + m_2) k + mu^2) s + mu k])
$

#callouts.Question(title: [24-25 秋第一题])[
  如图，$k_1$、$k_2$ 为弹簧刚度，$mu$ 为阻尼系数。
  (1) 列出运动微分方程；(2) 画出方块图；(3) 求 $Y_1(s) \/ F_i (s)$。
  #figure(image("历年卷/22-25秋回忆卷/T1.png", width: 60%), caption: [24-25 秋第一题])
]
#callouts.Tip(title: [思路提示])[
  方法同上，注意 $k_1$ 把 $M_1$ 接到墙上。题目要的是 $Y_1$，分子是 $C$。
]

解:
(1)
$
  M_1 dot.double(y)_1 & = f_i - k_1 y_1 - mu(dot(y)_1 - dot(y)_2) - k_2 (y_1 - y_2) \
  M_2 dot.double(y)_2 & = mu(dot(y)_1 - dot(y)_2) + k_2 (y_1 - y_2) - mu dot(y_2)
$
(2)
$
  M_1 s^2 y_1 & = f_i - k_1 y_1 - (mu s + k)(y_1 - y_2) \
          f_i & = (M_1 s^2 + mu +2k) y_1 - (mu s + k) y_2 \
  M_2 s^2 y_2 & = (mu s + k_2)(y_1 - y_2) - mu s y_2 \
            0 & =
$

$A =$
#figure(
  two_mass($ 1/(M_1 s^2 + k_1) $, $mu s + k_2$, $ 1/(M_2 s^2 + mu s) $, $F_i$, $Y_1$, $Y_2$),
  caption: [24-25 秋第一题方块图],
)


#callouts.Question(title: [23-24 秋、22-23 秋第一题（仅考点）])[
  23-24：类似课本习题 2-19，写微分方程、方块图、传递函数。\
  22-23：一维阻尼系统，求运动方程、方块图、传递函数。
]
#callouts.Tip(title: [思路提示])[
  单质量块经弹簧、阻尼器接墙时，传递函数就是 $display(1/(M s^2 + mu s + k))$（@sec-ground）。
]

== 必备知识
=== 传递函数
#Red[零初始条件]下，输出的 Laplace 变换与输入的 Laplace 变换之比。建模时只需要微分性质：零初始条件下 $L[f^((n))(t)] = s^n F(s)$，即把 $dot(x)$ 换成 $s X$，$dot.double(x)$ 换成 $s^2 X$。

=== 机械元件
#figure(caption: [机械元件])[
  #table(
    columns: (auto, auto, auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([元件], [时域关系], [方块], [信号转换]),
    [质量 $M$], [$F = M dot.double(x)$], [$display(1/(M s^2))$], [合力 → 位移],
    [弹簧 $k$], [$F = k Delta x$], [$k$], [位移差 → 力],
    [阻尼器 $mu$], [$F = mu Delta dot(x)$], [$mu s$], [位移差 → 力],
  )
]

=== 接地单元 <sec-ground>
质量块 $M$ 经弹簧 $k$、阻尼器 $mu$ 连到墙上时，三者合成一个方块，输入是作用在 $M$ 上的力，输出是 $M$ 的位移：
$ 1/(M s^2 + mu s + k) $
只接阻尼器到墙时是 $display(1/(M s^2 + mu s))$；不接任何东西时是 $display(1/(M s^2))$。

=== 方块图化简
#figure(caption: [方块图的基本连接])[
  #table(
    columns: (1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([连接方式], [等效传递函数]),
    [串联], [$G_1 G_2$],
    [并联], [$G_1 plus.minus G_2$],
    [负反馈], [$display(G/(1 + G H))$],
    [正反馈], [$display(G/(1 - G H))$],
  )
]

#figure(caption: [比较点与引出点的移动])[
  #table(
    columns: (1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([变换], [被移动支路的处理]),
    [引出点前移（越过 $G$）], [支路乘 $G$],
    [引出点后移（越过 $G$）], [支路乘 $1 \/ G$],
    [比较点前移（越过 $G$）], [支路乘 $1 \/ G$],
    [比较点后移（越过 $G$）], [支路乘 $G$],
  )
]

移动时保持#Red[前向通路的乘积不变]、#Red[每个回路的乘积不变]。比较点和引出点之间不能直接交换。

=== 梅森公式
$ T = (sum_k P_k Delta_k)/Delta, quad Delta = 1 - sum L_a + sum L_b L_c - dots.c $
- $P_k$：第 $k$ 条前向通路的增益；
- $L_a$：各回路增益（负反馈回路带负号）；
- $sum L_b L_c$：两两#Red[不接触]回路增益乘积之和；
- $Delta_k$：从 $Delta$ 中去掉与第 $k$ 条前向通路接触的回路。

不论输入、输出选在哪里，$Delta$ 都相同，所以同一系统各传递函数#Red[分母一样]。

=== 双质量块的通用解法 <sec-twomass>
两个质量块之间用弹簧、阻尼器连接时，Laplace 变换后的方程总能写成
$ cases(A Y_1 - B Y_2 = F, -B Y_1 + C Y_2 = 0) $
- $A$：质量块 1 自己的全部阻抗（$M_1 s^2$ 加上它连着的所有弹簧、阻尼器）；
- $C$：质量块 2 自己的全部阻抗；
- $B$：两块之间的耦合阻抗（中间的弹簧、阻尼器）。

由 Cramer 法则：
$ Y_1/F = C/(A C - B^2), quad Y_2/F = B/(A C - B^2) $
#Red[分母相同，分子随输出改变]（作业 2-15 的规律）。

方块图如下，$A' = A - B$、$C' = C - B$ 是去掉耦合项后的接地单元。

#figure(
  two_mass($display(1/A')$, $B$, $display(1/C')$, $F$, $Y_1$, $Y_2$),
  caption: [双质量块系统的通用方块图],
)

用梅森公式验证：回路 $-B\/A'$ 和 $-B\/C'$ 都经过 $B$，互相接触。$F$ 到 $Y_1$ 的通路只经过 $1\/A'$，不接触回路 $-B\/C'$：
$ Y_1/F = (1/A' (1 + B/C'))/(1 + B/A' + B/C') = C/(A C - B^2) $

== 解题模板
1. 设各质量块的位移，标出正方向。
2. 对每个质量块写牛顿第二定律：$M dot.double(x) =$ 外力 $-$ 弹簧力 $-$ 阻尼力。弹簧力、阻尼力取决于两端的#Red[位移差]。
3. 零初始条件下取 Laplace 变换，整理成 $A$、$B$、$C$ 的形式。
4. 方块图：每个质量块画一个接地单元，中间的耦合环节 $B$ 把位移差变成力，分别负反馈到两个质量块。
5. 用 Cramer 法则或梅森公式求传递函数，分母按 $s$ 降幂展开。

== 易错点
#callouts.Warning[
  - 题目问的是哪个位移的传递函数。24-25 秋求 $Y_1$，很多人写成了 $Y_2$。
  - 两块之间的阻尼器在 $A$、$C$ 中都要出现；连墙的阻尼器只出现在它连着的那一块里。
  - 没有弹簧接墙时（25-26 秋），分母可以提出一个 $s$，不要以为算错了。
  - 位移差的符号：对质量块 1 是 $x_1 - x_2$，对质量块 2 是 $x_2 - x_1$。
]

== 真题解答
=== 25-26 秋 <a1-2526>
*(1)* 设 $m_1$ 的位移为 $x_1$。
$
  cases(
    m_1 dot.double(x)_1 = f_i - k(x_1 - x_o) - mu(dot(x)_1 - dot(x)_o),
    m_2 dot.double(x)_o = k(x_1 - x_o) + mu(dot(x)_1 - dot(x)_o) - mu dot(x)_o
  )
$

*(2)* $m_1$ 不接地，单元为 $1\/(m_1 s^2)$；$m_2$ 经阻尼器接地，单元为 $1\/(m_2 s^2 + mu s)$；耦合环节为 $mu s + k$。

#figure(
  two_mass($display(1/(m_1 s^2))$, $mu s + k$, $display(1/(m_2 s^2 + mu s))$, $F_i$, $X_1$, $X_o$),
  caption: [25-26 秋第一题方块图],
)

*(3)* $A = m_1 s^2 + mu s + k$，$B = mu s + k$，$C = m_2 s^2 + 2 mu s + k$，
$ X_o/F_i = B/(A C - B^2) = (mu s + k)/(s [m_1 m_2 s^3 + mu(2 m_1 + m_2) s^2 + ((m_1 + m_2) k + mu^2) s + mu k]) $

分母多出一个 $s$，是因为没有弹簧把系统连到墙上，系统在恒力作用下会一直漂移。

=== 24-25 秋 <a1-2425>
$k_1$ 接墙和 $M_1$；$k_2$、$mu$ 接在 $M_1$ 与 $M_2$ 之间；另一个 $mu$ 接 $M_2$ 和墙。

*(1)*
$
  cases(
    M_1 dot.double(y)_1 = f_i - k_1 y_1 - k_2(y_1 - y_2) - mu(dot(y)_1 - dot(y)_2),
    M_2 dot.double(y)_2 = k_2(y_1 - y_2) + mu(dot(y)_1 - dot(y)_2) - mu dot(y)_2
  )
$

*(2)*
#figure(
  two_mass($display(1/(M_1 s^2 + k_1))$, $mu s + k_2$, $display(1/(M_2 s^2 + mu s))$, $F_i$, $Y_1$, $Y_2$),
  caption: [24-25 秋第一题方块图],
)

*(3)* $A = M_1 s^2 + mu s + k_1 + k_2$，$B = mu s + k_2$，$C = M_2 s^2 + 2 mu s + k_2$，
$ Y_1/F_i = C/(A C - B^2) = (M_2 s^2 + 2 mu s + k_2)/(Delta(s)) $
其中
$
  Delta(s) = M_1 M_2 s^4 + mu(2 M_1 + M_2) s^3 + (M_1 k_2 + M_2 k_1 + M_2 k_2 + mu^2) s^2 + mu(2 k_1 + k_2) s + k_1 k_2
$
