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
    "{2}.{3}",
  ))
  let _set_figure(body) = {
    // 设置前景
    show figure.where(kind: image): set figure(supplement: [图])

    show figure.where(kind: table): set figure(supplement: [表])
    show figure.where(kind: table): set figure.caption(position: top)

    // 使用正确的编号与图表标题字符及分隔符
    show figure.caption: set text()
    set figure.caption(separator: "　")

    set math.equation(numbering: "(1)", supplement: [方程])
    // show math.equation.where(block: true): it => {
    //   if not it.has("label") {
    //     let fields = it.fields()
    //     let _ = fields.remove("body")
    //     fields.numbering = none
    //     [#counter(math.equation).update(v => v - 1)#math.equation(..fields, it.body)<math-equation-without-label>]
    //   } else {
    //     it
    //   }
    // }
    body
  }
  show: _set_figure

  // 一级标题设置（章节标题）
  show heading.where(level: 1): set heading(numbering: "一、")
  show heading.where(level: 1): set text(
    stroke: 0.03em,
    font: "SimHei",
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
  set box(stroke: (bottom: 1pt), inset: (bottom: 20%, left: -10%, right: -10%))
  v(4em)
  text("物理实验预习报告", size: 36pt, font: "SimSun")
  v(6em)
  [#box(text(size: 16pt, font: "SimSun")[实验名称：], stroke: none) #box(name, width: 7cm)]
  v(0em)
  [#box(text(size: 16pt, font: "SimSun")[指导教师：], stroke: none) #box(instructor, width: 7cm)]
  v(5em)

  // set text(size: 14pt, stroke: none)
  [#box(text(size: 14pt, font: "SimSun")[班级：], stroke: none) #box(
      text(size: 14pt, font: "SimSun")[#class],
      width: 8cm,
    )]
  v(0cm)
  [#box(text(size: 14pt, font: "SimSun")[姓名：], stroke: none) #box(
      text(size: 14pt, font: "SimSun")[#author],
      width: 8cm,
    )]
  v(0cm)
  [#box(text(size: 14pt, font: "SimSun")[学号：], stroke: none) #box(
      text(size: 14pt, font: "SimSun")[#author-id],
      width: 8cm,
    )]

  v(2em)
  [#box("实验日期：", stroke: none) #box(str(date.year()), width: 2em) #box("年", stroke: none) #box(
      str(date.month()),
      width: 1.5em,
    ) #box("月", stroke: none) #box(str(date.day()), width: 1em) #box("日", stroke: none) #h(1cm) #box(
      "星期",
      stroke: none,
    ) #box("一二三四五六日".clusters().at(date.weekday() - 1), width: 1em) #box(am-pm, stroke: none, width: 2em)]

  set text(stroke: none, size: 14pt)
  v(2cm)
  [#box("浙江大学物理实验教学中心", stroke: none)]

  // 封面部分结束
  pagebreak()

  show strong: set text(stroke: 0.03em)
  set align(left)
  set text(size: 小四)
  body
}

