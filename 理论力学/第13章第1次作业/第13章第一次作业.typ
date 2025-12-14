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
  title: "第十三章 第1次作业",
  level: "submit",
)

= 13-6
(1)
$
  F_(l 1) = F_(l 2) = m dot omega^2 l sin phi \
  M - 2 F_(l 1) dot l cos phi = 0 \
  M = k(phi - phi_0) \
$
解得
$
  omega = sqrt((k(phi - phi_0))/(m l^2 sin 2 phi))
$
(2)
$
  F_(A x) + F_(B x) = 0\
  F_(A y) + F_(B y) = 0\
  F_(A z) - 2 m g = 0\
  - F_(B y) dot 2b - F_(l 1) dot 2l cos phi =0\
  F_(B x) = 0\
$
解得
$
  F_(A x) & = 0 \
  F_(A y) & = (m l^2 omega^2 sin 2phi)/(2b) \
  F_(A z) & = 2 m g \
  F_(B x) & = 0 \
  F_(B y) & = - (m l^2 omega^2 sin 2phi)/(2b) \
$
= 13-15
对物块$G$，
$
  m_3 g - F -F_1 =0\
  F_1 = m_3 a\
$
对轮$A$,
$
  - F' dot r_1 + M_1 + F_t dot r_1 = 0\
  M_1 = I alpha = (1/2) m_1 r_1^2 alpha_1
$
对轮$B$,
$
  F_t' dot r_2 - M_2 - F_k dot r_2 = 0\
  M_2 = I alpha = (1/2) m_2 r_2^2 alpha_2
$
又
$
  a = dot.double(x) = alpha_1 r_1 = alpha_2 r_2
$
解得
$
  dot.double(x) + (2 k x)/(m_1 + m_2 + 2 m_3)= 0
$
