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

  #v(15em)
  #text(size: 16pt)[
    #date.at(0) 年 #date.at(1) 月 #date.at(2) 日
  ]
]
#pagebreak()
#counter(page).update(1)
// 页面布局
#let _set_paper_page_par(body) = {
  set text(12pt, font: "Simsun")
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
  // show heading: i-figured.reset-counters
  set figure(numbering: "1-1")
  set math.equation(numbering: "(1)")

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


拔河是一项历史悠久的传统体育项目，其实质是双方在摩擦力与力矩平衡上的综合博弈。显然我们可以基于力学原理，建立拔河运动员的受力模型，分析其力学机制并制定制胜策略。

为了简化分析，本文取拔河比赛中的单个运动员为研究对象，假设其与地面的接触面为水平面，忽略空气阻力及绳索弹性变形等次要因素，当人的姿态确定后，可将其视为刚体模型建立力学模型，如图 1 所示：
#figure(image("./assets/理力.png"), caption: [拔河运动员姿态及受力分析图])
显然有
$
  F_L cos gamma = F_f
$
$
  F_L sin gamma + F_N = G
$

对E点的力矩平衡有
$
  F_L (L + L_0) sin(gamma + theta) - G L cos theta = 0
$
= 摩擦力分析
当绳上拉力不断增加时，摩擦力$F_f$也会随之增大，直至达到最大静摩擦力$F_(f m a x)$​，此时若继续增大拉力$F_L$​，则运动员将由静止转为平动，用$mu$表示静摩擦因数，则
$
  F_f = mu (F_N) = mu (G - F_L sin gamma)
$
由式(1),(2)和(4)可解得临界状态下：
$
  cos gamma + mu sin gamma = (mu G) / (F_L)
$
$
  F_L = (mu G) / (cos gamma + mu sin gamma) = G / (1/ mu cos gamma + sin gamma)
$
令$F(gamma) = cos gamma + mu sin gamma$，则$F(gamma)$​在$(0, arctan(mu))$上单调递增，且随着$gamma$​的增加，临界拉力$F_L$​减小。类似的，当$mu$增大时，临界拉力$F_L$​则增大。显然的，想要获胜，临界拉力$F_L$​应尽可能大，即应尽可能增大$mu$​，减小$gamma$​。因此，派体重更大的选手上场，穿静摩擦因数更大的鞋子，以及让较为矮小的人站在前面以减小后面人的$gamma$角都是很重要的策略。

从反面看，比赛中，一方队员一旦坐在地上就很容易被拉动，正是因为坐在地上时$gamma$角较大，影响效果明显。

= 力矩分析
当最大静摩擦力足够大时，虽然拉力不能使运动员滑动却有可能拉动身体前倾，人为了确保身体平衡，会向前挪动脚步从而输掉比赛。身体前倾就是身体发生了转动。由式(3)，这一过程可以看作是绳拉力矩和重力矩的较量，不妨记为：

绳拉力矩
$
  M_L = F_L (L + L_0) sin(gamma + theta)
$
重力矩
$
  M_G = G L cos theta
$

当$M_L > M_G$时，人被拉动，因此将输掉比赛。

据此分析函数$f(theta) = G L cos theta - F_L (L + L_0) sin(gamma + theta)$, 考虑实际情况，可将$gamma$视为0简化计算

$
  f'(theta) = - G L sin theta - F_L (L+L_0) cos theta < 0
$

因此$theta$越小，越有利于获胜。但是考虑到$theta$减小时，$gamma$会增大，所以需要综合考虑$theta$的取值。

另外，考虑参数$L$和$L_0$
$
  f(L,L_0) = (G cos theta - F_L sin (theta + gamma)) L - F_L sin (theta + gamma) L_0 \
$
可知，$L$越大，$L_0$越小越有利。$L$可以通过选择高个子的选手来提高，$L_0$则可以通过调整发力位置来减小。如弯曲手臂肘部紧贴腰部时，拉力作用点位于腰部，$L_0$更小；而如果将手臂展开拉力沿着手臂作用，作用点在肩部，$L_0$更大。


3. 结论

// 拔河比赛不仅是体能的对抗，更是力学智慧的博弈。通过建立力学模型分析可知：
大体重是基础，身体后倾是保障，弯臂贴身与抬高拉绳是制胜的关键战术。在力量相当的情况下，合理运用这些力学原理调整姿态和战术，将成为决定比赛胜负的关键因素。

// 2. 力学建模与分析

// 2.1 平动分析：摩擦力的极限博弈

// 在拔河的僵持阶段，双方处于相对静止状态，此时的较量主要取决于最大静摩擦力的大小。 根据库仑摩擦定律，摩擦力 f 与正压力 N 成正比，即 f=μN 。

// 基础模型：若忽略拉绳倾角，地面对人的支持力 N 等于重力 G（即 N=G=mg），因此摩擦力主要取决于摩擦系数 μ 和体重 m 。

// 进阶模型：考虑拉绳与水平方向存在夹角 γ（向上为负，向下为正），最大静摩擦力 Ffmax​ 的公式修正为：
// $
//   F_(f m a x)​=μ(G−F_L ​sin(γ)
// $
// 其中 FL​ 为绳索拉力。当 $γ<0$（即拉绳方向斜向下，相当于我方将绳子抬高）时，绳索拉力的分量会增加地面对脚底的正压力，从而增大我方的最大静摩擦力 。

// 2.2 转动分析：力矩的平衡维持

// 拔河不仅要“拉不动”，还要“稳得住”。将人视为刚体，脚为支点，存在两个主要的竞争性力矩 ：

// 拉力矩 (ML​)：由对方拉力产生，试图将运动员向前拉倒。
// ML​=FL​(L+L0​)sin(γ+θ)

// 其中 L 为重心到脚底距离，L0​ 为拉力作用点到重心距离，θ 为身体倾角 。

// 重力矩 (MG​)：由自身重力产生，帮助维持身体后倾的平衡。
// MG​=GLcosθ

// 要保持不被拉倒，必须保证 MG​≥ML​ 。

// 2.3 关键参数分析

// 身体倾角 (θ)：分析表明，在 0∘∼90∘ 范围内，θ 越小（身体越后倾），cosθ 越大，重力矩越大；同时拉力矩通常会减小。这有利于维持平衡 。

// 拉绳倾角 (γ)：拉绳倾角在 (−10∘,10∘) 区间内，γ 越小（即绳子在我方一侧较高），越有利于增加最大静摩擦力，从而增加获胜概率 。

// 3. 制胜策略设计

// 基于上述力学分析，制定以下拔河制胜策略：

// 3.1 选材与装备策略（增大基础摩擦）

// 大体重队员优先：由于正压力 N=G=mg，在人数限制的比赛中，应尽可能选择体重大的队员参赛，以获得更大的基础摩擦力 。

// 高摩擦系数鞋具：摩擦力是阻力性质，是取胜的重要因素。应选择橡胶底或车胎底等摩擦系数大的鞋子，以增大与地面的摩擦 。

// 3.2 姿态控制策略（优化力矩平衡）

// 身体后倾：队员应采取后倾姿势（$θ<90∘$）。李林等人的研究建议倾角 θ 保持在 30∘∼45∘ 之间 。这不仅能利用重力产生抗倾倒力矩，还能使脚底产生向后的摩擦力 。

// 手臂弯曲锁紧：建议将手臂弯曲并紧贴腰部。这能减小拉力作用点到重心的距离 L0​，从而直接减小拉力矩 ML​，使身体更难被拉动 。

// 腿部微弯：虽然弯腿会略微减小重力矩，但微弯腿部有利于蹬地发力，将腿部力量转化为对抗拉力，是攻守兼备的姿态 。

// 3.3 战术执行策略（利用拉绳角度）

// “抬绳”战术：在比赛中，应主动尝试提高拉绳的高度（使拉绳对我方呈斜向下趋势，$γ<0s$）。这一动作会产生两个有利后果：

// 增加我方地面的正压力，从而增大我方最大静摩擦力 。

// 迫使对方拉绳角度变为斜向上（γ>0），导致对方地面对其支持力减小，从而削弱对方的摩擦力 。

// 4. 结论

// 拔河比赛不仅是体能的对抗，更是力学智慧的博弈。通过建立力学模型分析可知：大体重是基础，身体后倾是保障，弯臂贴身与抬高拉绳是制胜的关键战术。在力量相当的情况下，合理运用这些力学原理调整姿态和战术，将成为决定比赛胜负的关键因素 。
