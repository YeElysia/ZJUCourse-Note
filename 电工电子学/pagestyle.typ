#import "@preview/i-figured:0.2.4"

#let _set_paper_page_par(body) = {
  set text(12pt, font: ("Maple Mono NF", "LXGW WenKai Mono Screen"))
  set par(justify: true, leading: 0.8em, first-line-indent: (amount: 2em, all: true))
  set par(spacing: 1em)
  body
}

#let tips = rgb("8727a9")

#let enumbring(..args) = {
  let nums = args.pos()
  let level = nums.len()
  if level <= 1 {
    return numbering("1.", ..nums)
  } else if level == 2 {
    return numbering("1)", nums.at(1))
  } else if level == 3 {
    return numbering("（一）", nums.at(2))
  } else {
    return numbering("（1）", nums.at(3))
  }
}
#set enum(numbering: enumbring)
// 正文部分页脚
#let _set_paper_page_footer_main(body) = {
  set page(
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

  body
}
// 摘要部分页脚
#let _set_paper_page_footer_pre(body) = {
  set page(
    footer: context {
      set align(center)

      grid(
        columns: (5fr, 1fr, 5fr),
        line(length: 100%, stroke: 0.7pt),
        context {
          text(10pt, baseline: -3pt, counter(page).display("I"))
        },
        line(length: 100%, stroke: 0.7pt),
      )
    },
  )

  body
}
// 页眉
#let _set_paper_page_header(course_name, author, body) = {
  set page(header: {
    set text(10pt, baseline: 8pt, spacing: 3pt)
    grid(
      columns: (auto, 1fr),
      align(left, course_name), align(right, author),
    )

    line(length: 100%, stroke: 0.7pt)
  })
  body
}
// 目录
#let chinese_outline() = {
  align(center)[
    #text(size: 18pt, "目　　录")
  ]

  set text(size: 12pt)
  // 临时取消目录的首行缩进
  set par(leading: 1.24em, first-line-indent: 0pt)
  context {
    let loc = here()
    let elements = query(heading.where(outlined: true))
    for el in elements {
      if el.level > 2 {
        continue
      }

      // 是否有 el 位于前面，前面的目录中用拉丁数字，后面的用阿拉伯数字
      let before_toc = query(heading.where(outlined: true).before(loc)).find(one => { one.body == el.body }) != none
      let page_num = if before_toc {
        numbering("I", counter(page).at(el.location()).first())
      } else {
        counter(page).at(el.location()).first()
      }

      link(el.location())[#{
        // acknoledgement has no numbering
        let chapt_num = if el.numbering != none {
          numbering(el.numbering, ..counter(heading).at(el.location()))
        } else { none }

        if el.level == 1 {
          set text(weight: "bold")
          if chapt_num == none {} else {
            chapt_num
            "　　"
          }
          el.body
        } else {
          chapt_num
          "　"
          el.body
        }
      }]

      // 填充 ......
      box(width: 1fr, h(0.5em) + box(width: 1fr, repeat[.]) + h(0.5em))
      [#page_num]
      linebreak()
    }
  }
}
// 页面大小
#let _set_paper_page_size(body) = {
  set page(
    paper: "a4",
    margin: (
      top: 2.5cm,
      bottom: 2cm,
      left: 2cm,
      right: 2cm,
    ),
  )

  body
}
// 标题样式
#let _set_heading(body) = {
  let unary(..args) = {
    let nums = args.pos()
    let level = nums.len()
    if level <= 2 {
      return numbering("1.1", ..nums)
    } else if level == 3 {
      return numbering("1.1.1 ", ..nums)
    } else if level == 4 {
      return numbering("（1）", nums.at(3))
    } else if level == 5 {
      return numbering(" 1）", nums.at(4))
    }
  }
  set heading(numbering: unary)
  set heading(supplement: [节])

  // 参考自 https://github.com/nju-lug/modern-nju-thesis/blob/main/utils/custom-heading.typ
  show heading: it => {
    if it != none {
      set par(first-line-indent: 0em)
      if it != none {
        numbering(it.numbering, ..counter(heading).at(it.location()))
        [　 ]
        it.body
      }
    } else {
      ""
    }
  }
  show heading.where(level: 1): it => {
    set text(weight: "bold", size: 18pt, blue)
    set block(spacing: 1.5em)
    it
  }
  show heading.where(level: 2): it => {
    set text(weight: "bold", size: 14pt, blue)
    set block(spacing: 1em, above: 1.5em, below: 1.5em)
    it
  }
  show heading.where(level: 3): it => {
    set text(weight: "bold", size: 12pt, blue)
    set block(spacing: 0.5em, above: 1.5em, below: 1.5em)
    if it != none {
      set par(first-line-indent: 0em)
      if it != none {
        numbering(it.numbering, ..counter(heading).at(it.location()))
      }
      it.body
    } else {
      ""
    }
  }
  show heading.where(level: 4): it => {
    set text(weight: "bold", size: 12pt, blue)
    set block(above: 1.5em, below: 1.5em)
    if it != none {
      set par(first-line-indent: (amount: 0em, all: true))
      if it != none {
        numbering(it.numbering, ..counter(heading).at(it.location()))
      }
      it.body
    } else {
      ""
    }
  }
  show heading.where(level: 5): it => {
    set text(weight: "bold", size: 12pt, blue)
    set block(above: 1.5em, below: 1.5em)
    if it != none {
      set par(first-line-indent: (amount: 1em, all: true))
      if it != none {
        numbering(it.numbering, ..counter(heading).at(it.location()))
      }
      it.body
    } else {
      ""
    }
  }
  body
}
// 设置图表
#let _set_figure(body) = {
  // 设置前缀
  show figure.where(kind: image): set figure(supplement: [图])

  show figure.where(kind: table): set figure(supplement: [表])
  show figure.where(kind: table): set figure.caption(position: top)

  // 使用正确的编号与图表标题字体及分隔符
  show figure.caption: set text()
  set figure.caption(separator: "　")

  set math.equation(supplement: [公式])

  body
}

// 设置编号 (引用时, 需要使用标签), 注意, 必须在 heading 设置完成后再调用
#let _set_numbering(body) = {
  show heading: i-figured.reset-counters.with(level: 2)
  show figure: i-figured.show-figure.with(numbering: "1.1", level: 2)
  show math.equation: i-figured.show-equation.with(numbering: "(1.1)", level: 2, only-labeled: true)

  body
}

#let style_page(course_name, author, body) = {
  pagebreak()
  counter(page).update(1)

  show: _set_heading.with()
  show: _set_figure.with()
  show: _set_numbering.with()
  show: _set_paper_page_size.with()
  show: _set_paper_page_header.with(course_name, author)
  show: _set_paper_page_footer_pre.with()

  chinese_outline()
  pagebreak()

  show: _set_paper_page_par.with()
  show: _set_paper_page_footer_main.with()

  counter(page).update(1)
  body
}
