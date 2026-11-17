#import "@local/Typwork-some:0.1.3": styles, exam

#let kong = exam.blank
#let tf = exam.judgment
#let q = exam.question
#let sub = exam.subquestion

#show: styles.recollection.with(
  course: "机械工程测试技术",
  author: "试鸢",
  academic-year: "2026-2027",
  term: "秋学期",
  course-code: "ME3013M",
  college: "机械工程学院",
  exam-form: [√闭、开卷(请在选定项上打√）)],
  exam-date: (2026, 11, 15),
  duration: 120,
)

= 判断 1 $times$ 10

#tf[1][信息是信号的载体，信号是信息的内容。]
#tf[2][两个简单周期信号叠加后必定是一个复杂周期信号。]
#tf[3][频谱图包含了信号频率结构信息，因此频域比时域包含的信息更丰富。]
#tf[4][
  若信号$x(t)$的傅里叶变换为$X(f)$，则其逆变换可由下式给出。$ x(t) = 1/(2 pi) integral_(-infinity)^infinity X(f) upright(e)^(j 2 pi f t) dif f. $
]
#tf[5][实信号的实部谱为偶函数，虚部谱为奇函数。]
#tf[6][FFT 可快速计算离散傅里叶变换，提高数字信号的频谱计算速度。]
#tf[7][面积变化型电容传感器都属于结构型传感器。]
#tf[8][A/D 是将模拟信号转换为数字信号的过程。]
#tf[9][相关系数能够反映两个信号之间的因果关系。]
#tf[10][相关滤波是基于“同频相关、不同频不相关”的原理实现的。]

= 填空 1 $times$ 40
#q[1][
  在下列信号中，周期信号为 #kong(width: 2em)，准周期信号为 #kong(width: 2em)，奇异信号为 #kong(width: 2em)，能量信号为 #kong(width: 2em) 。（$f>0$）
  #v(0.25em)
  #grid(
    columns: 4,
    gutter: 0.9em,
    [(a)$sin(sqrt(5) pi t)+sin(2 pi t)$],
    [(b)$op("sgn")(t)$],
    [(c)$upright(e)^(-5t^2)$],
    [(d)$sin(2 pi f t)+sin(4 pi f t)$],
  )
]

#q[2][测试系统通常由传感器、#kong(width: 4em)、#kong(width: 4em) 和显示记录装置等环节组成。]

#q[3][已知$x(t)$的傅里叶变换为$X(f)$, 则$x(t)$与 $delta(t-t_0)$的卷积的频谱为 #kong(width: 3em)\; 若$x(t)=sin(2 pi f_0t)$，则 $X(f)=$ #kong()。]

#q[4][在零初始条件下，某测试系统的输入$x(t)$与输出$y(t)$满足常系数微分方程
  $
    a_n (dif^n y(t))/(dif t^n) + a_(n-1) (dif^(n-1) y(t))/(dif t^(n-1)) + dots.c + a_1 (dif y(t))/(dif t) + a_0 y(t) = 0
  $
  各系数均为常数，则该系统属于 #kong(width: 8em) 系统。\
  系统的五个性质为 #kong(width: 4em)、#kong(width: 4em)、微分、#kong(width: 4em) 和 #kong(width: 4em)。
]

#q[5][灵敏度的定义是 #kong()\; 分辨率的定义是 #kong()。]

#q[6][Parseval 定理的数学关系为#kong(width: 5em)\;
  其物理意义是 #kong(width: 7em)。]


#q[7][
  不失真传输时, 幅频特性应满足 #kong()\; 相频特性应满足 #kong()。四个特性为#kong()[动态]、#kong()、#kong() 和 #kong()。
]
#q[8][测试装置的三类主要干扰源是：电磁干扰、#kong() 和 #kong()。]

#q[9][相干函数 $gamma_(x y)^2$ 可作为 #kong(width: 6em) 的一种度量。当 $0<gamma_(x y)^2<1$ 时，可能的原因包括：#kong(width: 4em)、存在和其他输入的综合作用、#kong(width: 4em)
]

#q[10][半导体应变片是根据 #kong(width: 10em) 原理制成的。]

#q[11][涡流传感器的工作原理是 #kong(width: 10em)；\按能量关系分类，它属于 #kong(width: 8em) (能量转换/能量控制)型传感器; 其应用有 #kong(width: 18em)。]

#q[12][霍尔传感器的工作原理是 #kong(width: 7em)\; 它属于 #kong() 型传感器（选填：物性／结构）。]

#q[13][调制分为#kong()和角度调制; 角度调制又可分为#kong()和#kong()。]

#q[14][矩形窗截断会引起谱泄漏。除三角窗和指数窗外, 常用的窗函数还有 #kong()。]

#q[15][滤波器按选频特性可分为 #kong()、#kong()、带通和带阻四类。]

= 计算题（共 50 分）

#q[1][（10 分）求符号函数 $op("sgn")(t)$ 和单位阶跃函数 $u(t)$ 的频谱，并画出频谱图。

  #v(10em)
]

#v(1.5em)
#q[2][
  （10 分）已知 $x(t)$ 的傅里叶变换为 $X(f)$
  #v(1em)
  #sub[1][（5 分）$x(t_0-a t)$，其中 $a>0$。]
  #v(0.5em)
  #sub[2][（5 分）$t^2x(t)$。]
]

#v(10em)
#q[3][（8 分）一条输油管的某处发生泄漏，技术人员已确定泄漏的大致位置，现需通过相关分析确定其确切位置。
  #v(1em)
  #sub[1][画出用于检漏的数字信号处理系统框图。]
  #v(0.5em)
  #sub[2][用文字描述检漏过程，并利用互相关函数的峰值时延推导泄漏距离 $S$ 的求解关系。]
]

#v(10em)

#q[4][（10 分）已知正弦信号 $x(t)=sin(2 pi f_0t)$ 和方波信号 $y(t)$ 的波形如下图所示，其中 $f_0>0$，$T_0=1/f_0$。方波的傅里叶级数展开式为
  $ y(t)=4/pi sum_(m=0)^infinity sin(2 pi (2m+1) f_0t)/(2m+1). $
  #figure(image("assets/sine-square.svg", width: 95%))
  #v(1em)
  #sub[1][求互相关函数 $R_(x y)(tau)$。]
  #v(0.5em)
  #sub[2][求互功率谱 $S_(x y)(f)$，并画出其幅频谱。]
]

#v(10em)

#q[5][（12 分）已知模拟信号 $x(t)$ 及其频谱 $X(f)$ 如下图所示。信号最高频率为 $f_(max)$，采样频率为 $f_s$，记录时长为 $T$，经过数字化和信号处理后得到离散频谱。
  #figure(image("assets/sampling.svg", width: 100%), caption: [模拟信号的时域波形与频谱])
  #v(1em)
  #sub[1][（4 分）用数学关系和频谱图说明 #box[$f_s>2f_(max)$] 的必要性。]
  #v(0.5em)
  #sub[2][（4 分）由采样点数、采样频率与记录时长的关系，推导 #box[$Delta f=1/T$]。]
  #v(0.5em)
  #sub[3][（4 分）写出对连续信号进行数字化处理时会遇到的问题及相应对策。]
]
