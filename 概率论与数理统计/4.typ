#import "@local/typsthw:0.1.0": homework

#let question = homework.question


#show: homework.style.with(
  course: "概率论与数理统计",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "第四周",
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
== B2
(1)
#figure(
  line_table((
    ([X], [0], [1], [2], [4]),
    ([P], [0.8], [0.16], [0.032], [0.008]),
  )),
  kind: table,
)
(2)
$P{X > 2} = P{X=4} = 0.008$

(3)
$P{X=4 | X>=2} = display(P{X=4} / (P{X=2}+P{X=4})) = display(0.008 / 0.04) = display(1/5)$

== B7
$P{X=0} = (1-p_1)(1-p_2)(1-p_3)$

$P{X=1} = p_1(1-p_2)(1-p_3) + (1-p_1)p_2(1-p_3) + (1-p_1)(1-p_2)p_3$

$P{X=2} = (1-p_1) p_2 p_3 + p_1 (1-p_2) p_3 + p_1 p_2 (1-p_3)$

$P{X=3} = p_1 p_2 p_3$

$P{Y=0} = p_1$

$P{Y=1} = (1-p_1) p_2$

$P{Y=2} = (1-p_1)(1-p_2) p_3$

$P{Y=3} = (1-p_1)(1-p_2)(1-p_3)$

== B8

(1)
#figure(
  line_table((
    ([X], [1], [2], [3], [4], [5]),
    ([P], [$p$], [$(1-p)p$], [$(1-p)^2p$], [$(1-p)^3p$], [$(1-p)^4$]),
  )),
  kind: table,
)

(2)

$P{X <= 2.5} = P{X=1} + P{X=2} = p(2-p)$

== B9
(1)

$P{X>=2} = 1 - P{X=0} - P{X=1} = 1- display((e^(-1) (1)^0)/0!) - display((e^(-1) (1)^1)/1!) = 1 - e^(-1) - e^(-1) = 1 - 2e^(-1)$

(2)

$P{X <=3 | P>=2} = display((P{X=2} + P{X=3})/P{X>=2}) = (display((e^(-1) (1)^2)/2!) +display((e^(-1)(1)^3)/3!))/(1-2e^(-1)) = display(2/(3e-6))$

#v(5em)
== B11

(1)

已知$P{X>=1} = 1- display((e^(-lambda) lambda^(0))/0!) = 1-e^(-4.5) arrow.double lambda = 4.5$

则$P{X>=2} = 1 - P{X=0} - P{X=1} = 1- display((e^(-4.5) (4.5)^0)/0!) - display((e^(-4.5) (4.5)^1)/1!) = 1 - 5.5e^(-4.5)$

(2)

$P{X=1 | X>=1} = display(P{X=1} / P{X>=1}) = display((e^(-3.2) (3.2)^1)/1!)/display(1-(e^(-3.2) (3.2)^0)/0!) = display(3.2/(e^(3.2)-1))$

== B12

(1)
$P{X=6} = display((e^(-6) (6)^6)/6!) = display(324 /(5 e^6))$

(2)

$P{X=6 |X >=5} = display(P{X=6} / P{X>=5}) = display(324/(5e^6))/display(1-sum_(i=0)^4(e^(-6) (6)^i)/i!) = display(324/(5e^6-575))$

== B14

(1) $P{X=k} = display((C_3^k C_7^(3-k))/C_10^3), k = 0, 1, 2, 3$

(2) $P{Y=k} = display(C_3^k (1/2)^k (1/2)^(3-k)) =display(C_3^k/8),k=0,1,2,3$

(3) $P{Z=k} = display((1/10)^k (9/10)^(k-1)) =display(9^(k-1)/10^(k)),k=0,1,2,3,dots.c$

(4) $P = display(1/2 times C_4^2/2^4 = 3/16)$

== B16

(1)

$display(
  F(x) = cases(
    0 \, #h(1em)x<0 \,, ,
    display(x/2) \, #h(1em)0<=x<1\,, ,
    display((1)/2) \, #h(1em)1<=x<2\,, ,
    display((x-1)/2) \, #h(1em)2<=x<3 \,, ,
    1 \, #h(1em)x>=3 \,
  )
)$

(2)

$P{X<=2.5} = F(2.5) = display(3/4)$
