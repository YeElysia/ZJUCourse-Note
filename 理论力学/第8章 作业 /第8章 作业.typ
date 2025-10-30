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
  title: "第8章 作业",
  level: "submit",
)


== 8-3
基点A的运动方程
$
  phi & = 1/2 alpha t^2 \
  x_A & = (R+r) cos phi = (R+r) cos(1/2 alpha t^2) \
  y_A & = (R+r) sin phi = (R+r) sin(1/2 alpha t^2) \
$

齿轮绕点A的转动方程，设齿轮上一点K
$
               & v_K = v_A + v_(K A) = 0 \
  arrow.double & omega_1 r = alpha t dot (R + r) \
               & omega_1 = alpha t (R + r) / r \
               \
               \
         theta & = integral omega_1 upright(d)t = integral alpha t (R + r) / r upright(d)t = (R + r) / (2r) alpha t^2 \
$
== 8-10
由速度投影定理，杆AB上点A和点B的速度在杆AB上投影相等，即
$
               & v_A cos(pi/2 - gamma) = v_B \
  arrow.double & v_B = omega_(O_1) dot O_1A dot sin gamma = 2.25 sqrt(3) m\/s \
$
所以
$
  omega_(O B) = v_B / (r_1 + r_2) = (2.25 sqrt(3)) / (0.6 sqrt(3)) = 3.75 upright(r a d)\/s \
$
又A B 与 齿轮 II 固结，故
$
  &v_B = v_A + omega_(II) dot A B \
  &v_B - omega_(II) r_1 = omega_(I) r_2 \
  arrow.double & omega_(I) = (v_B - omega_(II) r_1) / r_2 = (2.25 sqrt(3) - 2.25/1.5 dot 0.3 sqrt(3)) / (0.3 sqrt(3)) = 6 upright(r a d)\/s \
$

#v(40em)
== 8-24
显然三角板 A B C 的瞬心为O A 和 O B 的连线交点P
$
  omega_(A B C) & = v_A / (A P) = (omega O A) / (2 O A cos 30 degree) = (2 sqrt(3)) /3 upright(r a d) \/s \
            v_C & = omega_(A B C) dot C P = (2 sqrt(3)) / 3 m\/s \
$
又
$
            v_C & = v_(c) + v_(r) \
  v_c / (O_2 C) & = omega_(O_2 D) \
$
所以
$
  omega_(O_2 D) = sqrt(3) /3 upright(r a d) \/s \
$
== 8-32
$
  v_1 cos theta & = v_2 cos theta + v_(D A) = v_2 cos theta + omega_(A B) dot A D \
    omega_(A B) & = (v_1 - v_2) (cos theta )/ (A D) = ((v_1 - v_2)cos^2 theta)/ (2R) \
$

$
  a_D &= a_e + a_r + a_C = (v_1^2) / R \
  a_C & = 2 omega_e times v_r = 2 ((v_1 - v_2) cos^2 theta) / (2 R) times v_1sin theta = ((v_1 - v_2)^2 cos^2 theta sin theta ) / (R) \
  a_e^t &= a_C -a_D sin theta = ((v_1 - v_2)^2 cos^2 theta sin theta ) / (R) -(v_1^2) / R sin theta \
  alpha_(A B) & = a_e^t / (A D) = ( ((v_1 - v_2)^2 cos^2 theta sin theta ) / (R) -(v_1^2) / R sin theta ) / ((2R)/(cos theta)) = 1/(2R^2) [(v_1-v_2)^2cos^2 theta - v_1^2]sin theta cos theta \
$

== 8-34
设两齿轮啮合点为P，
$
  omega_(A B) = v_A / r = 3 omega_0 ,#h(2em) v_B = omega_(A B) dot P B = 3 sqrt(6) r omega_0 \
$
不会做
