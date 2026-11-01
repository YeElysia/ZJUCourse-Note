#import "utils.typ": Red, zebra
#import "Callouts.typ" as callouts

#show table: set par(justify: false)

= 其他知识点

这一章收录四年期末没有直接考到、但做题时偶尔用到的基础内容。时间不够可以跳过。

== Laplace 变换
=== 定义与常用变换对
对 $t < 0$ 时为零的函数 $x(t)$，其 Laplace 变换为
$ X(s) = L[x(t)] = integral_0^oo x(t) e^(-s t) dif t $

#figure(caption: [常用 Laplace 变换对])[
  #table(
    columns: (1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([$x(t)$], [$X(s)$]),
    [单位脉冲 $delta(t)$], [$1$],
    [单位阶跃 $1(t)$], [$display(1/s)$],
    [单位斜坡 $t$], [$display(1/s^2)$],
    [$display(1/2) t^2$], [$display(1/s^3)$],
    [$t^n$], [$display((n!)/s^(n+1))$],
    [$e^(-a t)$], [$display(1/(s+a))$],
    [$t e^(-a t)$], [$display(1/(s+a)^2)$],
    [$sin omega t$], [$display(omega/(s^2+omega^2))$],
    [$cos omega t$], [$display(s/(s^2+omega^2))$],
    [$e^(-a t) sin omega t$], [$display(omega/((s+a)^2+omega^2))$],
    [$e^(-a t) cos omega t$], [$display((s+a)/((s+a)^2+omega^2))$],
  )
]

=== 常用性质
#figure(caption: [Laplace 变换的性质])[
  #table(
    columns: (auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([性质], [公式]),
    [线性], [$L[a f_1(t) + b f_2(t)] = a F_1(s) + b F_2(s)$],
    [微分], [$L[f'(t)] = s F(s) - f(0)$，零初始条件下 $L[f^((n))(t)] = s^n F(s)$],
    [积分], [零初始条件下 $L[integral_0^t f(tau) dif tau] = display(F(s)/s)$],
    [衰减（复位移）], [$L[e^(-a t) f(t)] = F(s+a)$],
    [延时], [$L[f(t-a) dot 1(t-a)] = e^(-a s) F(s)$],
    [初值定理], [$display(lim_(t -> 0^+) f(t) = lim_(s -> oo) s F(s))$],
    [终值定理], [$display(lim_(t -> oo) f(t) = lim_(s -> 0) s F(s))$],
  )
]

#callouts.Warning(title: [终值定理的条件])[
  终值定理要求 $s F(s)$ 的极点全在左半 $s$ 平面。对控制系统来说，就是#Red[先判稳定，再用终值定理]。例如 $F(s) = display(1/(s^2+1))$ 对应 $sin t$，没有终值，但硬套公式会得到 0。
]

=== Laplace 反变换
把象函数做部分分式展开，再逐项查表。

#callouts.Question(title: [例 9.1])[
  求 $F(s) = display((s+1)/(s^2+5s+6))$ 的反变换。

  *解*：$F(s) = display((s+1)/((s+2)(s+3)) = A/(s+2) + B/(s+3))$。

  留数法：$A = lr((s+1)/(s+3)|)_(s=-2) = -1$，$B = lr((s+1)/(s+2)|)_(s=-3) = 2$。

  所以 $f(t) = (2 e^(-3t) - e^(-2t)) dot 1(t)$。
]

#callouts.Question(title: [例 9.2（重根）])[
  求 $F(s) = display(1/(s(s+1)^2))$ 的反变换。

  *解*：设 $F(s) = display(A/s + B/(s+1)^2 + C/(s+1))$。

  $A = lr(1/(s+1)^2|)_(s=0) = 1$，$B = lr(1/s|)_(s=-1) = -1$，$C = lr(dif/(dif s)(1/s)|)_(s=-1) = -1$。

  所以 $f(t) = 1 - t e^(-t) - e^(-t)$，$t >= 0$。
]

== 典型环节与开环、闭环
#figure(caption: [典型环节])[
  #table(
    columns: (auto, auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([环节], [传递函数], [例子]),
    [比例], [$K$], [齿轮副、运放],
    [积分], [$display(1/s)$], [有源积分网络],
    [微分], [$s$], [测速发电机],
    [惯性], [$display(1/(T s+1))$], [RC 低通、弹簧-阻尼],
    [一阶微分], [$T s + 1$], [PD 控制器],
    [二阶振荡], [$display(1/(T^2 s^2 + 2 zeta T s + 1))$，$0 < zeta < 1$], [弹簧-质量-阻尼],
    [延时], [$e^(-tau s)$], [传送带、管道],
  )
]

对前向通路 $G(s)$、反馈通路 $H(s)$ 的负反馈系统：
- 开环传递函数：$G(s) H(s)$
- 闭环传递函数：$Phi(s) = display(G(s)/(1 + G(s) H(s)))$
- 特征方程：$1 + G(s) H(s) = 0$

$H(s) = 1$ 时称为单位负反馈。

== 典型输入信号
#figure(caption: [典型输入信号])[
  #table(
    columns: (1fr, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([信号], [时域], [象函数]),
    [单位脉冲], [$delta(t)$], [$1$],
    [单位阶跃], [$1(t)$], [$display(1/s)$],
    [单位斜坡（等速）], [$t$], [$display(1/s^2)$],
    [单位加速度], [$display(1/2) t^2$], [$display(1/s^3)$],
    [正弦], [$sin omega t$], [$display(omega/(s^2+omega^2))$],
  )
]

线性定常系统有一个常用性质：#Red[系统对输入导数的响应，等于对该输入响应的导数]；积分同理。所以单位脉冲响应是单位阶跃响应的导数。

== 一阶系统
$ Phi(s) = 1/(T s + 1) $

#figure(caption: [一阶系统的响应])[
  #table(
    columns: (auto, 1fr, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.7em,
    table.header([输入], [输出], [特点]),
    [$delta(t)$], [$display(1/T) e^(-t\/T)$], [单调衰减],
    [$1(t)$], [$1 - e^(-t\/T)$], [$t = T$ 时达到 63.2%，无超调],
    [$t$], [$t - T + T e^(-t\/T)$], [稳态误差为 $T$],
  )
]

调整时间 $t_s = 3T$（$plus.minus 5%$）或 $4T$（$plus.minus 2%$）。$T$ 越小响应越快。

== 高阶系统与主导极点
=== 主导极点
- *主导极点*：离虚轴最近、附近没有闭环零点的闭环极点（一个实极点或一对共轭复极点）。
- 其他极点的实部绝对值大于主导极点的 #Red[5 倍]以上时，可以忽略。
- *偶极子*：相距很近的一对闭环零点和极点，作用近似抵消。

忽略非主导极点时，要#Red[保持闭环增益不变]：先写成尾1形式，再直接删去对应的因式。

#callouts.Question(title: [例 9.3])[
  闭环传递函数
  $ Phi(s) = (0.24 s + 1)/((0.25 s + 1)(0.04 s^2 + 0.24 s + 1)(0.0625 s + 1)) $
  用主导极点法估算超调量。

  *解*：零点 $-4.17$；极点 $-4$、$-3 plus.minus 4j$、$-16$。

  $-4.17$ 与 $-4$ 构成偶极子，消去。$abs(-16) \/ 3 > 5$，$-16$ 可以忽略。剩下
  $ Phi(s) approx 1/(0.04 s^2 + 0.24 s + 1) = 25/(s^2 + 6 s + 25) $
  $omega_n = 5$，$zeta = 0.6$，$M_p = e^(-0.6 pi \/ 0.8) = 9.5%$。
]

== 频率响应
=== 定义
频率响应是系统对#Red[正弦输入的稳态响应]。输入 $x_i = X sin omega t$ 时，稳定线性系统的稳态输出为
$ x_o = X A(omega) sin(omega t + phi(omega)), quad A(omega) = abs(G(j omega)), quad phi(omega) = angle G(j omega) $
$A(omega)$ 是幅频特性，$phi(omega)$ 是相频特性。环节串联时#Red[幅值相乘、相角相加]。

#callouts.Question(title: [例 9.4])[
  单位反馈系统开环 $G(s) = display(10/(s+1))$，输入 $x_i = 2 cos(2t - 45°)$，求稳态输出。

  *解*：输入加在闭环上，要用闭环传递函数 $Phi(s) = display(10/(s+11))$。$omega = 2$ 时
  $ A = 10/sqrt(2^2 + 11^2) = 0.894, quad phi = -arctan 2/11 = -10.3° $
  所以 $x_o = 1.79 cos(2t - 55.3°)$。
]

=== 阶与型
- *阶*：闭环特征方程的最高次数。
- *型*：开环传递函数 $G(s)H(s)$ 中积分环节的个数 $v$，决定稳态误差（第五题）。

例如 $G(s)H(s) = display((s-5)/(s^2 (s-2)(s-0.2)))$ 是四阶Ⅱ型系统。

== 闭环频率特性
#figure(caption: [二阶系统的闭环频域指标])[
  #table(
    columns: (auto, 1fr),
    align: horizon + center,
    fill: zebra,
    inset: 0.8em,
    table.header([指标], [公式]),
    [谐振频率], [$omega_r = omega_n sqrt(1 - 2 zeta^2)$（$zeta < 0.707$）],
    [谐振峰值], [$M_r = display(1/(2 zeta sqrt(1 - zeta^2)))$],
    [带宽频率], [$omega_b = omega_n sqrt(1 - 2 zeta^2 + sqrt((1 - 2 zeta^2)^2 + 1))$],
  )
]

工程上常用 $M_r approx display(1/(sin gamma))$ 在开环 $gamma$ 和闭环 $M_r$ 之间换算（第六题高阶最优模型用到）。

