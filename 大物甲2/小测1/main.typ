
#import "@local/typsthw:0.1.0": homework

#let question = homework.question
#let answer = homework.answer


#show: homework.style.with(
  course: "大学物理甲 Ⅱ",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "电场小测",
  level: "post",
)

// #show strong: set text(weight: 600)
#set par(leading: 0.8em, spacing: 1.5em)
== 1. * $C_1$和$C_2$两空气电容器串联起来接上电源充电。然后将电源断开，再把一电介质板插入$C_1$中，如图所示。则 *
#box(width: 8cm)[

  A. $C_1$上电势差减小，$C_2$上电势差不变

  B. $C_1$上电势差增大，$C_2$上电势差不变

  C. $C_1$上电势差增大，$C_2$上电势差减小

  D. $C_1$上电势差减小，$C_2$上电势差增大

  #v(2em)
]
#h(1fr)
#box(width: 6cm)[
  #image("1.png", width: 6cm)
]



#answer()[
  A

  【解】
  由电容器的串联关系可知，$C_1$和$C_2$的电荷量相等，即$Q_1=Q_2$。在插入电介质板后，$C_1$的电容增大，电势差减小，而$C_2$的电容不变，电势差不变。因此选A。
]
== 2. 如图所示，一半径为a的“无限长”圆柱面上均匀带电，其电荷线密度为$lambda$。在它外面同轴地套一半径为b的薄金属圆筒，圆筒原先不带电，但与地连接。设地的电势为零，则在内圆柱面里面、距离轴线为r的P点的场强大小和电势分别为：
#box(width: 8cm)[

  A. $E=0, V=display(lambda/(2 pi epsilon_0) ln a/r)$

  B. $E=display(lambda/(2 pi epsilon_0 r)), V=display(lambda/(2 pi epsilon_0) ln b/r)$

  C. $E=display(lambda/(2 pi epsilon_0 r)), V=display(lambda/(2 pi epsilon_0) ln b/a)$

  D. $E=0, V=display(lambda/(2 pi epsilon_0) ln b/a)$

  #v(2em)
]
#h(1fr)
#box(width: 6cm)[
  #image("2.png", width: 6cm)
]


#answer()[
  D

  【解】
  由高斯定律可知，在内圆柱面里面，距离轴线为r的P点的场强为$E=0$。

  在内圆柱面里面，距离轴线为r的P点的电势与内圆柱面表面电势相等，由于外圆筒接地，电势为零，因此
  $
    V_P = V_A=0-integral_b^a E upright(d)r = -lambda/(2 pi epsilon_0)integral_b^a 1/r upright(d)r = lambda/(2 pi epsilon_0) ln b/a
  $
]

== 3. 在电荷为－Q的点电荷A的静电场中，将另一电荷为q的点电荷B从a点移到b点。a、b两点距离点电荷A的距离分别为$r_1$和$r_2$，如图所示。则移动过程中电场力做的功为

#box(width: 8cm)[


  A. $display((-q)/(4 pi epsilon_0) (1/r_1 - 1/r_2))$

  B. $display((-q Q)/(4 pi epsilon_0 (r_2 - r_1)))$

  C. $display((-q Q)/(4 pi epsilon_0) (1/r_1 - 1/r_2))$

  D. $display((q Q)/(4 pi epsilon_0) (1/r_1 - 1/r_2))$

  #v(0em)
]
#h(1fr)
#box(width: 6cm)[
  #image("3.png", width: 6cm)
  #v(3em)
]

#answer()[
  C

  【解】

  点电荷A在空间任意一点P处的电势为$V_P = display((-Q)/(4 pi epsilon_0 r))$，其中r为点P到点电荷A的距离。点电荷B从a点移到b点过程中，电场力做的功为
  $
    W = q (V_a - V_b) = q (display((-Q)/(4 pi epsilon_0 r_1)) - display((-Q)/(4 pi epsilon_0 r_2))) = display((-q Q)/(4 pi epsilon_0) (1/r_1 - 1/r_2))
  $
]

== 4. 三块互相平行的导体板，相互之间的距离$d_1$和$d_2$比板面积线度小得多，外面二板用导线连接。中间板上带电，设左右两面上电荷面密度分别为$sigma_1$和$sigma_2$，如图所示。则比值$display(sigma_1/sigma_2)$为
#box(width: 8cm)[


  A. $display(d_2^2/d_1^2)$

  B. $display(d_2/d_1)$

  C. $display(1)$

  D. $display(d_1/d_2)$

  #v(2em)
]
#h(1fr)
#box(width: 6cm)[
  #image("4.png", width: 4cm)
  #v(0em)
]
#answer()[
  B

  【解】
  左、右两块导体板上电荷面密度分别为$sigma_1$和$sigma_2$，则中间板上电荷面密度为$sigma = sigma_2 - sigma_1$。

  由高斯定律可知，左、右两块导体板产生的场强分别为$E_1 = sigma_1/epsilon_0$和$E_2 = sigma_2/epsilon_0$。

  由于中间板静止不动，故有$E_1 d_1 = E_2 d_2$，即$sigma_1 d_1 = sigma_2 d_2$，从而得出比值$display(sigma_1/sigma_2) = display(d_2/d_1)$。
]
