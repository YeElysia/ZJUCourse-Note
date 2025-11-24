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
  title: "作业7",
  level: "submit",
)

#set enum(numbering: "(1).")

= 19-3
(1)
若选择平面侧为入射侧，
$
  1/f = (n-1)(1/R_1 - 1/R_2) = (1.2-1)(1/infinity - (-1/(57.1m m)))
$
$ f = 285.5 m m $
(2)
$
  1/S + 1/S' = 1/f
$
$ S' = -60.6 m m $
虚像，在透镜左侧60.6mm处

= 19-6
放大率
$
  M = m times m_theta = - (23.0c m -2c m )/(1 c m ) times (25 c m)/(2 c m) = - 262.5
$
物距
$
  1/S_1 + 1/S_1' = 1/S_1 + 1/(23.0c m -2c m ) = 1/f_1 \
  S_1 = 1.05 c m
$
取$m = display(S_1'/S_1)$，则 $M = 250$


= 16-2

$
  Delta delta = (n_2-n_1) e = 7 lambda\
  e =( 7 lambda )/(n_2-n_1) = 1.75 times 10^(-5)m
$

= 16-3
(1)
$
  Delta delta = (n-1) l + (S S_2 - S S_1) = 7/2 lambda \
  l = (4 lambda)/(n-1) = 4 times 10^(-6)m
$
#v(40em)
(2)
$
  0 = (n-1) l + (S S_2 - S S_1) + d/D dot x\
  x = - D/d dot (7 lambda)/2 = - 2.5 times 10^(-3)m
$
(3)
$
  plus.minus 2 lambda = (n-1) l + (S S_2 - S S_1) + d/D dot x_1\
$
$
  x_1 = - D/d dot (11 lambda)/2 = - 3.9 times 10^(-3)m \
  x_1' = - D/d dot (3 lambda)/2 = - 1.1 times 10^(-3)m
$


= 16-5
$
  lambda = A C dot (1- cos 2 theta) + lambda /2 \
  A C = h /(sin theta)
$
所以  $theta = arcsin display((4 lambda )/ h)$

= 16-6
$
  2n d = k lambda_1 \
  2n d = (k+1/2) lambda_2 \
$
所以$k = 3$, $d = display((3 lambda_1)/(2n)) = 7.9 times 10^(-7)m$

= 16-9
(1)

明暗相间的平行条纹

(2)
$
  2 n e =(k + 1/2) lambda \
  e_max = display(((7 + 1/2) lambda)/(2 n)) = 1.69 times 10^(-6)m
$
#v(10em)
= 16-10
(1)
#image("image.jpg", width: 30%)

(2)

$n_4$边，
$
  2n_4 e + 1/2 lambda = (10 + 1/2 ) lambda \
  r = sqrt(2e R) = 1.9 times 10^(-3)m
  \ \ \
  2 n_3 e' = (9 + 1/2 ) lambda \
  r' = sqrt(2 e' R) = 1.8 times 10^(-3)m
$

= 16-15
$
  2(n-1)l = 100 lambda\
  n =1.0002945
$

= 16-19
$
  L_c = display(lambda^2)/(Delta lambda) = 5 times 10^(-3)m\
  2n e < L_c \
  e_max = 1.9 times 10^(-3)m
$
