#import "@local/typsthw:0.1.0": homework

#let question = homework.question


#show: homework.style.with(
  course: "概率论与数理统计",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "第一周",
  level: "submit",
)



== A1
(1)

6次

(2)

A = { (0,a), (1,a), (2,a) }

(3)

B = { (0,a), (0,b), (0,c) }

== A4
(1)

$A B union B C union A C$

(2)

$overline(A B union B C union A C)$

(3)

$overline(A)B C union A overline(B) C union A B overline(C)$

(4)

$overline(A B C)$

== A12

(1)

有放回 $display(4/5 times 4/5 = 16/25)$, #h(2em)无放回 $display(C_8^2/C_10^2 = 28/45)$

(2)

有放回 $display(4/5 times 1/5 + 1/5 times 4/5 = 8/25)$, #h(2em)无放回 $display((C_8^1 C_2^1)/C_10^2 = 16/45)$

(3)

有放回 $display(1 times 4/5 = 4/5)$, #h(2em)无放回 $display((A_2^1 A_8^1 + A_8^2)/A_10^2 = 4/5)$

== B1

(1) $P(overline(A)C) = 0.4 - 0.3 = 0.1$

(2) $P(A union B) = 0.3 + 0.3 = 0.6$

(3) $P(overline(A union B union C)) = 1 - 0.4 - 0.3 = 0.3$
