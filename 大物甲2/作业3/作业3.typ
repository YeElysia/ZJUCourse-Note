#import "@local/Typwork-some:0.1.1": homework, styles

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
  course: "大学物理甲II",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "作业3",
  level: "submit",
)


== 11-1
由
$
                 I = e nu & = e v/ (2 pi r) \
  e^2/ (4 pi epsilon_0 r) & = m v^2/2
$
解得
$
  I = e^2/ (2pi sqrt(4 pi epsilon_0 m r^3)) = 1.05 times 10^(-3) A
$
== 11-4

(1)

$
  j_(A l) = (4 I) /(pi d_1^2) = 2.6 times 10^5 upright(A)\/upright(m)^2\
  j_(C u ) = (4 I) /(pi d_2^2) = 5.1 times 10^5 upright(A)\/upright(m)^2
$

(2)

$
  v_d = j /(n e) = (j_(C u ) M)/ (e N_A rho) = 3.65 times 10^(-5) upright(m)\/upright(s)
$

== 12-3
(1)

$
  B_P = (mu_0 I) /(4 pi a) (cos theta_1 - cos theta_2) = (mu_0 I) /(4 pi a) ((L/2) / sqrt(a^2 + L^2/4) + (L/2) / sqrt(a^2 + L^2/4)) = (mu_0 I L) /(2 pi a sqrt(4a^2 + L^2))
$

(2)

$
  B_Q = (mu_0 I) /(4 pi a) (cos theta_1 - cos theta_2) = (mu_0 I) /(4 pi a ) (L/ sqrt(a^2 + L^2) - 0 ) = (mu_0 I L) /(4 pi a sqrt(a^2 + L^2))
$

== 12-8

$
  upright(d) I &= I /(pi R) dot R upright(d) theta = I/pi upright(d) theta \
  upright(d) B &= (mu_0 upright(d) I) /(2 pi R) = (mu_0 I)/(2 pi^2 R) upright(d) theta\
  B &= integral_0^(pi) upright(d)B_x = integral_0^(pi) (mu_0 I)/(2 pi^2 R) sin theta upright(d) theta = (mu_0 I)/( pi^2 R) = 6.37 times 10^(-5) T
$

== 12-9
取半径为$rho$, 径向宽度为 $upright(d) rho$的同心圆电流元
$
  upright(d) I = (N I)/(R-r) dot upright(d) rho
$
其在圆心处产生的磁场为
$
  upright(d) B = (mu_0 upright(d) I) /(2 rho) = (mu_0 N I)/(2 (R-r)) dot (upright(d) rho) / rho
$
则
$
  B = integral_r^(R) upright(d) B = (mu_0 N I)/(2 (R-r)) integral_r^(R) (upright(d) rho) / rho = (mu_0 N I)/(2 (R-r)) ln R/r
$
== 12-11
取半径为$r$, 径向宽度为 $upright(d) r$的同心圆
$
  upright(d) q = sigma dot 2pi r upright(d)r \
  upright(d) I = (omega r)/(2pi r) dot upright(d) q
$
其在点P处产生的磁场为
$
  upright(d) B = (mu_0 upright(d) I r^2) /(2 (r^2 + x^2)^(3/2))
$
则
$
  B = integral_0^(a) upright(d) B_x = (mu_0 omega sigma)/2 integral_0^(a) (r^3)/(r^2 + x^2)^(3/2) upright(d) r = (mu_0 omega sigma)/2 ((2x^2 + a^2)/sqrt(a^2 + x^2) - 2x)
$
== 12-13
取无限长直电流元
$
  upright(d) I = I/(a sin theta) upright(d) r\
  upright(d) B = (mu_0 upright(d) I)/(2 pi r)\
  B = integral_(a sin theta)^(2a sin theta) upright(d) B = integral_(a sin theta)^(2a sin theta) (mu_0 I)/(2 pi a) (upright(d) r)/r = (mu_0 I)/(2 pi a) ln 2
$
== 12-16

$
  integral.cont_L B dot upright(d) l = mu_0 sum I\
  B dot 2 pi r = mu_0 I/(pi R^2) pi r^2 arrow.double B = (mu_0 I r)/(2 pi R^2)
$
在S上取宽度为$upright(d) r$，长为$l$的平行轴线元
$
  upright(d) S = l dot upright(d) r , #h(2em) d Phi= B upright(d) S\
  S = integral_0^(R) B upright(d) S = integral_0^R (mu_0 I l)/(2 pi R^2) r upright(d) r = (mu_0 I l)/(4 pi)
$
== 12-17
(1)
$
  B_1 dot 2 pi r = mu_0 I/(pi a^2) dot pi r^2 arrow.double B_1 = (mu_0 I r)/(2 pi a^2)
$

(2)
$
  B_2 dot 2 pi r = mu_0 I arrow.double B_2 = (mu_0 I)/(2 pi r)
$

(3)
$
  B_3 dot 2 pi r = mu_0 [I - I /(pi (c^2-b^2) dot pi (r^2 - b^2)) ] arrow.double B_3 = (mu_0 I)/(2 pi) (1/r - (r^2 - b^2)/(c^2 - b^2) )
$

(4)
$
  B_4 dot 2 pi r = 0 arrow.double B_4 = 0
$
== 12-20

$
  &integral.cont B dot upright(d) l = mu_0 sum I\
  &B dot overline(a b) + B dot overline(b c) cos 90 degree + B dot overline(c d) + B dot overline(d a) cos 90 degree = mu_0 j overline(a b)\
  arrow.double &B = (mu_0 j)/2
$
于是
$
  B_P = B_1 - B_2 = (mu_0 j_1)/2 - (mu_0 j_2)/2 \
  B_Q = B_1 + B_2 = (mu_0 j_1)/2 + (mu_0 j_2)/2
$
== 12-26

$
  upright(d) I &= upright(d) x bold(i) + upright(d) y bold(j), #h(2em) B = (mu_0 I)/(2 pi x) bold(k)\
  upright(d) F &= I_2 upright(d) l times B = - (mu_0 I_1 I_2)/(2 pi x) upright(d) y bold(i) + (mu_0 I_1 I_2)/(2 pi x) upright(d) x bold(j) \
  F_(A B) &= integral upright(d) F_x = integral_0^a - (mu_0 I_1 I_2)/(2 pi (b -sqrt(3)/6a) upright(d) y) = - (mu_0 I_1 I_2 a)/(2 pi (b -sqrt(3)/6a)) \
$
AC 与 BC 在y方向的分力相互抵消，在x方向的分力相加，得到
$
  F_x = 2 integral upright(d) F_x = integral_(a/2)^0 - (mu_0 I_1 I_2)/(2 pi （b + sqrt(3)/3 a - sqrt(3)y)) upright(d) y = (mu_0 I_1 I_2)/(pi sqrt(3)) ln ((b + sqrt(3)/3 a)/(b - sqrt(3)/6 a))
$

$
  F = F_(A B) + F_x = (mu_0 I_1 I_2)/(pi sqrt(3)) ln ((b + sqrt(3)/3 a)/(b - sqrt(3)/6 a)) - (mu_0 I_1 I_2 a)/(2 pi (b -sqrt(3)/6a))
$

== 12-28

$
  M_磁 & = P_m B sin theta = N I l 2 R B sin theta \
  M_重 & = m g R sin theta \
  M_磁 & = M_重 \
     I & = 2.45A
$
== 12-30

(1)
$
  B_p = 1/2 (mu_0 I)/(2a) + 1/2 (mu_0 I)/(2b) = (mu_0 I)/4 (a+b)/(a b)
$

(2)
$
  P_m = 1/2 pi a^2 I + 1/2 pi b^2 I = 1/2 pi I (a^2 + b^2) \
$
== 12-31
$
           sigma & = q/(pi (R_2^2-R_1^2)) \
    upright(d) I & = upright(d) q dot n omega sigma r upright(d) r \
  upright(d) P_m & = S upright(d) I = pi omega sigma r^3 upright(d) r \
             P_m & = integral_(R_1)^(R_2) upright(d) P_m = (omega q)/4 (R_1^2 + R_2^2) \
               M & = P_m B sin a=(omega q B)/4 (R_1^2 + R_2^2) sin a
$
