#import "@local/typsthw:0.1.0": homework

#let question = homework.question


#show: homework.style.with(
  course: "概率论与数理统计",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "第五周",
  level: "submit",
)


// 三线表
#let tlt_header(content, is_first: false) = {
  set align(center)
  // 如果是第一列，添加右侧边线，并保留标题行的底线
  let line = if is_first { (right: 0.5pt, bottom: 0.5pt) } else { (bottom: 0.5pt) }

  rect(
    width: 100%,
    stroke: line,
    [#content],
  )
}

#let tlt_cell(content, is_first: false) = {
  set align(center)
  // 如果是第一列，添加右侧边线
  let line = if is_first { (right: 0.5pt) } else { none }

  rect(
    width: 100%,
    stroke: line,
    [#content],
  )
}

// 辅助函数：处理一行中的所有单元格
#let tlt_row(r) = {
  let cells = ()
  let col_count = r.len()

  // 使用 range(col_count) 来迭代索引
  for i in range(col_count) {
    let content = r.at(i)
    let is_first = i == 0
    cells = (..cells, tlt_cell(content, is_first: is_first))
  }

  // 返回扁平化的元组
  (..cells.flatten(),)
}

// 辅助函数：处理表头中的所有单元格
#let tlt_header_row(r) = {
  let cells = ()
  let col_count = r.len()

  // 使用 range(col_count) 来迭代索引
  for i in range(col_count) {
    let content = r.at(i)
    let is_first = i == 0
    cells = (..cells, tlt_header(content, is_first: is_first))
  }

  // 返回扁平化的元组
  (..cells.flatten(),)
}


#let line_table(values) = {
  // 表格的总体边框保持三线表的样式（顶、底、标题下）
  rect(
    stroke: (bottom: 1pt, top: 1pt),
    inset: 0pt,
    outset: 0pt,
    grid(
      rows: auto,
      // 表头
      grid(
        columns: values.at(0).len(),
        // 调用新的表头处理函数
        ..tlt_header_row(values.at(0))
      ),

      // 内容行
      grid(
        columns: values.at(0).len(),
        // 映射剩余的行
        ..values.slice(1).map(tlt_row).flatten()
      ),
    ),
  )
}
== A13
$
  f_X (x) = cases(
    display(1/4) #h(2em)-1 < x < 3,
    ,
    0 #h(2em) x in (-infinity,-1] or [3,infinity)
  )
$

$
  P{ Y = k } = C_n^k (3/4)^k (1/4)^(n-k) , k = 0,1,2,...,n
$

== B17
(1)
由
$
  1 = integral_(-infinity)^(+infinity) f_X (x) upright(d)x = integral_(0)^(2) c(4-x^2) upright(d)x = 16/3 c #h(2em)
$
可得
$ c = 3/16 $

(2)
$
  F(x) = cases(
    display(0) #h(2em) x <= 0, ,
    display(3/4x - 1/16x^3)#h(2em) 0 < x <= 2, ,
    display(1) #h(2em) x > 2
  )
$

(3)
$
  P{ -1 < X < 1 } = F(1) - F(-1) = 11/16
$

(4)
设对X独立观察5次，{-1 < X < 1}出现的次数为Y
$
  P{ Y = 2} = C_5^2 (11/16)^2 (5/16)^3 = 151250/1048576 = 0.144
$

== B23
(1)
$
  P_1 & = 0.1 times Phi(1) + 0.15 times (Phi(2)- Phi(1)) + 0.3 times (1-Phi(2) \
      & = 0.111
$
(2)
$
  P_2 = (0.15 times (0.9772 - 0.8413) + 0.3 times(1 - Phi(2))) / P_1 = 0.245
$

(3)
$
  P_3 = 1 - C_3^0 (0.111)^0 (0.889)^3= 0.297
$
== B24
(1)
$
  alpha = 0.1 times Phi(-0.8) + 0.001 times (Phi(0.8) - Phi(-0.8)) + 0.2 times (1 - Phi(0.8)) = 0.0641
$
(2)
$
  beta = (0.2 times (1 - Phi(0.8))) / alpha = 0.661
$
(3)
$
  theta = C_3^2 (0.0641)^1 (0.9359)^2 + C_3^3 (0.9359)^3 = 0.988
$
== B27
(1)
由
$
  1 = integral_(-infinity)^(+infinity) a e^(- x^2) upright(d)x = a sqrt(pi)
$
可得
$ a = 1/sqrt(pi) $
(2)
$
  P{X>1/2 } = 1- Phi(sqrt(2)/2) = 0.2398
$

== B29

(1)
$
  P_1 = 0.4 times (1- F_1(6)) + 0.6 times (1-F_2(6))= 0.4e^(-2) + 0.6e^(-1)
$
(2)
$
  P_2 = 1 - F_1(2/3) = 1 - e^(-2/9)
$
(3)
$
  P_3 & = (0.4 times P{X_1 > 1} + 0.6 times P{X_2 > 1})/(0.4 times P{X_1 > 1/3} + 0.6 times P{X_2 > 1/3}) \
      & = (0.4e^(-1/3) + 0.6e^(-1/6)) / (0.4e^(-1/9) + 0.6e^(-1/18))
$

== B32
$
     P{Y=10} & = p^2 = 0.49 \
      P{Y=8} & = C_2^1 p^2 (1-p)^1 = 0.294 \
  P{ Y = 2 } & = 1 - P{Y=10} - P{Y=8} = 0.216
$
