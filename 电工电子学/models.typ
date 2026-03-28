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
#let arrow(points, direction, color: black) = {
  line(points, direction, stroke: color, mark: (end: ">", fill: color, stroke: 1.2pt))
}

// 节点
#let node(points, fill: black) = {
  circle(points, radius: 0.1, fill: fill, stroke: fill)
}

// 回路
#let loop(points1, points2, caption, color: blue) = {
  rect(points1, points2, stroke: color)
  content(((points1.at(0) + points2.at(0)) / 2, (points1.at(1) + points2.at(1)) / 2), text(color)[#caption])
  arrow(
    (points1.at(0), (points1.at(1) + points2.at(1)) / 2 - 0.4),
    (points1.at(0), (points1.at(1) + points2.at(1)) / 2 + 0.4),
    color: color,
  )
}
