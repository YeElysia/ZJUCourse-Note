#import "@local/Typwork-some:0.1.1": homework, styles

#let question = homework.question

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
  course: "概率论与数理统计",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "第十一周作业",
  level: "submit",
)

= A5
(1)
$
  E(overline(X)) = E(1/7 sum_(i=1)^7 X_i) = 1/7 E(sum_(i=1)^7 X_i) = 1/7 times 7 times 0.3 = 0.3 \
  V a r(overline(X)) = V a r(1/7 sum_(i=1)^7 X_i) = (1/7)^2 V a r(sum_(i=1)^7 X_i) = 1/49 times 7 times 0.21 = 0.03 \
$
(2)
$
               S^2 & = 1/6 sum_(i=1)^7 (X_i - overline(X))^2 = 1/6 (sum_(i=1)^7 X_i^2 - 7 overline(X)^2) \
            E(X^2) & = V a r(X) + [E(X)]^2 = 0.21 + 0.3^2 = 0.3 \
  E(overline(X)^2) & = V a r(overline(X)) + [E(overline(X))]^2 = 0.03 + 0.3^2 = 0.12 \
            E(S^2) & = 1/6 (7 times 0.3 - 7 times 0.12) = 0.21 \
$
(3)
$
  P{max{X_1,X_2,dots,X_7}<1} = 0.7^7 = 0.0823543
$
= A7
(1)

已知
$
  X_1 + X_2 +X_3 + X_4 + X_5 ~ chi^2(10)\
$
又
$
  chi^2_0.05 = 18.307
$
所以
$ P{X_1 + X_2 +X_3 + X_4 + X_5 > 18.307} = 0.05 $
(2)
分布
$
  X_1 + X_2 +X_3 + X_4 + X_5 ~ chi^2(10)\
$
上0.1分位数$chi^2_0.1(10) = 15.987$

= A9
(1)
已知$X_i^2 ~ chi^2(1)$,则$Y^2 ~ chi^2(9)$,所以$display(T = (3X_10)/Y = X_10/(sqrt(Y^2/9))~t(9))$

因此$P{|T|>1.8331} = 2P{T>1.8331} = 2P{T>t_0.05(9)} = 0.1$

(2)
$t_0.1(9)=1.3830$
= A11
已知
$
  X_i ~ N(0,1) \
  X_i^2 ~ chi^2(1) \
$
(1)
$
  overline(X) = 1/16 sum_(i=1)^16 X_i ~ N(0,1/16^2 times 16) = N(0,1/16) \
$
(2)
$
  sum_(i=1)^16 X_i^2 ~ chi^2(16) \
$
(3)
$
  (3X_1) /(sqrt(display(sum_(i=2)^10X_i^2))) = display(X_1/(sqrt(display((sum_(i=2)^10X_i^2)/9)))) ~ t(9) \
$
(4)
$
  (X_1+X_2)/(sqrt(X_3^2 + X_4^2)) = display(((X_1+X_2)/sqrt(2))/(sqrt(display((X_3^2 + X_4^2)/2)))) ~ t(2) \
$
(5)
$
  overline(X) - X_1 = -15/16 X_1 + 1/16 sum_(i=2)^16 X_i ~ N(0,15^2/16^2+15/16^2) = N(0,15/16) \
$
= B1

= B2(7,8)

= B4

= B10
