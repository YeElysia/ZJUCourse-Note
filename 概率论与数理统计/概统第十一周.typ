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
(1)
可知
$
  (overline(X)-mu)/(sigma/5) ~ N(0,1) \
  P{|overline(X)-mu|<0.2 sigma} = P{(|overline(X)-mu|)/(sigma/5) < 1} = 2Phi(1) -1 = 0.6826 \
$
(2)
$
  P{|overline(X) > mu - c sigma} = P{(overline(X)-mu)/(sigma/5) gt.eq -5c} =1- Phi(-5c)= Phi(5c) = 0.95 \
$
解得$c = 0.33$
= B2
(7)
$
  (2(X_1-X_2)^2)/((X_3-X_4)^2 + (X_5-X_6)^2) &= display((2(X_1-X_2)^2)/(2sigma^2))/display(((X_3-X_4)^2 + (X_5-X_6)^2)/(2 sigma^2))\
  &= display(((X_1-X_2)^2)/(2sigma^2))/display(1/2 ((X_3-X_4)^2 + (X_5-X_6)^2)/(2 sigma^2)) \
  &~ F(1,2) \
$

(8)

令
$
  S_1^2 = 1/2 [(X_1-Y_1)^2 + (X_2-Y_1)^2 + (X_3 -Y_1)^2] \
  S_2^2 = 1/2 [(X_4-Y_2)^2 + (X_5-Y_2)^2 + (X_6 -Y_2)^2] \
$
则
$
  (2S_1^2)/(sigma^2) ~ chi^2(2) \
  (2S_2^2)/(sigma^2) ~ chi^2(2) \
$
所以
$
  ((X_1 - Y_1)^2 + (X_2 - Y_1)^2 + (X_3 - Y_1)^2)/((X_4 - Y_2)^2 + (X_5 - Y_2)^2 + (X_6 - Y_2)^2) = S_1^2/S_2^2 = (display((2S_1^2)/sigma^2 dot 1/2) )/(display((2S_2^2)/sigma^2 dot 1/2)) ~ F(2,2) \
$
= B4
已知$X_i ~ N(a, 2.5^2)$
所以
$
  overline(X) & ~ N(a, 2.5^2/n) \
  (overline(X)-a)/(display(2.5/sqrt(n))) & ~ N(0,1) \
  P{|overline(X)-a| lt.eq 0.5} & = P{(|overline(X)-a|)/(display(2.5/sqrt(n))) lt.eq (0.5sqrt(n))/2.5} = 2 Phi((sqrt(n))/5) -1 \
$

#v(10em)
(1)
$
  2 Phi ((sqrt(n))/5) -1 gt.eq 0.9 \
$
解得 $n> 67.65$,所以至少68次

(2)
$
  2 Phi ((sqrt(n))/5) -1 gt.eq 0.95 \
$
解得 $n> 96.04$,所以至少97次
= B10
(1)
$
              overline(X)- overline(Y) & ~ N(0, sigma^2/5 + sigma^2/9) \
  (a(overline(X) - overline(B)))/sigma & ~ N(0,(14a^2)/45) = N(0,1) \
$
解得$display(a = plus.minus sqrt(45/14))$

(2)
显然有
$
  display(a(overline(X)-overline(B))/sigma)/display(sqrt((4S_1^2+8S_2^2)/(12 sigma^2))) = (sqrt(3)a(overline(X)-overline(B)))/display(sqrt(S_1^2+2S_2^2)) ~ t(12) \
$
于是$sqrt(3)a = b$, $b = display(plus.minus sqrt(135/14))$
