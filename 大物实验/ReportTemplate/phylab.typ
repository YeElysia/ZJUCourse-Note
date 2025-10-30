#let phylab(
  name: "实验名称",
  instructor: "指导教师",
  class: "班级",
  desk-id: "实验桌号",
  author: "姓名",
  author-id: "学号",
  date: datetime.today(),
  week: 1,
  am-pm: "上午",
  body,
) = {
  let 小初 = 36pt
  let 三号 = 16pt
  let 小三 = 15pt
  let 四号 = 14pt
  let 小四 = 12pt
  // 设置字体和基本文本格式
  set text(font: "SimSun", size: 四号)
  show raw: set text(font: "Consolas", size: 10pt)

  // 设置段落格式
  set par(first-line-indent: (amount: 2em, all: true))

  import "@preview/numbly:0.1.0": numbly
  set heading(numbering: numbly(
    "一、",
    "{2}.",
    //"{2}.{3}",
    "（{3}）",
  ))
  set par(spacing: 1.24em,leading: 0.85em)

  let _set_figure(body) = {
    // 设置前景
    show figure.where(kind: image): set figure(supplement: [图])

    show figure.where(kind: table): set figure(supplement: [表])
    show figure.where(kind: table): set figure.caption(position: top)
    show figure.where(kind: "续"): set figure(supplement: [续表])
    show figure.where(kind: "续"): set figure.caption(position: top)
    // 使用正确的编号与图表标题字符及分隔符
    show figure.caption: set text()
    set figure.caption(separator: "　")

set math.equation(numbering: "(1)", supplement: [方程])

    body
  }
  show: _set_figure


  // 一级标题设置（章节标题）
  show heading.where(level: 1): set heading(numbering: "一、")
  show heading.where(level: 1): set text(
    stroke: 0.03em,
    font: "simhei",
    size: 三号,
  )
  show heading.where(level: 1): set block(
    spacing: 1.5em,
    above: 1em,
    below: 1em,
  )

  // 二级标题设置（小节标题）- 独立编号
  show heading.where(level: 2): set text(
    stroke: 0.02em,
    font: "SimSun",
    size: 四号,
  )
  show heading.where(level: 2): set block(
    spacing: 1em,
    above: 0.8em,
    below: 0.8em,
  )

  // 三级标题设置（子小节标题）- 独立编号

  show heading.where(level: 3): set text(
    font: "SimSun",
    size: 小四,
  )

  show heading.where(level: 3): set block(
    spacing: 0.9em,
    above: 0.7em,
    below: 0.7em,
  )
  // 设置纸张大小与页边距
  set page(paper: "a4", margin: (top: 2.54cm, bottom: 2.54cm, left: 1.91cm, right: 1.91cm), numbering: (..args) => {
    let ind = args.pos().at(0)
    if ind > 1 {
      "第" + str(args.pos().at(0) - 1) + "页"
    }
  })

  // 封面部分开始
  set text(stroke: 0.03em, size: 三号)
  set align(center)
  //set box(stroke: (bottom: 1pt), inset: (bottom: 20%, left: -10%, right: -10%))
  v(1em)
  align(center, image("image.png", width: 6cm))
  v(0.15fr)
  text("物 理 实 验 报 告", size: 小初, tracking: -0.02em)
  v(0.8fr)
  [#box("实验名称：", stroke: none) #box(
      name,
      width: 7cm,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    )]
  v(0.5cm)
  [#box("实验桌号：", stroke: none) #box(
      desk-id,
      width: 7cm,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    )]
  v(0.5cm)
  [#box("指导教师:", stroke: none) #box(
      instructor,
      width: 7cm,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    )]
  v(5em)
  [#box(text(size: 14pt, font: "SimSun")[班级：], stroke: none) #box(
      text(size: 14pt, font: "SimSun")[#class],
      width: 8cm,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    )]
  v(0cm)
  [#box(text(size: 14pt, font: "SimSun")[姓名：], stroke: none) #box(
      text(size: 14pt, font: "SimSun")[#author],
      width: 8cm,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    )]
  v(0cm)
  [#box(text(size: 14pt, font: "SimSun")[学号：], stroke: none) #box(
      text(size: 14pt, font: "SimSun")[#author-id],
      width: 8cm,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    )]

  v(0.5fr)
  [#box("实验日期：", stroke: none) #box(
      str(date.year()),
      width: 3em,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    ) #box("年", stroke: none) #box(
      str(date.month()),
      width: 1.5em,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    ) #box("月", stroke: none) #box(
      str(date.day()),
      width: 1.5em,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    ) #box("日", stroke: none) #h(1cm) #box(
      "星期",
      stroke: none,
    ) #box(
      "一二三四五六日".clusters().at(date.weekday() - 1),
      width: 1em,
      stroke: (bottom: 1pt),
      inset: (bottom: 20%, left: -10%, right: -10%),
    ) #box(am-pm, stroke: none, width: 2em)]
  set text(stroke: none)
  v(2cm)
  [#box("浙江大学物理实验教学中心", stroke: none)]


  // 封面部分结束
  pagebreak()

  show strong: set text(stroke: 0.03em)
  set align(left)
  set text(size: 小四)
  // set box(stroke:(:),inset:)
  body
}
}

// 三线表
#let tlt_header(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: (bottom: 0.5pt),
    [#content],
  )
}

#let tlt_cell(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: none,
    [#content],
  )
}

#let tlt_row(r) = {
  (..r.map(tlt_cell).flatten(),)
}

#let three_line_table(values) = {
  rect(
    stroke: (bottom: 1pt, top: 1pt),
    inset: 0pt,
    outset: 0pt,
    grid(
      rows: auto,
      // table title
      grid(
        columns: values.at(0).len(),
        ..values.at(0).map(tlt_header).flatten()
      ),

      grid(
        columns: values.at(0).len(),
        ..values.slice(1).map(tlt_row).flatten()
      ),
    ),
  )
}
