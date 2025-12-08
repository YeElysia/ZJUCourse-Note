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
  title: "第十一章 第2次作业",
  level: "submit",
)

= 11-27
可知
$
  a_C = a_A + a_(C A)^t + a_(C A)^n \
  a_(C A)^n = omega_B^2 dot l = 0 \
  a_(C A)^t = alpha_(A B) dot l/2
$
则
$
  a_(C x) & = a_A dot cos 30 degree, \
  a_(C y) & = - a_A dot sin 30 degree - a_(C A)^t
$
又
$
  1/12 P/g l^2 dot alpha_(A B) = F_N sin 60 degree dot l/2\
  P/g a_(C x) = F_N cos 60 degree\
  P/g a_(C y) = F_N sin 60 degree - P
$
解得
$
  alpha_(A B) & = (18g)/(13l) " rad/s"^2, \
          F_N & = (2sqrt(3))/13 P
$
= 11-31
(1)
$
                m_B a_B & = F - F_s \
                m_A a_A & = F_T - F_s \
  m_A rho^2 dot alpha_A & = F_s dot R - F_T dot r \
                    a_A & = alpha_A dot r \
                    a_B & = alpha_A dot R - a_A
$
解得
$
  alpha_A & = 25/9 " rad/s"^2 \
      F_T & = 1500/9 N \
$
// a_A 等于绳子的加速度
#v(10em)
(2)
$
  phi = 1/2 alpha_A t^2 = 625/18 " rad"
$
