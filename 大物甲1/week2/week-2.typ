#import "@local/typsthw:0.1.0": homework

#let question = homework.question
#let answer = homework.answer

#let level = sys.inputs.at("level", default: "post");
#let level = "submit"

#show: homework.style.with(
  course: "大学物理（甲）Ⅰ",
  name: "叶畅飞",
  alter: "试鸢",
  id: "3240103132",
  lang: "zh-cn",
  title: "第二周",
  level: level,
)

#show raw.where(block: true): block.with(
  width: 100%,
  stroke: 1pt,
  radius: 5pt,
  breakable: true,
  inset: 5pt,
)

#question(number: "2.3")[]
#answer()[
  #image("image.jpg")
]

#question(number: "2.18")[]
#answer()[
  #image("image-1.png")
]
=
=
#question(number: "2.19")[]
#answer()[
  #image("image-2.png")
]

#question(number: "2.20")[]
#answer()[
  #image("image-3.png", height: 59.2%)
]

#question(number: "2.21")[]
#answer()[
  #image("image-4.png")
]

#question(number: "2.28")[]
#answer()[
  #image("image-5.png")
]

#question(number: "2.30")[]
#answer()[
  #image("image-6.png")
]

#question(number: "2.44")[]
#answer()[
  #image("image-7.png")
]z
#question(number: "2.48")[]
#answer()[
  #image("image-8.png")
]
#question(number: "2.50")[]
#answer()[
  #image("image-9.png")
]
