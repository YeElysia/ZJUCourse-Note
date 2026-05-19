#import "@preview/cetz:0.4.2"
#import cetz.draw: *

// 电源 -
#let constSourceH(points) = {
  circle(points, radius: 0.4)
  line((points.at(0) - 0.4, points.at(1)), (points.at(0) + 0.4, points.at(1)))
}
// 电源 |
#let constSourceV(points) = {
  circle(points, radius: 0.4)
  line((points.at(0), points.at(1) - 0.4), (points.at(0), points.at(1) + 0.4))
}

// 电阻 横
#let resistorH(points) = {
  rect((points.at(0) - 0.4, points.at(1) + 0.1), (points.at(0) + 0.4, points.at(1) - 0.1))
}

// 受控源 ｜
#let controlledSourceV(points) = {
  line(
    (points.at(0), points.at(1) - 0.4),
    (points.at(0) + 0.4, points.at(1)),
    (points.at(0), points.at(1) + 0.4),
    (points.at(0) - 0.4, points.at(1)),
    close: true,
  )
  line((points.at(0), points.at(1) - 0.4), (points.at(0), points.at(1) + 0.4))
}

// 受控源 -
#let controlledSourceH(points) = {
  line(
    (points.at(0) - 0.4, points.at(1)),
    (points.at(0), points.at(1) + 0.4),
    (points.at(0) + 0.4, points.at(1)),
    (points.at(0), points.at(1) - 0.4),
    close: true,
  )
  line((points.at(0) - 0.4, points.at(1)), (points.at(0) + 0.4, points.at(1)))
}

// 电阻 竖
#let resistorV(points) = {
  rect((points.at(0) - 0.1, points.at(1) - 0.4), (points.at(0) + 0.1, points.at(1) + 0.4))
}
// 箭头
#let arrow_I(points, direction, color: black) = {
  line(points, direction, stroke: color, mark: (end: ">", fill: color, stroke: 1.2pt))
}

// 节点
#let node(points, fill: black, color: black) = {
  circle(points, radius: 0.1, fill: fill, stroke: color)
}

// 回路
#let loop(points1, points2, caption, color: blue) = {
  rect(points1, points2, stroke: color)
  content(((points1.at(0) + points2.at(0)) / 2, (points1.at(1) + points2.at(1)) / 2), text(color)[#caption])
  arrow_I(
    (points1.at(0), (points1.at(1) + points2.at(1)) / 2 - 0.4),
    (points1.at(0), (points1.at(1) + points2.at(1)) / 2 + 0.4),
    color: color,
  )
}

// 相量
#let ph(angle) = {
  box(baseline: 0.2em, inset: (x: 0.1em, y: 0em), outset: -5em)[
    #cetz.canvas({
      import cetz.draw: *
      content((0, 0), text(0.8em, [#h(1em) #angle]), name: "txt", padding: (x: 0.3em, y: 0.2em))
      line("txt.south-west", "txt.south-east", stroke: 0.08em)
      line("txt.south-west", (rel: (0.7em, 1em)), stroke: 0.08em)
    })
  ]
}

// 电容
#let capacitorH(points) = {
  line((points.at(0) - 0.4, points.at(1)), (points.at(0) - 0.1, points.at(1)))
  line((points.at(0) + 0.1, points.at(1)), (points.at(0) + 0.4, points.at(1)))
  line((points.at(0) - 0.1, points.at(1) - 0.3), (points.at(0) - 0.1, points.at(1) + 0.3))
  line((points.at(0) + 0.1, points.at(1) - 0.3), (points.at(0) + 0.1, points.at(1) + 0.3))
}

#let capacitorV(points) = {
  line((points.at(0), points.at(1) - 0.4), (points.at(0), points.at(1) - 0.1))
  line((points.at(0), points.at(1) + 0.1), (points.at(0), points.at(1) + 0.4))
  line((points.at(0) - 0.3, points.at(1) - 0.1), (points.at(0) + 0.3, points.at(1) - 0.1))
  line((points.at(0) - 0.3, points.at(1) + 0.1), (points.at(0) + 0.3, points.at(1) + 0.1))
}

// 电感
#let inductorH(points) = {
  arc((points.at(0) - 0.3, points.at(1)), radius: 0.15, start: 0deg, stop: 180deg)
  arc((points), radius: 0.15, start: 0deg, stop: 180deg)
  arc((points.at(0) + 0.3, points.at(1)), radius: 0.15, start: 0deg, stop: 180deg)
  arc((points.at(0) + 0.6, points.at(1)), radius: 0.15, start: 0deg, stop: 180deg)
}

#let inductorV(points) = {
  arc((points.at(0), points.at(1) - 0.6), radius: 0.15, start: -90deg, stop: 90deg)
  arc((points.at(0), points.at(1) - 0.3), radius: 0.15, start: -90deg, stop: 90deg)
  arc((points.at(0), points.at(1)), radius: 0.15, start: -90deg, stop: 90deg)
  arc((points.at(0), points.at(1) + 0.3), radius: 0.15, start: -90deg, stop: 90deg)
}

// 二极管
#let diode(point1, point2, mark) = {
  if mark == "r" {
    line(point1, point2)
    line(
      (point1.at(0) + 0.1, point1.at(1) + 0.3),
      (point1.at(0) + 0.1, point1.at(1) - 0.3),
      (point2.at(0) - 0.1, point2.at(1)),
      close: true,
    )
    line((point2.at(0) - 0.1, point2.at(1) + 0.3), (point2.at(0) - 0.1, point2.at(1) - 0.3))
  } else if mark == "u" {
    line(point1, point2)
    line(
      (point1.at(0) + 0.3, point1.at(1) + 0.1),
      (point1.at(0) - 0.3, point1.at(1) + 0.1),
      (point2.at(0), point2.at(1) - 0.1),
      close: true,
    )
    line((point2.at(0) + 0.3, point2.at(1) - 0.1), (point2.at(0) - 0.3, point2.at(1) - 0.1))
  } else if mark == "d" {
    line(point1, point2)
    line(
      (point1.at(0) + 0.3, point1.at(1) - 0.1),
      (point1.at(0) - 0.3, point1.at(1) - 0.1),
      (point2.at(0), point2.at(1) + 0.1),
      close: true,
    )
    line((point2.at(0) + 0.3, point2.at(1) + 0.1), (point2.at(0) - 0.3, point2.at(1) + 0.1))
  } else if mark == "l" {
    line(point1, point2)
    line(
      (point1.at(0) - 0.1, point1.at(1) + 0.3),
      (point1.at(0) - 0.1, point1.at(1) - 0.3),
      (point2.at(0) + 0.1, point2.at(1)),
      close: true,
    )
    line((point2.at(0) + 0.1, point2.at(1) + 0.3), (point2.at(0) + 0.1, point2.at(1) - 0.3))
  }
}

// 与门
#let andGate(points) = {
  rect((points.at(0) - 0.3, points.at(1) - 0.4), (points.at(0) + 0.3, points.at(1) + 0.4))
  content(points, [&])
}
// 或门
#let orGate(points) = {
  rect((points.at(0) - 0.3, points.at(1) - 0.4), (points.at(0) + 0.3, points.at(1) + 0.4))
  content(points, text(size: 8pt)[>=1])
}
// 非门
#let notGate(points) = {
  rect((points.at(0) - 0.3, points.at(1) - 0.4), (points.at(0) + 0.3, points.at(1) + 0.4))
  content(points, text(size: 8pt)[1])
  node((points.at(0) + 0.4, points.at(1)), fill: none)
}

// 与非门
#let nandGate(points) = {
  rect((points.at(0) - 0.3, points.at(1) - 0.4), (points.at(0) + 0.3, points.at(1) + 0.4))
  content(points, [&])
  node((points.at(0) + 0.4, points.at(1)), fill: none)
}
// 或非门
#let norGate(points) = {
  rect((points.at(0) - 0.3, points.at(1) - 0.4), (points.at(0) + 0.3, points.at(1) + 0.4))
  content(points, text(size: 8pt)[>=1])
  node((points.at(0) + 0.4, points.at(1)), fill: none)
}
// 异或门
#let xorGate(points) = {
  rect((points.at(0) - 0.3, points.at(1) - 0.4), (points.at(0) + 0.3, points.at(1) + 0.4))
  content(points, text(size: 8pt)[=1])
}
