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
  title: "第十三章 第2次作业",
  level: "submit",
)

= 13-17
(1)
对轮$D$，
$
          F_s - F_(I) & = 0 \
            F_N - m g & = 0 \
  F_s dot r + M_1 - M & = 0 \
$
$
  F_1 & = m a \
  M_1 & = 1.2 m r^2 alpha
$
解得
$
  F_s & = m a \
  F_N & = m g \
    M & = 3/2 m a r \
$
(2)

由(1)解得
$
  F_s & = m a \
  F_N & = m g \
$
(3)
分析$A B C$
$
                       F_(A x) - F_s ' - F_B sin 45 degree & = 0 \
  - F_N ' dot l/2 + F_s ' dot l + F_B cos 45 degree dot 2l & = 0 \
             F_N ' dot 3/2l + F_s ' dot l - F_(A y) dot 2l & = 0
$
解得
$
  F_(A x) & = 1/4 m g + 1/2 m a \
  F_(A y) & = 3/4 m g + 1/2 m a \
      F_B & = sqrt(2)/4 m g - sqrt(2)/2 m a \
$

#v(10em)
= 13-20
由$v_A$、$v_B$速度均沿水平方向
$
          a_B & = a_A + a_(B A)^tau \
          a_A & = omega_0^2 r \
  a_(B A)^tau & = alpha_(A B) dot 2r \
$
解得
$
  a_(B A)^tau & = (2 sqrt(3))/3 omega_0^2 r \
  alpha_(A B) & = (sqrt(3))/3 omega_0^3 \
          a_B & = (sqrt(3))/3 omega_0^2 r \
$
分析杆$A B$和滑块$B$
$
  F_(I B) = m a_B," "F_(I 1) = 2m a_A," "F_(I 2) =2 m a_(B A)^tau," "M_(I A B) = 1/12 dot 2m (2r)^2
$
由
$
  F_(A z) - F_(I 2) cos 60 degree - F_(I B) -F = 0 \
  (F_N -m g) dot 2r dot cos 30 degree - (F+F_(I B)) dot 2r sin 30 degree - F_(I 2) dot r + F_(I 1) dot r dot sin 60 degree - 2m g dot r dot sin 60 degree - M_(I A B)= 0 \
$
解得
$
  F_(A x) = F + (2 sqrt(3))/3m omega_0^2 r \
$
分析杆$O A$
$
  M_0 - F_(A x) ' dot r = 0
$
所以
$
  M_0 = F r + (2 sqrt(3))/3m omega_0^2 r^2
$
