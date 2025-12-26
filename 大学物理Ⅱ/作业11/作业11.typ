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
  title: "作业11",
  level: "submit",
)

#set enum(numbering: "(1).")

= 21-1
(1)
$
  1/2 m_0 v^2 = e U \
  v = sqrt((2 e U )/ m_0) \
  lambda = h/ p = h/(m_0 v) = h/ sqrt(2 m_0 e U) = 1.23 times 10^(-10) "m"
$
(2)
$
  lambda = h/(m v) = 8.29 times 10^(-35) "m"
$
= 21-2
$
  p_电 & = p_光 = h/ lambda = 3.32 times 10^(-24) "kg"dot"m/s" \
  E_电 & = sqrt(m_0^2 c^4 + p_电^2 c^2) = 8.19 times 10^(-14) "J" \
  E_光 & = p_光 c = 9.96 times 10^(-16) "J" \
$
= 21-6
$
  Delta x >= h/(4 pi m Delta v) = 5.80 times 10^(-10) "m"
$
= 21-10
概率密度
$
  |psi(x)|^2 = (2/ a) sin^2( (3pi x)/ a) "   "(0 < x < a)
$
令$("d"|psi(x)|^2) /("d"x) = 0$, 则
$
  (6 pi)/a^2 sin((6 pi x)/ a) = 0
$
因此$x = display(a/6),display(a/2),display((5a)/6)$时，概率最大
= 21-11
$
  integral_0^l |psi(x)|^2 "d"x & = integral_0^l c^2 x^2 (l-x)^2 "d"x \
                               & = (c^2 l^5 )/30 =1 \
                             P & = integral_0^(l/3) c^2 x^2 (l-x)^2 "d"x \
                               & = (c^2 l^5 )/30 dot 17/81 = 17/81
$

= 21-13
不确定度
$
  Delta v_x >= h /(4 pi m Delta x)
$
粒子最小能量
$
  E_min = (1/2) m (Delta v_x)^2 = h^2 / (32 pi^2 m L^2)
$
核内质子和中子的最小能量
$
  E_min = h^2 / (32 pi^2 m_p d^2) = 8.3 times 10^(-15) "J"
$
= 21-16
$
  E_1 & = h^2 / (8 m a^2) dot 1^2 = 1.68 times 10^(-19) "J" = 1.05 "eV" \
  E_2 & = 4 E_1 = 4.20 "eV" \
  E_3 & = 9 E_1 = 9.45 "eV" \
$

= 21-17
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

= 21-18
$
  k & = sqrt((8 pi^2 m(E_(p 0)-E))/h^2)=5.12 times 10^9 "m"^(-1) \
  T & = e^(-2k a) = 0.01
$
解得
$
  a = 4.50 times 10^(-10) m
$
