#import "utils.typ": Red, zebra
#import "Callouts.typ" as callouts

#show table: set par(justify: false)

= 第六题：校正

== 题型
15 分，最难也最稳定。给固有部分 $G_0(s)$ 和指标（$K_v$、$omega_c$、$gamma$），设计串联校正环节，常附带画校正前后的 Bode 图。

#figure(caption: [第六题历年考法])[
  #table(
    columns: (auto, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([年份], [校正方式], [附加问]),
    [25-26], [滞后], [中频宽 $h$、高阶最优近似],
    [24-25], [超前], [画校正前后 Bode 图],
    [23-24], [超前（$omega_c >= 5$）+ 滞后（$omega_c <= 1.5$）], [—],
    [22-23], [滞后], [Bode 图、合并小时间常数],
  )
]

#Red[滞后校正考了三年，高阶最优模型考了两年]，这两块补天笔记都讲得少，要重点看。

== 历年真题
#callouts.Question(title: [25-26 秋第六题])[
  单位负反馈，$G_0(s) = display(500/(s(0.008s+1)(0.001s+1)))$。  (1) 设计滞后校正，使 $K_v >= 500 "s"^(-1)$，$omega_c approx 45 "rad/s"$，$gamma >= 45°$；  (2) 校正后求中频宽 $h$，并求高阶最优模型的近似表达式。
]
#callouts.Tip(title: [思路提示])[
  先验证 $gamma_0(45) >= 45° + 6°$。$beta = K_v \/ omega_c$，零点取 $0.1 omega_c$。第 (2) 问把 $0.008$ 和 $0.001$ 合并成 $T'_3$，中频段把 $beta T s + 1$ 近似成 $beta T s$。
]

#callouts.Question(title: [24-25 秋第六题])[
  单位反馈，$G_0(s) = display(5/(s(0.1s+1)(0.5s+1)))$。  (1) 用超前校正使 $gamma >= 45°$；(2) 画校正前后的幅值 Bode 图。
]
#callouts.Tip(title: [思路提示])[
  $gamma_0$ 只有约 $15°$，一般法要补 $40°$ 以上并反复试算。用相消法：零点抵消 $0.5 s + 1$。
]

#callouts.Question(title: [23-24 秋第六题])[
  单位反馈，$G_0(s) = display(8/(s(0.1s+1)(0.5s+1)))$，要求 $gamma >= 35°$。  (1) 若要 $omega_c >= 5$，用超前校正；(2) 若要 $omega_c <= 1.5$，用滞后校正。
]
#callouts.Tip(title: [思路提示])[
  (1) 相消法，校正后 $omega_c$ 落在 $[-20]$ 段上。(2) 先算 $gamma_0(1.5)$ 是否够 $41°$。
]

#callouts.Question(title: [22-23 秋第六题])[
  单位反馈，$G_0(s) = display(K/(s(0.008s+1)(0.002s+1)(0.001s+1)))$。  (1) 使 $K_v = 200$，$omega_c <= 30$，$gamma >= 50°$，确定 $K$ 并设计串联滞后校正；  (2) 画校正前后的幅值 Bode 图；  (3) 利用高阶最优模型，优化小时间常数环节（0.008、0.002、0.001）。
]
#callouts.Tip(title: [思路提示])[
  与 25-26 几乎同一道题，只多了一个小时间常数。
]

== 必备知识
=== 校正的思路
本章只讲#Red[串联校正]：在前向通路中串入校正环节 $G_c (s)$，校正后开环为 $G_c (s) G_0(s)$。对开环 Bode 图的要求是：
- 低频段：增益足够高，满足稳态误差；
- 中频段：以 $[-20]$ 穿越 0 dB，$omega_c$ 和 $gamma$ 满足要求；
- 高频段：衰减快，抑制噪声。

#figure(
  image("assets/lead_lag.svg", width: 90%),
  caption: [超前网络与滞后网络的 Bode 图],
)

=== 超前校正
==== 超前网络
$ G_c (s) = (T s + 1)/(alpha T s + 1), quad alpha < 1 $
- 零点 $1\/T$ 在前，极点 $1\/(alpha T)$ 在后，相角为正。
- 最大超前角及其频率：
$ sin phi_m = (1 - alpha)/(1 + alpha), quad alpha = (1 - sin phi_m)/(1 + sin phi_m), quad omega_m = 1/(T sqrt(alpha)) $
- $omega_m$ 处幅值抬高 $-10 lg alpha$（dB）。$omega_m$ 是两个转折频率的几何中点。
- 一级超前网络的 $phi_m$ 一般不超过 $60°$。
- 补天笔记和嘎嘎的笔记写成 $display((alpha T s + 1)/(T s + 1))$，$alpha = display((1 + sin phi_m)/(1 - sin phi_m)) > 1$，对应的步骤是 $L_0(omega_c) = -10 lg alpha$、$T = display(1/(omega_c sqrt(alpha)))$。和本书的 $alpha$ 互为倒数，最后的 $G_c$ 一样。

超前校正利用#Red[正相角]增加 $gamma$，同时 $omega_c$ 增大、响应变快。它不改变低频段，所以 $K$ 要先按稳态要求定好。

==== 一般法
1. 由稳态误差要求定 $K$。画原系统 Bode 图，求 $omega_(c 0)$ 和 $gamma_0$。
2. 需要的超前角 $phi_m = gamma^* - gamma_0 + (5° tilde 12°)$。多加的角度补偿 $omega_c$ 右移后原系统相角的减小。
3. 求 $alpha$。
4. 在原系统幅频曲线上找 $L_0(omega) = 10 lg alpha$ 的频率，作为 $omega_m = omega_c$。这样校正后 $omega_m$ 处正好是 0 dB。
5. $T = display(1/(omega_m sqrt(alpha)))$，写出 $G_c$。
6. 验算 $gamma$。不满足就加大补偿角重做。

#callouts.Question(title: [例 1])[
  $G_0(s) = display(K/(s(s+1)))$，要求 $K_v = 10 "s"^(-1)$，$gamma >= 45°$，设计超前校正。

  *解*：$K = K_v = 10$。$omega_(c 0) = 3.08$，$gamma_0 = 90° - arctan 3.08 = 18°$。

  取 $phi_m = 45° - 18° + 10° = 37°$，$alpha = display((1 - sin 37°)/(1 + sin 37°)) = 0.249$，$10 lg alpha = -6.0 "dB"$。

  令 $abs(G_0(j omega)) = sqrt(alpha)$，即 $display(10/(omega sqrt(1+omega^2))) = 0.499$，得 $omega_m = omega_c = 4.42$。

  $T = display(1/(4.42 sqrt(0.249))) = 0.453$，$alpha T = 0.113$：
  $ G_c (s) = (0.453 s + 1)/(0.113 s + 1) $
  验算：$gamma = 90° - arctan 4.42 + arctan(0.453 times 4.42) - arctan(0.113 times 4.42) = 49.7° >= 45°$。
]

==== 相消法
用超前网络的零点#Red[抵消原系统中转折频率最低的惯性极点]（$omega_c$ 附近相角下降最多的那个），再按 $gamma$ 或 $omega_c$ 的要求解出 $alpha T$。

#callouts.Question(title: [例 2（课件例 3）])[
  $G_0(s) = display(6/(s(0.2s+1)(0.5s+1)))$，用相消法设计超前校正，使 $gamma >= 40°$，$omega_c >= 4$。

  *解*：取 $G_c = display((0.5s+1)/(T s+1))$，校正后 $G = display(6/(s(0.2s+1)(T s+1)))$。

  $gamma = 90° - arctan 0.2 omega_c - arctan T omega_c >= 40°$。取 $omega_c = 4$，得 $arctan T omega_c <= 11.3°$，$T <= 0.05$：
  $ G_c (s) = (0.5 s + 1)/(0.05 s + 1) $
]

#callouts.Tip(title: [两种方法怎么选])[
  原系统 $gamma_0$ 很小、需要补的角度接近 $60°$ 时，一般法要反复试算，相消法往往一步到位。24-25 秋第六题就是这样。
]

=== 滞后校正
==== 滞后网络
$ G_c (s) = (T s + 1)/(beta T s + 1), quad beta > 1 $
- 极点 $1\/(beta T)$ 在前，零点 $1\/T$ 在后。高频段幅值衰减 $20 lg beta$（dB）。
- 滞后校正利用的是#Red[高频衰减]：把幅频曲线往下压，让 $omega_c$ 左移到相角裕量足够的地方。代价是 $omega_c$ 减小，响应变慢。
- 滞后网络的相角是负的，所以零点 $1\/T$ 要远离 $omega_c$，取 $1\/T = (0.1 tilde 0.2) omega_c$，使它在 $omega_c$ 处只带来 $5° tilde 10°$ 的滞后。

==== 设计步骤
1. 由稳态要求定 $K$，画原系统 Bode 图。
2. 在原系统上找 $gamma_0(omega) = gamma^* + (5° tilde 12°)$ 的频率，作为新的 $omega_c$。题目直接给 $omega_c$ 时，检查 $gamma_0(omega_c)$ 是否满足这个条件。
3. 令 $L_0(omega_c) = 20 lg beta$ 求 $beta$。对Ⅰ型系统，$omega_c$ 在 $[-20]$ 段上时有经验公式 $beta = K_v \/ omega_c$。
4. 取 $1\/T = 0.1 omega_c$，求出 $beta T$。
5. 验算。

#callouts.Warning(title: [两种 $beta$ 写法])[
  补天笔记把滞后网络写成 $display((beta T s+1)/(T s+1))$，$beta < 1$，公式是 $K_v = omega_c \/ beta$。本书和课件用 $beta > 1$，公式是 $K_v = beta omega_c$。两者互为倒数，最后的 $G_c$ 一样。
]

#callouts.Question(title: [例 3])[
  $G_0(s) = display(30/(s(0.1s+1)(0.2s+1)))$，要求 $K_v = 30$，$gamma >= 40°$，设计滞后校正。

  *解*：原系统 $omega_(c 0) approx 9.8$，$gamma_0 < 0$，不稳定。用超前校正需要补的角度太大，改用滞后校正。

  找 $gamma_0(omega) = 40° + 6° = 46°$ 的频率：$90° - arctan 0.1 omega - arctan 0.2 omega = 46°$，得 $omega approx 2.7$，取 $omega_c = 2.7$。

  $beta = 30 \/ 2.7 = 11.1$。取 $1\/T = 0.1 omega_c = 0.27$，$T = 3.7$，$beta T = 41$：
  $ G_c (s) = (3.7 s + 1)/(41 s + 1) $
  验算（精确计算）：$omega_c = 2.39$，$gamma = 45.2° >= 40°$。
]

==== 超前与滞后的比较
#figure(caption: [超前校正与滞后校正])[
  #table(
    columns: (auto, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([], [超前校正], [滞后校正]),
    [原理], [利用正相角], [利用高频幅值衰减],
    [$omega_c$], [增大，响应变快], [减小，响应变慢],
    [抗高频干扰], [变差], [变好],
    [适用场合], [$omega_c$ 附近相角下降平缓], [$omega_c$ 附近相角下降很快，或要求 $omega_c$ 不大于某值],
  )
]

滞后-超前校正：$G_c = display(((T_1 s + 1)(T_2 s + 1))/((beta T_1 s + 1)(T_2 s \/ beta + 1)))$，低频段用滞后部分提高精度，中频段用超前部分增加 $gamma$。

=== 希望特性与最优模型
==== 二阶最优模型
$ G(s) = K/(s(T s + 1)), quad K T = 1/2 $
对应闭环 $zeta = 0.707$，$M_p = 4.3%$。此时 $omega_c approx K = 1/(2T)$，也就是#Red[转折频率 $1\/T = 2 omega_c$]。

==== 高阶最优模型
#figure(
  image("assets/hopt.svg", width: 75%),
  caption: [高阶最优模型（2-1-2 型）的对数幅频特性],
)

中频段为 $[-40] -> [-20] -> [-40]$（2-1-2 型），Ⅱ型的典型形式为
$ G(s) = (K (T_2 s + 1))/(s^2 (T_3 s + 1)), quad omega_2 = 1/T_2 < omega_c < omega_3 = 1/T_3 $

#figure(caption: [高阶最优模型的公式])[
  #table(
    columns: (auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.8em,
    table.header([量], [公式]),
    [中频宽], [$h = display(omega_3/omega_2 = T_2/T_3)$，一般取 $h = 7 tilde 12$],
    [增益], [$K = omega_2 omega_c$],
    [最佳频比], [$display(omega_c/omega_2 = (h+1)/2)$，$display(omega_3/omega_c = (2h)/(h+1))$],
    [谐振峰], [$M_r = display((h+1)/(h-1))$，即 $h = display((M_r+1)/(M_r-1))$],
    [由 $M_r$ 定转折频率], [$omega_2 <= display(omega_c (M_r - 1)/M_r)$，$omega_3 >= display(omega_c (M_r + 1)/M_r)$],
    [超调量], [$M_p = 0.16 + 0.4 (M_r - 1)$，$1 <= M_r <= 1.8$],
    [调整时间], [$t_s = display(pi/omega_c) [2 + 1.5(M_r - 1) + 2.5(M_r - 1)^2]$],
    [相位裕量], [$gamma = arctan display(omega_c/omega_2) - arctan display(omega_c/omega_3)$，$M_r approx display(1/(sin gamma))$],
    [由 $gamma$ 定 $h$], [$M_r <= display(1/(sin gamma))$，$h >= display((1 + sin gamma)/(1 - sin gamma))$],
  )
]

Ⅰ型系统在低频再加一个转折频率 $omega_1$：$G(s) = display((K_v (s\/omega_2 + 1))/(s (s\/omega_1 + 1)(s\/omega_3 + 1)))$，$omega_1 = omega_2 omega_c \/ K_v$。中频段的公式不变。

==== 期望频率特性法的步骤
按高阶最优模型直接设计校正（嘎嘎的笔记把它列为第四种方法，课件例 7-6 就是这样做的）：
1. 由 $M_p$、$t_s$ 用上表公式求 $M_r$ 和 $omega_c$，确认原系统不满足。
2. 由 $M_r$ 定 $omega_2 <= omega_c (M_r - 1)\/M_r$、$omega_3 >= omega_c (M_r + 1)\/M_r$。只给 $gamma$ 时先用 $M_r = 1\/sin gamma$。
3. 取合适的 $omega_2$、$omega_3$，$h = omega_3 \/ omega_2$。
4. $omega_1 = omega_2 omega_c \/ K_v$。
5. 高频段的转折频率尽量取和 $G_0$ 相同的，这样校正环节最简单。
6. 写出希望特性 $G(s)$，校正环节 $G_c = G \/ G_0$。
7. 验算。

==== 小时间常数的合并
$omega_c$ 以上有多个惯性环节 $T_3, T_4, dots$ 时，在中频段可以把它们合并成一个：
$ T'_3 = T_3 + T_4 + dots.c, quad omega'_3 = 1/T'_3 $
依据是 $omega << 1\/T_i$ 时 $product (T_i j omega + 1) approx (sum T_i) j omega + 1$。合并后再用上表的公式。

==== 校正后系统的高阶最优近似
滞后校正后的Ⅰ型系统 $display((K_v (T s + 1))/(s (beta T s + 1) product (T_i s + 1)))$，在中频段 $beta T s >> 1$，所以
$ G(s) approx (K_v/(beta T) (T s + 1))/(s^2 (T'_3 s + 1)) $
这就是高阶最优模型，$omega_2 = 1\/T$，$omega'_3 = 1\/T'_3$，$h = T \/ T'_3$。可以验证 $K_v \/ (beta T) = omega_2 omega_c$。

#callouts.Question(title: [例 4（课件例 7-6）])[
  $G_0(s) = display(500/(s(0.008s+1)(0.002s+1)(0.001s+1)))$，要求 $K_v = 500$，$M_p < 30%$，$t_s < 0.2 "s"$。

  *解*：$M_r = 0.6 + 2.5 M_p = 1.35$，要求 $h >= display(2.35/0.35) approx 6.7$。

  由 $t_s = display(pi/omega_c) (2 + 1.5 times 0.35 + 2.5 times 0.35^2) < 0.2$ 得 $omega_c > 44.5$，取 $omega_c = 45$。

  由 $M_r$：$omega_2 <= 45 times 0.35 \/ 1.35 = 11.7$，取 $omega_2 = 9$；$omega_3 >= 45 times 2.35 \/ 1.35 = 78$，合并小时间常数得 $T'_3 = 0.011$，$omega'_3 = 91$，满足。此时 $h = 91 \/ 9 approx 10$。

  $omega_1 = omega_2 omega_c \/ K_v = 0.81$。中频段近似为
  $ G(s) approx (400 (0.11 s + 1))/(s^2 (0.011 s + 1)) $
  精确验算 $gamma approx 53°$。
]

== 解题模板
*超前（一般法）*：定 $K$ → 原系统 $omega_(c 0)$、$gamma_0$ → $phi_m = gamma^* - gamma_0 + (5° tilde 12°)$ → $alpha$ → $L_0(omega_m) = 10 lg alpha$ 求 $omega_m$ → $T = 1\/(omega_m sqrt(alpha))$ → 验算。

*超前（相消法）*：零点抵消最低频的惯性极点 → 写出校正后的 $gamma$ 表达式 → 由 $gamma^*$（和 $omega_c$）解出极点时间常数 → 验算。

*滞后*：定 $K$ → 找 $gamma_0(omega) = gamma^* + 6°$ 的频率作 $omega_c$（或检查给定 $omega_c$）→ $beta = L_0(omega_c)$ 对应的倍数（Ⅰ型 $[-20]$ 段上 $beta = K_v \/ omega_c$）→ $1\/T = 0.1 omega_c$ → 验算。

*高阶最优近似*：合并 $omega_c$ 以上的小时间常数 → 中频段 $beta T s + 1 approx beta T s$ → 写成 $display((K (T_2 s+1))/(s^2 (T'_3 s+1)))$，$K = omega_2 omega_c$ → $h = T_2 \/ T'_3$。

*画图*：校正前、校正环节、校正后三条渐近线画在一张图上，标出所有转折频率和 $omega_c$。

== 易错点
#callouts.Warning[
  - 两种 $beta$ 写法互为倒数，用哪一种就从头到尾用哪一种。
  - 超前校正不改变低频段，$K$ 要先按稳态要求定好。
  - 一般法的 $omega_m$ 要在原系统上找 $L_0 = 10 lg alpha$（负值）的点，不是 $L_0 = 0$。
  - 滞后校正前要检查 $gamma_0(omega_c)$ 是否比要求多出 $5° tilde 12°$，这一步写在卷面上。
  - 最后一定要验算 $gamma$，不满足就加大补偿角重算。
]

== 真题解答
=== 25-26 秋 <a6-2526>
*(1)* $K_v = 500$ 已满足。原系统 $omega_(c 0) approx 250 > 45$，$gamma_0 approx 15°$，不满足。

$gamma_0(45) = 90° - arctan 0.36 - arctan 0.045 = 67.6° > 45° + 6°$，可以用滞后校正，取 $omega_c = 45$。

$beta = K_v \/ omega_c = 500\/45 = 11.1$，$1\/T = 0.1 omega_c = 4.5$，$T = 0.222$，$beta T = 2.47$：
$ G_c (s) = (0.222 s + 1)/(2.47 s + 1) $
验算：滞后网络在 $omega_c$ 处的相角为 $arctan 10 - arctan 111 = -5.2°$，$gamma approx 67.6° - 5.2° = 62.4°$（精确值 $63.2°$），满足。

#figure(image("assets/bode_2526t6.svg", width: 85%), caption: [25-26 秋第六题校正前后的 Bode 图])

*(2)* 校正后 $G = display((500 (0.222 s + 1))/(s (2.47 s + 1)(0.008 s + 1)(0.001 s + 1)))$。

合并小时间常数：$T'_3 = 0.008 + 0.001 = 0.009$，$omega'_3 = 111$。中频段 $2.47 s >> 1$，$500 \/ 2.47 = 202$：
$ G(s) approx (202 (0.222 s + 1))/(s^2 (0.009 s + 1)) $
中频宽 $h = T_2 \/ T'_3 = 0.222\/0.009 approx 24.7$（不合并时为 $125\/4.5 approx 27.8$）。验算 $K = omega_2 omega_c = 4.5 times 45 = 202$，一致。


=== 24-25 秋 <a6-2425>
$G_0(s) = display(5/(s(0.1s+1)(0.5s+1)))$，要求 $gamma >= 45°$。

原系统：$[-20]$ 段到 2 为止，之后 $[-40]$，$L = 20 lg(10\/omega^2)$，$omega_(c 0) = 3.16$，$gamma_0 = 90° - arctan 0.316 - arctan 1.58 = 14.8°$。

*相消法（推荐）*：用零点抵消 $0.5 s + 1$，$G_c = display((0.5s+1)/(T s+1))$，校正后 $G = display(5/(s(0.1s+1)(T s+1)))$。渐近线 $omega_c = 5$，
$ gamma = 90° - arctan 0.5 - arctan 5T >= 45° => T <= 0.067 $
取 $T = 0.05$：
$ G_c (s) = (0.5 s + 1)/(0.05 s + 1) $
验算：$gamma = 90° - 26.6° - 14.0° = 49.4°$（精确值 $omega_c = 4.46$，$gamma = 53.4°$）。

*一般法*：需要的超前角很大。补 $10°$（$phi_m = 40°$）时验算只有约 $42°$；取 $phi_m = 50°$，$alpha = 0.132$，由 $abs(G_0(j omega_m)) = sqrt(alpha)$ 得 $omega_m = 4.78$，$G_c = display((0.575 s + 1)/(0.076 s + 1))$，$gamma approx 47°$。

#figure(image("assets/bode_2425t6.svg", width: 85%), caption: [24-25 秋第六题校正前后的 Bode 图（相消法）])


=== 23-24 秋 <a6-2324>
$G_0(s) = display(8/(s(0.1s+1)(0.5s+1)))$，要求 $gamma >= 35°$。原系统渐近线 $omega_(c 0) = 4$，$gamma_0 approx 5°$（精确值 $omega_(c 0) = 3.63$，$gamma_0 = 8.9°$）。

*(1) 超前，$omega_c >= 5$*：用相消法抵消 $0.5 s + 1$，校正后 $G = display(8/(s(0.1s+1)(T s+1)))$，渐近线 $omega_c = 8$。
$ gamma = 90° - arctan 0.8 - arctan 8 T >= 35° => T <= 0.036 $
取 $T = 0.03$：$G_c = display((0.5 s + 1)/(0.03 s + 1))$。精确验算 $omega_c = 6.6 >= 5$，$gamma = 45.6°$。

*(2) 滞后，$omega_c <= 1.5$*：$gamma_0(1.5) = 90° - arctan 0.15 - arctan 0.75 = 44.6° > 35° + 6°$，可以用。

取 $omega_c = 1.5$，$beta = 8\/1.5 = 5.33$，$1\/T = 0.15$，$T = 6.67$，$beta T = 35.6$：
$ G_c (s) = (6.67 s + 1)/(35.6 s + 1) $
精确验算 $omega_c = 1.27$，$gamma = 45.0°$。


=== 22-23 秋 <a6-2223>
*(1)* $K = K_v = 200$。原系统 $omega_(c 0) approx 130$，$gamma_0 approx 21°$，不满足。

$gamma_0(30) = 90° - arctan 0.24 - arctan 0.06 - arctan 0.03 = 71.4° > 50° + 6°$，取 $omega_c = 30$。

$beta = 200\/30 = 6.67$，$1\/T = 0.1 omega_c = 3$，$T = 0.333$，$beta T = 2.22$：
$ G_c (s) = (0.333 s + 1)/(2.22 s + 1) $
精确验算 $omega_c = 29.3$，$gamma = 66.8°$。

*(2)*
#figure(image("assets/bode_2223t6.svg", width: 85%), caption: [22-23 秋第六题校正前后的 Bode 图])

*(3)* 三个小时间常数都在 $omega_c$ 以上，合并为 $T'_3 = 0.008 + 0.002 + 0.001 = 0.011$，$omega'_3 = 91$。中频段 $2.22 s >> 1$，$200\/2.22 = 90$：
$ G(s) approx (90 (0.333 s + 1))/(s^2 (0.011 s + 1)) $
$h = 0.333\/0.011 approx 30$，$M_r = (h+1)\/(h-1) approx 1.07$，$gamma approx 66.5°$，与合并前几乎相同。

#callouts.Note(title: [这一问的题意])[
  回忆卷只写了"优化小时间常数环节"，这里按"合并成一个等效小时间常数、写出高阶最优近似"作答。若要按最佳频比 $omega_c = omega_2 (h+1)\/2$ 重新设计，$h = 30$ 对应 $omega_c approx 47$，超过了 $omega_c <= 30$ 的要求，所以保留滞后校正的结果。
]

