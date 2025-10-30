#import "@local/Typwork-some:0.1.1": styles


#show: styles.work.with(
  course: "微积分甲",
  alter: "试鸢",
  lang: "zh-cn",
  title: "第11章、 级数",
  level: "post",
)


#set par(leading: 2em, justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)

#set heading(numbering: "1.1")
#show heading: it => {
  if it.level == 1 {
    counter(heading).display("一、")
    it.body
    parbreak()
  } else {
    h(2em)
    counter(heading).display("1.1 ")
    it.body
    parbreak()
  }
}

#let indented-box(body) = {
  pad(left: 32pt, body)
}

#show box: it => {
  indented-box(it.body)
}

= 数项级数
== 几何级数
#box()[
  $
    a + a q + a q^2 + dots.h.c + a q^n + dots.h.c = sum_(n=1)^(infinity) a q^(n-1), (a eq.not 0)
  $
  显然，当 $|q| < 1$ 时，几何级数收敛，
  $
    sum_(n=1)^(infinity) a q^(n-1)= lim_(n arrow.r infinity )frac(a(1-q^n),1-q) = frac(a,1-q)
  $
  当 $|q| gt.eq.slant 1$ 时，几何级数发散。
]

== p级数
#box()[
  $
    1 + frac(1,2^p) + frac(1,3^p) +dots.h.c + frac(1,n^p) + dots.h.c = sum_(n=1)^(infinity) frac(1,n^p)
  $
  #move(dx: 32pt)[#text(red)[解]]

  当 $p eq 1$ 时，称$display(sum_(n = 1)^infinity frac(1,n))$为调和级数，根据其通项$u_n = display(frac(1,n))$，引入函数$f(x)= display(frac(1,x))$，显然\ $n lt.eq.slant x lt.eq.slant n+1$时，$f(n) gt.eq.slant f(x)$，由定积分性质：
  $
    frac(1,n) = integral_(n)^(n+1) frac(1,n) d x gt integral_(n)^(n+1) frac(1,x) d x
  $
  从而
  $
    S_n &= 1 + frac(1,2) + frac(1,3) + dots.h.c + frac(1,n) = integral_1^2 frac(1,x) d x + integral_2^3 frac(1,x) d x + dots.h.c + integral_n^(n+1) frac(1,x) d x\
    &= integral_1^(n+1) frac(1,x) d x = ln(x) lr(size:#200%,|)_1^(n+1) = ln(n+1) arrow.r +infinity "  " (n arrow.r +infinity),
  $
  于是$lim S_n = infinity$，按定义知当$p eq 1$时，$display(sum_(n = 1)^infinity frac(1,n^p))$发散。\
  #h(2em)当$p lt 1$时，$display(frac(1,n^p) gt frac(1,n))$，显然级数$display(sum frac(1,n^p))$发散。\
  #h(2em)当$p gt 1$时，根据通项$u_n = display(frac(1,n^p))$，引入函数$f(x)= display(frac(1,x^p))$，显然$n lt.eq.slant x lt.eq.slant n+1$时，\ $f(x) gt.eq.slant f(n+1)$，由定积分性质：
  $
    integral_n^(n+1) frac(1,x^p) d x gt integral_n^(n+1) frac(1,(n+1)^p) d x = frac(1,(n+1)^p)
  $
  从而
  $
    S_n = 1 + frac(1,2^p) + frac(1,3^p) + dots.h.c + frac(1,n^p) lt 1 + integral_1^n frac(1,x^p) d x
  $
  由反常积分$display(integral_1^(infinity)frac(1,x^p) d x)$收敛，可知S_n有上界，由其单调性可知极限存在，所以当\ $p gt 1$时，$display(sum_(n arrow.r infinity) frac(1,n^p))$收敛。\
  #h(2em)综上所述，$display(sum_(n = 1)^infinity frac(1,n^p))$收敛当且仅当$p gt 1$，发散当且仅当$p lt.eq.slant 1$.
]


= 正项级数敛散性的判别法
== 比较判别法
#box()[
  \

  设$display(sum_(n=1)^infinity u_n),display(sum_(n=1)^infinity v_n)$均为正项级数，且$u_n lt.eq.slant v_n (n=1, 2 ,3, dots.h.c)$,\
  #h(2em) (1) 若$display(sum_(n=1)^infinity v_n)$收敛，则$display(sum_(n=1)^infinity u_n)$也收敛；\
  #h(2em) (2) 若$display(sum_(n=1)^infinity u_n)$发散，则$display(sum_(n=1)^infinity v_n)$也发散。
]
\

== 比较判别法的极限形式
#box()[
  \

  设$display(sum_(n=1)^infinity u_n),display(sum_(n=1)^infinity v_n)$均为正项级数，且$display(lim_(n arrow.r infinity) frac(u_n,v_n)=l)$,\
  #h(2em) (1) 当$0 lt l lt + infinity"  "$即$lr(size:#150%,paren.l) u_n~l v_n (n arrow.r infinity)lr(size:#150%,paren.r)$时，两个级数同时收敛或同时发散；\
  #h(2em) (2) 当$l = 0$时，$display(sum_(n=1)^infinity v_n)$收敛，则$display(sum_(n=1)^infinity u_n)$也收敛；\
  #h(2em) (3) 当$l = + infinity$时，$display(sum_(n=1)^infinity v_n)$发散，则$display(sum_(n=1)^infinity u_n)$也发散。\
]
\

== 比值判别法或达朗贝尔( d'Alembert )判别法
#box()[
  \

  设$display(sum_(n=1)^infinity u_n)$为正项级数，且$display(lim_(n arrow.r infinity) frac(u_(n+1),u_n)=gamma)$（或$+infinity$），\
  #h(2em) (1) 当$gamma lt 1$时，级数收敛；

  (2) 当$gamma gt 1$时，级数发散；

  (3) 当$gamma = 1$时，不能确定级数的敛散性。
]

== 根值判别法或柯西判别法
#box()[
  \

  设$display(sum_(n=1)^infinity u_n)$为正项级数，且$display(lim_(n arrow.r infinity) root(n,u_n)=gamma)$，\
  #h(2em) (1) 当$gamma lt 1$时，级数收敛；

  (2) 当$gamma gt 1$时，级数发散；

  (3) 当$gamma = 1$时，不能确定级数的敛散性。
]


== 积分判别法
#box()[

  设$f(x)$在$[1,+infinity)$上是非负且递减的连续函数，记$u_n = f(n), (n=1, 2, 3, dots.h.c)$，则级数$display(sum_(n=1)^infinity u_n)$与反常积分$display(integral_1^(+infinity)f(x) d x)$的敛散性相同。
]

#pagebreak()

= 一般项级数收敛性的判别法
== 莱布尼茨( Leibniz )定理
#box()[
  \

  若交错级数$display(sum_(n=1)^infinity (-1)^(n-1) u_n)$满足：\
  #h(4em) (1) $u_1 gt u_2 gt.eq.slant u_3 gt.eq.slant dots.h.c$; #h(2em) (2) $display(lim_(n arrow.r infinity) u_n = 0)$
  \
  #h(2em) 则级数$display(sum_(n=1)^infinity (-1)^(n-1) u_n)$收敛，并且它的和$S lt.eq.slant u_1$。
]

#box()[
  #move(
    dx: 16pt,
    dy: 16pt,
    rect(radius: 16pt, outset: 5%, inset: 1.2em, width: 90%)[
      设$display(sum_(n=1)^infinity u_n)$为一般级数，\
      (1) 如果$display(sum_(n=1)^infinity)|u_n|$收敛，则称$display(sum_(n=1)^infinity u_n)$为绝对收敛；\
      (2) 如果$display(sum_(n=1)^infinity)|u_n|$发散，但$display(sum_(n=1)^infinity u_n)$收敛，则称$display(sum_(n=1)^infinity u_n)$为条件收敛；\

    ],
  )
]
\
\

== 绝对值的比值判别法
#box()[
  \

  设$display(sum_(n=1)^infinity u_n)$为一般级数，且$display(lim_(n arrow.r infinity) frac(|u_(n+1)|,|u_n|)=gamma)$（或$+infinity$），\
  #h(2em) (1) 当$gamma lt 1$时，级数绝对收敛

  (2) 当$gamma gt 1$ (或 $gamma eq infinity$ ) 时，级数发散

  (3) 当$gamma = 1$时，不能确定级数的敛散性。
]

== 绝对值的根值判别法
#box()[
  \

  设$display(sum_(n=1)^infinity u_n)$为一般级数，且$display(lim_(n arrow.r infinity) root(n,|u_n|)=gamma)$（或$infinity$），\
  #h(2em) (1) 当$gamma lt 1$时，级数绝对收敛；

  (2) 当$gamma gt 1$ (或 $gamma eq infinity$ ) 时，级数发散

  (3) 当$gamma = 1$时，不能确定级数的敛散性。
]
\
// TODO: 3.3 绝对收敛级数的性质

= 函数项级数与一致收敛性
#box()[
  #move(
    dx: 16pt,
    dy: 4pt,
    rect(radius: 16pt, outset: 2%, inset: 0.5em, width: 90%)[

      函数项级数：表达式$u_1(x) + u_2(x) + dots.h.c + u_n(x) + dots.h.c , x in E$\
      #h(2em) 部分和函数: $S_n(x) = u_1(x) + u_2(x) + dots.h.c + u_n(x) = display(sum_(k=1)^n u_k(x))$\
      #h(2em) 和函数：$S(x) = display(sum_(n=1)^infinity u_n (x))$\
      #h(2em) 收敛点：当$display(lim_(n arrow.r infinity) u_n (x_0))$存在，$x_0$是函数项级数$display(sum_(n=1)^infinity u_n (x))$的收敛点\
      #h(2em) 收敛域：全体收敛点的集合\
      #h(2em) 函数项级数的余项：$R_n(x) = S(x) - S_n(x)$\
    ],
  )
]
== 一致收敛的柯西准则
#box()[
  \

  级数$display(sum_(n=1)^infinity u_n (x))$在集合$D$上一致收敛的充分必要条件是：对于任意给定的$epsilon gt 0$，存在与x无关的正整数$N(epsilon)$，使得当$
  n gt N$时，对一切$x in D$和一切正整数$p$，都有

  \
  $
    |S_(n+p) (x) - S_n (x)|= |u_(n+1) (x) + u_(n+2) (x) + dots.h.c + u_(n+p) (x)| lt epsilon
  $
]
\

== 魏尔斯特拉斯( Weierstrass )判别法
#box()[
  \

  设$display(sum_(n=1)^infinity u_n (x))$在集合$D$上, $display(sum_(n=1)^infinity M_n)$为收敛的正项级数。若对一切$ x in D$，都有\ $abs(u_n (x)) lt.eq.slant M_n,n=k, k+1, dots.h.c$，则函数项级数$display(sum_(n=1)^infinity u_n (x))$在$D$上一致收敛。
]
#pagebreak()

= 幂级数及其和函数
== 阿贝尔( Abel )定理
#box()[
  \

  如果级数$display(sum_(n=0)^infinity a_n x^n)$当$x = x_0(x_0 eq.not 0)$时收敛，那么适合不等式$|x|< |x_0|$的一切 $x$ 使该幂级数绝对收敛，反之，如果级数$display(sum_(n=0)^infinity a_n x^n)$当$x=x_0$时发散，那么适合不等式$|x| gt |x_0|$的一切 $x$ 使该幂级数发散。\
]

== 柯西-阿达马( Cauchy- Hadamard )公式
#box()[
  \

  设幂级数$display(sum_(n=0)^infinity a_n x^n)$，若$display(lim_(n arrow.r infinity) frac(|a_n|, |a_(n+1)|)=R)$\
  #h(2em) (1) 当 $0 lt R lt + infinity$ 时，级数在$|x| lt R$时绝对收敛，在$|x| gt R$时发散；\
  #h(2em) (2) 当 $R = 0$时，级数仅在$x=0$处收敛，在$x eq.not 0$处发散；\
  #h(2em) (3) 当 $R = +infinity$时，级数在 $(-infinity,+infinity)$ 内绝对收敛。\
]

==
#box()[
  \

  设幂级数$display(sum_(n=0)^infinity a_n x^n)$，若$display(lim_(n arrow.r infinity) frac(1, root(n,|a_n|))=R)$\
  #h(2em) (1) 当 $0 lt R lt + infinity$ 时，级数在$|x| lt R$时绝对收敛，在$|x| gt R$时发散；\
  #h(2em) (2) 当 $R = 0$时，级数仅在$x=0$处收敛，在$x eq.not 0$处发散；\
  #h(2em) (3) 当 $R = +infinity$时，级数在 $(-infinity,+infinity)$ 内绝对收敛。\
]

#box()[
  #move(
    dx: 24pt,
    dy: 4pt,
    rect(radius: 16pt, outset: 2%, inset: 0.5em, width: 90%)[

      我们],
  )
]
= 函数展成幂级数

= 幂级数的应用

= 函数的傅里叶展开
