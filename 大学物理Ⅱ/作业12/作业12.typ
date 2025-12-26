#import "@local/Typwork-some:0.1.1": homework, styles
#import "@preview/cetz:0.4.2"

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
  title: "作业12",
  level: "submit",
)

#set enum(numbering: "(1).")

= 22-2

(1)
$
  E = h nu = (h c)/lambda = 2.86 "eV"
$
(2)
$
  1/lambda = R(1/1^2 - 1/n^2)
$
解得$n=5$

(3)
#grid(
  columns: (1fr, 1fr),
  gutter: 24pt,
  [
    如图所示，最多可以发射4个线系，10条谱线，波长最短的谱线为赖曼系的$E_5$->$E_1$跃迁
  ],
  cetz.canvas({
    import cetz.draw: *

    line((0, 0), (5, 0), name: "0", stroke: (dash: "dashed"))
    line((0, -0.54), (5, -0.54), name: "5")
    content("5.end", [n=5], anchor: "west", padding: 10pt)
    line((0, -0.85), (5, -0.85), name: "4")
    content("4.end", [n=4], anchor: "west", padding: 10pt)

    line((0, -1.51), (5, -1.51), name: "3")
    content("3.end", [n=3], anchor: "west", padding: 10pt)

    line((0, -2.86), (5, -2.86), name: "2")
    content("2.end", [n=2], anchor: "west", padding: 10pt)

    line((0, -5.44), (5, -5.44), name: "1")
    content("1.end", [n=1], anchor: "west", padding: 10pt)


    line((0.5, -0.54), (0.5, -5.44), mark: (end: ">", fill: black, stroke: 1pt))
    line((0.9, -0.85), (0.9, -5.44), mark: (end: ">", fill: black, stroke: 1pt))
    line((1.3, -1.51), (1.3, -5.44), mark: (end: ">", fill: black, stroke: 1pt))
    line((1.7, -2.86), (1.7, -5.44), mark: (end: ">", fill: black, stroke: 1pt))
    line((2.2, -0.54), (2.2, -2.86), mark: (end: ">", fill: black, stroke: 1pt))
    line((2.6, -0.85), (2.6, -2.86), mark: (end: ">", fill: black, stroke: 1pt))
    line((3.0, -1.51), (3.0, -2.86), mark: (end: ">", fill: black, stroke: 1pt))
    line((3.5, -0.54), (3.5, -1.51), mark: (end: ">", fill: black, stroke: 1pt))
    line((3.9, -0.85), (3.9, -1.51), mark: (end: ">", fill: black, stroke: 1pt))
    line((4.4, -0.54), (4.4, -0.85), mark: (end: ">", fill: black, stroke: 1pt))
  }),
)

= 22-3
$
  E_3 -E_1 = 12.09 "eV"\
  E_4 -E_1 = 12.75 "eV"
$
显然最多激发至$E_3$态，则发射谱线的波长为：
$
  1/lambda_31 = R(1/1^2 - 1/3^2) \
  lambda_31 = 102.6 "nm" \
  1/lambda_32 = R(1/2^2 - 1/3^2) \
  lambda_32 = 656.3 "nm" \
  1/lambda_21 = R(1/1^2 - 1/2^2) \
  lambda_21 = 121.5 "nm"
$
#v(10em)
= 22-6
$
  1/lambda_infinity = R(1/k^2 - 1/infinity^2)
$
解得$k=2$, 又
$
  1/lambda = R(1/2^2 -1/n^2)
$
解得$n=3$

始态
$
  E_3 = -1.51 "eV"
$
终态
$
  E_2 = -3.40 "eV"
$
= 22-9
(3,0,0), (3,1,0), (3,1,1), (3,1,-1), (3,2,0), (3,2,1), (3,2,-1), (3,2,2), (3,2,-2)

= 22-11
3d态，n=3, l=2, m=-2, -1, 0, 1, 2,于是
$
  L = sqrt(l(l+1)) planck = sqrt(2 dot 3) planck = sqrt(6) planck \
  L_z = m planck = plus.minus 2 planck, plus.minus 1 planck, 0\
  cos theta_min = L_(z max) /L = (2 planck)/(sqrt(6) planck) = sqrt(6)/3 \
  theta_min = arccos(sqrt(6)/3) = 39.3 degree
$

= 22-1
对2p态
$
  P(r) = r^2 dot R_(21)(r)^2 = r^4/(24 a_0^5) dot e^(-r/a_0ß)
$
令$("d"P(r))/("d"r) = 0$，则：
$
  ("d" P(r))/("d"r) = r^3/(12 a_0^5) dot e^(-r/a_0) (4 - r/a_0) = 0 \
$
解得$r=4 a_0$
