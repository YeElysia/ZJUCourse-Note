#import "@local/Typwork-some:0.1.1": homework,styles

#let question = homework.question
#let answer = homework.answer

#let level = sys.inputs.at("level", default: "post"); //报告等级 the level of the report

/*
  level: "post" | "submit"
  post: 显示昵称并隐藏学号 show nickname and hide student ID
  submit: 显示真名和学号 show real name and student ID
*/
#show heading: it => {
  text(blue)[#it]
}
#show: styles.work.with(
  course: "大学物理Ⅱ",
  name: "叶畅飞",
  alter: "叶畅飞",
  id: "3240103132",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "作业2",
  level: "submit",
)
#set enum(numbering: "1)")
= 10-6
(1)
#align(center)[
  $
    E = cases(
      (Q+q)/(4 pi epsilon_0 r^2) #h(2em)  r > R_3,
      q/(4 pi epsilon_0 r^2) #h(2em)  R_1 < r < R_2,
      0 #h(2em)  
    )\
  $
  $
    U_1 &= (Q+q)/(4 pi epsilon_0 R_3) + q/(4 pi epsilon_0) (1/R_1 - 1/R_2)\
    U_2 &= (Q+q)/(4 pi epsilon_0 R_3)\
  $
]
(2)
若用导线将两个导体球连接，则电荷将全部分布在球壳外表面：
#align(center)[
  $
    U_1 = U_2 = (Q+q)/(4 pi epsilon_0 R_3)
  $
]
(3)
内球接地则 $U_1 = 0$，此时设内球电荷为 $q'$，则有：
#align(center)[
  $
     U_1 &= (Q+q')/(4 pi epsilon_0 R_3) + q'/(4 pi epsilon_0) (1/R_1 - 1/R_2) = 0 \
     arrow.double q' &= (Q R_1 R_2) / (R_1 R_2 + R_2 R_3 - R_1 R_3)
  $
  #v(1em)
  $
    U_2 &= - integral_(R_1)^(R_2) q'/(4 pi epsilon_0 r^2) d r = q'/(4 pi epsilon_0)(1/R_1 - 1/R_2)\
     &= (Q (R_2 - R_1)) / (4 pi epsilon_0 (R_1 R_2 + R_2 R_3 - R_1 R_3))
  $
]

= 10-11
(1)

$U_1 = display(q_1 / (4 pi epsilon_0 a))$，$U_2 = display(q_2 / (4 pi epsilon_0 b))$，两球由细导线相连可知 $U_1 = U_2$ 且 $q_1 + q_2 = Q$，于是有：
#align(center)[
  $
    q_1 = (a Q) / (a + b) #h(2em)  q_2 = (b Q) / (a + b)
  $
]

(2)
#align(center)[
  $
    C = Q / U_1 = 4 pi epsilon_0 (a + b)
  $
]

#pagebreak()
= 10-13

设 A 的电荷线密度为 $lambda$， B 的电荷线密度为 $-lambda$，则AB间距AB间距为 $x$ 处的电场强度为：
$
  E &= lambda/(2 pi epsilon_0 x) + lambda/(2 pi epsilon_0 (d - x)) = (lambda d)/(2 pi epsilon_0 x (d - x)) \ 

  U_(A B) &= integral_(r)^(d-r) E upright(d) x = (lambda)/(2 pi epsilon_0) integral_(r)^(d-r) (1/x + 1/(d-x)) upright(d) x\
  &= lambda/(pi epsilon_0) ln((d - r)/r) approx lambda/(pi epsilon_0) ln(d/r) \

  C &= lambda/U_(A B) = (pi epsilon_0)/(ln(d/r))
$

= 10-14
设内球电荷为 $q$，则有：
$
  U = integral_(b)^(a) (q/(4 pi epsilon_0 r^2)) upright(d) r = q/(4 pi epsilon_0) (1/a - 1/b) \
$

内球表面附近的电场强度为：
$
  E = q/(4 pi epsilon_0 a^2) = U/(a(1 - a/b))
$
显然，$a =display(b/2)$ 时，$E$ 取最小值 $E = display((4U)/b)$。

= 10-15
$epsilon_0 = 8.85 times 10^(-12) C^2\/(N m^2)$

(1)
$
  E &= U / d = 5 times 10^ 3V\/m\
  D_1 &= epsilon_0 epsilon_(r 1) E = 1.77 times 10^(-7) C\/m^2\
  D_2 &= epsilon_0 epsilon_(r 2) E = 2.655 times 10^(-7) C\/m^2\
$
(2) 
由(1)可知，$E = 5 times 10^ 3V\/m$

(3) 
$
  P_1 = epsilon_0 (epsilon_(r 1) - 1) E = 1.3275 times 10^(-7) C\/m^2\
  P_2 = epsilon_0 (epsilon_(r 2) - 1) E = 2.2125 times 10^(-7) C\/m^2\
$

#pagebreak()

= 10-18

设两圆柱导体沿轴线方向上的单位长度的电荷量为 $lambda$，则有：

$
  D = lambda/(2 pi r) #h(2em) E = D/epsilon=  lambda/(2 pi epsilon r) \
$
则最大电场强度出现在 $r = R_1$ 处，于是$lambda_M = 2 pi epsilon R_1 E_M$

于是：
$
  U_M &= integral_(R_1)^(R_2) E upright(d) r = lambda_M/(2 pi epsilon) ln(R_2/R_1) = R_1 E_M ln(R_2/R_1) \
  & = 2c m times 2 times 10^5 V\/c m times ln 2 = 2.77 times 10^5 V
$

= 10-19
(1)

$r < R, D = 0 ,E = 0$

$R < r < a , D = display(lambda/(4 pi r^2)), E = display(D/epsilon = lambda/(4 pi epsilon_0 r^2))$

$a < r < b , D = display(lambda/(4 pi r^2)), E = display(D/epsilon = lambda/(4 pi epsilon_0 epsilon_r r ^2))$

$r > a , D = display(lambda/(4 pi r^2)), E = display(D/epsilon = lambda/(4 pi epsilon_0 r^2))$

(2) 
$
  P = D - epsilon_0 E = lambda/(4 pi r^2)(1-1/epsilon_r )
$

#align(center)[
  介电质内表面$sigma'_a = display(lambda/(4 pi a^2)(1-1/epsilon_r))$, 介电质外表面$sigma'_b = display(lambda/(4 pi b^2)(1-1/epsilon_r))$
]
= 10-23
(1 )
设平行板电容器的电荷面密度为 $sigma$，则有 $D = sigma$，$E = display(D/epsilon)$，因此：

$
  U &= E_1 d_1 + E_2 d_2 = sigma/(epsilon_0 epsilon_(r 1))d_1 + sigma/(epsilon_0 epsilon_(r 2))d_2 \
  arrow.double sigma &=8.85 times 10^(-7) C \/m^2 = DD

$
于是 
$
  omega_1 = 1/2 D E_1 = sigma^2/(2epsilon_0 epsilon_(r 1))= 1.10625 times 10^(-2) J\/m^2\
  omega_2 = 1/2 D E_2 = sigma^2/(2epsilon_0 epsilon_(r 2))= 2.2125 times 10^(-2) J\/m^2  
$

(2) 
$
  W_1 = omega_1 S d_1 = 8.85 times 10^(-8) J \ 
  W_2 = omega_2 S d_2 = 2.655 times 10^(-7) J 
$
= 10-26
$
  D = lambda/(2 pi r) #h(2em) E = D/epsilon=  lambda/(2 pi epsilon r) \
  omega = 1/2 D E = lambda^2 / (8 epsilon_0 epsilon_r pi^2 r^2 )
$
$
  W = integral_a^b omega dot 2pi r upright(d)r = lambda^2 / (4 pi epsilon_0 epsilon_r) ln(b/a)
$
= 10-28
(1)

金属板抽出前$C_1 = display((epsilon_0 S)/(d-t))$，抽出后$C_2 = display((epsilon_0 S)/d)$，外力做功： 
$
  A &= W_2 -W_1 = 1/2 Q^2/C_2 - 1/2 Q^2/C_1 = (epsilon_0 S t U_1^2)/(2(d-t)^2) \ 
    &= (8.85 times 10^(-12) C^2\/(N m^2) times 3 times 10^(-2) m times 10^(-3)m times (600 V)^2)/(2times (3 times 10^(-3)m - 10^(-3)m)^2) \
    &= 1.19475 times 10^(-5) J 
$

(2)
$
  E &=  sigma / (2 epsilon_0) #h(2em) Q = (epsilon_0 S)/ ( d-t) U_1\
  F &= E Q = (epsilon_0 S U_1^2)/(2(d-t)^2)
$