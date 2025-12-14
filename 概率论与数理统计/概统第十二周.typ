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
  title: "第十二周作业",
  level: "submit",
)

= A3

(1)
$
   mu_1 & = integral_0^2 x dot 2^(- theta) theta x^(theta -1) "d"x = 2^(-theta) theta integral_0^2 x^theta "d"x \
        & = (2 theta)/(theta + 1) \
  theta & = mu_1 / (2 - mu_1) \
$
用$A_1$代替$mu_1$，则有
$
  hat(theta_1) = A_1 / (2 - A_1) = overline(X) / (2 - overline(X)) \
$
可得似然函数
$
  L(theta) = product_(i=1)^n f(x_i; theta) =cases(
    display(2^(-n theta)theta^n product_(i=1)^n x_i(theta-1)) ",   "0<x_i<2,
    0 ",                        其他",
  )
$
则对数似然函数
$
  l(theta) = ln L(theta) = cases(
    -n theta ln 2 + n ln theta + (theta -1) display(sum_(i=1)^n) ln x_i ", " 0<x_i<2,
    0 ",                                             其他",
  )
$
从而$0<x_i<2$时，$display(("d"l(theta))/("d"(theta)))= -n ln 2 + display(n/theta) + display(sum_(i=1)^n) ln x_i$

令$display(("d"l(theta))/("d"theta) lr(|, size: #200%)_(theta = hat(theta)) =0)$, 则$-n ln 2 + display(n/hat(theta) + sum_(i=1)^n ln x_i = 0)$, 解得$hat(theta) = display(1/(display(ln 2 - 1/n sum_(i=1)^n ln x_i)))$.

因此$hat(theta)$的极大似然估计量
$
  hat(theta_2) = 1/(display(ln 2 - 1/n sum_(i=1)^n ln x_i))
$
对本题，有$display(overline(x)= 1/10 sum_(i=1)^10 x_i = 0.503)$, 从而矩估计值为$hat(theta_1) = 0.336$。

又$display(sum_(i=1)^10 ln x_i = -10.392)$，从而极大似然估计值为$hat(theta_2) = 0.577$。
#v(10em)
(2)
因为函数是奇函数
$
  mu_1 = E(X) = integral_(-infinity)^infinity x dot 1/(2 theta) e^(-display((|x|)/theta)) "d"x = 0
$
继续考虑二阶矩
$
  mu_2 = E(X^2) = integral_(-infinity)^infinity x^2 dot 1/(2 theta) e^(-display((|x|)/theta)) "d"x = 2 theta^2
$
因为$theta > 0$,从而$theta = sqrt(display(mu_2/2))$, 则$theta$ 的矩估计量为
$
  hat(theta_1) = sqrt(display(A_2/2)) = sqrt(1/(2n) sum_(i=1)^n X_i^2)
$
似然函数
$
  L(theta) = product_(i=1)^n f(x_i; theta) = 1/(2^n theta^n) product_(i=1)^n e^(-display((|x_i|)/theta)) \
$
对数似然函数
$
  l(theta) = ln L(theta) = -n ln 2 - n ln theta - display(sum_(i=1)^n (|x_i|)/theta)
$
从而$display(("d"l(theta))/("d"(theta)) = -n/theta + display(sum_(i=1)^n (|x_i|)/theta^2))$，令$display(("d"l(theta))/("d"theta) lr(|, size: #200%)_(theta = hat(theta)) = 0)$, 解得$hat(theta) =display(1/n sum_(i=1)^n |x_i|)$ ， 则$theta$ 的极大似然估计量为
$
  hat(theta_2) = 1/n sum_(i=1)^n |x_i|
$
由$display(sum_(i=1)^10x_i^2 = 4.6956),display(sum_(i=1)^10 |x_i| = 4.68)$，

从而矩估计值$hat(theta_1) = 0.4845$，极大似然估计值为$hat(theta_2) = 0.468$。

(3)
$
  mu_1 = E(X) = integral_theta^2 x dot x/(2- theta) "d"x = (theta +2)/2
$
则$theta = 2 mu_1 -2$，矩估计量为
$
  hat(theta_1) = 2 A_1 -2 = 2 overline(X) -2
$
似然函数
$
  L(theta) = product_(i=1)^n f(x_i; theta) =cases(
    display(1/(2 - theta)^n) ",   "theta<=x_i<2,
    0 ",             其他",
  )
$
#v(10em)
对数似然函数
$
  l(theta) = ln L(theta) = cases(
    -n ln(2 - theta) ", " theta<=x_i<2,
    0 ",                 其他",
  )
$
由对数似然函数递增，则当$theta$取最大值时，$l(theta)$取最大值，即$hat(theta) = min(x_i)$。

由$theta <= x_i$，从而$theta <= min(x_1, x_2, dots, x_n)$，则极大似然估计量为
$ hat(theta_2) = min(X_1, X_2, dots, X_n) $

已知$display(overline(x) = 1/10 sum_(i=1)^10 x_i = 1.093)$，从而矩估计值$hat(theta_1) = 0.186$

极大似然估计值$hat(theta_2) = 0.35$。

= A5
$
  mu_1 = E(X) = 0 dot theta^2 + 1 dot 2 theta (1 - theta) + 2 dot (1 - theta)^2 = 2 - 2 theta
$

则$theta = 1 - display(mu_1/2)$，$A_1 = display(1/9 sum_(i=1)^9 x_i = 1)$，从而矩估计量为$hat(theta) = 1 - display(A_1/2) = 0.5$

似然函数
$
  L(theta) = product_(i=1)^9 p(x_i; theta) = (theta^2)^3 dot lr(\[, size: #200%)2 theta (1 - theta)lr(], size: #200%)^3 dot lr(\[, size: #200%)(1 - theta)^2lr(], size: #200%)^3 = 8 theta^9 (1 - theta)^9
$
对数似然函数
$
  l(theta) = ln L(theta) = ln 8 + 9 ln theta + 9 ln(1 - theta)
$
从而$display(("d"l(theta))/("d"(theta)) = 9/theta - 9/(1 - theta))$，令$display(("d"l(theta))/("d"theta) lr(|, size: #200%)_(theta = hat(theta)) = 0)$，解得$hat(theta) = 0.5$。

= A7
设$x_1,x_2,dots,x_n$是样本$X_1,X_2,dots,X_n$的观测值，则似然函数
$
  L(theta) = product_(i=1)^n f(x_i; theta) =cases(
    display(1/theta^n product_(i=1)^n x_i e^(-x^2_i/(2theta))) ",   " x_i>0,
    0 ",                  其他",
  )
$
对数似然函数
$
  l(theta) = ln L(theta) = cases(
    -n ln theta + display(sum_(i=1)^n) ln x_i- display(1/(2 theta)) display(sum_(i=1)^n x_i^2) ", " x_i>0,
    0 ",                                       其他",
  )
$
从而$display(("d"l(theta))/("d"(theta)) = -n/theta + display(1/(2 theta^2)) display(sum_(i=1)^n x_i^2))$，令$display(("d"l(theta))/("d"theta) lr(|, size: #200%)_(theta = hat(theta)) = 0)$，解得$hat(theta) = display(1/(2 n) sum_(i=1)^n x_i^2)$，则极大似然估计量为
$ hat(theta) = 1/(2 n) sum_(i=1)^n X_i^2 $

#v(10em)
又
$
  mu = E(X^2) = integral_0^infinity x^2 dot x/theta e^(-x^2/(2 theta)) "d"x = 2 theta
$
因此$mu$的极大似然估计量为
$ hat(mu) = 2 hat(theta)= 1/n sum_(i=1)^n X_i^2 $

又
$
  p = P{X>1} = integral_1^infinity x/theta e^(-x^2/(2 theta)) "d"x = e^(-1/(2 theta))
$
因此$p$的极大似然估计量为
$ hat(p) = e^(-1/(2 hat(theta))) = e^display(-n/display(sum_(i=1)^n X_i^2)) $

= B1
$
  mu = E(X) = integral_0^theta x dot (6x (theta-x))/(theta^3) "d"x = theta /2
$
则$theta = 2 mu$，矩估计量为
$ hat(theta) = 2 A_1 = 2 overline(X) $
因为$E(overline(X)) = E(X) = display(theta/2)$, 所以$E(hat(theta)) = 2 E(overline(X)) = theta$.

又
$
  E(X^2) = integral_0^theta x^2 dot (6x (theta-x))/(theta^3) "d"x = (3theta^2) /10
$
从而$V a r(X) = E(X^2) - (E(X))^2 = display((3theta^2)/10 - (theta^2)/4 = (theta^2)/20)$，则
$
  V a r(hat(theta)) = V a r(2overline(X)) = 4/n^2 V a r(X_i) = (theta^2)/(5 n)
$
