#import "utils.typ": Red, zebra
#import "Callouts.typ" as callouts

#show table: set par(justify: false)

= 第四题：Nyquist 判据

== 题型
15 分。画开环 Nyquist 图，用 Nyquist 判据判断闭环稳定性或求参数范围。每年都会加一个"不常规"的地方：

#figure(caption: [第四题历年考法])[
  #table(
    columns: (auto, auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([年份], [开环传递函数], [特点]),
    [25-26], [$display(K/(s(s+1)(s+2)))$], [常规，按 $K$ 讨论],
    [24-25], [$display(K/(s(s+2)(s+3)))$], [常规，求 $K$ 范围],
    [23-24], [$display((-1)/(s^2 + A s + B))$], [增益为负],
    [22-23], [$display((K(s+2))/(s(s-2)))$], [开环不稳定，$P = 1$],
  )
]

== 历年真题
#callouts.Question(title: [25-26 秋第四题])[
  单位负反馈，$G(s) = display(K/(s(s+1)(s+2)))$，$K > 0$。画 Nyquist 图，根据 $K$ 的取值讨论闭环稳定性。
]
#callouts.Question(title: [24-25 秋第四题])[
  单位反馈，$G(s) = display(K/(s(s+2)(s+3)))$。用 Nyquist 判据求稳定时 $K$ 的范围。
]
#callouts.Tip(title: [思路提示（上面两题）])[
  $P = 0$，Ⅰ型。令 $angle G = -180°$ 求 $omega_g$，再算 $abs(G(j omega_g))$ 与 1 比较。
]

#callouts.Question(title: [23-24 秋第四题])[
  单位反馈，$G(s) = display((-1)/(s^2 + A s + B))$，$A, B > 0$。画 Nyquist 图并判断闭环稳定性。
]
#callouts.Tip(title: [思路提示])[
  负号让相角整体加 $180°$，起点 $-1\/B$ 在负实轴上。按 $B$ 与 1 的大小分情况，起点在 $(-1, 0)$ 左侧时记半次穿越。
]

#callouts.Question(title: [22-23 秋第四题])[
  单位反馈，$G(s) = display((K(s+2))/(s(s-2)))$，$K > 0$。画 Nyquist 图并判断闭环稳定性。
]
#callouts.Tip(title: [思路提示])[
  极点 2 在右半平面，$P = 1$。虚线圆弧的起始方向由 $s -> 0$ 时 $G approx -K\/s$ 决定，从负实轴出发。
]

== 必备知识
=== 画 Nyquist 图
Nyquist 图是 $omega$ 从 $0$ 到 $+oo$ 时 $G(j omega)$ 在复平面上的轨迹。
1. 写出 $A(omega) = abs(G(j omega))$ 和 $phi(omega) = angle G(j omega)$。
2. 起点 $omega -> 0^+$ 和终点 $omega -> +oo$（见下表）。
3. 与负实轴的交点：令 $phi = -180°$ 求 $omega_g$，再算 $A(omega_g)$。

#callouts.Tip(title: [求 $omega_g$ 的小技巧])[
  Ⅰ型系统带两个惯性环节时，$phi = -180°$ 等价于 $arctan(omega\/a) + arctan(omega\/b) = 90°$。两角互余，正切互为倒数：$(omega\/a)(omega\/b) = 1$，所以 #Red[$omega_g = sqrt(a b)$]。25-26 秋 $omega_g = sqrt(1 times 2)$，24-25 秋 $omega_g = sqrt(2 times 3)$。
]
4. 有积分环节时补画虚线圆弧。
5. 光滑连线，标 $omega$ 增大的方向。

#figure(caption: [起点和终点（$K > 0$ 的最小相位系统，$n > m$）])[
  #table(
    columns: (auto, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([型别 $v$], [起点 $omega -> 0^+$], [终点 $omega -> +oo$]),
    [0], [正实轴上的点 $(K, j 0)$], [原点，切入角 $-90° (n - m)$],
    [Ⅰ], [沿 $-90°$ 方向趋于无穷], [同上],
    [Ⅱ], [沿 $-180°$ 方向趋于无穷], [同上],
  )
]

*Ⅰ型系统的低频渐近线*：尾1形式 $display((K product (tau_i s + 1))/(s product (T_j s + 1)))$ 在 $omega -> 0^+$ 时实部趋于
$ V_x = -K (sum T_j - sum tau_i) $
曲线沿直线 $"Re" = V_x$ 趋于 $-j oo$。

=== Nyquist 判据
$ Z = P - 2 (N^+ - N^-) $
- $P$：开环在右半 $s$ 平面的极点数（原点上的极点不算）；$Z$：闭环右半平面极点数，$Z = 0$ 才稳定。
- 只看 $(-1, j 0)$ #Red[左侧]的负实轴 $(-oo, -1)$。
- $omega$ 增大时曲线从上往下穿过（逆时针）记 $N^+$，从下往上（顺时针）记 $N^-$。
- 曲线的起点或终点在 $(-oo, -1)$ 上时，记半次。

=== 积分环节与虚线圆弧
开环有 $v$ 个积分环节时，补画 $omega: 0 -> 0^+$ 的虚线圆弧：半径无穷大，从 $omega = 0$ 对应的方向开始#Red[顺时针]转 $v times 90°$，接到曲线起点。
- 起始方向由 $s -> 0$ 时 $G$ 中除积分环节外其余部分的符号决定。$K > 0$ 的最小相位系统从正实轴开始。
- #Red[虚线也参与穿越计数]。
- 也有资料（如嘎嘎的笔记）写成"从曲线起点#Red[逆时针]补 $v times 90°$"，那是沿 $omega: 0^+ -> 0$ 反着画，补出来是同一段圆弧。

=== 常见陷阱
#figure(caption: [Nyquist 判据的常见陷阱])[
  #table(
    columns: (auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([情况], [处理]),
    [开环有右半平面极点], [$P != 0$；$(s - a)$ 的相角是 $180° - arctan(omega\/a)$],
    [开环增益为负], [相角整体加 $180°$],
    [延时环节 $e^(-tau s)$], [幅值不变，相角多出 $-omega tau$，曲线呈螺旋形],
    [非最小相位零点 $(1 - T s)$], [相角是 $-arctan T omega$],
  )
]

=== Bode 判据与稳定裕度
Nyquist 图的单位圆对应 Bode 图的 0 dB 线，负实轴对应 $-180°$ 线。$P = 0$ 的最小相位系统：#Red[$omega_c < omega_g$ 时稳定]。

#figure(caption: [稳定裕度])[
  #table(
    columns: (auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.8em,
    table.header([指标], [定义]),
    [相位裕度 $gamma$], [$gamma = 180° + angle G(j omega_c)$],
    [幅值裕度 $K_g$], [$K_g = 1 \/ abs(G(j omega_g))$，常用 dB 表示],
  )
]

== 解题模板
1. 写出 $P$ 和 $v$。
2. 写 $A(omega)$、$phi(omega)$，求起点、终点（Ⅰ型加上低频渐近线 $V_x$）。
3. 令 $phi = -180°$ 求 $omega_g$ 和交点 $-A(omega_g)$。
4. 画图，补虚线圆弧，标方向。
5. 分情况数 $N^+$、$N^-$，写 $Z$，下结论。
6. 用 Routh 判据验算（写在草稿纸上即可）。

== 易错点
#callouts.Warning[
  - 只数 $(-1, j 0)$ #Red[左侧]的穿越，右侧的不算。
  - 起点在负实轴上时是半次穿越（23-24、22-23 都考了）。
  - $P$ 不含原点极点；$s - 2$ 这样的极点要算进 $P$。
  - 穿越方向看 $omega$ 增大时的走向：相角减小是顺时针。
]

== 真题解答
=== 25-26 秋 <a4-2526>
$P = 0$，$v = 1$。$phi(omega) = -90° - arctan omega - arctan(omega\/2)$，从 $-90°$ 减到 $-270°$。

- 起点：尾1形式 $display((K\/2)/(s(s+1)(0.5 s+1)))$，$V_x = -K/2 times 1.5 = -0.75 K$，沿此线趋于 $-j oo$。
- 终点：从 $+90°$ 方向进入原点。
- 与负实轴：$arctan omega + arctan(omega\/2) = 90°$，$omega_g = sqrt(2)$，$abs(G) = display(K/(sqrt(2) sqrt(3) sqrt(6))) = K/6$。
- 虚线圆弧从正实轴顺时针转 $90°$，不穿越负实轴。

#figure(image("assets/nyq_2526.svg", width: 55%), caption: [25-26 秋第四题 Nyquist 图])

曲线在 $omega_g$ 处从下往上穿过负实轴（顺时针），是负穿越。
- $0 < K < 6$：交点在 $(-1, 0)$ 右侧，$Z = 0$，稳定。
- $K = 6$：曲线过 $(-1, j 0)$，临界稳定。
- $K > 6$：$N^- = 1$，$Z = 0 - 2(0 - 1) = 2$，不稳定。

Routh 验算：$s^3 + 3 s^2 + 2 s + K = 0$，$6 > K$。

=== 24-25 秋 <a4-2425>
$P = 0$。令 $arctan(omega\/2) + arctan(omega\/3) = 90°$，得 $omega_g = sqrt(6)$：
$ abs(G(j sqrt(6))) = K/(sqrt(6) dot sqrt(10) dot sqrt(15)) = K/30 $
与上题同理，#Red[$0 < K < 30$] 时稳定，$K > 30$ 时 $Z = 2$。Routh 验算：$s^3 + 5 s^2 + 6 s + K$，$30 > K$。

=== 23-24 秋 <a4-2324>
$P = 0$。
- $omega = 0$：$G = -1\/B$，在负实轴上。
- 分母相角从 $0°$ 减到 $-180°$，加上负号的 $180°$，$G$ 的相角从 $180°$ 减到 $0°$。
- $omega = sqrt(B)$：$G = display(j/(A sqrt(B)))$，在正虚轴上。
- $omega -> oo$：从正实轴一侧进入原点。

曲线从 $-1\/B$ 出发，经上半平面到达原点。
- $B > 1$：起点在 $(-1, 0)$ 右侧，不穿越，稳定。
- $B < 1$：起点在 $(-1, 0)$ 左侧，曲线从负实轴向上离开（顺时针），半次负穿越，$Z = 0 - 2(0 - 1\/2) = 1$，不稳定。
- $B = 1$：临界稳定。

Routh 验算：$s^2 + A s + (B - 1) = 0$，$B > 1$ 时稳定。

#figure(image("assets/nyq_2324.svg", width: 55%), caption: [23-24 秋第四题 Nyquist 图])

=== 22-23 秋 <a4-2223>
$P = 1$。
- $phi = 2 arctan(omega\/2) - 270°$，从 $-270°$ 增大到 $-90°$（逆时针）。
- $omega -> 0^+$：$G approx display((2K)/(j omega (-2))) = j K\/omega$，沿 $+90°$ 方向趋于无穷；$omega -> oo$：从 $-90°$ 方向进入原点。
- 与负实轴：$omega = 2$，$abs(G(j 2)) = K\/2$，交点 $-K\/2$。这次穿越从上往下，是正穿越。
- 虚线圆弧：$s -> 0$ 时 $G approx -K\/s$，圆弧从负实轴无穷远处出发，顺时针转 $90°$ 接到起点。起点在负实轴上，记半次负穿越。

$K > 2$：$N^+ = 1$，$N^- = 1\/2$，$Z = 1 - 2(1 - 1\/2) = 0$，#Red[稳定]。\
$K < 2$：$N^+ = 0$，$Z = 1 - 2(0 - 1\/2) = 2$，不稳定。

Routh 验算：$s^2 + (K - 2) s + 2 K = 0$，$K > 2$ 时稳定。

#figure(image("assets/nyq_2223.svg", width: 55%), caption: [22-23 秋第四题 Nyquist 图])
