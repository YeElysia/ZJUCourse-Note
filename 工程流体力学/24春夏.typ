#import "@preview/cetz:0.4.2"

#set text(12pt, font: ("Maple Mono NF", "LXGW WenKai Mono Screen"))
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
      align(left, "工程流体力学和热工基础"), align(right, ""),
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
#show heading.where(level: 1): it => {
  set text(weight: "bold", size: 14pt)
  set block(spacing: 1.5em)
  it
}
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
  #text(size: 20pt, weight: "regular")[25 春夏 回忆卷]
  #v(0em)
  // #text(size: 14pt, weight: "regular")[《军事理论》期末回忆卷]
]

1. 论述流体和固体在力学性能上的区别。(5)
#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  (书本第3页)

  第一点是流体不能承受拉⼒, 因⽽流体内部永远不存在抵抗拉伸变形的拉应⼒。

  第⼆点是流体在宏观平衡状态下不能承受剪切⼒, 任何微⼩的剪切⼒都会导致流体连续变形、平衡破坏、产⽣流动。

  固体显然没有这两个特点。它能承受拉⼒、压⼒和剪切⼒，内部相应产⽣拉应⼒、压应⼒和切应⼒以抵抗变形, 外⼒或应⼒不⼤到⼀定数值, 固体形状不会被破坏。

  流体的这两个特点简称为流体的易流动性易流动性既是流体命名的由来, 也是流体区别于固体的根本标志。
]

2. 试述液体的粘性与温度的关系, 并阐述应用。(5)

#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  (书本第24页)

  液体粘度的⼤⼩取决于分⼦间距和分⼦引⼒, 当温度升⾼或压强降低时(液体膨胀、分⼦ 间距增⼤、分⼦引⼒减⼩, 故粘度降低。反之温度降低或压强升⾼时, 液体粘度增⼤。这种粘度变化规律可⽤指数形式表达:
  $
    mu = mu_0 e^(alpha p - lambda(t - t_0))
  $
  只考虑温度的影响:
  $
    mu = mu_0 e^(- lambda(t - t_0))
  $
  (25页)

  影响⾮等温流动(例如液压传动及远程⽯油输送等)性能的一个重要因素

]

1. 有一不可压缩流体, x方向速度分量 $u = a x^2 + b y$, z方面为0, 设y方向为v, 且y=0时, v=0, 求y方向分量, a为常数。(5)
#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[

  根据不可压缩流体的连续性方程, 可得:
  $
    (partial u)/(partial x) + (partial v)/(partial y) + (partial w)/(partial z) = 0 \
    2 a x + (partial v)/(partial y) = 0 \
  $
  偏积分得
  $
    v = - a x^2 y + C(x, z)
  $
  根据边界条件y=0时v=0, 可得$C(x, z) = 0$, 故y方向分量为
  $
    v = - a x^2 y
  $
]

2. 如图小坝, 求作用在单位宽度坝面上的合力$F$及其与垂线的夹角, 已知$tan theta = 4$
#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0.3, 1.2), (0.3, 2.4), (0.9, 2.4), (00.9, 0), (0, 0))
  arc((0.3, 0), radius: 0.3, start: 0deg, stop: 72deg)
  line((0.9, 0), (0.2, 0.7), stroke: gray)
  line((0.9, 0.3), (0.24, 0.96), stroke: gray)
  line((0.9, 0.6), (0.3, 1.2), stroke: gray)
  line((0.9, 0.9), (0.3, 1.5), stroke: gray)
  line((0.9, 1.2), (0.3, 1.8), stroke: gray)
  line((0.9, 1.5), (0.3, 2.1), stroke: gray)
  line((0.9, 1.8), (0.3, 2.4), stroke: gray)
  line((0.9, 2.1), (0.6, 2.4), stroke: gray)

  line((0.3, 1.2), (-0.5, 1.2), stroke: (dash: "dashed"))
  line((0.3, 0), (-1.4, 0), stroke: (dash: "dashed"))
  line((0.3, 2.4), (-1.4, 2.4), stroke: (dash: "dashed"))
  line((-0.8, 2.3), (-0.4, 2.3))
  line((-0.75, 2.25), (-0.45, 2.25))
  line((-0.7, 2.2), (-0.5, 2.2))
  line((-0.2, 1.2), (-0.2, 0), mark: (start: ">", end: ">", fill: black))
  line((-1.2, 2.4), (-1.2, 0), mark: (start: ">", end: ">", fill: black))
  content((-0.7, 0.6), [37m])
  content((-1.7, 1.2), [78m])
  content((0.5, 0.2), [$theta$])
})
#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  参考78页例特例2
  $
      F_y & = rho g h_c A_y = 1000 times 9.8 times 78/2 times (78 times 1) \
          & =29811.6 "kN" \
      F_z & = rho g V_F = 1000 times 9.8 times [1/2 (78 + 41) times 37/4 times 1] \
          & = 5393.675 "kN" \
    alpha & = arctan(F_z / F_y) = arctan(5393.675/29811.6) approx 15 degree
  $]
3. $rho = 900 "kg/m"^3$的油从$d = 2"cm"$的孔射出, 孔口前表压$P=45000"Pa"$, 射流对挡板的冲击力$F=20"N"$, 出流流量$q_v = 2.29 "L/s"$, 试求孔口的出流系数$C_v、C_d、C_c$
#v(-1em)
#image("assets/image.png", width: 30%)
#v(-1em)
#block(inset: 10pt, radius: 4pt, stroke: gray + 0pt, width: 100%, fill: rgb(251, 242, 235))[
  此处为6-3原题

  由书本329页式(6-15), 流量系数
  $
    C_d & = q_v / (A sqrt((2 Delta P) / rho)) = q_v / ((pi d^2)/4 sqrt((2 P) / rho)) = 0.00229 /((pi times 0.02^2 / 4 times sqrt(2 times 45000 / 900))) = 0.729 \
  $
  由冲击力 $F = rho q_v v = rho q_v (C_v sqrt(2 ( P) / rho))$（前一个等号可以由动量定理得到）, 可得

  流速系数
  $
    C_v & = F / (rho q_v sqrt((2 P) / rho)) = 20 / (900 times 0.00229 times sqrt(2 times 45000 / 900)) = 0.970 \
  $
  收缩系数
  $
    C_c & = C_d / C_v = 0.729 / 0.970 = 0.752 \
  $
]

4. 小泵抽水, 流量$q_v = 0.0628 "m"^3\/"s"$。水的运动粘度$nu = 1.519 "m"^2\/"s"$, 管径$d= 200"mm"$, $h_1 =3"m"$, $h_2 =17"m"$, $h_3 =15"m"$, $L_2 = 12"m"$, $lambda = 0.0242$, $xi_1 =3$, $xi_2 =0.204$, $xi_3 =0.073$,$xi_4 =1$, $theta = 30 degree$ 求:
#image("assets/image-1.png", width: 30%)
(1) 泵的扬程$H$;
(2) 泵的有效功率$P$;
