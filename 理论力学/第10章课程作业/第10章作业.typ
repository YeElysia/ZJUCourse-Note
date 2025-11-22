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
  title: "第10章 作业",
  level: "submit",
)

= 谜语

质心


= 10-6
$
  F_x = q_V rho (v_1 + v_2 cos theta)
$


= 10-11

(1)
由质心坐标公式
$
  x_C & = (P_1x + P_2(l sin omega t +x) + P_3 (2l sin omega t +x ))/(P_1 + P_2 + P_3)=0
$
解得
$
  x = - (P_2 + 2 P_3)/(P_1+P_2+P_3)l sin omega t
$

(2)
若外壳被固定，则
$
  x_C & = (P_2 dot l sin omega t + P_3 dot 2l sin omega t )/(P_1 + P_2 + P_3) \
      & (P_1 + P_2+P_3)/(g) x_C = F_x
$
解得
$
         F_x & = (P_2 + 2 P_3)/(g) omega^2 l sin omega t \
  F_("xmax") & = (P_2 + 2 P_3)/(g) omega^2 l
$

= 10-15
以A的起始点为原点建立坐标系
$
  (m_(A C) dot 35 m m + m_(B C) dot 230 m m)/(m_(A C) + m_(B C)) &= (m_(A C) dot (125m m +x_A) + m_(B C)dot (450 m m + x_A))/(m_(A C) + m_(B C))\
  x_B +x_A &= 650 m m - 390 m m
$

所以
$
  x_A & = - 170 m m \
  x_B & = 90 m m
$
