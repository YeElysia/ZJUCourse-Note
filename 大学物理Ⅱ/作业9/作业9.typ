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
  course: "大学物理甲II",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "作业9",
  level: "submit",
)

#set enum(numbering: "(1).")

= 18-2
(1)
$
  cos^2 theta & = 1/3 \
        theta & = arccos sqrt(3)/3 \
$
(2)
$
      I & = 1/3 I_0 = 1/2 I_0 cos^2 theta \
  theta & = arccos sqrt(6)/3 \
$
= 18-3
$
  I_max = I_偏 + I_自/2 \
  I_min = I_自/2 \
  I_max = 5 I_min \
$
所以
$
  I_偏 : I_自 = 2 : 1
$
= 18-7
#figure(image("assets/21043f3ca92d69c419789bdd71d9e239.jpg", width: 40%))
$
  sin i = n_e sin 30 degree
  i = arcsin (0.743) = 47.99 degree \
$
= 18-8
#figure(image("assets/ad213a5e503257ae7b62f0e335881d61.jpg", width: 40%))
= 18-9
$
  delta = (n_e - n_o) d = 1/4 lambda \
  d= lambda / (4 (n_e - n_o)) = 1.2 times 10^(-5) m
$
= 18-10
(1)
$
  A_e & = A cos alpha \
  I_0 & = A_0^2 = A^2 sin^2 alpha = I_0/4 \
  I_e & = A_e^2 = A^2 cos^2 alpha = 3 I_0/4 \
$
(2)
$
  Delta phi = (2 pi) /lambda delta = (2 pi)/lambda(n_0-n_e)d = pi/2 \
  d = lambda / (4(n_0 - n_e)) = 8.6 times 10^(-7) m \
$
= 18-11
(1)
$
  Delta phi = (2 pi)/lambda (n_0 - n_e)d + pi \
  d_min = lambda / (n_0 - n_e) = 2.33 times 10^(-6) m \
$
(2)
$
  d_min = lambda / (2(n_0 - n_e)) = 1.16 times 10^(-6) m \
$
= 18-14
$
  I_0 = 2 I
$
