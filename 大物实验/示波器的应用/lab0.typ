#import "../ReportTemplate/phylab.typ": phylab, three_line_table

#show: phylab.with(
  name: "示波器的应用",
  instructor: "殷立明",
  desk-id: "14",
  class: "机械2402",
  author: "叶畅飞",
  author-id: "3240103132",
  date: datetime(year: 2025, month: 11, day: 4),
  week: "第4周",
  am-pm: "下午",
)

// 此处填写正文，如：

= 预习测试（10分）
#text(gray)[上课前到学在浙大上完成，注意测试仅1次机会。期末时测试分数会与报告其他部分的分数进行加和处理。]

= 原始数据（20分）
// *（将有老师签名的“自备数据记录草稿纸”的扫描或手机拍摄图粘贴在下方，完整保留姓名，学号，教师签字和日期。）
#align(center)[#image("原始数据.jpg", width: 90%)]

= 结果与分析（60分）

== 数据处理与结果（30分）
// *（列出数据表格、选择适合的数据处理方法、写出测量或计算结果。）
#set enum(numbering: "(1)")
1. 用比较法验证 $f_y = n times f_x$
  #figure(
    three_line_table((
      ([波形个数$n$], [信号频率$f_y (upright(H z))$], [测得的扫描频率$f_x (upright(H z))$]),
      ([1], [201.100], [201.100]),
      ([2], [401.400], [200.700]),
      ([3], [603.600], [201.200]),
      ([4], [804.200], [201.050]),
      ([5], [1004.400], [200.880]),
      ([6], [1203.200], [200.533]),
    )),
    kind: table,
    caption: [实验1数据],
  )
  最终结果：$overline(f_x) = 200.910 upright(H z)$

  相对误差：$display(E = 0.4%)$

  因此： $f_x = (200.91 plus.minus 0.10) upright(H z)$

#v(1em)
2. 用李萨如图形测量未知信号的频率

信号发生器背后输出的 $~50 upright(H z)$ 的电压，作为$f_y$
#figure(
  kind: table,
  caption: [实验2数据],
)[#set text(size: 11pt)
  #three_line_table((
    (
      [频率比$f_y : f_x$],
      [图形],
      [垂直交点数$N_y$],
      [水平交点数$N_x$],
      [读出$f_x \/ upright(H z)$],
      [计算$f_y \/ upright(H z)$],
    ),
    ([1:1], [见下图1], [2], [2], [49.970], [49.970]),
    ([1:2], [见下图2], [4], [2], [100.191], [50.096]),
    ([1:3], [见下图3], [6], [2], [150.252], [50.084]),
    ([2:1], [见下图4], [2], [4], [25.016], [50.032]),
    ([2:3], [见下图5], [6], [4], [75.051], [50.034]),
    ([3:1], [见下图6], [2], [6], [16.668], [50.004]),
  ))
]
最终结果：$overline(f_y) = 50.037 upright(H z)$

相对误差：$display(E = 0.07%)$

因此： $f_y = (50.037 plus.minus 0.019) upright(H z)$

#v(40em)
李萨如图图片6张依次附上:

#box()[#figure(image("lsr1.jpg", width: 30%), caption: [1:1])]
#box()[#figure(image("lsr2.jpg", width: 30%), caption: [1:2])]
#box()[#figure(image("lsr3.jpg", width: 30%), caption: [1:3])]

#box()[#figure(image("lsr4.jpg", width: 30%), caption: [2:1])]
#box()[#figure(image("lsr5.jpg", width: 30%), caption: [2:3])]
#box()[#figure(image("lsr6.jpg", width: 30%), caption: [3:1])]

#v(1em)
3. 二极管正向导通电压的测量
光标法测量结果:
#figure(
  three_line_table((
    ([输入电压的峰-峰值$upright(U_(1P-P))$], [输出半波电压的峰值$upright(U_(2P))$], [正向导通电压$upright(U_(导 通))$]),
    ([4.76$upright(V)$], [1.760$upright(V)$], [0.62$upright(V)$]),
    ([9.52$upright(V)$], [4.00$upright(V)$], [0.76$upright(V)$]),
  )),
  kind: table,
  caption: [实验3数据],
)
$upright(U_(导 通) = display(1/2) U_(1P-P) - U_(2P))$

$overline(U_(导 通)) = 0.69 upright(V)$

#v(5em)
4. RC 电路输入输出波形相位差的测量
光标法测量结果：

实验参数：$R = 750 upright(Omega)$，$C = 0.47 upright(mu F)$，$f = 1 upright(k H z)$
#figure(
  three_line_table((
    ([波形时间差$Delta t (upright(mu s))$], [周期$T (upright(mu s))$], [相位差$Delta phi (upright(degree))$]),
    ([184], [1000], [66.2]),
  )),
  kind: table,
  caption: [实验4-1数据],
)

$Delta phi = display(frac(Delta t, T) times 360 degree) = 66.2 degree$

#v(1em)
实验参数：$R = 750 upright(Omega)$，$C = 0.47 upright(mu F)$，$f = 2 upright(k H z)$
#figure(
  three_line_table((
    ([波形时间差$Delta t (upright(mu s))$], [周期$T (upright(mu s))$], [相位差$Delta phi (upright(degree))$]),
    ([104], [500], [74.9]),
  )),
  kind: table,
  caption: [实验4-2数据],
)
$Delta phi = display(frac(Delta t, T) times 360 degree) = 74.9 degree$

#v(3em)
== 误差分析（20分）
#set math.equation(numbering: none, supplement: [方程])
// *（运用测量误差、相对误差或不确定度等分析实验结果，写出完整的结果表达式，并分析误差原因。）
(1)
$
  overline(f_x) & = 1/6 sum_(i=1)^6 f_(x_i) = 200.910 upright(H z) \
              E & = (|overline(f_x) -200upright(H z)|)/ (200upright(H z)) times 100% = 0.4% \
            u_A & = sqrt(1/ (6 times 5)sum_(i=1)^6 (f_(x_i) - overline(f_x))^2) = 0.10 upright(H z) \
$
(2)
$
  overline(f_y) & = 1/6 sum_(i=1)^6 f_(y_i) = 50.037 upright(H z) \
              E & = (|overline(f_y) -50upright(H z)|)/ (50upright(H z)) times 100% = 0.07% \
            u_A & = sqrt(1/ (6 times 5)sum_(i=1)^6 (f_(y_i) - overline(f_y))^2) = 0.019 upright(H z) \
$
#v(3em)
误差原因分析：
1. 示波器屏幕显示的波形存在视觉宽度，导致读数误差。
2. 信号发生器精度有限，调节李萨如图形时难以达到理想状态。有时稳定后图形又会发生缓慢翻转。
3. 仪器信号精度有限，且调节值与实际输出值存在偏差。
== 实验探讨（10分）
// *（对实验内容、现象和过程的小结，不超过100字。）
通过本次实验，掌握了示波器的基本使用方法及其在测量频率、电压和相位差等方面的应用。了解了李萨如图形的形成原理及其在频率测量中的作用，提高了数据处理和误差分析的能力。


= 思考题（10分）
// *（解答教材或讲义或老师布置的思考题，请先写题干，再作答。）
#set enum(numbering: "1、")
1. 示波器的工作原理，CRT的工作原理
示波器通过电子束在荧光屏上扫描形成波形图像。CRT（阴极射线管）通过加热阴极释放电子，电子在电场和磁场的作用下偏转，最终击中荧光屏形成可见光点，显示电信号的变化。

2. 何谓“直读法”“光标法”测量电压和周期
直读法是通过示波器屏幕上直接读取格数来测量电压。光标法则是利用示波器的光标功能，手动调整光标位置以测量波形的时间间隔，从而在仪器上显示周期和频率。

3. 示波器扫描信号的特征
示波器的扫描信号通常为锯齿波或三角波，能够提供稳定的水平扫描，使电子束在荧光屏上均匀移动，从而准确显示输入信号的波形。

4. 示波器呈现稳定波形的机理？触发同步的理解
示波器通过触发电路检测输入信号的特定点（如上升沿或下降沿），在该点启动扫描，从而实现波形的稳定显示。触发同步确保每次扫描从相同的信号状态开始，避免波形漂移。

5. 有哪些方法可以检测示波器扫描时基的准确度
可以通过输入已知频率的信号源，观察示波器显示的周期与实际周期是否一致，来检测扫描时基的准确度。此外，还可以使用频率计或校准信号源进行对比测量。

6. 何谓李萨如图，什么情况下示波器可以观察到稳定的李萨如图？
李萨如图是由两个正交输入信号在示波器上形成的闭合曲线图形。当两个信号的频率成整数比且相位关系稳定时，示波器可以显示出稳定的李萨如图形。

7. 李萨如图测量未知信号频率的原理
李萨如图测量未知信号频率的原理基于两个正交输入信号的频率比。当已知一个信号的频率时，通过观察李萨如图形的形状和交点数，可以确定另一个信号的频率。
// *- 注意事项：
// *+ 用PDF格式上传“实验报告”，文件名：学生姓名+学号+实验名称+周次。
// *+ “实验报告”必须递交在“学在浙大”本课程内对应实验项目的“作业”模块内。
// *+ “实验报告”成绩必须在“浙江大学物理实验教学中心网站”-“选课系统”内查询。
// *+ 教学评价必须在“浙江大学物理实验教学中心网站”-“选课系统”内进行，学生必须进行教学评价，才能看到实验报告成绩，教学评价须在本次实验结束后3天内进行。
