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
  title: "第十四章 第1次作业",
  level: "submit",
)

= 14-6
弹簧拉力
$
  F = k Delta l = 2000 "N"
$
杆$A B$做平动，因此
$
  v_A = v_B = v_C
$
又
$
  v_C / (C D sin 60 degree) = v_D/(C D cos 60 degree)
$
得
$
  v_D = sqrt(3)/3 v_C
$
由虚功率方程
$
  M_1 dot v_A/(O A) - F dot v_B - M_2 dot v_D/(O_1 D) = 0
$
200 / 0.2 - 2000 - M_2 sqrt(3)/0.45

解得
$
  M_2 = 150 sqrt(3) " N"dot"m"
$
= 14-7
虚功工程
$
  F delta r_D - M delta phi = 0
$
已知
$
  v_B / (l ) = v_D/(2 l sin theta)\
  v_A /display(a / (tan^2 theta)-a) = v_B / display(a / (tan theta dot sin theta))\
  delta r_D = v_D "d"t \
  delta phi = v_A / a "d"t
$
解得
$
  F = M/(a tan 2 theta)
$
