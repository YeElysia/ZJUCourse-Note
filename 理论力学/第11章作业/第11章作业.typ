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
  course: "理论力学",
  name: "叶畅飞",
  alter: "叶畅飞",
  id: "3240103132",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "第十一章 课程作业",
  level: "submit",
)

= 11-2
(a)
$
  J_A & = 1/2 m R^2 = 0.5 "kg" dot "m"^2 \
  J_O & = J_A + m L_("OA")^2 = 4.5 "kg" dot "m"^2 \
  L_O & = J_O omega = J_O dot w_O = 18 "kg" dot "m"^2\/"s"
$
(b)
$
  L_O = J_O omega_O +J_A omega_r = 20 "kg" dot "m"^2\/"s" \
$
(c)
$
  L_O = J_O omega_O - J_A omega_r = 16 "kg" dot "m"^2\/"s" \
$
= 11-11
由转动微分方程
$
  1/2 m R^2 dot alpha = F dot R \
$
得 $alpha = 20 "rad"\/"s"^2$

又
$
  F_A cos 45 degree + F_B cos 45 degree - m g = 0\
  F_A sin 45 degree - F_B sin 45 degree + F = 0 \
$
解得
$
  F_A = 13.6 "N" \
  F_B = 41.9 "N" \
$
= 11-15
(1)

显然动量矩$L$守恒
$
  J' dot (2 pi n_0) = J' dot 2 pi(n_1+n) + J dot 2 pi n
$
解得 $n=2.94 "r/min"$

(2)
$
  alpha = ("d" omega) / ("d" t) = (2 pi (n_1-n_0)) / 5 = 20pi "rad"\/"s"^2\
  J' dot alpha = F dot R
$
解得 $F = 186.6 "N"$

= 11-21
0.2588
0.9659
$
  v_A & = omega "OA" = omega_"AB" "AB"/(cos 15 degree) \
  v_B & = omega_"AB" "AB" tan 15 degree \
$
解得
$
  v_A = 0.36 pi "m/s", v_B = 0.09 pi "m/s" , omega_("AB") = 1.93 pi "rad"\/"s"\
$

$
  a_B^n + a_B^t = a_A + a_("BA") \
  v_B^2/"BD" + alpha_B dot "BD" = omega^2 dot "OA" + omega_"AB"^2 dot "AB"
$
解得
$
  alpha_B = 177.72 "rad"\/"s"^2 \
  a_B^n = 27.19 "m/s"^2 \
  a_B^t = 0.56 "m/s"^2 \
$
转动微分方程
$
  J_D dot alpha_B = F_"AB" dot "BD" + m g cos 60 degree dot "BD"
$
解得 $F_"AB" = 313.5 "N"$

又
$
  m dot a_B^n & = m g sin 60 degree - F_"Dy" \
  m dot a_B^t & = F_"AB" + F_"Dx" + m g cos 60 degree
$
解得
$
  F_"Dx" = 79.3 "N" \
  F_"Dy" = 90.6 "N" \
$
= 11-24
$
  alpha = (2 phi)/t^2 = pi /90 "rad"\/"s"^2 \
$
由转动微分方程
$
  1/12 m l^2 dot alpha = (F_A + Delta F) dot 0.3"m" - F_B dot 0.3 "m" \
$
解得 $Delta F = 3.49 dot 10^5 "N"$
