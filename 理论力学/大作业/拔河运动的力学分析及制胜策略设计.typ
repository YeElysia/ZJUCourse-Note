#import "@local/Typwork-some:0.1.1": styles
#import "@preview/i-figured:0.2.4"
#import "@preview/codelst:2.0.2": sourcecode
#show: styles.base-style.with(lang: "zh-cn")

#let course = "理论力学(甲)"
#let name = "试鸢"
#let lang = "zh-cn"
#let title = "综合大作业1"
#let level = "post"
#let date = (2025, 11, 26)
#set document(title: course, author: name)
#set page(numbering: none)

// 封面
#align(center)[
  // hust logo
  #v(20pt)

  #image("figures/char.png", width: 55%)

  #v(40pt)

  #text(
    size: 24pt,
    weight: "bold",
  )[拔河运动的力学分析及制胜策略设计]

  #v(40pt)

  #let info_value(body) = {
    rect(
      width: 100%,
      inset: 2pt,
      stroke: (
        bottom: 1pt + black,
      ),
      text(
        size: 16pt,
        bottom-edge: "descender",
      )[
        #body
      ],
    )
  }

  #let info_key(body) = {
    rect(
      width: 100%,
      inset: 2pt,
      stroke: none,
      text(
        size: 16pt,
        body,
      ),
    )
  }

  #grid(
    columns: (70pt, 180pt),
    rows: (40pt, 40pt),
    gutter: 3pt,
    // info_key("作业名称"), info_value("实验报告六"),
    info_key("姓　　名"), info_value("叶畅飞"),
    info_key("学　　号"), info_value("3240103132"),
    info_key("电子邮箱"), info_value("yeelysia@zju.edu.cn"),
    info_key("联系电话"), info_value("19557031070"),
    info_key("指导老师"), info_value("张文普"),
  )

  #v(30pt)
  #text(size: 16pt)[
    #date.at(0) 年 #date.at(1) 月 #date.at(2) 日
  ]
]
#pagebreak()
#counter(page).update(1)
// 页面布局
#let _set_paper_page_par(body) = {
  set text(12pt, font: ("Maple Mono NF", "LXGW WenKai"))
  set par(justify: true, leading: 1em, first-line-indent: (amount: 2em, all: true))
  set par(spacing: 1.24em)

  body
}
// 正文部分页脚
#let _set_paper_page_footer_main(body) = {
  set page(
    footer: context {
      set align(center)

      grid(
        columns: (5fr, 1fr, 5fr),
        line(length: 100%, stroke: 0.7pt),
        context {
          text(10pt, baseline: -3pt, counter(page).display("1"))
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
#let _set_paper_page_header(body) = {
  set page(header: {
    set text(10pt, baseline: 8pt, spacing: 3pt)
    grid(
      columns: (auto, 1fr),
      align(left, course), align(right, title),
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
      // 计算机学院要求不出现三级以上标题
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

#let _fix_indent(body) = {
  // 首段不缩进，手动加上 box
  show figure: it => {
    it + empty_par()
  }
  show math.equation.where(block: true): it => {
    it + empty_par()
  }

  body
}
// 页面大小
#let _set_paper_page_size(body) = {
  set page(
    paper: "a4",
    margin: (
      top: 2.5cm,
      bottom: 2.5cm,
      left: 3cm,
      right: 3cm,
    ),
  )

  body
}


#let _set_heading(body) = {
  set heading(numbering: "1.1.1.1")
  set heading(supplement: [节])

  // 参考自 https://github.com/nju-lug/modern-nju-thesis/blob/main/utils/custom-heading.typ
  show heading: it => {
    if it != none {
      set par(first-line-indent: 0em)
      if it.has("numbering") and it.numbering != none {
        numbering(it.numbering, ..counter(heading).at(it.location()))
        [　 ]
      }
      it.body
    } else {
      ""
    }
  }
  show heading.where(level: 1): it => {
    set text(weight: "bold", size: 18pt)
    set block(spacing: 1.5em)
    it
  }
  show heading.where(level: 2): it => {
    set text(weight: "bold", size: 14pt)
    set block(spacing: 1em, above: 1.5em, below: 1.5em)
    it
  }
  show heading.where(level: 3): it => {
    set text(weight: "bold", size: 12pt)
    set block(spacing: 0.5em, above: 1.5em, below: 1.5em)
    it
  }
  show heading.where(level: 4): it => {
    set text(weight: "bold", size: 12pt)
    set block(above: 1.5em, below: 1.5em)
    it
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
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure.with(numbering: "1-1")
  show math.equation: i-figured.show-equation.with(numbering: "(1-1)")

  body
}

// 参考文献
#let _set_references(csl_style: "pages/hust-cse-ug.csl", body) = {
  set bibliography(title: "参考文献", style: csl_style)

  show bibliography: it => {
    set heading(level: 1, numbering: none)
    set par(justify: false, leading: 1.24em, first-line-indent: 2em)

    it
  }

  body
}

// 引用文献相关函数
#let bib_cite(..names) = {
  for name in names.pos() {
    cite(name)
  }
}

// 三线表
#let tlt_header(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: (bottom: 1pt),
    [#content],
  )
}

#let tlt_cell(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: none,
    [#content],
  )
}

#let tlt_row(r) = {
  (..r.map(tlt_cell).flatten(),)
}

#let three_line_table(values) = {
  rect(
    stroke: (bottom: 1pt, top: 1pt),
    inset: 0pt,
    outset: 0pt,
    grid(
      columns: auto,
      rows: auto,
      // table title
      grid(
        columns: values.at(0).len(),
        ..values.at(0).map(tlt_header).flatten()
      ),

      grid(
        columns: values.at(0).len(),
        ..values.slice(1).map(tlt_row).flatten()
      ),
    ),
  )
}

// 设置标题, 需要在图表前设置
#show: _set_heading
// 图表公式的排版
#show: _set_figure
// 图表公式的序号
#show: _set_numbering
// 参考文献
#show: _set_references.with(csl_style: "hust-cse-ug.csl")
// 整体页面设置
#show: _set_paper_page_size

// 整体页眉
#show: _set_paper_page_header
// 目录与摘要的页脚
#show: _set_paper_page_footer_pre
// 整体段落与页面设置
#show: _set_paper_page_par



// 目录
// #chinese_outline()


// 整体段落与页面设置
#show: _set_paper_page_par
#show: _set_paper_page_footer_main
#counter(page).update(1)


摘要： 拔河是一项历史悠久的传统体育项目，其实质是双方在摩擦力与力矩平衡上的综合博弈。本文基于力学原理，建立了拔河运动员的受力模型，分析了平动（摩擦力）与转动（力矩）两个关键维度的力学机制。研究发现，除了体重与鞋底摩擦系数外，拉绳倾角、身体倾角以及肢体姿态对比赛结果具有显著影响。基于此，本文提出了一套科学的拔河制胜策略。

1. 引言

拔河在中国有着悠久的历史，古称“牵钩”或“施钩”，唐代正式改称为“拔河” 。虽然许多人认为拔河是臂力的较量，但实际上它主要取决于力学因素的运用 。从力学角度看，拔河是拉力、摩擦力、重力及力矩之间复杂的平衡过程，运动员的身体运动可分为“身体重心的平动”和“绕脚为支点的转动” 。

2. 力学建模与分析

2.1 平动分析：摩擦力的极限博弈

在拔河的僵持阶段，双方处于相对静止状态，此时的较量主要取决于最大静摩擦力的大小。 根据库仑摩擦定律，摩擦力 f 与正压力 N 成正比，即 f=μN 。

基础模型：若忽略拉绳倾角，地面对人的支持力 N 等于重力 G（即 N=G=mg），因此摩擦力主要取决于摩擦系数 μ 和体重 m 。

进阶模型：考虑拉绳与水平方向存在夹角 γ（向上为负，向下为正），最大静摩擦力 Ffmax​ 的公式修正为：
$
  F_(f m a x)​=μ(G−F_L ​sin(γ)
$
其中 FL​ 为绳索拉力。当 $γ<0$（即拉绳方向斜向下，相当于我方将绳子抬高）时，绳索拉力的分量会增加地面对脚底的正压力，从而增大我方的最大静摩擦力 。

2.2 转动分析：力矩的平衡维持

拔河不仅要“拉不动”，还要“稳得住”。将人视为刚体，脚为支点，存在两个主要的竞争性力矩 ：

拉力矩 (ML​)：由对方拉力产生，试图将运动员向前拉倒。
ML​=FL​(L+L0​)sin(γ+θ)

其中 L 为重心到脚底距离，L0​ 为拉力作用点到重心距离，θ 为身体倾角 。

重力矩 (MG​)：由自身重力产生，帮助维持身体后倾的平衡。
MG​=GLcosθ

要保持不被拉倒，必须保证 MG​≥ML​ 。

2.3 关键参数分析

身体倾角 (θ)：分析表明，在 0∘∼90∘ 范围内，θ 越小（身体越后倾），cosθ 越大，重力矩越大；同时拉力矩通常会减小。这有利于维持平衡 。

拉绳倾角 (γ)：拉绳倾角在 (−10∘,10∘) 区间内，γ 越小（即绳子在我方一侧较高），越有利于增加最大静摩擦力，从而增加获胜概率 。

3. 制胜策略设计

基于上述力学分析，制定以下拔河制胜策略：

3.1 选材与装备策略（增大基础摩擦）

大体重队员优先：由于正压力 N=G=mg，在人数限制的比赛中，应尽可能选择体重大的队员参赛，以获得更大的基础摩擦力 。

高摩擦系数鞋具：摩擦力是阻力性质，是取胜的重要因素。应选择橡胶底或车胎底等摩擦系数大的鞋子，以增大与地面的摩擦 。

3.2 姿态控制策略（优化力矩平衡）

身体后倾：队员应采取后倾姿势（$θ<90∘$）。李林等人的研究建议倾角 θ 保持在 30∘∼45∘ 之间 。这不仅能利用重力产生抗倾倒力矩，还能使脚底产生向后的摩擦力 。

手臂弯曲锁紧：建议将手臂弯曲并紧贴腰部。这能减小拉力作用点到重心的距离 L0​，从而直接减小拉力矩 ML​，使身体更难被拉动 。

腿部微弯：虽然弯腿会略微减小重力矩，但微弯腿部有利于蹬地发力，将腿部力量转化为对抗拉力，是攻守兼备的姿态 。

3.3 战术执行策略（利用拉绳角度）

“抬绳”战术：在比赛中，应主动尝试提高拉绳的高度（使拉绳对我方呈斜向下趋势，$γ<0s$）。这一动作会产生两个有利后果：

增加我方地面的正压力，从而增大我方最大静摩擦力 。

迫使对方拉绳角度变为斜向上（γ>0），导致对方地面对其支持力减小，从而削弱对方的摩擦力 。

4. 结论

拔河比赛不仅是体能的对抗，更是力学智慧的博弈。通过建立力学模型分析可知：大体重是基础，身体后倾是保障，弯臂贴身与抬高拉绳是制胜的关键战术。在力量相当的情况下，合理运用这些力学原理调整姿态和战术，将成为决定比赛胜负的关键因素 。
