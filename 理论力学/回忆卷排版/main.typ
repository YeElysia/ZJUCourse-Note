#import "@preview/cetz:0.4.2"

#set text(12pt, font: ("Maple Mono NF", "LXGW WenKai Mono"))
#set par(justify: true, leading: 1em, first-line-indent: (amount: 2em, all: true))
#set par(spacing: 1.24em)

#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,
    right: 3cm,
  ),
  header: {
    set text(10pt, baseline: 8pt, spacing: 3pt)
    grid(
      columns: (auto, 1fr),
      align(left, "理论力学"), align(right, "猫娘小蛋糕烘焙组"),
    )

    line(length: 100%, stroke: 0.7pt)
  },
  footer: context {
    set align(center)

    grid(
      columns: (1fr, 1fr, 1fr),
      line(length: 100%, stroke: 0.7pt),
      context {
        text(10pt, baseline: -3pt, counter(page).display(" 1 "))
      },
      line(length: 100%, stroke: 0.7pt),
    )
  },
)
// 设置前缀
#show figure.where(kind: image): set figure(supplement: [图])

#show figure.where(kind: table): set figure(supplement: [表])
#show figure.where(kind: table): set figure.caption(position: top)

// 使用正确的编号与图表标题字体及分隔符
#show figure.caption: set text()
#set figure.caption(separator: "　")

// show figure.caption: it => [
//   #it.supplement
//   #context counter(heading).display((..args) => {
//     let nums = args.pos()
//     if nums.len() == 0 { return none } else { return numbering("1.1", ..nums) }
//   })-#context it.counter.display(it.numbering)
//   #it.body
// ]
#set math.equation(supplement: [公式])
#set heading(numbering: "一、")
#set enum(numbering: "1.A.")

#let kong = {
  box(width: 5em, stroke: (bottom: 1pt), inset: (bottom: 20%, left: -10%, right: -10%))
}

// 设置背景水印

#let _set_watermark(body) = {
  set page(
    background: [
      #rotate(24deg, text(50pt, fill: rgb(128, 128, 128, 40))[
        *My CC98 My Home* $"         "$
      ])
      #v(5cm)
      #rotate(24deg, text(50pt, fill: rgb(128, 128, 128, 40))[
        $"         "$ *My CC98 My Home*
      ])
      #v(5cm)
      #rotate(24deg, text(50pt, fill: rgb(128, 128, 128, 40))[
        *My CC98 My Home* $"         "$
      ])],
  )

  body
}
#show: _set_watermark

#align(center)[
  #text(size: 20pt, weight: "regular")[浙江大学 2025-2026 学年秋学期]
  #v(-1em)
  #text(size: 14pt, weight: "regular")[《理论力学》期末回忆卷]

  #v(2em)
  课程号：AA2002F #h(11em) 开课学院： 航空航天学院

  // 考试试卷：√A卷、B卷（请在选定项上打√）

  考试形式：√闭、开卷(请在选定项上打√）) #h(11em)

  考试日期：2026年  1 月 11日#h(5em) 考试时间：  120 分钟

  考生姓名：#kong
  #h(1em)学号： #kong
  #h(1em)所属院系：#kong
  #v(2em)
]
1. 如图所示的组合结构中，水平梁通过铰链A及支柱体系固定在竖直墙面上，已知几何尺寸为AE=2m，EC=2m，右侧悬臂段长4m，且竖直杆ED与支座间距均为2m；现于水平梁的E点至右端部施加大小为5kN/m的竖直向下均布荷载，请在不计构件自重的情况下，计算固定铰支座A、B处的约束反力，并求出斜杆CD的受力。
#cetz.canvas({
  import cetz.draw: *
  line((-0.3, 0.5), (-0.3, -0.5))
  line((-0.3, 0.4), (-0.5, 0.2))
  line((-0.3, 0.2), (-0.5, 0))
  line((-0.3, 0), (-0.5, -0.2))
  line((-0.3, -0.2), (-0.5, -0.4))
  line((-0.07, -0.07), (-0.3, -0.3), (-0.3, 0.3), (-0.07, 0.07))
  circle((0, 0), radius: 0.1)
  line((0.1, 0.05), (7.9, 0.05))
  line((0.1, -0.05), (7.9, -0.05))
  circle((8, 0), radius: 0.1)

  line((-0.3, -1.5), (-0.3, -2.5))
  line((-0.3, -1.6), (-0.5, -1.8))
  line((-0.3, -1.8), (-0.5, -2.0))
  line((-0.3, -2), (-0.5, -2.2))
  line((-0.3, -2.2), (-0.5, -2.4))
  line((-0.07, -2.07), (-0.3, -2.3), (-0.3, -1.7), (-0.07, -1.93))
  circle((0, -2), radius: 0.1)
  line((0.1, -1.95), (1.9, -1.95))
  line((0.1, -2.05), (1.9, -2.05))
  circle((2, -2), radius: 0.1)

  line((1.95, -1.9), (1.95, -0.25))
  line((2.05, -1.9), (2.05, -0.25))
  circle((2, -0.15), radius: 0.1)

  line((2.05, -1.9), (3.9, -0.2))
  line((2.1, -2), (4, -0.25))
  circle((4, -0.15), radius: 0.1)

  line((2, 0.8), (2, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((2.4, 0.8), (2.4, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((2.8, 0.8), (2.8, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((3.2, 0.8), (3.2, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((3.6, 0.8), (3.6, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((4, 0.8), (4, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((4.4, 0.8), (4.4, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((4.8, 0.8), (4.8, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((5.2, 0.8), (5.2, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((5.6, 0.8), (5.6, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((6, 0.8), (6, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((6.4, 0.8), (6.4, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((6.8, 0.8), (6.8, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((7.2, 0.8), (7.2, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((7.6, 0.8), (7.6, 0.05), mark: (end: ">", fill: black, stroke: 1pt))
  line((8, 0.8), (8, 0.05), mark: (end: ">", fill: black, stroke: 1pt))

  line((2, 0.8), (8, 0.8))

  content((9, 0.4), [5kN/m])
  content((0, 0.4), [A])
  content((0, -1.6), [B])
  content((1.6, 0.4), [E])
  content((2.3, -2.3), [D])
  content((4.3, -0.4), [C])

  line((0, -3.3), (0, -3.7), stroke: 0.7pt)
  line((2, -3.3), (2, -3.7), stroke: 0.7pt)
  line((0, -3.5), (2, -3.5), mark: (start: ">", end: ">", fill: black, stroke: 0.1pt))
  content((1, -4), [2m])

  line((2, -3.3), (2, -3.7), stroke: 0.7pt)
  line((4, -3.3), (4, -3.7), stroke: 0.7pt)
  line((2, -3.5), (4, -3.5), mark: (start: ">", end: ">", fill: black, stroke: 0.1pt))
  content((3, -4), [2m])

  line((4, -3.3), (4, -3.7), stroke: 0.7pt)
  line((8, -3.3), (8, -3.7), stroke: 0.7pt)
  line((4, -3.5), (8, -3.5), mark: (start: ">", end: ">", fill: black, stroke: 0.1pt))
  content((6, -4), [4m])


  line((-0.8, 0), (-1.2, 0), stroke: 0.7pt)
  line((-0.8, -2), (-1.2, -2), stroke: 0.7pt)
  line((-1, 0), (-1, -2), mark: (start: ">", end: ">", fill: black, stroke: 0.1pt), name: "1")
  content(("1.start", 50%, "1.end"), angle: "1.start", [2m #h(2em)#v(2.5em)])
})

#pagebreak()

2. R=3r=3m,杆AB在大圆盘内的滑槽内运动，且与小圆盘圆心A铰接，如图所示。该瞬时$theta = 15 degree，omega = 4 "rad/s"，alpha = 2 "rad/s"^2$，求该瞬时小圆盘角速度和角加速度。
#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  arc((9.4641, 3), start: 0deg, stop: 100deg, radius: 2, mark: (end: ">", fill: black, stroke: 0.1pt), name: "omega1")
  content(("omega1.start", 98%, "omega1.end"), [α#v(2em)])
  arc((9.4641, 3), start: 0deg, stop: 80deg, radius: 2, stroke: (thickness: 2pt, paint: white))

  circle((0, 1), radius: 1)
  line((0, 1), (0, 0), mark: (end: ">", fill: black, stroke: 1pt), name: "r")
  content((0.3, 0.5), [r])
  circle((7.4641, 3), radius: 3)
  line((7.4641, 3), (7.4641, 0), mark: (end: ">", fill: black, stroke: 1pt), name: "R")
  content((7.7641, 1.5), [R])
  circle((0, 1), radius: 0.1)
  line((0.05, 1.05), (11.2062, 4.05), stroke: 4pt)
  line((11.1962, 4.1), (11.2162, 4))

  line((4.5063, 2.44), (10.3173, 3.9765))
  line((4.5963, 2.08), (10.3973, 3.6565))

  line((0.1, 1), (4, 1))
  arc((2.1, 1), start: 0deg, stop: 15deg, radius: 2)
  content((3, 1.4), [15$degree$])

  // line((10.34, 3.85), (10.360, 3.789), stroke: white)
  // line((4.546, 2.30), (4.565, 2.225), stroke: white)
  line((-2, 0), (10, 0))

  arc((11.4641, 3), start: 0deg, stop: 100deg, radius: 4, mark: (end: ">", fill: black, stroke: 0.1pt), name: "omega")
  content(("omega.start", 94%, "omega.end"), [ω#v(4em)])
  arc((11.4641, 3), start: 0deg, stop: 80deg, radius: 4, stroke: (thickness: 2pt, paint: white))
  //content((10, 7), [ω = 4rad/s])
  content((-0.5, 1), [A])
  content((7.4641, 3.5), [O])
  content((11.5, 4), [B])
})


#pagebreak()
3.墙面光滑，地面粗糙，杆AB长l,质量 $display(3/8)$m，轮A半径R,质量m，初始时$theta=30degree$，求$theta=60degree$时，轮心A的速度、加速度，地面对轮的摩擦力，墙对杆的支持力。
#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  line((0, 8), (0, 0), (5, 0))

  circle((3, 1), radius: 1)
  circle((3, 1), radius: 0.1)
  line((2.95, 1.05), (0.07, 6.135), stroke: 4pt)

  content((3.4, 1.4), [A])
  content((0.4, 6.4), [B])

  arc((0, 4.1), start: 270deg, stop: 300deg, radius: 2, name: "theta")
  content(("theta.start", 20%, "theta.end"), [#v(2em)θ])
})

#pagebreak()
4.（限用动静法）轮质量m，半径R;杆质量m，长2R，初始时刻杆与水平夹角$theta=45degree$，水平面粗糙，初始时杆水平，求
- 释放时轮和杆的角加速度和地面的约束力
- 保证纯滚动的地面摩擦因数
#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  circle((3, 1), radius: 1)
  circle((3, 1), radius: 0.05, fill: black)
  content((3.5, 1), [$C_1$])
  circle((4, 1), radius: 0.1, fill: white)
  content((4.3, 1.3), [A])
  line((4.07, 1.05), (6, 1.05), (6, 0.95), (4.07, 0.95), name: "l")
  circle((5, 1), radius: 0.05, fill: black)
  content((5.3, 1.3), [$C_2$])
})

#pagebreak()
5.（限用虚位移）OC=CB=CA=l，$angle$CBO=$theta$,杆自重2P,其余部分均不计重，杆两端分别受到图示力作用，图示为平衡状态，求F和Q的关系
#cetz.canvas(length: 1cm, {
  import cetz.draw: *


  circle((4, 1), radius: 1)
  circle((0, 1), radius: 0.1, fill: white)
  line((2, 0), (6, 0))
  line((4.1, 1), (6, 1), mark: (start: ">", fill: black, stroke: 1pt))
  content((6.4, 1), [F])
  //line((4.07, 1.05), (6, 1.05), (6, 0.95), (4.07, 0.95))

  line((-0.5, 0.7), (0.5, 0.7))
  line((-0.4, 0.7), (-0.6, 0.5))
  line((-0.2, 0.7), (-0.4, 0.5))
  line((0, 0.7), (-0.2, 0.5))
  line((0.2, 0.7), (0, 0.5))
  line((0.4, 0.7), (0.2, 0.5))
  line((-0.07, 0.93), (-0.3, 0.7), (0.3, 0.7), (0.07, 0.93))


  circle((1.85, 4.31), radius: 0.1)
  line((0, 1.1), (1.75, 4.31))
  line((0.1, 1), (1.85, 4.21))
  circle((4, 1), radius: 0.1)
  line((3.9, 1), (0, 7.8), (0.14, 7.87), (4, 1.1))
  line((2, 4.45), (2, 2), mark: (end: ">", fill: black, stroke: 1pt))
  content((2, 1.5), [2P])
  line((0, 7.8), (0, 5.8), mark: (end: ">", fill: black, stroke: 1pt))
  content((0, 5.4), [Q])

  line((4, 1), (2, 1), stroke: (dash: "dashed"))
  arc((3.70, 1.4), start: 120deg, stop: 180deg, radius: 0.5)
  content((3.3, 1.4), [$theta$])

  content((0, 8.2), [A])
  content((-0.5, 1.5), [O])
  content((2.3, 4.6), [C])
  content((4, 0.5), [B])
})
