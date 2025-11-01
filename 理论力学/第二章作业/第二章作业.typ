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
  title: "第二章作业",
  level: "submit",
)

== 2-9

对滑块$D$，
$
  F_(B D) cos theta - F = 0
$
对销轴$B$，
$
  F_(B C) cos theta + F_(A B) sin theta - F_(B D) cos theta = 0\
  F_(A B) cos theta - F_(B C) sin theta - F_(B D) sin theta = 0
$
对杆$O A$，
$
  F_(A B) cos theta dot a - M = 0
$
解得，
$
  F_(B D) & = F / (cos theta) \
  F_(A B) & = (2 F sin theta) /(cos 2 theta) \
        M & = (2 a F sin theta cos theta) / (cos 2 theta) = a F tan 2 theta
$

== 2-12
(1)
$
  F_R & = F_1 + F_2 + F_3 + F_4 = 150 N， #h(1em) 方 向 沿 x 轴 负 向 \
  M_0 & = F_2 dot 30 m m + F_3 dot 50 m m - F_4 dot 30 m m - M = - 900 upright(N dot m m) \
$
(2)
显然合力大小为$150 N$，方向沿$x$轴负向。

又$display(d = | M_0 / F_R | = 6 m m)$，所以合力作用线为 $y = -6$。

== 2-39
对杆$C D$上的力矩，
$
  F_(C x) dot a - q dot a dot a / 2 = 0 \
$
对杆$B C$上，
$
  & F_(A B x) - F_(C x) = 0 \
  & F dot a - F_(A B y) dot a + M= 0 \
$
解得销B对杆$A B$的作用力为，
$
  F_(A B x) & = 1/2 q a \
  F_(A B y) & = F + q a \
$

于是销B对杆$B C$的作用力为，
$
  F_(B C x) & = 0 - F_(A B x) = - 1/2 q a \
  F_(B C y) & = F - F_(A B y) = - q a \
$

对杆$A B$上，
$
  & F_(A x) - F_(A B x) - F_(C x) + 1/2 q dot 3a = 0 \
  & F_(A y) - F_(A B y)= 0 \
  & F_(A B x) dot 3 a - F_(A B y) dot a + M_A - 1/2 q dot 3a dot a= 0 \
$

所以，
$
  F_(A x) & = - q a \
  F_(A y) & = q a + F \
      M_A & = q a^2 + F a \
$
