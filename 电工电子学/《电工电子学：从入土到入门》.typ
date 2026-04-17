#import "@local/Typwork-some:0.1.2": styles
#import "@preview/i-figured:0.2.4"
#import "@preview/codelst:2.0.2": sourcecode
#import "utils.typ": Red, three_line_table
#import "pagestyle.typ": style_page

#show: styles.base-style.with(lang: "zh-cn")

#let course_name = "电工电子学从入土到入门"
#let author = "试鸢"
#let date = (2026, 3, 16)

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
  // #align(right, text(16pt, baseline: -50pt, weight: "regular", "——贡菜培养日记"))

  #align(left)[
    #text(blue)[= 【前言】]
    参考文献：
    - 《电工电子学》（第5版）
    - #link("https://www.cc98.org/topic/6089073")[【学习天地】2024-2025秋冬学期 电工电子学复习提纲（一到九章）]
    - #link("https://savia7582.github.io/Exterior/Engineering/EE/")[Savia的《电工电子学及实验》通关攻略]
    #text(blue)[= 【成绩计算】]

    - （课外）SPOC课程+课堂外作业【中国大学MOOC】+【学在浙大】#Red("20%")
    - （课外）思政报告占5%。上传【学在浙大】#Red("5%")
    - （课内）阶段性测试（共3次）【学在浙大】。#Red("15%")
    - （课内）随堂测试【学在浙大】#Red("10%")
    - 期末卷面成绩 #Red("50%")
    - 期末卷面成绩低于45分，本课程不及格。

    #v(1em)
    #text(blue, size: 15pt)[【一些碎碎念】]#linebreak()
    非常感谢#link("https://www.cc98.org/user/id/666442")[Savia]在本文档修订过程中提供的帮助。

    另外非常抱歉本人一直在调整字体, 理论上#text(font: "New Computer Modern Math")[New Computer Modern Math]肯定是一个很好的数学字体, 但是#text(font: "Fira Math")[Fira Math]跟我的中英文字体看起来比较搭, 取舍之间本文档的英文和数字的字体可能会有些许异常, 请各位见谅。

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
