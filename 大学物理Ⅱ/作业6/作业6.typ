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
  title: "作业6",
  level: "submit",
)

#set enum(numbering: "(1).")

= 15-3
1.
$
  i= V/R = (V_0 sin omega t)/R
$

2.
$
  I_d = (upright(d) Phi_D)/(upright(d) t) = (upright(d))/(upright(d) t)( epsilon_0 dot (V_0 sin omega t)/d dot A ) = (epsilon_0 A V_o omega cos omega t)/d
$

3.
$
  I = i + I_d = (V_0 sin omega t)/R + (epsilon_0 A V_0 omega cos omega t)/d
$
4.
$
  integral.cont_L H dot upright(d) l = i + pi r^2 dot (upright(d) D)/(upright(d) t) \
  H_r = 1/(2pi r) ( (V_0 sin omega t)/R + (epsilon_0 pi r^2 V_0 omega cos omega t)/d )\
  B_r = mu_0 H_r = mu_0/(2pi r) ( (V_0 sin omega t)/R + (epsilon_0 pi r^2 V_0 omega cos omega t)/d )
$
= 15-5
圆平面边缘磁感应强度
$
  B & = (mu_0 q v)/(4pi r^2) sin theta = (mu_0 q v a)/(4pi r^3) \
  H & = B/mu_0 = (q v a)/(4pi r^3)
$
又
$
  integral.cont_L H dot upright(d) l = I + I_d = I_d
$
则
$
  I_d = H dot 2 pi a = (q v a^2)/(2 r^3) = (q v a^2)/(2 (x^2 +a^2)^(3/2))
$

#v(40em)
= 15-8
1.
已知
$
  E/H= sqrt(mu_0/epsilon_0) #h(2em) overline(S) = E times H = 1/2 E_0 H_0 = (E_0^2)/(2 sqrt(mu_0/epsilon_0))
$
所以
$
  E_0 & = sqrt(2 sqrt(mu_0/epsilon_0) overline(S)) = 1.03 times 10^3 V\/m \
  B_0 & = mu_0 H_0 = sqrt(mu_0 epsilon_0) E_0 = 3.42 times 10^(-6) T
$
2.
$
  P = 4 pi r^2 overline(S) =3.96 times 10^26 W
$

= 15-11
1.
$
  f = c/lambda = 10^8 H z
$
2.
$
  B_0 = mu_0 H_0 = sqrt(mu_0 epsilon_0) E_0 = 10^(-6) T
$
3.
$
  omega = 2 pi f = 6.28 times 10^8 r a d \/s \
$
4.
$
    S & = E H = E_0 H_0 cos^2 (omega (t-x/v) + phi) \
  S_0 & = 1/2 E_0 H_0 = 119 W \/ m^2
$
= 15-14
1.
$
  I = 2 pi R L sigma dot omega/(2pi) = R L sigma alpha t \
  B = mu_0 I/(L ) = mu_0 R sigma alpha t
$
2.
$
  E dot 2pi R = - (upright(d) Phi_D)/(upright(d) t) = - (upright(d))/(upright(d)t)(pi R^2 dot B)
$
$ E = (-mu_0 R^2 sigma alpha )/2 $
3.
$
  S = E times H = (mu_0 R^3 sigma^2 alpha^2 t)/(2 )
$
4.
$
  P = integral.cont_S S dot upright(d) A = S dot (2 pi R L) = mu_0 pi R^4 L sigma^2 alpha^2 t\
  (upright(d))/(upright(d)t)((pi R^2 L)/(2mu_0) dot B^2) = 1 /(upright(d)t)(mu_0 R^2 L)/(2 mu_0) dot 2 mu_0 R sigma alpha t dot mu_0 R sigma alpha upright(d) t = mu_0 pi R^4 L sigma^2 alpha^2 t\
$
得证
