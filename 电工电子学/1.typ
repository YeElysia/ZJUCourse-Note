#let zh-font = "LXGW Wenkai Mono Screen"
#let en-font = "Maple Mono NF"
#let math-font = "Libertinus Math"

#let t = {
  $ hat(alpha)(f) = f(alpha) "（同上，α–map的“定义”）" $
  $ f(alpha) #[或者*任意*内容 _α–map_ $alpha$–map] $
  $ (1,...,n) dot bold(v) + dots.c + f(dot.c) = cases("Math" 1 I l, "正文 1Il") $
}

#t

#show math.equation: set text(font: (
  //math-font, // 数学
  //"New Computer Modern Math",
  "Fira Math",
  //"Libertinus Math",
  en-font,
  zh-font, // 中文
))
#t

#show math.equation: set text(font: (
  (name: en-font, covers: regex("[.\d\p{Latin}]")),
  (name: zh-font, covers: regex("[·–—‘’“”‥…‧⸺]")),
  "Fira Math",
  //"Libertinus Math",
  //en-font,
  zh-font, // 中文
))

#t
#show math.equation: set text(font: (
  // (name: en-font, covers: regex("[.\d\p{Latin}·–—‘’“”‥…‧⸺]")),
  //(name: zh-font, covers: regex("[·–—‘’“”‥…‧⸺]")),
  "Fira Math",
  //"Libertinus Math",
  //en-font,
  zh-font, // 中文
))

#t
