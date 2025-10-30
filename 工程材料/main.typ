#import "@local/Typwork-some:0.1.1": styles
#import "@preview/i-figured:0.2.4"
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/cetz:0.4.2"

#show: styles.base-style.with(lang: "zh-cn")

#let course_name = "工程材料"
#let author = "试鸢"
#let date = (2025, 9, 19)
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
#let _set_paper_page_header(body) = {
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
// 标题样式
#let _set_heading(body) = {
  let unary(..args) = {
    let nums = args.pos()
    let level = nums.len()
    if level <= 2 {
      return numbering("1.1", ..nums)
    } else if level == 3 {
      return numbering("（一）", nums.at(2))
    } else {
      return numbering("（一）.1", nums.at(2), nums.at(3))
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

  // show figure.caption: it => [
  //   #it.supplement
  //   #context counter(heading).display((..args) => {
  //     let nums = args.pos()
  //     if nums.len() == 0 { return none } else { return numbering("1.1", ..nums) }
  //   })-#context it.counter.display(it.numbering)
  //   #it.body
  // ]
  set math.equation(supplement: [公式])

  body
}

// 第一页
#align(center)[

  #text(
    size: 36pt,
    weight: "bold",
  )[ 工程材料]
  #align(center, text(size: 16pt, fill: blue, weight: "bold", author))
  #align(right, text(16pt, baseline: -50pt, weight: "regular", "——贡菜培养日记"))

  #align(left)[
    #text(blue)[= 【前言】]
    本文写作目的仅为督促自己学习和复习所学内容，机械版面已有 #text(red)[折一只纸鹭] 和 #text(red)[\_atri]珠玉在前。如有期末补天需要，请在98搜索。

    本文多数内容均参考ppt写作，少部分会参考网络，难免有误，欢迎指正。

    #text(blue)[= 【成绩计算】]
    - 课堂点名 + 小测 #h(20pt)  #text(red)[10%]
    - 平时作业       #h(53pt)  #text(red)[30%]
    - 期末考试(闭卷)  #h(24pt)  #text(red)[60%]
  ]



  #v(400pt)
  #text(size: 10pt)[
    最后更新于
    #date.at(0) 年 #date.at(1) 月 #date.at(2) 日
  ]
]

#pagebreak()
#counter(page).update(1)

#show: _set_heading
#show: _set_figure
#show: _set_paper_page_size
#show: _set_paper_page_header
#show: _set_paper_page_footer_pre

#chinese_outline()
#pagebreak()

#show: _set_paper_page_par
#show: _set_paper_page_footer_main

#counter(page).update(1)




= 金属材料结构及其性能

== 纯金属的晶体结构与结晶

=== 晶体的基本概念
- #text(red)[晶体]： 原子按一定规律排列的固体材料。
+ #text(blue)[晶格与晶胞]
  - #text(red)[晶格]： 用假想的直线将原子中心连接起来所形成的三维空间格架。直线的交点(原子中心)称*结点*。由结点形成的空间点的阵列称*空间点阵*。
  - #text(red)[晶胞]： 能代表晶格原子排列规律的最小几何单元。
  - #text(red)[晶粒]： 晶体中晶格方位相同的区域。
  - #text(red)[晶格常数]： 晶胞各边的尺寸a、b、c及其夹角α、β、γ。
+ #text(blue)[晶系]
  - 根据晶胞参数不同，将晶体分为七种晶系。
  - 90%以上的金属具有立方晶系和六方晶系。
  - *立方晶系*： $a=b=c,alpha = beta = gamma = 90 degree$
  - *六方晶系*： $a_1 = a_2 = a_3 eq.not c ,alpha = beta = 90 degree,gamma = 120 degree$（高不同）
+ #text(blue)[原子半径]：晶胞中原子密度最大方向上相邻原子（$approx$最近原子）间距的一半。
+ #text(blue)[晶胞原子数]:一个晶胞中所含的原子数。
+ #text(blue)[配位数]：指晶格中任一原子距离最近且相等的原子数目。
+ #text(blue)[致密度]：晶胞中原子本身所占的体积百分数。
$
  "致密度" = frac("晶胞所含原子数" times "单个原子体积", "晶胞体积") #h(2em) K = frac(n dot v, V)
$
=== 常见的三种晶胞
#box()[
  #figure(
    image("./pic/1.1.2-1.png", width: 30%),
    caption: [
      体心立方晶胞
    ],
  )]
#box()[
  #figure(
    image("./pic/1.1.2-2.png", width: 30%),
    caption: [
      面心立方晶胞
    ],
  )]
#box()[
  #figure(
    image("./pic/1.1.2-3.png", width: 30%),
    caption: [
      密排六方晶胞
    ],
  )]

#pagebreak()
#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    rows: (2em, 4em, 4em, 4em),
    inset: 5pt,
    align: center + horizon,
    [晶胞种类], [*原子半径*], [*原子数*], [*配位数*], [*致密度*], [*常见金属*],
    [#text(red)[*体心立方晶胞*]], [$frac(sqrt(3), 4)a$], [2], [8], [0.68], [$alpha$-Fe, $gamma$-Fe, Cr, W, Mo, V],
    [#text(red)[*面心立方晶胞*]], [$frac(sqrt(2), 4)a$], [4], [12], [0.74], [$beta$-Fe, Ni, Al, Cu, Ag, Au],
    [#text(red)[*密排六方晶胞*]], [$frac(1, 2)a$], [6], [12], [0.74], [Mg, Zn, Be, Cd(镉)],
  )
]

=== 立方晶系晶面、晶向表示方法

- #text(red)[晶面]：由一系列原子所组成的平面。
- #text(red)[晶向]：任意两个原子之间的连线成为#text(red)[原子列]，其所指方向。

+ #text(blue)[晶面指数]
  - 表示晶面的符号称为#text(red)[晶面指数]。
  - 其确定步骤为
    #set enum(numbering: "(1)", start: 1)
    + 选坐标，以晶格中某一原子为原点(注意不要把原点放在所求的晶面上)，以晶胞的三个棱边作为三维坐标的坐标轴。
    + 以相应的晶格常数为单位，求出待定晶面在三个轴上的截距。
    + 求三个截距的倒数。
    + 将所得数值化为最小整数，加圆括弧，形式为(hkl)。
  #figure(
    image("./pic/1.1.3-1.png"),
    caption: [
      晶面指数
    ],
  )
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (x: 8), stroke: (red), mark: (end: "straight"))
    line((0, 0), (y: 6), stroke: (green), mark: (end: "straight"))
    line((0, 0), (z: 6), stroke: (blue), mark: (end: "straight"))

    line(
      (0, 0),
      (5, 0, 0),
      stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"),
      name: "AB",
    )
    line((0, 0), (0, 5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"))
    line((0, 0), (0, 0, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"))

    line((0, 5, 5), (0, 5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))

    line((0, 5, 5), (0, 0, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))

    line((5, 0, 5), (0, 0, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "CD")
    line((5, 0, 5), (5, 0, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))


    line((5, 5, 0), (0, 5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "EF")
    line((5, 5, 0), (5, 0, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))


    content("AB.start", [A(0,0,0)], anchor: "east")
    content("AB.end", [B(5,0,0)], anchor: "west")
    content("CD.start", [C(5,0,5)], anchor: "north")
    content("CD.end", [D(0,0,5)], anchor: "east")
    content("EF.start", [F(5,5,0)], anchor: "west")
    content("EF.end", [F(0,5,0)], anchor: "east")
    line("AB.end", "CD.end", "EF.end", close: true, fill: blue.transparentize(70%))

    line((5, 0, 5), (5, 5, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))
    line((0, 5, 5), (5, 5, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "GH")
    line((5, 5, 0), (5, 5, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))
    content("GH.start", [G(0,5,5)], anchor: "east")
    content("GH.end", [H(5,5,5)], anchor: "west")
  })

  以图中晶面 BDF 为例，显然截距为 $1, 1, 1$, 故晶面指数为(111)。


+ #text(blue)[晶向指数]
  - 表示晶向的符号称为#text(red)[晶向指数]。其确定步骤为
    #set enum(numbering: "(1)", start: 1)
    + 确定原点，建立坐标系，过原点作所求晶向的平行线。
    + 求直线上任一点的坐标值。
    + 按比例化为最小整数，加方括弧，形式为[hkl]#text(red)[（负号写在数字的正上方，如[$overline(1)01$]）]。
  - 在立方晶系中，指数相同的晶面与晶向相互垂直，即(hkl)面垂直于[hkl]向。
+ 晶面族和晶向族
  - (hkl)和[uvw]分别表示的是一组平行的晶面和晶向
  - 指数虽然不同，但原子排列完全相同的晶向和晶面称作晶向族或晶面族。
  - 在立方晶系中，指数相同的晶面与晶向相互垂直。

=== 金属的实际结构与晶体缺陷

- #text(red)[单晶体]：其内部晶格方位完全一致的晶体。
- #text(red)[多晶体]：由取向不同的单晶体组成。
- #text(red)[晶界]：晶粒之间的交界面。
- 晶粒越细小，晶界面积越大。
- 在实际金属中，由于原子热振动的作用或其他原因，#text(red)[有少数原子偏离正常位置，或余、缺原子，或局部原子错排]。这种现象称为晶体结构的不完整性，或称#text(red)[晶体缺陷]。

+ #text(blue)[点缺陷]
  - 空间三维尺寸都很小的缺陷,包括：
    - 空位
    - 间隙原子
    - 置换原子
  - 点缺陷使缺陷周围的晶格发生畸变，提高晶体的内能，从而使晶体抵抗外力的作用的#text(red)[能力增强]。

  #text(gray)[以下不重要]
  - 点缺陷的#text(red)[平衡浓度]可根据热力学公式计算。
  - 根据Boltzmann统计，如果空位的形成能为$E_V$，在热平衡状态下任一格点#text(red)[被空位占据的概率]$P$，即#text(red)[空位的平衡浓度]，可表示为：
    $
      P = C_0 = exp(-frac(E_V, k_B dot T))
    $
    其中$k_B$为Boltzmann常数，$T$为热力学温度(K)。
+ #text(blue)[线缺陷]
  - 线缺陷主要指#text(red)[位错]，位错是一种#text(red)[非平衡态缺陷]，由于晶体生长条件偏离平衡态、机械加工或异质外延等过程引入。
  - 位错及其#text(red)[易动性]使实际晶体的屈服强度大大低于完美晶体的屈服强度。
  - Taylor、Orowan和Polanyi等指出，位错使滑移所需的#text(red)[切应力]大大下降。

  #text(red)[位错]
  格中一部分晶体相对于另一部分晶体发生局部滑移，滑移面上滑移区与未滑移区的交界线称作位错。分为*刃型位错*和*螺型位错*。
  #figure(
    image("./pic/1.1.4-1.png"),
    caption: [
      位错
    ],
  )
  #h(1em)
  - #text(blue)[刃型位错]
  当一个完整晶体某晶面以上的某处多出半个原子面，该晶面#text(red)[像刀刃一样切入晶体]，这个多余原子面的边缘就是刃型位错。
  #figure(
    image("./pic/1.1.4-2.png"),
    caption: [
      刃型位错
    ],
  )
  - #text(blue)[位错密度] 单位体积内所包含的位错线总长度。

+ #text(blue)[面缺陷]
  - #text(red)[晶界]是不同位向晶粒的过渡部位，宽度为5～10个原子间距，位向差一般为$20~ 40degree$。
  - #text(red)[亚晶界]是晶粒内部由于位错的堆积而使一部分晶体的晶格位向与另一部分的晶体的晶格位向产生小角度偏差而形成的界面。
  - 亚晶粒直接的交界面称#text(red)[亚晶界]。亚晶界也可看作#text(red)[位错壁]。
  - #text(red)[亚晶粒]是组成晶粒的尺寸很小，位向差也很小($10degree~2degree$)的小晶块。
  #align(center)[
    #box()[
      #figure(
        image("./pic/1.1.4-3.png", width: 60%),
        caption: [
          晶界
        ],
      )]
    #box()[
      #figure(
        image("./pic/1.1.4-4.png", width: 30%),
        caption: [
          亚晶界
        ],
      )]]
#pagebreak()
=== 纯金属的结晶
+ #text(blue)[纯金属结晶的条件]
  - 纯金属都有一个理论结晶温度$T_0$（熔点或平衡结晶温度）。处于该温度时, 液体和晶体处于#text(red)[动平衡状态]。（类比水结冰的过程，0℃时为冰水混合物）
  - 结晶只有在$T_0$以下的实际结晶温度下才能进行。
  - 液态金属在理论结晶温度以下开始结晶的现象称#text(red)[过冷]。
  - 理论结晶温度$T_0$与实际结晶温度$T_n$的差$Delta T$称#text(red)[过冷度]。
  - 过冷度大小与冷却速度有关，#text(red)[过冷度越大，冷速越大。]
  #figure(
    image("./pic/1.1.5-1-1.png", width: 90%),
  )

  #text(blue)[【古地明莲小课堂】]根据热力学第二定律，物质系统总是自发地从自由能较高的状态向自由能较低的状态转变。当温度低于$T_0$时，液体的自由能大于固体的自由能，液体自发向固体转变，此时才能结晶。过冷度越大，固体和液体的自由能相差越大，相变的驱动力越大，因此冷却速度越大。

+ #text(blue)[纯金属的结晶过程]
  - 金属的结晶是原子从#text(red)[无序]排列的液态转变为#text(red)[有序]排列的固态（结晶态）的过程。
  #set enum(numbering: "(1)", start: 1)
  + #text(blue)[晶核的形成]
    - 晶核有两种形成方式：\
      #text(red)[自发形核]：由液体中排列规则的原子团形成晶核。\
      #text(red)[非自发形核]：以液体中存在的固态杂质为核心形核。\
      非自发形核比自发形核更重要。#text(gray)[#strike[（韩援强于国内【ac01】）]]
  + #text(blue)[晶核的长大方式]\
    长大方式分为#text(red)[均匀长大]和#text(red)[树枝状长大]。
    - #text(red)[连续生长]：
      固-液界面在原子尺度上是“粗糙的”，原子可以连续、无序地向界面添加，使界面迅速向液相推移从而使晶体生长。
    - #text(red)[沿晶体缺陷生长]：
      由缺陷造成的界面台阶容易使原子向上堆砌，其中对晶体生长过程影响较大的是螺位错和孪晶界面。
    - #text(red)[二维晶核台阶生长]：
      原子主要借助光滑界面上形成的台阶侧面堆砌、增厚，从而使界面向前推进；台阶的来源可以是界面上的二维形核，也可以是界面上的晶体缺陷。

    #box()[
      #figure(
        image("./pic/1.1.5-2.png", width: 50%),
        caption: [
          均匀长大
        ],
      )]
    #box()[
      #figure(
        image("./pic/1.1.5-3.png", width: 40%),
        caption: [
          树枝状长大
        ],
      )]
    - 晶粒的大小取决于晶核的#text(red)[形成速度]和#text(red)[长大速度]
    - 单位时间、单位体积内形成的晶核数目叫#text(red)[形核率(N)]
    - 单位时间内晶核生长的长度叫#text(red)[长大速度(G)]
    - N/G比值越大，晶粒越细小。因此，凡是促进形核、抑制长大的因素，都能细化晶粒。

    - 细化铸态金属晶粒的措施
      + #text(blue)[增加过冷度]：
        随过冷度增加，N/G值增加，晶粒变细。
      + #text(blue)[变质处理]：
        又称孕育处理。即有意向液态金属内加入非均匀形核物质从而细化晶粒的方法。所加入的非均匀形核物质叫变质剂(或称孕育剂)。

== 合金的相结构
- #text(red)[合金]是指由两种或两种以上元素组成的具有金属特性的物质。
- 组成合金的元素可以全部是金属，也可是金属与非金属。
- 组成合金的基本单元称为#text(red)[组元]。
- 表达合金的两个概念——#text(red)[相]和#text(red)[组织]。
- #text(red)[相]
  是指金属或合金中凡成分相同、结构相同，并与其他部分有界面分开的均匀组成部分。
- #text(red)[组织]
  合金结构的微观形貌，实质上是指在显微镜下观察到的金属中#text(red)[各相或各晶粒的形态、数量、大小和分布]的组合。
- 固态合金中的相分为#text(red)[固溶体]和#text(red)[金属化合物]两类。
#pagebreak()
=== #text(blue)[固溶体]
- 合金在固态下、组元间仍能互相溶解而形成的均匀相称为#text(red)[固溶体]。习惯以#text(red)[$alpha,beta,gamma$]等表示。

+ #text(blue)[固溶体的分类]
  - 按溶质原子所处位置分为#text(red)[置换固溶体]和#text(red)[间隙固溶体]。
    #figure(
      image("./pic/1.2.1-1.png", width: 70%),
      caption: [
        置换固溶体和间隙固溶体
      ],
    )
  - 按溶解度可分为#text(red)[有限固溶体]和#text(red)[无限固溶体]。
  - 溶质原子呈无序分布的称#text(red)[无序固溶体]，呈有序分布的称#text(red)[有序固溶体]。

+ #text(blue)[固溶体的性能]
  - 随溶质含量增加，固溶体的强度、硬度增加，塑性、韧性下降#text(red)[(固溶强化)] 。
  - 产生固溶强化的原因是溶质原子使#text(red)[晶格发生畸变及对位错的钉扎作用]。
  - 与纯金属相比，固溶体的强度、硬度高，塑性、韧性低。但与化合物相比，其硬度要低得多，而塑性和韧性则要高得多。

=== #text(blue)[金属化合物]
- 合金组元相互作用形成的晶格类型和特性完全不同于任一组元的新相称#text(red)[金属化合物]。金属化合物具有#text(red)[较高的熔点、硬度和脆性，并可用分子式表示]其组成。
+ #text(red)[正常价化合物]——符合正常原子价规律。如Mg2Si。
+ #text(red)[电子化合物]——符合电子浓度规律。如Cu3Sn。\ #text(gray)[电子浓度为价电子数与原子数的比值]。
+ #text(red)[间隙化合物]——由过渡族元素与C、N、B、H等小原子半径的非金属元素组成。
  #set enum(numbering: "(1)", start: 1)
  + #text(red)[间隙相]：
    $r_非 / r_金 lt 0.59$时形成的具有简单晶格结构的间隙化合物。
    - 间隙相具有金属特征和极高的硬度及熔点，非常稳定。
    - 部分碳化物和所有氮化物属于间隙相。
  + #text(red)[具有复杂结构的间隙化合物]：
    - $r_非 / r_金 gt 0.59$时形成复杂结构间隙化合物。
    - 如$F e B、F e_3 C、C r_(23)C_6$等。
    $$
    - #text(blue)[$F e_3 C$]
      称渗碳体，是钢中重要组成相，具有复杂斜方晶格。
      #box()[
        #figure(
          image("./pic/1.2.2-1.png", width: 40%),
          caption: [
            间隙相VC
          ],
        )]
      #box()[
        #figure(
          image("./pic/1.2.2-2.png", width: 40%),
          caption: [
            $F e_3 C$
          ],
        )]
=== #text(blue)[机械混合物]
- 合金的一种特殊的结构，由固溶体与化合物或固溶体与固溶体两相组成。
- 两种或两种以上的相按照一定质量百分数组成的物质。
- 混合物中各组成相仍保持自己的晶格。
- 其性能主要取决于各组成相的性能以及相的分布状态。


== 工程材料的基本力学性能
#align(horizon)[
  #v(-1.5em)
  #h(-2em)
  #box(baseline: 1em)[#v(0em)
    - #text(blue)[应力]：$sigma = display(P/F)$
  ]#h(6em)
  #box(baseline: 1.3em)[- #text(blue)[应变]：$epsilon = display((Delta L )/ L_0)$]
]
- #text(blue)[弹性]：
  指标为弹性极限 $sigma_e$，即材料承受最大弹性变形时的应力。

- #text(blue)[刚度]：
  材料受力时抵抗弹性变形的能力。指标为弹性模量 $E$。 $E = display(sigma/epsilon)$

- #text(red)[强度]：
  材料在外力作用下抵抗变形和破坏的能力。
  - #text(blue)[屈服强度（屈服点应力）]$sigma_s$：
    材料发生塑性变形(s点)时的应力值。
  - #text(blue)[条件屈服强度]$sigma_(0.2)$：
    残余变形量为 0.2% 时的应力值。
  - #text(blue)[抗拉强度]$sigma_b$：
    材料断裂(z点)前所承受的最大应力值(b点)
  #figure(
    image("./pic/1.3-1.png", width: 95%),
    caption: [应力-应变曲线],
  )

- #text(blue)[塑性]：材料受力破坏前可承受最大塑性变形的能力。
  - 伸长率$delta = display((l_1-l_0)/1_0)$, $l_1$为试样拉断后的标距离长度
  - 断面收缩率$psi = display((A_0-A_1)/A_0)$, $A_1$为试样拉断处的截面积
  #text(red)[断面收缩率表示塑性比伸长率更接近真实变形]

- #text(blue)[疲劳强度]$sigma_r$:
  材料在规定次数应力循环后仍不发生断裂时的最大应力\
  提高零件抗疲劳的方法：
  - 合理的选材，细化晶粒、减少材料和零件的缺陷；
  - 改善零件的结构设计，避免应力集中；
  - 减少零件的表面粗糙度；
  - 对零件表面进行强化处理。

- #text(red)[硬度]：
  材料抵抗表面局部塑性变形压痕、划痕的能力

  (1) #text(blue)[布氏硬度(HB)]：

  用直径为D(mm)的硬质合金球，在载荷F(kgf)作用下压入试样表面，压痕直径为d(mm)时，布氏硬度值为：
  $
    H B = display((2 dot F)/(pi dot D (D - sqrt(D^2 - d^2))))
  $
  #figure(
    table(
      columns: (auto, 1fr, 1fr),
      // width: 100%,
      rows: (4em, 4em),
      inset: 5pt,
      align: center + horizon,
      [压头], [布氏硬度符号], [适用布氏硬度值],
      [钢球], [$H B S$], [$< 450$],
      [硬质合金球], [$H B W$], [$< 650$],
    ),
  )
  - #text(blue)[优点]：测量误差小，数据稳定。
  - #text(blue)[缺点]：压痕大，不能用于太薄件、成品件。
  - #text(blue)[适测量]：退火、正火、调质钢，铸铁及有色金属的硬度。

  #v(12em)
  (2) #text(blue)[洛氏硬度(HR)]：

  用不同形状的压头，在不同载荷下压入试样表面，根据压痕深度测定硬度值。
  #figure(
    table(
      columns: (auto, 0.5fr, 1fr),
      // width: 100%,
      rows: (4em, 4em),
      inset: 5pt,
      align: center + horizon,
      [压头], [符号], [适用范围],
      [$120 degree$金刚石圆锥], [$H R A$], [高硬度材料 ,如硬质合金、表淬层和渗碳层。],
      [$phi.alt 1.588m m$ 淬火钢球], [$H R B$], [低硬度材料 ,如有色金属和退火、正火钢等。],
      [$120 degree$金刚石圆锥], [$H R C$], [中等硬度材料，如调质钢、淬火钢等。],
    ),
  )
  - #text(blue)[优点]：操作简便，压痕小，适用范围广。
  - #text(blue)[缺点]：测量结果分散度大。

  (3) #text(blue)[维氏硬度(HV)]：

  用金刚石四棱锥形压头，在一定载荷$F$下压入试样表面，根据压痕对角线长度$d$测定硬度值。
  $
    H V = display(2sin 68 degree dot (F)/(d^2))
  $

  三种硬度相互转换一般查表进行。

- #text(blue)[韧性]：
  - 冲击韧性$a_k$：材料抵抗冲击载荷作用而不破坏的能力
  - 裂纹韧性：带微裂纹的材料或零件阻止裂纹扩展的能力。
  - 应力强度因子：描述裂纹尖端附近应力场强度的指标

    裂纹尖端处存在应力集中，与裂纹长度和裂纹尖端曲率半径有关。

#v(1em)
细晶强化可以同时增强增韧，否则对金属来说强度和韧性负相关
#v(1em)

#text(gray)[
  yj 老师的ppt内还有关于液体和粘弹性材料的内容，但感觉不太重要，就按下不表了。

  如果书上有或者其他老师也讲了，请告诉我，我补充进来。
]

#v(10em)
= 金属的塑性变形与再结晶

== 单晶体的塑性变形

=== #text(blue)[滑移]
- 在#text(red)[切应力]作用下，晶体的一部分原子相对另一部分原子，沿着一定的晶面（滑移面）和一定的方向（滑移方向）相对滑动的结果。
- 滑移只有在切应力作用下才能进行，只有当作用在晶面上的切应力达到临界值时，材料才会发生#text(red)[塑性变形]。
#figure(
  image("./pic/2.1.1-1.png", width: 90%),
  caption: [
    滑移
  ],
)
- 晶体的滑移不是只发生在一个晶面上，而是在相邻的一组晶面上同时或先后发生，从而形成明显的#text(red)[滑移带]。
- 滑移的同时伴随着晶体的转动。

  转动有两种:滑移面向外力轴方向转动和滑移面上滑移方向向最大切应力方向转动。

  - 拉伸时轴向要求不能变，滑移方向朝拉伸轴方向转动；
  - 压缩时端面不能变，滑移面朝压缩面（端面）转动。
#box()[
  #figure(
    image("./pic/2.1.1-2.png", width: 45%),
    caption: [
      滑移带
    ],
  )]
#box()[
  #figure(
    image("./pic/2.1.1-3.png", width: 45%),
    caption: [
      滑移转动
    ],
  )]

#text(gray)[孪生不作要求，不写了]
#v(5em)
单晶体受力后，外力在任何晶面上都可分解为正应力和切应力。正应力只引起晶格弹性伸长进而被拉断#text(red)[(不引起塑性变形)]；切应力使晶格产生弹性扭曲后滑移。

- 滑移只能在切应力的作用下发生。产生滑移的最小切应力称临界切应力
- 滑移常沿晶体中原子密度最大的晶面和晶向发生。因原子密度最大的晶面和晶向之间原子间距最大，结合力最弱，产生滑移所需切应力最小。#text(green)[思考题2-9(2)]
- 沿其发生滑移的晶面和晶向分别叫做滑移面和滑移方向。通常是晶体中的密排面和密排方向。
#grid(
  columns: 2,
  gutter: 2em,
  box()[
    #v(1em)
    【注】上面所说的“距离”指的是两个晶面或两个晶向之间的距离。以右图为例，在(010),(011),(013)三种晶面中，晶面(011)的原子密度最大，同为该晶面指数的两个相邻晶面之间的距离最大，因此这两个晶面之间的结合力最弱，产生滑移所需的切应力最小，最容易发生滑移。
  ],
  box()[
    #figure(
      image("./pic/2.1.1-4.png", width: 90%),
      caption: [
      ],
    )],
)
=== 滑移系
一个滑移面和其上的一个滑移方向构成一个滑移系。

- 滑移系越多，金属发生滑移的可能性越大，塑性越好，其中滑移方向对塑性的贡献比滑移面更大。
- 因此，金属的塑性，面心立方晶格好于体心立方晶格，体心立方晶格好于密排六方晶格。

#text(blue)[塑性变形的实质]
滑移是通过滑移面上位错的运动来实现的。

晶体通过位错运动产生滑移时，只在位错中心的少数原子发生移动，它们移动的距离远小于一个原子间距，因而所需临界切应力小，这种现象称作位错的易动性。

#text(
  gray,
)[密排六方晶格金属滑移系少，常以孪生方式变形。体心立方晶格金属只有在低温或冲击作用下才发生孪生变形。面心立方晶格金属，一般不发生孪生变形，但常发现有孪晶存在，这是由于相变过程中原子重新排列时发生错排而产生的，称退火孪晶。
]
#figure(
  image("./pic/2.1.2-1.png", width: 100%),
  caption: [
  ],
)
#box()[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (x: 8), stroke: (blue), mark: (end: "straight"))
    line((0, 0), (y: 8), stroke: (blue), mark: (end: "straight"))
    line((0, 0), (z: 8), stroke: (blue), mark: (end: "straight"))

    line((0, 0, 5), (0, -0.75, 5.75), stroke: (paint: red, thickness: 2pt), mark: (end: "straight"))
    line((0, 5, 0), (-0.75, 5.75, 0), stroke: (paint: red, thickness: 2pt), mark: (end: "straight"))
    line((5, 0, 0), (5.75, 0, -0.75), stroke: (paint: red, thickness: 2pt), mark: (end: "straight"))

    line(
      (0, 0),
      (5, 0, 0),
      stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"),
      name: "AB",
    )
    line((0, 0), (0, 5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"))
    line((0, 0), (0, 0, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"))

    line((0, 5, 5), (0, 5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))

    line((0, 5, 5), (0, 0, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))

    line((5, 0, 5), (0, 0, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "CD")
    line((5, 0, 5), (5, 0, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))


    line((5, 5, 0), (0, 5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "EF")
    line((5, 5, 0), (5, 0, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))


    content("AB.start", [A(0,0,0)], anchor: "east")
    content("AB.end", [B(5,0,0)], anchor: "west")
    content("CD.start", [C(5,0,5)], anchor: "north")
    content("CD.end", [D(0,0,5)], anchor: "east")
    content("EF.start", [F(5,5,0)], anchor: "west")
    content("EF.end", [F(0,5,0)], anchor: "east")
    line("AB.end", "CD.end", "EF.end", close: true, fill: blue.transparentize(70%))

    line((5, 0, 5), (5, 5, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))
    line((0, 5, 5), (5, 5, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "GH")
    line((5, 5, 0), (5, 5, 5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))
    content("GH.start", [G(0,5,5)], anchor: "east")
    content("GH.end", [H(5,5,5)], anchor: "west")
  })
]

如上图，当蓝色的晶面作为滑移面时，其上可以有三个滑移方向（图中红色箭头标出），每个滑移方向都能与该滑移面构成一个滑移系，共3个。因为有4个滑移面，所以有12个滑移面。

【注】上图 b 出现的{110}、\<111\>等指的并不是晶面和晶向，而是晶面族和晶向族。
