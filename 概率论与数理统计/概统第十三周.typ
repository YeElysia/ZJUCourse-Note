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
  title: "第十三周作业",
  level: "submit",
)

= A9
$
  E(hat(mu_1)) & = E(1/2 X_1 + 1/4 X_2 + 1/4 X_3) = 1/2E(X_1) + 1/4E(X_2) + 1/4E(X_3) \
               & = 1/2 mu + 1/4 mu + 1/4 mu = mu \
  E(hat(mu_2)) & = E(2 X_1 -2 X_2 + X_3) = 2E(X_1) - 2E(X_2) + E(X_3) \
               & = 2 mu - 2 mu + mu = mu \
  E(hat(mu_3)) & = E(1/3 X_1 + 1/3 X_2 + 1/3 X_3) = 1/3E(X_1) + 1/3E(X_2) + 1/3E(X_3) \
               & = 1/3 mu + 1/3 mu + 1/3 mu = mu
$
又
$
  V a r(hat(mu_1)) & = = (1/2)^2 V a r(X_1) + (1/4)^2 V a r(X_2) + (1/4)^2 V a r(X_3) \
                   & = 1/4 sigma^2 + 1/16 sigma^2 + 1/16 sigma^2 = 3/8 sigma^2 \
  V a r(hat(mu_2)) & = (2)^2 V a r(X_1) + (-2)^2 V a r(X_2) + (1)^2 V a r(X_3) \
                   & = 4 sigma^2 + 4 sigma^2 + 1 sigma^2 = 9 sigma^2 \
  V a r(hat(mu_3)) & = (1/3)^2 V a r(X_1) + (1/3)^2 V a r(X_2) + (1/3)^2 V a r(X_3) \
                   & = 1/9 sigma^2 + 1/9 sigma^2 + 1/9 sigma^2 = 1/3 sigma^2
$
因此，$hat(mu_1), hat(mu_2), hat(mu_3)$均为mu的无偏估计量，且$V a r(hat(mu_3)) < V a r(hat(mu_1)) < V a r(hat(mu_2))$，故$hat(mu_1)$最有效。
= A12
查表$t_0.05(14) = 2.1448$
已知
$
  overline(x) = 3400.933 \
  S = 412.7951
$
代入得置信区间
$
  ( overline(x) - S/ sqrt(n) t_0.05(14) , overline(x) + S/ sqrt(n) t_0.05(14) ) \
  = ( 3172.33 , 3629.53 )
$

= A14
查表$t_0.05(9) = 2.2622$
已知
$
  overline(x) = -6.7 \
  S = 8.6801
$
代入得置信区间
$
  ( overline(x) - S/ sqrt(n) t_0.05(9) , overline(x) + S/ sqrt(n) t_0.05(9) ) \
  = (-12.9095, -0.4905 )
$
= A16
查表$chi^2_0.025(15) = 27.488, chi^2_0.975(15) = 6.262$
置信区间
$
  ( sqrt(((n-1)S^2) / (chi^2_0.025(n-1))) , sqrt(((n-1) S^2) / (chi^2_0.975(n-1)))) \
  = ( 221.613 , 464.312 )
$
= A18
(1) 查表$z_0.025 = 1.96$

置信区间
$
  ( overline(X) -overline(Y) - z_0.025 sqrt(sigma_1^2/16+ sigma_2^2/12) , overline(X) -overline(Y) + z_0.025 sqrt(sigma_1^2/16+ sigma_2^2/12) ) \
  = ( -4.01,14.61)
$
(2) 查表$t_0.025(26) = 2.0555$

已知
$
  S_w = sqrt((15S_1^2 + 11S_2^2) / (16 + 12 -2)) = 12.1879
$
置信区间
$
  ( overline(X) -overline(Y) - t_0.025(26) S_w sqrt(1/16 + 1/12) , overline(X) -overline(Y) + t_0.025(26) S_w sqrt(1/16 + 1/12) ) \
  = ( -4.2670,14.8670)
$
(3)
查表$F_0.025(15,11) = 3.33, F_0.975(15,11) = 0.332$
置信区间
$
  ( S_1^2 / S_2^2 1 / (F_0.025(15,11)) , S_1^2 / S_2^2 1 / (F_0.975(15,11)) ) \
  = ( 0.3853 , 3.8590 )
$
= B5
(1)
$
  mu_1 = E(X) = integral_0^theta x dot (2x)/(theta^2) "d"x = 2/3 theta
$
则$theta = 3/2 mu_1$，矩估计量为
$
  hat(theta)_1 = 3/2 overline(X)
$
似然函数
$
  L(theta) = product_(i=1)^n f(x_i; theta) =cases(
    display(product_(i=1)^n x_i/theta^2) ", " 0<x_i<theta,
    0 ",             其他",
  )
$
对数似然函数
$
  l(theta) = ln L(theta) = cases(
    display(n ln 2 - 2 n ln theta + sum_(i=1)^n ln x_i) ", " 0<x_i<theta,
    0 ",                 其他",
  )
$
$display(("d" l(theta))/("d" theta)) = display(-(2n)/theta)$, 所以
$
  hat(theta)_2 = max(X_1, X_2, ..., X_n)
$
(2)
已知
$
  V a r(X) & = integral_0^theta (x-2/3 theta)^2 dot (2x)/(theta^2) = 1/2 theta^2 \
      F(x) & = integral_0^x (2t)/(theta^2) "d"t = x^2/(theta^2) \
$
$hat(theta)_1$无偏，
$
  M s e(hat(theta)_1) =9/(4n) V a r(X) = 9/(8n) theta^2
$
$hat(theta)_2$有偏，
$
  E(hat(theta)_2) = [E(hat(theta)_2 - hat(theta)_2 )]^2 = E(hat(theta)_2^2) - 2 theta E(hat(theta)_2) + theta^2
$
$
  F_n(X) = (F(X))^n = (X^2/(theta^2))^n = cases(0 "        " x<0, display(x^(2n)/(theta)^(2n) "   "0<x<theta), 1 "         "x>=theta)
$
$
  f_n(X) = cases(display((2n x^(2n-1))/(theta^(2n)) "   "0<x<theta), 0 "             其他")
$
$
    E(hat(theta)_2) & = integral_0^theta x dot (2n x^(2n-1))/(theta^(2n)) "d"x = (2n)/(2n+1) theta \
  E(hat(theta)_2^2) & = integral_0^theta x^2 dot (2n x^(2n-1))/(theta^(2n)) "d"x = (n)/(n+1) theta^2 \
$
$
  M s e(hat(theta)_2) & = (n)/(n+1) theta^2 - ( (2n)/(2n+1) theta )^2 + ( (2n)/(2n+1) theta - theta )^2 \
                      & = theta^2 / ((n+1)(2n+1))
$
比较得$M s e(hat(theta)_2) < M s e(hat(theta)_1)$，故$hat(theta)_2$更优。

(3)
$
                              overline(X) & = E(X) = 2/3 theta \
                             hat(theta)_1 & = 3/2 overline(X), "    为"theta"的相合估计量" \
                          E(hat(theta)_2) & = (2n)/(2n+1) theta \
  lim_(n arrow +infinity) E(hat(theta)_2) & = theta, "    故"hat(theta)_2"为"theta"的相合估计量"
$

= B8
(1)
$
  L(x,theta) & = product_(i=1)^n e^(-(x_i-theta)) \
    l(theta) & = n theta - sum_(i=1)^n x_i \
$
显然$l(theta)$关于$theta$单调递增，故
$ hat(theta) = min(X_1, X_2, ..., X_n) $
(2)
$
               F(x,theta) & = cases(0 "               " x<theta, display(1 - e^(-(x-theta))) "   " x>=theta) \
        F_(hat(theta))(t) & = 1 - e^(-n(t-theta)), "   " t>=theta \
        f_(hat(theta))(t) & = cases(
                              n e^(-n(t-theta))"   " t>=theta,
                              0 "             其他 "
                            ) \
  f_(hat(theta)-theta)(t) & = cases(
                              n e^(-n t) "   " t>=0,
                              0 "         其他 "
                            ) \
$
(3)可以，样本和 $theta$ 的分布完全已知且不依赖于未知参数。

(4)
$
  P{hat(theta)-theta < t} & = F_(hat(theta))(t + theta) = 1 - e^(-n t) \
$
令$1-e^(-n t) = 1- alpha$，则$t = -1/n ln alpha$
$
               & P{hat(theta)-theta < -1/n ln alpha} = 1 - alpha \
  arrow.double & P{theta > hat(theta) + 1/n ln alpha} = 1 - alpha \
$
置信下限为$hat(theta) + 1/n ln alpha$。
