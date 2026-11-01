#import "utils.typ": Red, zebra
#import "Callouts.typ" as callouts

#show table: set par(justify: false)

= 第二题：二阶系统时域指标

== 题型
15 分，两种考法轮流出现：
- *正向*：给开环传递函数，求 $t_r$、$t_p$、$t_s$、$M_p$，或分析参数的影响（25-26、23-24）；
- *反向*：给响应曲线，反求系统参数（24-25、22-23）。

== 历年真题
#callouts.Question(title: [25-26 秋第二题])[
  (1) 单位负反馈系统开环 $G(s) = display(1/(s(s+1)))$，求阶跃响应的 $t_r$、$t_p$、$t_s$（5%）和 $M_p$。\
  (2) 若开环为 $G(s) = display(K/(s(s+1)))$，分析 $K$ 对动态性能的影响。
]
#callouts.Tip(title: [思路提示])[
  先求闭环，再和 $s^2 + 2 zeta omega_n s + omega_n^2$ 对比。第 (2) 问把 $zeta$、$omega_n$、$zeta omega_n$ 都写成 $K$ 的函数，逐个指标讨论，别忘了 $zeta >= 1$ 的情况。
]

#callouts.Question(title: [24-25 秋第二题])[
  给下左图的系统施加 330 N 的阶跃力，$x_o (t)$ 的响应如下右图。\
  (1) 求 $M$、$k$、$D$；(2) 求 $t_r$ 与 $t_s$。
  #figure(image("历年卷/22-25秋回忆卷/T2.png", width: 85%), caption: [24-25 秋第二题])
]
#callouts.Tip(title: [思路提示])[
  终值定理求 $k$；$M_p = 3.26 \/ 20$ 求 $zeta$；$t_p$ 求 $omega_n$；最后和 $display(1/(M s^2 + D s + k))$ 对比求 $M$、$D$。
]

#callouts.Question(title: [23-24 秋、22-23 秋第二题（仅考点）])[
  23-24：给单位反馈开环传递函数，求 $t_r$、$t_p$、$t_s$、$M_p$；画出二阶欠阻尼阶跃响应并在图上标出这些量。\
  22-23：给二阶模型和响应曲线，已知超调量、上升时间、稳态值，求系数。
]
#callouts.Tip(title: [思路提示])[
  23-24 的图照 @fig-indices 画。22-23 用 $M_p$ 求 $zeta$、$t_r$ 求 $omega_d$、终值定理求增益，三个方程解三个未知数。
]

== 必备知识
=== 标准形式
$ Phi(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2), quad s_(1,2) = -zeta omega_n plus.minus j omega_d, quad omega_d = omega_n sqrt(1 - zeta^2) $

单位负反馈、开环 $display(K/(s(T s + 1)))$ 时，闭环为
$ Phi(s) = (K\/T)/(s^2 + s\/T + K\/T), quad omega_n = sqrt(K/T), quad zeta = 1/(2 sqrt(K T)) $

=== 阻尼比与响应形式
#figure(caption: [阻尼比与单位阶跃响应])[
  #table(
    columns: (auto, auto, auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([状态], [$zeta$], [特征根], [单位阶跃响应]),
    [无阻尼], [$zeta = 0$], [一对纯虚根], [等幅振荡],
    [欠阻尼], [$0 < zeta < 1$], [一对共轭复根], [衰减振荡],
    [临界阻尼], [$zeta = 1$], [两个相等负实根], [单调上升，无超调],
    [过阻尼], [$zeta > 1$], [两个不等负实根], [单调上升，更慢],
  )
]

#figure(
  image("assets/step_zeta.svg", width: 80%),
  caption: [不同阻尼比的单位阶跃响应],
)

=== 性能指标
#figure(
  image("assets/step_indices.svg", width: 80%),
  caption: [阶跃响应的性能指标（图中 $zeta = 0.4$）],
) <fig-indices>

#figure(caption: [欠阻尼二阶系统的性能指标])[
  #table(
    columns: (auto, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.8em,
    table.header([指标], [定义], [公式]),
    [上升时间 $t_r$], [第一次到达稳态值], [$display(t_r = (pi - arccos zeta)/omega_d)$],
    [峰值时间 $t_p$], [到达第一个峰值], [$display(t_p = pi/omega_d)$],
    [最大超调量 $M_p$], [$display((x_o (t_p) - x_o (oo))/(x_o (oo)))$], [$display(M_p = e^(-zeta pi \/ sqrt(1-zeta^2)))$],
    [调整时间 $t_s$], [进入并保持在误差带内], [$display(3/(zeta omega_n))$（5%），$display(4/(zeta omega_n))$（2%）],
  )
]

- $M_p$ 只取决于 $zeta$；$t_s$ 只取决于极点实部 $zeta omega_n$；$t_p$ 只取决于极点虚部 $omega_d$。
- 由 $M_p$ 反求：$zeta = display((abs(ln M_p))/sqrt(pi^2 + (ln M_p)^2))$。

#figure(caption: [常用阻尼比对应的超调量])[
  #table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.6em,
    table.header([$zeta$], [0.3], [0.4], [0.5], [0.6], [0.707], [0.8]),
    [$M_p$], [37.2%], [25.4%], [16.3%], [9.5%], [4.3%], [1.5%],
  )
]

=== 开环增益的影响
开环 $display(K/(s(T s+1)))$，$K$ 增大时：
#figure(caption: [$K$ 增大时的变化])[
  #table(
    columns: (1fr, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([量], [变化], [原因]),
    [$zeta$], [减小], [$zeta prop 1 \/ sqrt(K)$],
    [$M_p$], [增大], [$zeta$ 减小],
    [$t_r$、$t_p$], [减小], [$omega_d$ 增大],
    [$t_s$], [基本不变], [$zeta omega_n = 1 \/ (2T)$ 与 $K$ 无关],
    [斜坡稳态误差], [减小], [$e_(s s) = 1 \/ K$],
  )
]
$K <= 1\/(4T)$ 时 $zeta >= 1$，没有超调。

== 解题模板
*正向*：
1. 求闭环传递函数，$s^2$ 系数化成 1。
2. 对比标准形式求 $zeta$、$omega_n$，算出 $omega_d$、$zeta omega_n$、$arccos zeta$。
3. 代公式，写明误差带。

*反向*：
1. 终值定理求增益（或刚度）：$x_o (oo) = A dot G(0)$。
2. $M_p$（相对量）→ $zeta$。
3. $t_p$ 或 $t_r$ → $omega_d$ → $omega_n$。
4. 与传递函数各项系数对比，求物理参数。

== 易错点
#callouts.Warning[
  - $M_p$ 是相对稳态值的比例。图上标的超调如果是绝对量，要先除以稳态值。
  - 分子不一定是 $omega_n^2$，稳态值不一定是 1，要用终值定理。
  - 题目没说误差带时默认 5%，答题时写明。
  - "分析 $K$ 的影响"要分欠阻尼和过阻尼两种情况。
]

== 真题解答
=== 25-26 秋 <a2-2526>
*(1)* 闭环 $Phi(s) = display(1/(s^2 + s + 1))$，$omega_n = 1$，$zeta = 0.5$，$omega_d = 0.866$。
$ t_r = (pi - pi\/3)/0.866 = 2.42 "s", quad t_p = pi/0.866 = 3.63 "s", quad t_s = 3/0.5 = 6 "s", quad M_p = 16.3% $

*(2)* 闭环 $Phi(s) = display(K/(s^2 + s + K))$，$omega_n = sqrt(K)$，$zeta = display(1/(2 sqrt(K)))$，$zeta omega_n = 0.5$。
- $K > 0.25$（欠阻尼）：$K$ 越大，$zeta$ 越小，$M_p$ 越大；$omega_d = sqrt(K - 0.25)$ 增大，$t_r$、$t_p$ 减小；$t_s approx 6 "s"$ 基本不变。
- $K = 0.25$：临界阻尼；$0 < K < 0.25$：过阻尼，没有超调，$K$ 越小响应越慢。

=== 24-25 秋 <a2-2425>
*(1)* $G(s) = display(1/(M s^2 + D s + k))$。
- 终值定理：$x_o (oo) = 330\/k = 20$，$k = 16.5$。
- $M_p = 3.26\/20 = 0.163$，$zeta = 0.5$。
- $t_p = pi\/omega_d = 2$，$omega_d = 1.571$，$omega_n = 1.814 "rad/s"$。
- $M = k\/omega_n^2 = 5.02$，$D = 2 zeta omega_n M = 9.10$。

*(2)* $t_r = display((2pi\/3)/1.571) = 1.33 "s"$；$t_s = 3\/(zeta omega_n) = 3.31 "s"$（5%）或 $4.41 "s"$（2%）。

图上没有标 $x_o$ 的单位，$k$、$M$、$D$ 的单位跟着 $x_o$ 走。
