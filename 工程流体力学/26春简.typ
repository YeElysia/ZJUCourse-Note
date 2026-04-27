#import "@preview/cetz:0.4.2"

#set text(12pt, font: ("Maple Mono NF", "LXGW WenKai Mono"))
#set par(justify: true, leading: 1em, first-line-indent: (amount: 2em, all: true))
#set par(spacing: 1.24em)


#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 2cm,
    right: 2cm,
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

#let kong(width: 5em, it) = {
  box(width: width, stroke: (bottom: 1pt), inset: (bottom: 20%, left: -10%, right: -10%))[#align(center)[#it]]
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
  #text(size: 20pt, weight: "regular")[浙江大学 2025-2026 学年春学期]
  #v(-1em)
  #text(size: 14pt, weight: "regular")[《工程流体力学》期末回忆卷]

  #v(2em)
]
= 说明题 (共20分, 每小题4分)
1. 阐述流体粘性产生的原因, 并说明流体粘性随温度的变化规律。
2. 说明流体微团运动分解与刚体运动分解的不同之处。
3. 分别说明层流、湍流的沿程摩阻系数与哪些因素有关。
4. 说明油液中混入气体会产生哪些危害
5. 同样出流条件下, 当孔口面积相同时, 为什么通过厚壁孔口的流量大于薄壁孔口。
= 计算题
1. 设某流场速度分布为
  #grid(
    columns: (1fr, 1fr),
    $
      v_x = 4t - (2y)/(x^2+y^2)
    $,
    $
      v_y = (2x)/(x^2+y^2)
    $,
  )
  试求: 在t=0时过(1,1)点流体的加速度。(6分)
#v(1em)
2. 已知某二维不可压缩流场速度分布为
  #grid(
    columns: (1fr, 1fr),
    $
      v_x = x^2 + 4x y - y^2
    $,
    $
      v_y = 2x y - 4y
    $,
  )
  试确定：(1) 流场是否可压缩? (4分)

  #h(4em) (2) 流场是否有旋? (5分)
#v(1em)
3. 如图所示, 有一圆形滚门, 宽度b=1m, 直径D=40, 两侧有水, 上游水深$H_1=4"m"$, 下游水深$H_2=2"m"$, 求作用在门上的静水总压力(包括大小、方向) (20分)
#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 0))
  line((0, 4), (5, 4), stroke: (dash: "dashed"))
  line((1.6, 3.9), (2.4, 3.9))
  line((1.7, 3.8), (2.3, 3.8))
  line((1.8, 3.7), (2.2, 3.7))
  line((0.5, 0), (0.5, 4), mark: (start: ">", end: ">", fill: black))
  content((0, 2), [4m])
  content((2, 0.5), [水])
  circle((5, 2), radius: 2)

  line((2, 2), (10, 2), stroke: (dash: "dashed"))
  line((5 - 1.414, 2 - 1.414), (5 + 1.414, 2 + 1.414), mark: (start: ">", end: ">", fill: black))
  content((4.5, 1), [D])
  line((8.1, 1.9), (8.9, 1.9))
  line((8.2, 1.8), (8.8, 1.8))
  line((8.3, 1.7), (8.7, 1.7))
  line((9.5, 0), (9.5, 2), mark: (start: ">", end: ">", fill: black))
  content((10, 1), [2m])
  content((8.5, 0.5), [水])
  for i in (0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5) {
    line((0.3 + i, 0), (0 + i, -0.3))
  }
})

#pagebreak()
4. 断面积为$A = 2580 "mm"^2$的水射流以$30 "m"\/"s"$的速度喷入转向角为$theta = 2.62$弧度的叶片, 如果叶片以$U= 12 "m"\/"s"$的速度按射流喷射方向运动求：
#grid(
  columns: 2,
  gutter: 2em,
  [
    (1) 叶片上受到沿喷射方向的力

    (2) 叶片上受到垂直于喷射方向的力

    (3) 对叶片作的功率
  ],
  cetz.canvas({
    import cetz.draw: *
    arc((0, 0), start: -90deg, stop: -60deg, radius: 9)
    arc((0, 1), start: -90deg, stop: -70deg, radius: 12)
    arc((0.5, 0.2), start: -88deg, stop: -61deg, radius: 8.6, stroke: (dash: "dashed"))
    arc((0.5, 0.8), start: -88deg, stop: -70deg, radius: 12, stroke: (dash: "dashed"))

    line((0.5, 0.2), (0.5, 0.8), stroke: (dash: "dashed"))
    arc((0, -0.1), start: -90deg, stop: -86deg, radius: 9, stroke: (paint: white))
    arc((), start: -86deg, stop: -60deg, radius: 9)
    line((0.7, -0.09), (0.7, 0.05))
    line((1, -0.07), (1, 0.05))
    line((1.3, -0.03), (1.3, 0.07))
    line((1.6, 0.02), (1.6, 0.14))
    line((1.9, 0.07), (1.9, 0.18))
    line((2.2, 0.15), (2.2, 0.25))
    line((2.5, 0.23), (2.5, 0.35))
    line((2.8, 0.31), (2.8, 0.47))
    line((3.1, 0.43), (3.1, 0.58))
    line((3.4, 0.55), (3.4, 0.68))
    line((3.7, 0.67), (3.7, 0.8))
    line((4, 0.82), (4, 0.95))
    line((4.3, 0.97), (4.3, 1.1))

    arc((0, 0), start: 90deg, stop: 120deg, radius: 2)
    arc((), start: -150deg, stop: -210deg, radius: 0.766)
    arc((), start: -150deg, stop: -210deg, radius: 0.766)
    arc((0, 1), start: -90deg, stop: -120deg, radius: 2)
    arc((), start: 30deg, stop: -30deg, radius: 0.766)
    arc((0, -0.1), start: 90deg, stop: 120deg, radius: 1.9)
    line((), (-1, -0.26))
    arc((0, 1.1), start: -90deg, stop: -120deg, radius: 1.9)
    line((), (-1, 1.26))
    line((0, 1.1), (0, -0.1))
    line((-0.25, 1), (-0.25, 1.1))
    line((-0.5, 1.07), (-0.5, 1.19))
    line((-0.75, 1.13), (-0.75, 1.25))
    line((-0.25, 0), (-0.25, -0.1))
    line((-0.5, -0.07), (-0.5, -0.19))
    line((-0.75, -0.13), (-0.75, -0.25))

    line((0.2, 0.5), (0.8, 0.5), mark: (end: ">", fill: black, stroke: 0.2pt))
    content((0.3, 0.8), [$v_1$])
    line((4.2, 1.35), (4.7, 1.6), mark: (end: ">", fill: black, stroke: 0.2pt))
    content((4.5, 1.9), [$v_2$])
    line((2.5, 0.1), (3.3, 0.1), mark: (end: ">", fill: black, stroke: 0.2pt))
    content((3.5, 0.1), [$U$])

    line((1, 0.5), (6, 0.5), mark: (end: "straight"))
    content((5.9, 0.2), [x])
    line((1, 0.5), (1, 2.5), mark: (end: "straight"))
    content((1.3, 2.4), [y])

    line((8, 1.5), (6, 1.5), mark: (start: "straight"))
    line((), (rel: (30deg, 2)), mark: (end: "straight"))
    content((rel: (0.3, 0)), [$v_2$])
    content((7, 1.8), [$theta$])
    arc((6.5, 1.5), radius: 0.5, start: 0deg, stop: 30deg)
    content((8.3, 1.5), [$v_1$])
  }),
)
#v(10em)
5. 齿轮泵向具有端⾯缝隙$b=0.3"mm"$, 和同⼼环形缝隙$a=0.4"mm"$的柱塞和套筒供油, 借以平衡柱塞上的轴向⼒$P$。

  已知泵⼊口在液⾯之上$h=0.7"m"$, 吸油管$l=1"m"$, $d=15"mm"$, 压油管长$5l$。柱塞直径$D=50"mm"$, 柱塞长度$L=100"mm"$, 油的密度为$rho=900 "kg"\/"m"$, 动⼒粘度$mu=0.065"Pa"dot"s"$, 流量$Q=0.4"L"\/"s"$,  管道⼊口局部阻⼒系数$xi = 0.5$。试求:

(1) 泵⼊口压强$p_1$、泵出口压强$p_2$、圆盘外缘压强$p_4$, 假定柱塞右端压强$p=0$;

(2) 柱塞的轴向⼒P和泵的功率。
#image("assets/image-3.png", width: 50%)
