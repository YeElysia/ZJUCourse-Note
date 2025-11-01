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
  title: "作业5",
  level: "submit",
)

== 14-3

b 端电势高
$
  epsilon_(o a b) = epsilon_(o b) = 1/2 B omega (l_(o b))^2 = 5/2 B omega R^2
$

== 14-5

a 端电势高
$
  & B = mu_0 I /(2 pi r) \
  & upright(d) epsilon = v B upright(d)l = (mu_0 I v) /(2 pi) dot 1/x upright(d)x \
  & epsilon = integral_(0.1)^(1) (mu_0 I v)/(2 pi) dot 1/x upright(d)x = (mu_0 I v)/(2 pi) ln 10 = 3.68 times 10^(-6) upright(V)
$
== 14-6

$
  epsilon = 1/2 B omega (L sin theta)^2 = 1/2 B omega L^2 sin^2 theta
$
== 14-7
$
  epsilon & = N (B_1 - B_2) v b \
          & = N dot (mu_0 I)/(2 pi) (1/c - 1/(c+a)) v b \
          & = 6.86 times 10^(-6) upright(V)
$
== 14-9
$
      Phi & = integral_0^a a dot 4 t^2 y upright(d)y = 2 a^3 t^2 \
  epsilon & = - (d Phi)/(d t) = -4 a^3 t \
          & = - 4 dot (0.2)^3 dot 0.25 = -8 times 10^(-3) upright(V)
$
方向顺时针

#v(40em)
== 14-11
取半径为$r$,宽度为$upright(d) r$的圆环元
$
  upright(d) epsilon & = (upright(d B) dot S)/(upright(d)t) = pi r^2 k \
        upright(d) R & = rho (2pi r) / (b dot upright(d) r) \
        upright(d) I & = (upright(d) epsilon) / (upright(d) R) = (k b)/(2 rho) r upright(d) r \
                   I & = integral_0^a (k b)/(2 rho) r upright(d) r = (k b)/(4 rho) a^2
$
== 14-15
(1)
显然$display(epsilon_(a d) = epsilon_(c b) = 0)$,
$
  epsilon_(a b) = epsilon_(Delta o a b ) = (upright(d) B dot S_(Delta o a b))/(upright(d) t) = sqrt(3)/4 R^2 ( upright(d)B)/(upright(d) t) \
  epsilon_(d c) = epsilon_(Delta o d c) = (upright(d) B dot S_(Delta o d c))/(upright(d) t) = sqrt(3)/16 R^2 ( upright(d)B)/(upright(d) t)
$
(2)
$
  epsilon = epsilon_(a b) + epsilon_(b c) + epsilon_(c d) + epsilon_(d a) = (3 sqrt(3))/16 R^2 ( upright(d)B)/(upright(d) t)
$
== 14-17
(1)

单位长度等效电流
$
  I = (omega lambda)/(2 pi) = (beta lambda)/(2 pi) t
$
于是
$
  B = mu_0 I = (mu_0 beta lambda)/(2 pi) t
$
由涡旋电场
$
  2 pi b E = - pi b^2 (upright(d) B)/(upright(d) t) \
$
得
$
  E = - b/2 (mu_0 beta lambda)/(2 pi) = - (mu_0 beta lambda b)/(4 pi) t
$
方向为圆筒旋转方向的反向

(2)
$
  epsilon_(M N) = epsilon_(Delta O M N) =(upright(d) B dot S)/(upright(d) t) = dot (mu_0 beta lambda)/(2 pi)dot a^2 dot arctan(l/(2c))
$
== 14-21
(1)
$
  & B = N dot (mu_0 I) /(2 R) \
  & epsilon = (B dot S)/(Delta t) = 3.14 times 10^(-4) upright(V)
$
(2)
$
  M = (B S)/ I = 1.57 times 10^(-7) upright(H)
$
== 14-23
$
  & B = (mu_0 I) /(2 pi r) \
  & upright(d) Phi = B dot (2sqrt(3))/3h dot ((h-r+a)/h) upright(d) r = (mu_0 I)/(pi) dot (sqrt(3))/3(h - r + a) 1/r upright(d) r \
  & Phi = integral_a^(a+h) upright(d) Phi = (mu_0 I)/(pi) dot (sqrt(3))/3 [(h + a) ln (1+h/a) -h]\
  & M = Phi / I = (mu_0)/(pi) dot (sqrt(3))/3 [(h + a) ln (1+h/a) -h]
$
== 14-25
(1)
$
  & B = (mu_0 I)/(2 pi r) \
  & upright(d) Phi = B dot a upright(d) r = (mu_0 I a)/(2 pi) 1/r upright(d) r \
  & Phi = integral_(1/2a)^(3/2a) upright(d) Phi = (mu_0 I a)/(2 pi) ln 3 \
  & M = Phi / I = (mu_0 a)/(2 pi) ln 3
$
(2)
$
  epsilon = - M (upright(d) I)/(upright(d) t) = - (mu_0 a)/(2 pi) ln 3 dot I_0 omega cos omega t
$
#v(40em)
== 14-26
(1)
若在无限长直导线上通以电流$I$
$
  & B = (mu_0 I)/(2 pi r) \
  & upright(d) Phi = N B dot b upright(d) r = (mu_0 N I b)/(2 pi) 1/r upright(d) r \
  & Phi = integral_(R_1)^(R_2) upright(d) Phi = (mu_0 N I b)/(2 pi) ln (R_2/R_1) \
  & M = Phi / I = (mu_0 N b)/(2 pi) ln (R_2/R_1)
$
所以
$
  epsilon = -M (upright(d) I)/(upright(d) t) = (mu_0 N b)/(2 pi) ln (R_2/R_1) dot I_0 omega sin omega t
$
当$display(omega t = pi /4)$时
$
  epsilon = (mu_0 N b)/(2 pi) ln (R_2/R_1) dot I_0 omega sqrt(2)/2 = 1.46 times 10^(-2) upright(V)
$
