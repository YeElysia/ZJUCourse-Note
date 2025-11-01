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
  title: "第三章第一次作业",
  level: "submit",
)

== 3-1
设$A B$与$A^' B$的夹角为$alpha$, $A^' B$与$D^' B$的夹角为$beta$，则有
$
  cos alpha = sqrt(A D^2 + A C^2)/(A B ) = 20/29\
  sin alpha = sqrt(1 - cos^2 alpha) = 21/29 \
  cos beta = (A C)/ (A B cos theta) = 4/5 \
  sin beta = (A D)/ (A B cos theta) = 3/5
$
又
$
  & F_(A B) cos alpha cos beta - F_(A C) = 0 \
  & F_(A B) cos alpha sin beta - F_(A D) = 0 \
  & F_(A B) sin alpha - P = 0
$
解得
$
  & F_(A B) = P / (sin alpha) = 580 upright(N) \
  & F_(A C) = (P cos alpha cos beta)/ (sin alpha) = 320 upright(N) \
  & F_(A D) = (P cos alpha sin beta)/ (sin alpha) = 240 upright(N)
$

== 3-16
已知$tan 20 degree = 0.364$

对轴$A B$,
$
  & F_(t 1) dot D_1 /2 - M_1= 0 \
  & F_(t 1) dot 380 m m + F_(A z) dot 580 m m =0 \
  & F_(r 1) dot 380 m m + F_(A x) dot 580 m m =0 \
  & F_(A x) + F_(r 1) + F_(B x)= 0 \
  & F_(A z) + F_(t 1) + F_(B z) = 0
$
解得
$
  F_(t 1) & = 8712.5 upright(N) #h(2em)  & F_(r 1) & = 3171.4 upright(N) \
  F_(A x) & = -2077.8 upright(N) #h(2em) & F_(A z) & = -5708.2 upright(N) \
  F_(B x) & = -1093.6 upright(N) #h(2em) & F_(B z) & = -3004.3 upright(N)
$
#v(2em)

对轴$C D$,
$
  & F_(t 1)^‘ dot D_2 /2 - F_(t 2) dot D_3 /2 = 0 \
  & F_(C z) dot 580 m m - F_(t 1)^' dot 380 m m - F_(t 2) dot 145 m m =0 \
  & F_(C x) dot 580 m m - F_(r_1)^' dot 380 m m + F_(r_2) dot 145 m m =0 \
  & F_(C x) - F_(r 1)^' + F_(r 2) + F_(D x)= 0 \
  & F_(C z) - F_(t 1)^' - F_(t 2) + F_(D z) = 0
$
解得
$
  F_(t 2) & = 26991.7 upright(N) #h(2em) & F_(r 2) & = 9825.0 upright(N) \
  F_(C x) & = -378.4 upright(N) #h(2em)  & F_(C z) & = 12456.1 upright(N) \
  F_(D x) & = -6275.2 upright(N) #h(2em) & F_(D z) & = 23248.1 upright(N)
$
