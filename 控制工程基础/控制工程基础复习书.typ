#import "@local/Typwork-some:0.1.2": styles
#import "@preview/i-figured:0.2.4"
#import "utils.typ": Red, three_line_table
#import "pagestyle.typ": style_page

#show: styles.base-style.with(lang: "zh-cn")

#let course_name = "控制工程基础复习"
#let author = "试鸢"
#let date = (2026, 11, 1)

// 第一页
#align(center)[
  #set page(
    footer: context {
      set align(center)
      text(size: 10pt)[最后更新于#date.at(0) 年 #date.at(1) 月 #date.at(2) 日]
    },
  )
  #text(
    size: 36pt,
    weight: "bold",
  )[ #course_name]
  #align(center, text(size: 16pt, fill: blue, weight: "bold", author))

  #align(left)[
    #text(blue)[= 【前言】]
    参考资料：
    - 《控制工程基础》（第4版，董景新）及《控制工程基础习题解》
    - 课程课件（第2～8章）
    - #link(
        "https://github.com/zjuatri/ZJU_Courses/tree/main/%E5%A4%A7%E4%B8%89/%E6%8E%A7%E5%88%B6%E5%B7%A5%E7%A8%8B%E5%9F%BA%E7%A1%80",
      )[atri 的《控制工程基础 补天笔记》]
    - 折一只纸鹭改写的 22-23 秋至 25-26 秋回忆卷
    - 98 经验帖：纸鹭（25-26 秋）、笔蔓越莓莓（24-25 秋）
    - 嘎嘎sama 的《题型总结》（手写，`题型总结_嘎嘎sama.pdf`）

    #text(blue)[= 【考试】]

    - 期末固定 #Red("7 道大题")，前六题各 15 分，根轨迹 10 分（25-26 秋）。
    - 题型顺序基本固定：建模 → 二阶时域指标 → Bode 图 → Nyquist 稳定性 → 方块图（Routh + 稳态误差）→ 校正 → 根轨迹。

    #v(1em)
    #text(blue, size: 15pt)[【使用说明】]#linebreak()
    #Red()[由claude opus 5.5制作, 试鸢负责使用其复习时的校对工作。]

    第2～8章按七道大题组织，每章先给历年真题和思路提示，再给必备知识，解答放在章末。第9章是没有直接考到的知识点。答案是按课件方法自己算的，未与官方答案核对。

    插图由 `assets/plots.py` 生成，历年卷原图引用 `历年卷/` 目录下的图片。
  ]
  #set page(
    footer: context {
      set align(center)

      grid(
        columns: (1fr, 1fr, 1fr),
        [#line(length: 100%, stroke: 0.7pt),
          #text(size: 10pt)[最后更新于#date.at(0) 年 #date.at(1) 月 #date.at(2) 日]
          #line(length: 100%, stroke: 0.7pt),],
      )
    },
  )
]
// 页面布局
#show: style_page.with(course_name, author)

#include "Char1.typ"
#include "Char2.typ"
#include "Char3.typ"
#include "Char4.typ"
#include "Char5.typ"
#include "Char6.typ"
#include "Char7.typ"
#include "Char8.typ"
#include "Char9.typ"
