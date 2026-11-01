#import "@preview/cetz:0.4.2"
#import cetz.draw: *

// 方块
#let blk(pos, body, w: 2.6, h: 1.1) = {
  let (x, y) = pos
  rect((x - w / 2, y - h / 2), (x + w / 2, y + h / 2), fill: rgb("EAF2F5"))
  content(pos, body)
}

// 比较点
#let sumnode(pos, r: 0.25) = {
  let (x, y) = pos
  circle(pos, radius: r, fill: white)
  let d = r * 0.7071
  line((x - d, y - d), (x + d, y + d))
  line((x - d, y + d), (x + d, y - d))
}

// 带箭头的信号线
#let arr(..pts) = line(..pts, mark: (end: ">", fill: black))

// 引出点
#let tap(pos) = circle(pos, radius: 0.06, fill: black)

// 双质量块方块图：F → [A] → Y1 → (Y1−Y2) → [B] → F12 → [C] → Y2
#let two_mass(A, B, C, fin, y1, y2) = cetz.canvas({
  arr((0, 0), (0.95, 0))
  content((0.3, 0.35), fin)
  sumnode((1.2, 0))
  arr((1.45, 0), (2.1, 0))
  blk((3.5, 0), A)
  arr((4.9, 0), (6.15, 0))
  tap((5.3, 0))
  arr((5.3, 0), (5.3, -1.3))
  content((5.3, -1.6), y1)
  sumnode((6.4, 0))
  arr((6.65, 0), (7.2, 0))
  blk((8.5, 0), B)
  arr((9.8, 0), (10.5, 0))
  tap((10.1, 0))
  content((10.3, -0.38), text(size: 9pt, $F_(12)$))
  blk((11.8, 0), C)
  arr((13.1, 0), (14.4, 0))
  content((14.2, 0.35), y2)
  tap((13.6, 0))
  // 位移差反馈
  line((13.6, 0), (13.6, -1.0), (6.4, -1.0))
  arr((6.4, -1.0), (6.4, -0.25))
  content((6.15, -0.5), $-$)
  // 耦合力反作用在第一个质量上
  line((10.1, 0), (10.1, 1.2), (1.2, 1.2))
  arr((1.2, 1.2), (1.2, 0.25))
  content((0.95, 0.5), $-$)
})

// 单回路方块图：R → ⊗ → [G1] → ⊕(D) → [G2] → ⊕(P) → Y，单位负反馈
#let loop3(G1, G2, r, d, p, y) = cetz.canvas({
  arr((0, 0), (0.95, 0))
  content((0.3, 0.35), r)
  sumnode((1.2, 0))
  arr((1.45, 0), (2.1, 0))
  blk((3.5, 0), G1)
  arr((4.9, 0), (5.75, 0))
  sumnode((6, 0))
  arr((6, 1.3), (6, 0.25))
  content((6, 1.6), d)
  arr((6.25, 0), (7.1, 0))
  blk((8.6, 0), G2, w: 3.0)
  arr((10.1, 0), (10.95, 0))
  sumnode((11.2, 0))
  arr((11.2, 1.3), (11.2, 0.25))
  content((11.2, 1.6), p)
  arr((11.45, 0), (13, 0))
  content((12.8, 0.35), y)
  tap((12.2, 0))
  line((12.2, 0), (12.2, -1.2), (1.2, -1.2))
  arr((1.2, -1.2), (1.2, -0.25))
  content((0.95, -0.5), $-$)
})
