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

= 第5章

= A3

= B2

= B6

= B7

= B9

= B11

