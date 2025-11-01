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
  title: "第七章 第1次作业",
  level: "submit",
)


== 7-10

随凸轮转动，顶杆 $A B$ 的底面距离 $O$ 点的数值距离 $h$ 为
$
  h = R + O C times sin phi = R + e sin omega t
$

则速度为
$
  v = (upright(d) h)/(upright(d) t) = e omega cos omega t
$
当 $phi = omega t = 0$ 时，$v = e omega$ 。

== 7-18
$
  y & = O_1 A times sin omega t = 0.1 sin 2 t \
  v & = (upright(d) y)/(upright(d) t) = 0.2 cos 2 t \
  a & = (upright(d) v)/(upright(d) t) = -0.4 sin 2 t \
$

$phi = 60 degree$时，
$
  v = 0.2 cos pi/3 = 0.1 m\/s\
  a = -0.4 sin pi/3 = -0.346 m\/s^2\
$

== 7-27
$
    x_1 & = 40 m m #h(2em) alpha = 2 upright(r a d) \/s^2 #h(2em) omega_1 = 2 upright(r a d) \/s \
    a_e & = (upright(d)^2 x) / (upright(d)t^2) = 80 m m \/ s^2 \
  a_r^n & = omega_1^2 x_1 sin 60 degree = 138.564 m m \/ s^2 \
  a_r^t & = alpha x_1 sin 60 degree = 69.282 m m \/ s^2 \
    a_c & = 2 omega_e times v_r = 2 omega_1 v_r sin 60 degree = 138.564 m m \/ s^2 \
    a_a & = 355.5 m m \/ s^2 \
$

== 7-31

$
  omega_(A B) & = v/r sin theta tan theta \
  alpha_(A B) & = v^2/r^2 tan^3 theta(1 + cos^2 theta)
$
