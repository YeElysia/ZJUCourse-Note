#import "@local/Typwork-some:0.1.1": homework, styles

#let question = homework.question

#show heading: it => {
  text(blue)[#it]
}
#let level = sys.inputs.at("level", default: "submit");

#show: styles.work.with(
  course: "概率论与数理统计",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "第十周",
  level: level,
)

= 第4章

= A16
$
    E(X) & = integral_0^2 "d"x integral_x^2 x f(x,y) "d"y = 3/4 integral_0^2 x^2 (2 - x) "d"x = 1 \
    E(Y) & = integral_0^2 "d"y integral_0^y y f(x,y) "d"x = 3/8 integral_0^2 y^3 "d"y = 3/2 \
  E(X Y) & = integral_0^2 integral_0^y x y f(x,y) "d"x "d"y = 1/4 integral_0^2 y^4 "d"y = 8/5 \
$
所以
$
  C o v(X,Y) = E(X Y) - E(X) E(Y) = 1/10 \
$
又
$
    E(X^2) & = integral_0^2 "d"x integral_x^2 x^2 f(x,y) "d"y = 3/4 integral_0^2 x^3 (2 - x) "d"x = 6/5 \
    E(Y^2) & = integral_0^2 "d"y integral_0^y y^2 f(x,y) "d"x = 3/8 integral_0^2 y^4 "d"y = 12/5 \
  V a r(X) & = E(X^2) - [E(X)]^2 = 1/5 \
  V a r(Y) & = E(Y^2) - [E(Y)]^2 = 3/20
$
所以
$
  ρ_(X Y) = (C o v(X,Y) )/ sqrt(V a r(X) V a r(Y)) = sqrt(3)/3
$


= A19
由$X+Y$与$X-a Y$相互独立可得
$
  C o v(X+Y, X - a Y) = V a r(X) - a V a r(Y) + (1 - a) C o v(X,Y) = 0
$
已知
$
    V a r(X) & = 4, V a r(Y) = 4, \
  C o v(X,Y) & = ρ_(X Y) dot sqrt(V a r(X) V a r(Y)) = 2.4 \
$
解得$a=1$

= B24
已知
$
        E(X) & = integral_(-infinity)^infinity x f(x) upright(d) x = 0 \
      E(X^2) & = integral_(-infinity)^infinity x^2 f(x) upright(d) x = integral_0^infinity x^2 e^(-x) upright(d) x \
             & = Gamma(3) = 2 \
      E(|X|) & = integral_(-infinity)^infinity |x| f(x) upright(d) x = integral_0^infinity x e^(-x) upright(d) x \
             & = Gamma(2) = 1 \
    E(|X|^2) & = E(X^2) = 2 \
    V a r(X) & = E(X^2) - [E(X)]^2 = 2 - 0 = 2 \
  V a r(|X|) & = E(|X|^2) - [E(|X|)]^2 = 2 - 1 = 1
$
(1)
$
       E(X |X|) & = integral_(-infinity)^infinity 1/2x|x| e^(-|x|) upright(d) x = 0 \
  C o v(X, |X|) & = E(X dot |X|) - E(X) dot E(|X|) = 0
$
(2)
令$0<a<b$
$
         P{X<a} & = integral_(-infinity)^a 1/2 e^(-|x|) upright(d) x = 1 - 1/2 e^(-a) \
       P{|x|<b} & = integral_(-b)^b 1/2 e^(-|x|) upright(d) x = 1 - e^(-b) \
  P{X<a, |X|<b} & = P{-b<X<b} = 1- e^(-b) \
$
显然不独立
= B31
(1)
#figure(image("assets/7e55d252-0eaa-4077-9d1e-b8ba9a74c33a.png", width: 45%))
$
  E(X=0) = 0.6, E(Y=0) = 0.6, E(X=0, Y=0) = 0.4
$
显然$X$与$Y$不独立

(2)
$
        E(X) & = 0 dot 0.6 + 1 dot 0.4 = 0.4 \
        E(Y) & = 0 dot 0.6 + 1 dot 0.4 = 0.4 \
      E(X Y) & = 0 dot 0.8 + 1 dot 0.2 = 0.2 \
  C o v(X,Y) & = E(X Y) - E(X) E(Y) = 0.04
$
$X$与$Y$正相关
(3)
= 第5章

= A3
$
  P{|X_1-X_2| gt.slant 4} lt.slant (V a r (X_1 - X_2))/16 = (V a r(X_1) + V a r(X_2))/16 = 1/2
$
= B2
设$X_i=0$表示隔代不发病，$X_i=1$表示隔代发病，则有$E(X)=0.1$，$V a r(X)=0.09$

令$S = display(1/500 sum_1^500X_i)$,则$E(S) = 0.1$，$V a r(S) = display(0.09/500 = 0.00018)$

$
  P(|S-0.1|<0.05) gt.slant 1 - (V a r(S))/(0.05)^2 = 0.928
$
= B6
(1)
$
                                        E(X^2) & = V a r(X) + [E(X)]^2 = sigma^2 + mu^2 \
  lim_(n arrow infinity) 1/n sum_(i=1)^n X_i^2 & = sigma^2 + mu^2 \
$
(2)
$
                                          E((X-mu)^2) & = E(X^2) - 2 mu E(X) + mu^2 = sigma^2 \
  lim_(n arrow infinity) 1/n sum_(i=1)^n (X_i - mu)^2 & = sigma^2 \
$
(3)
$
  lim_(n arrow infinity) (sum_(i=1)^n X_i)/(sum_(i=1)^n X_i^2) = E(X)/E(X^2) = mu/(sigma^2 + mu^2)
$
(4)
$
  lim_(n arrow infinity) (sum_(i=1)^n X_i)/(sqrt(n sum_(i=1)^n (X_i - mu)^2)) = E(X)/sqrt(E((X-mu)^2)) = mu/sigma
$

#v(10em)
= B7
(1)
已知
$
  E(X) = 1/ lambda, V a r(X) = 1/ lambda^2
$
显然
$
  a = lim_(n arrow infinity) (sum_(i=1)^n X_i^2)/n = E(X^2) = V a r(X) + [E(X)]^2 = 2/ lambda^2
$
(2)
$
  1/50 sum_(i=1)^100 X_i ~ N(2/ lambda, 1/(25 lambda^2))
$
(3)
已知$display(E(X^2) = 2/ lambda^2)$, X^2 满足正太分布，所以
$
  P{1/100 sum_(i=1)^100 X_i^2 lt.slant 2/ lambda^2} = 0.5
$

= B9
(1)

已知
$
  P{0.95 < X < 1.05} = integral_0.95^1 x "d"x + integral_1^1.05 (2 - x) "d"x = 0.0975
$
所以$Y ~ B(100,0.0975)$
- 精确分布
$
  P{Y>2} = 1 - P{Y=0}- P{Y=1}- P{Y=2} approx 0.9976
$
- 泊松分布近似
$
  P {Y=k} & approx e^(-lambda) lambda^k/(k!), lambda = 9.75 \
   P{Y>2} & = 1 - P{Y=0}- P{Y=1}- P{Y=2} approx 0.9966 \
$
- 中心极限定理
$
  (Y - 100 times 0.0975)/sqrt(100 times 0.0975 times 0.9025) approx N(0,1) \
  P{Y>2} = P{(Y - 9.75)/sqrt(8.795625) > (2 - 9.75)/sqrt(8.795625)} = 1 - Phi(-2.61) approx 0.9955 \
$

#v(10em)

(2)
设观察n次时${1/2 < X < 3/2}$的次数为Z，则$Z ~ B(n,0.75)$，所以
$
  (Z - 0.75 n)/sqrt(0.75 times 0.25 n) approx N(0,1) \
$
满足题意有
$
  Phi((80 - 0.75 n)/sqrt(0.1875 n)) lt.slant 0.05 lt.slant Phi(-1.64) \
$
解得$n$最小整数值为$117$
= B11
(1)
设得0分的人数为$X$，则$X ~ B(100,0.3)$
$
  (X - 30)/sqrt(21) approx N(0,1) \
  P{X lt 35} = P{(X - 30)/sqrt(21) lt.slant 5/sqrt(21)} = Phi(1.09) approx 0.8621
$

(2)
$
  E(X) = 0 times 0.2 + 1 times 0.16 + 2 times 0.128 + 4 times 0.512 = 2.464\
  E(X^2) = 0 times 0.2 + 1 times 0.16 + 4 times 0.128 + 16 times 0.512 = 8.864 \
  V a r(X) = E(X^2) - [E(X)]^2 = 2.792704
$
由中心极限定理
$
  (sum_(i=1)^100 X_i - 246.4)/sqrt(279.2704) & approx N(0,1) \
  P{sum_(i=1)^100 X_i gt 220} &= P{(sum_(i=1)^100 X_i - 246.4)/sqrt(279.2704) gt.slant (220 - 246.4)/sqrt(279.2704)} \
  &= 1 - Phi(-1.58) approx 0.9429 \
$
