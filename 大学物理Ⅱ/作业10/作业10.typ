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
  title: "作业10",
  level: "submit",
)

#set enum(numbering: "(1).")

= 20-2
$
  p_电 & = p_光 = h/ lambda = 3.32 times 10^(-24) "kg"dot"m/s" \
  E_电 & = sqrt(m_0^2 c^4 + p_电^2 c^2) = 8.19 times 10^(-14) "J" \
  E_光 & = p_光 c = 9.96 times 10^(-16) "J" \
$
= 20-5
$
  Delta x >= h/(4 pi Delta p) = h/(4 pi p) = lambda/(4 pi)
$
= 20-7
当$k=1$时，$a sin theta = lambda$

第一级极小离中心点的距离为
$
  x_1 = f tan theta approx f sin theta = (f lambda) / a
$
又$display(lambda = h/ p)$, 因此中央最大强度的宽度为
$
  d = 2 x_1 = (2 f h)/(a p )
$

= 20-16
$
  E_1 & = h^2 / (8 m a^2) dot 1^2 = 1.68 times 10^(-19) "J" = 1.05 "eV" \
  E_2 & = 4 E_1 = 4.20 "eV" \
  E_3 & = 9 E_1 = 9.45 "eV" \
$

= 20-17
(1)
$
  integral_(-infinity)^(+infinity) |psi(x)|^2 "d"x & = integral_0^infinity A^2 x^2 e^(-2lambda x) "d"x \
                                                   & = A^2 / (8 lambda^3) integral_0^infinity y^2e^(-y) "d"y \
                                                   & = A^2 / (4 lambda^3) =1
$
所以
$
  psi(x) = cases(sqrt(4 lambda^3) x e^(-lambda x) "   "(x >= 0), 0 "                "(x < 0))
$
(2)
概率密度
$
  |psi(x)|^2 = cases(4 lambda^3 x^2 e^(-2 lambda x) "   "(x >= 0), 0 "                "(x < 0))
$
