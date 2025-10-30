#import "@local/typsthw:0.1.0": homework
#let question = homework.question
#let answer = homework.answer

#let level = sys.inputs.at("level", default: "post");

#show: homework.style.with(
  course: "微积分（甲）Ⅱ",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "第一周",
  level: level,
)

#show raw.where(block: true): block.with(
  width: 100%,
  stroke: 1pt,
  radius: 5pt,
  breakable: true,
  inset: 5pt,
)

=

#question(number: 1)[
  设数列${n a_n}$收敛，级数$ sum_(n=1)^infinity n(a_n-a_(n-1))$收敛，证明级数$ sum_(n=0)^infinity a_n$收敛。
]

#answer()[
  $
    "已知ABel变换：" sum_(n=1)^n alpha_i (beta_i-beta_(i-1)) = sum_(i=1)^n alpha_i beta_i - sum_(i=0)^(n-1) alpha_(i+1) beta_i = sum_(i=1)^(n-1) (alpha_i - alpha_(i+1)) beta_i + alpha_n beta_n -alpha_1 beta_0 \
    "可令" alpha_n = n, beta_n = a_n, "记" alpha_0 = 0, \
    "则" sum_(i=1)^n i(a_i-a_(i-1)) = sum_(i=1)^(n-1) (-a_i) + n a_n - a_0 = -sum_(i=0)^(n) a_i + (n+1) a_n "收敛," \
    "于是" sum_(i=0)^n a_i = (n+1) a_n - sum_(i=1)^n i(a_i-a_(i-1)) "收敛,即级数" sum_(n=0)^infinity a_n "收敛。"
  $
]

=

#question(number: 2)[
  设级数$sum_(n=1)^infinity (a_(n+1) - a_n)$收敛，级数$ sum_(n=1)^infinity |b_n|$收敛，证明级数$ sum_(n=1)^infinity |a_n b_n|$收敛。
]
#answer()[
  $
    "已知" sum_(i=1)^n (a_(i+1)-a_i) = a_(n+1) - a_1"收敛", n arrow.r infinity \
    "即" {a_n} "收敛" arrow.l.r.double exists M > 0, forall n, |a_n| < M, \
    "所以" |a_n b_n| < M |b_n|, "又" sum_(n=1)^infinity |b_n| "收敛","推得" sum_(n=1)^infinity M|b_n| "收敛",\
    "由比较判别法，级数" sum_(n=1)^infinity |a_n b_n| "收敛。"
  $
]
=
#question(number: 3)[
  设极限$lim_(n arrow.r infinity) n a_n$存在， 试证级数$sum_(n=1)^infinity a_n^2$收敛。
]
#answer()[
  $
    {n a_n}"有极限" arrow.l.r.double exists M > 0, forall n, |n a_n| < M \
    arrow.r.double |a_n| < frac(M, n) arrow.r.double a_n^2 < frac(M^2,n^2) \
    "易知" sum_(n=1)^infinity frac(M^2,n^2) = M^2 sum_(n=1)^infinity frac(1,n^2) "收敛。"\
    "由比较判别法，级数" sum_(n=1)^infinity a_n^2 "收敛。"
  $
]

=

#question(number: 4)[
  设$a_1=2,a_(n+1)= frac(1,2)(a_n + frac(1,a_n))(n=1,2,dots)$，证明：
]
(1) $lim_(n arrow.r infinity) a_n$存在；\
(2) 级数$sum_(n = 1)^infinity (frac(a_n,a_(n+1))-1)$收敛。

#answer()[
  $
    a_(n+1)=frac(1,2)(a_n+frac(1,a_n)) gt.eq.slant frac(1,2) dot 2 sqrt(a_n dot frac(1,a_n)) = 1\
  $
  (1)
  $
    frac(a_(n+1),a_n) = frac(1,2)(1+frac(1,a_n^2)) lt.eq.slant frac(1,2)(1+1) = 1\
    "于是"a_n"单调减且有下界1,由单调有界原理，" {a_n} "收敛,即" lim_(n arrow.r infinity) a_n "存在。"
  $
  (2)
  $
    0 lt.eq.slant frac(a_n,a_(n+1))-1 = frac(a_n-a_(n+1),a_n) lt.eq.slant a_n-a_(n+1)\
    "由"sum_(i=1)^n (a_i-a_(i+1)) = a_1 -a_(n+1)"可知"sum_(n=1)^infinity (a_n-a_(n+1))"收敛，"\
    "由比较判别法，级数"sum_(n=1)^infinity (frac(a_n,a_(n+1))-1) "收敛。"
  $
]
=
#question(number: 5)[
  若记数列$u_n=1+frac(1,2)+frac(1,3)+dots+frac(1,n)-ln n$，试证明：
]
(1) $sum_(k=1)^infinity (u_(k+1)-u_k)$收敛；\
(2) ${u_n}$极限存在。\
(3) $lim_(n arrow.r infinity) (frac(1,n+1) + frac(1,n+2) + dots + frac(1,2n)) = ln 2$。
#answer()[
  (1)
  $
    u_(k+1)-u_k = frac(1,k+1)-bracket.l ln(k+1) - ln k bracket.r \
    "由拉格朗日中值定理" ln(1+x) -ln x = frac(1,xi) ,xi in (x,x+1) ,\
    "于是" ln(1+x) - ln x gt.eq.slant frac(1,x+1) arrow.r.double u_(k+1) - u_k < 0 \
    "又" u_(k+1)-u_k = frac(1,k+1)-ln(1+frac(1,k)) = frac(1,k+1) - (frac(1,k)+frac(1,2) dot frac(1,k^2)+o(frac(1,k^2))) \
    = -frac(1,n(n+1)) -frac(1,2n^2) + o(frac(1,n^2)) approx -frac(3,2n^2) \
    "则" lim_(n arrow.r infinity) frac(ln(1+frac(1,n))-frac(1,n+1),frac(1,n^2)) = frac(3,2) \
    "已知" sum_(n=1)^infinity frac(1,n^2) "收敛，由比较判别法的极限形式，级数"sum_(n=1)^infinity (u_(n+1)-u_n)"收敛。"\
  $
  (2)
  $
    "由（1），" lim_(n arrow.r infinity) (u_(n+1) -u_1 ) "存在，于是" lim_(n arrow.r infinity) u_n "显然存在。即"{a_n}"极限存在。"
  $
]
#answer()[
  (3)
  $
    "令" lim_(n arrow.r infinity) u_n = lim_(n arrow.r infinity) u_(2n) = c, \
    "显然有" lim_(n arrow.r infinity)(u_(2n)-u_(n)) = lim_(n arrow.r infinity)(frac(1,n+1)+frac(1,n+2) + dots + frac(1,2n)) -ln 2 = 0. \
  $
]

=
#question(number: "思考题：")[
  $lim_(n arrow.r infinity) (1 + frac(1,sqrt(2)) + frac(1,sqrt(3)) + dots + frac(1,sqrt(n)) - 2 sqrt(n))$ 和 $lim_(n arrow.r infinity) (1 + frac(1,root(3,2)) + dots + frac(1,root(3,n)) - frac(3,2) n^(frac(2,3)))$存在吗？为什么？
]

#answer()[
  思路同5(1)(2)可证
]
