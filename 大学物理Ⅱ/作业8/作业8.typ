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
  title: "作业8",
  level: "submit",
)

#set enum(numbering: "(1).")

= 17-3
紫黄色

= 17-6
1.
$
  k_"max" = d/lambda lambda/a = 5
$
9条

2.
$
  Delta x = f/d lambda = 2.4 times 10^(-3) m
$

= 17-11
1.
$
  d & = lambda/(sin theta_1) = 1.028 times 10^(-6) m
$
2.
$
  lambda' = d sin theta_1 ' = 4.667 10^(-7) m \
  k_max= (d sin 90 degree)/lambda' = 2.2
$
第2级
= 17-12
1.
$
  d = (k lambda)/(sin theta) = 6.0 times 10^(-6) m
$
2.
$
  a sin theta= lambda \
  d sin theta = 4 lambda\
$
所以$a = d/4 = 1.5 times 10^(-6) m$

3.
$
  k_max = (d sin 90 degree)/lambda = 10
$
$0,plus.minus. 1,plus.minus. 2,plus.minus. 3plus.minus. 5,plus.minus. 6,plus.minus. 7plus.minus. 9$
= 17-13
$
  d /a & = k/(k') \
     k & = d/a k' = 3/2 k'
$
所以$k= 3,6,9 dots.c$时缺级
= 17-17
$
  d & = (2 lambda)/(sin 30 degree) = 2.4 times 10^(-6) m \
  R & = lambda/(Delta lambda) = N k \
  N & = lambda/(k Delta lambda) = 6000
$
$k=3$ 时$lambda = 400 n m$,可知缺级，故
$
  a = d /3 = 8.0 times 10^(-7) m
$
两缝间距$ b= d - a = 1.6 times 10^(-6) m $
= 17-19
$
  theta_min & = 1.22 lambda/D = (Delta x)/l \
          l & = 6.7 times 10^3 m \
$
= 17-21
$
  lambda & = (2d sin theta)/k \
$
取$k = 1,2,3,4,5$,验证得$lambda = 0.130"nm"$和$lambda=0.097 "nm"$满足
