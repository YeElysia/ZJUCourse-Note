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
  title: "第十二章 第2次作业",
  level: "submit",
)

= 综-13
(1)
$
  1/2 dot 1/3 m l^2 omega^2 = m g dot l/2 (1 -cos theta) \
  1/3 m l^2 dot alpha = m g dot l/2 cos theta \
$
解得
$
  omega^2 = (3 g (1 - cos theta)) / l \
  alpha = (3 g sin theta) / (2 l)
$
所以
$
  a_C^t = alpha dot l/2 = (3 g sin theta) / 4 \
  a_C^n = omega^2 dot l/2 = (3 g (1 - cos theta)) / 2 \
$
又
$
  m a_C^t cos theta - m a_C^n sin theta = F_(B x) \
  - m a_C^t sin theta - m a_C^n cos theta = F_(B y) - m g
$
解得
$
  F_(B x) = 3/ 4 m g sin theta (3cos theta -2)\
  F_(B y) = 1/4 m g (1 - 3 cos theta)^2 \
$

(2)

当$F_(B x) = 0$时，即
$
  3/4 m g sin theta (3 cos theta -2) = 0 \
$
解得$theta = 48.2 degree$,于是
$
  omega_1 & = g/l \
  v_(C x) & = l/2 omega_1 cos theta = 1/3 sqrt(g l)
$
脱离墙后，因$sum F_x =0$，有$a_(C x)=0$，则$v_(C x) = 1/3sqrt(g l)$

(3)
$
  & v_(C y) = omega_2 dot l/2 \
  & 1/2 m v_C^2 + 1/2 dot 1/12 m l^2 omega_2^2 = m g dot l/2 \
  & v_C^2 = v_(C x)^2 + v_(C y)^2 \
$
解得
$
  omega_2 = 2 sqrt((2g)/(3l)) \
  v_(C) = 1/3 sqrt(7 g l)
$

= 综-21
(1)
$
  1/2 m v_O^2 + 1/2 dot (1/2 m dot 4r^2) omega^2 + 1/2 dot (1/2 m r^2 + m r^2) omega^2 = m g r \
$
解得
$
  omega = 2 sqrt((g)/(15 r)) \
$

(2)
$
  1/2 (1/2 m dot 4 r^2 + 1/4 m r^2) omega^2 + 1/2 dot (1/2 m r^2 + 1/4 m r^2) omega^2 = m g r \
$
解得
$ omega = sqrt((2 g)/(3 r)) \ $
