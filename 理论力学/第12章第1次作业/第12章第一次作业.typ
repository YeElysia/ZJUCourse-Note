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
  title: "第十二章 第1次作业",
  level: "submit",
)

= 12-4

$
  T_"车轮" & = 2 times (1/2 m_1v^2 + 1/2 dot 1/2 m_1R^2 (v/R)^2) \
  T_"履带" & = 1/2 times 1/4 m(2v)^2 + 1/2 times 1/2m v^2 + 1/2 times 1/2 m R^2 (v/R)^2 \
         T & = T_"车轮" + T_"履带" = 3/2 m_1 v^2 + m v^2 \
$

= 12-7
$
        T_1 & = 1/2 (1/3P_1/g r^2) dot (v/r)^2 + 1/2 P_2/g v^2 + 1/2 P_3/g v^2 \
        T_2 & = 1/2 (1/3P_2/g r^2) dot (v_1/r)^2 + 1/2 (1/3 P_2/g l^2) (v_1/l)^2 \
  T_2 - T_1 & = M dot pi/2
$
解得
$
  v_1 = sqrt((3pi M g + (P_1+3P_2+3P_3)v^2)/(P_1+P_2))
$
