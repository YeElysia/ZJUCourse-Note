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
  title: "第九周作业",
  level: "submit",
)

= A12

由$X~P(2)$，$E(X)=2, V a r(X) =2$

由$Y~B(2, 0.4)$，$E(Y)=0.8, V a r(Y) =0.48$

则
$
       E(2X - Y) & = 2E(X) - E(Y) = 4 - 0.8 = 3.2 \
  V a r (2X - Y) & = 4V a r(X) + V a r(Y) = 8 + 0.48 = 8.48 \
   E[(2X - Y)^2] & = V a r(2X - Y) + [E(2X - Y)]^2 = 8.48 + 3.2^2 = 18.72
$
= B6
(1)
$
  E(X) & = integral_(-infinity)^infinity integral_(-infinity)^infinity x f(x,y) upright(d) x upright(d) y \
       & =integral_0^infinity upright(d) x integral_0^x 2e^(-2x) upright(d) y \
       & = integral_0^infinity 2x e^(-2x) upright(d) x = - integral_0^infinity x upright(d)(e^(-2x)) \
       & = - x e^(-2x) |_(0)^(infinity) + integral_0^infinity e^(-2x) upright(d) x \
       & = 0 -1/2 e^(-2x) |_(0)^(infinity) \
       & = 1/2
$
(2)
$
  E(3X -1) = 3E(X) -1=1/2
$
(3)
$
  E(X Y) & = integral_0^infinity upright(d) x integral_0^x 2 y e^(-2x) upright(d) y \
         & = integral_0^infinity x^2 e^(-2x) upright(d) x \
         & = integral_0^infinity -1/2 x^2 upright(d)(e^(-2x)) \
         & = -1/2 x^2 e^(-2x) |_(0)^(infinity) + integral_0^infinity x e^(-2x) upright(d) x \
         & = 0 + 1/4 = 1/4
$
= B12
(1)
$
  P(xi_2 = 0) & = (C_a^0 C_(15-a)^2) / (C_15^2) = ((15 - a)(14 - a))/(210) \
  P(xi_2 = 1) & = (C_a^1 C_(15-a)^1) / (C_15^2) = (a(15 - a))/(105) \
  P(xi_2 = 2) & = (C_a^2 C_(15-a)^0) / (C_15^2) = (a(a -1))/(210)
$
因此
$
  E(xi_2) & = 0 times P(xi_2 = 0) + 1 times P(xi_2 = 1) + 2 times P(xi_2 = 2) \
          & = (a(15 - a))/(105) + 2 dot (a(a -1))/(210) \
          & = (14a)/(105) = 4/3 \
        a & = 10
$
(2)
$
  P(xi_9 = k ) & = (C_a^k C_(15-a)^(9-k)) / (C_15^9), k = 4, 5, 6,7,8,9 \
       E(xi_9) & = sum_(k=4)^9 k times (C_10^k C_5^(9-k)) / (C_15^9) \
               & = 6
$
= B20
$
      E(X) & = integral_(-infinity)^infinity x f(x) upright(d) x = 0 \
    E(X^2) & = integral_(-infinity)^infinity x^2 f(x) upright(d) x = integral_0^infinity x^2 e^(-x) upright(d) x \
           & = Gamma(3) = 2 \
    E(|X|) & = integral_(-infinity)^infinity |x| f(x) upright(d) x = integral_0^infinity x e^(-x) upright(d) x \
           & = Gamma(2) = 1 \
  E(|X|^2) & = E(X^2) = 2
$
所以
$
    V a r(X) & = E(X^2) - [E(X)]^2 = 2 - 0 = 2 \
  V a r(|X|) & = E(|X|^2) - [E(|X|)]^2 = 2 - 1 = 1
$

#v(10em)
= B34
设一个月总产煤量为$Y$, 则$display(Y= sum_1^20 X_i)$ , 所以 $Y ~ N(45,0.3)$, 从而$display((Y-45)/(sqrt(0.3))) ~ N(0,1)$
$
  P{Y>46} = 1 - P{Y < 46} = 1 - Phi((46-45)/(sqrt(0.3))) = 1 - Phi(1.83) = 0.0336
$
