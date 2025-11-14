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

#let Red(body) = {
  set text(red)
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
    本文写作目的仅为督促自己学习和复习所学内容，机械版面已有 #Red("折一只纸鹭") 和 #text(red)[\_atri]珠玉在前。如有期末补天需要，请在98搜索。

    本文多数内容均参考ppt写作，少部分会参考网络，难免有误，欢迎指正。

    #text(blue)[= 【成绩计算】]
    - 课堂点名 + 小测 #h(20pt)  #Red("10%")
    - 平时作业       #h(53pt)  #Red("30%")
    - 期末考试(闭卷)  #h(24pt)  #Red("60%")
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
1. #text(blue)[晶格与晶胞]
  - #text(red)[晶格]： 用假想的直线将原子中心连接起来所形成的三维空间格架。直线的交点(原子中心)称*结点*。由结点形成的空间点的阵列称*空间点阵*。
  - #text(red)[晶胞]： 能代表晶格原子排列规律的最小几何单元。
  - #text(red)[晶粒]： 晶体中晶格方位相同的区域。
  - #text(red)[晶格常数]： 晶胞各边的尺寸a、b、c及其夹角α、β、γ。
2. #text(blue)[晶系]
  - 根据晶胞参数不同，将晶体分为七种晶系。
  - 90%以上的金属具有立方晶系和六方晶系。
  - *立方晶系*： $a=b=c,alpha = beta = gamma = 90 degree$
  - *六方晶系*： $a_1 = a_2 = a_3 eq.not c ,alpha = beta = 90 degree,gamma = 120 degree$（高不同）
3. #text(blue)[原子半径]：晶胞中原子密度最大方向上相邻原子（$approx$最近原子）间距的一半。
4. #text(blue)[晶胞原子数]:一个晶胞中所含的原子数。
5. #text(blue)[配位数]：指晶格中任一原子距离最近且相等的原子数目。
6. #text(blue)[致密度]：晶胞中原子本身所占的体积百分数。
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

1. #text(blue)[晶面指数]
  - 表示晶面的符号称为#text(red)[晶面指数]。
  - 其确定步骤为
    #set enum(numbering: "(1)", start: 1)
    1. 选坐标，以晶格中某一原子为原点(注意不要把原点放在所求的晶面上)，以晶胞的三个棱边作为三维坐标的坐标轴。
    2. 以相应的晶格常数为单位，求出待定晶面在三个轴上的截距。
    3. 求三个截距的倒数。
    4. 将所得数值化为最小整数，加圆括弧，形式为(hkl)。
  #figure(
    image("./pic/1.1.3-1.png"),
    caption: [
      晶面指数
    ],
  )
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (x: 8), stroke: (red), mark: (end: "straight"))
    line((0, 0), (y: 6), stroke: (tips), mark: (end: "straight"))
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


2. #text(blue)[晶向指数]
  - 表示晶向的符号称为#text(red)[晶向指数]。其确定步骤为
    #set enum(numbering: "(1)", start: 1)
    1. 确定原点，建立坐标系，过原点作所求晶向的平行线。
    2. 求直线上任一点的坐标值。
    3. 按比例化为最小整数，加方括弧，形式为[hkl]#text(red)[（负号写在数字的正上方，如[$overline(1)01$]）]。
  - 在立方晶系中，指数相同的晶面与晶向相互垂直，即(hkl)面垂直于[hkl]向。
3. 晶面族和晶向族
  - (hkl)和[uvw]分别表示的是一组平行的晶面和晶向
  - 指数虽然不同，但原子排列完全相同的晶向和晶面称作晶向族或晶面族。
  - 在立方晶系中，指数相同的晶面与晶向相互垂直。

=== 金属的实际结构与晶体缺陷

- #text(red)[单晶体]：其内部晶格方位完全一致的晶体。
- #text(red)[多晶体]：由取向不同的单晶体组成。
- #text(red)[晶界]：晶粒之间的交界面。
- 晶粒越细小，晶界面积越大。
- 在实际金属中，由于原子热振动的作用或其他原因，#text(red)[有少数原子偏离正常位置，或余、缺原子，或局部原子错排]。这种现象称为晶体结构的不完整性，或称#text(red)[晶体缺陷]。

1. #text(blue)[点缺陷]
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
2. #text(blue)[线缺陷]
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

3. #text(blue)[面缺陷]
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
1. #text(blue)[纯金属结晶的条件]
  - 纯金属都有一个理论结晶温度$T_0$（熔点或平衡结晶温度）。处于该温度时, 液体和晶体处于#text(red)[动平衡状态]。（类比水结冰的过程，0℃时为冰水混合物）
  - 结晶只有在$T_0$以下的实际结晶温度下才能进行。
  - 液态金属在理论结晶温度以下开始结晶的现象称#text(red)[过冷]。
  - 理论结晶温度$T_0$与实际结晶温度$T_n$的差$Delta T$称#text(red)[过冷度]。
  - 过冷度大小与冷却速度有关，#text(red)[过冷度越大，冷速越大。]
  #figure(
    image("./pic/1.1.5-1-1.png", width: 90%),
  )

  #text(blue)[【古地明莲小课堂】]根据热力学第二定律，物质系统总是自发地从自由能较高的状态向自由能较低的状态转变。当温度低于$T_0$时，液体的自由能大于固体的自由能，液体自发向固体转变，此时才能结晶。过冷度越大，固体和液体的自由能相差越大，相变的驱动力越大，因此冷却速度越大。

2. #text(blue)[纯金属的结晶过程]
  - 金属的结晶是原子从#text(red)[无序]排列的液态转变为#text(red)[有序]排列的固态（结晶态）的过程。
  #set enum(numbering: "(1)", start: 1)
  1. #text(blue)[晶核的形成]
    - 晶核有两种形成方式：\
      #text(red)[自发形核]：由液体中排列规则的原子团形成晶核。\
      #text(red)[非自发形核]：以液体中存在的固态杂质为核心形核。\
      非自发形核比自发形核更重要。#text(gray)[#strike[（韩援强于国内【ac01】）]]
  2. #text(blue)[晶核的长大方式]\
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
      1. #text(blue)[增加过冷度]：
        随过冷度增加，N/G值增加，晶粒变细。
      2. #text(blue)[变质处理]：
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

#v(4em)
=== #text(blue)[固溶体]
- 合金在固态下、组元间仍能互相溶解而形成的均匀相称为#text(red)[固溶体]。习惯以#text(red)[$alpha,beta,gamma$]等表示。

1. #text(blue)[固溶体的分类]
  - 按溶质原子所处位置分为#text(red)[置换固溶体]和#text(red)[间隙固溶体]。
    #figure(
      image("./pic/1.2.1-1.png", width: 70%),
      caption: [
        置换固溶体和间隙固溶体
      ],
    )
  - 按溶解度可分为#text(red)[有限固溶体]和#text(red)[无限固溶体]。
  - 溶质原子呈无序分布的称#text(red)[无序固溶体]，呈有序分布的称#text(red)[有序固溶体]。

2. #text(blue)[固溶体的性能]
  - 随溶质含量增加，固溶体的强度、硬度增加，塑性、韧性下降#text(red)[(固溶强化)] 。
  - 产生固溶强化的原因是溶质原子使#text(red)[晶格发生畸变及对位错的钉扎作用]。
  - 与纯金属相比，固溶体的强度、硬度高，塑性、韧性低。但与化合物相比，其硬度要低得多，而塑性和韧性则要高得多。

=== #text(blue)[金属化合物]
- 合金组元相互作用形成的晶格类型和特性完全不同于任一组元的新相称#text(red)[金属化合物]。金属化合物具有#text(red)[较高的熔点、硬度和脆性，并可用分子式表示]其组成。
1. #text(red)[正常价化合物]——符合正常原子价规律。如Mg2Si。
2. #text(red)[电子化合物]——符合电子浓度规律。如Cu3Sn。\ #text(gray)[电子浓度为价电子数与原子数的比值]。
3. #text(red)[间隙化合物]——由过渡族元素与C、N、B、H等小原子半径的非金属元素组成。
  #set enum(numbering: "(1)", start: 1)
  1. #text(red)[间隙相]：
    $r_非 / r_金 lt 0.59$时形成的具有简单晶格结构的间隙化合物。
    - 间隙相具有金属特征和极高的硬度及熔点，非常稳定。
    - 部分碳化物和所有氮化物属于间隙相。
  2. #text(red)[具有复杂结构的间隙化合物]：
    - $r_非 / r_金 gt 0.59$时形成复杂结构间隙化合物。
    - 如$F e B、F e_3 C、C r_(23)C_6$等。
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
#align()[
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
    image("./pic/1.3-1.png", width: 75%),
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
#v(0em)
(1) #text(blue)[布氏硬度(HB)]：

用直径为D(mm)的硬质合金球，在载荷F(kgf)作用下压入试样表面，压痕直径为d(mm)时，布氏硬度值为：
$
  H B = display((2 dot F)/(pi dot D (D - sqrt(D^2 - d^2))))
$
#figure(
  table(
    columns: (auto, 1fr, 1fr),
    // width: 100%,
    rows: (2em, 4em),
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

#v(20em)
(2) #text(blue)[洛氏硬度(HR)]：

用不同形状的压头，在不同载荷下压入试样表面，根据压痕深度测定硬度值。
#figure(
  table(
    columns: (auto, 0.5fr, 1fr),
    // width: 100%,
    rows: (2em, 4em),
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

#v(0em)
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

#v(40em)
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
- 滑移常沿晶体中原子密度最大的晶面和晶向发生。因原子密度最大的晶面和晶向之间原子间距最大，结合力最弱，产生滑移所需切应力最小。#text(tips)[思考题2-9(2)]
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
- 因此，金属的塑性，面心立方晶格>体心立方晶格>密排六方晶格。
  #line(length: 100%, stroke: (paint: tips, thickness: 1pt, dash: "dashed"))
  #v(-0.5em)
  #text(tips)[
    【例】（课本思考题 2-9 第 5 问改）]#text(blue)[比较 Al、Fe、Mg 的塑性。]

  #text(tips)[【解】] Al > Fe > Mg。
  Al 是面心立方晶格，Fe 是体心立方晶格，Mg 是密排六方晶格。
  #v(-0.5em)

  #line(length: 100%, stroke: (paint: tips, thickness: 1pt, dash: "dashed"))

#text(blue)[塑性变形的实质]
滑移是通过滑移面上位错的运动来实现的。

晶体通过位错运动产生滑移时，只在位错中心的少数原子发生移动，它们移动的距离远小于一个原子间距，因而所需临界切应力小，这种现象称作位错的易动性。
#v(-0.6em)
#text(
  gray,
)[密排六方晶格金属滑移系少，常以孪生方式变形。体心立方晶格金属只有在低温或冲击作用下才发生孪生变形。面心立方晶格金属，一般不发生孪生变形，但常发现有孪晶存在，这是由于相变过程中原子重新排列时发生错排而产生的，称退火孪晶。
]

#figure(
  image("./pic/2.1.2-1.png", width: 100%),
  caption: [
  ],
)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (x: 4), stroke: (blue), mark: (end: "straight"))
    line((0, 0), (y: 4), stroke: (blue), mark: (end: "straight"))
    line((0, 0), (z: 4), stroke: (blue), mark: (end: "straight"))

    line((0, 0, 2.5), (0, -0.375, 2.875), stroke: (paint: red, thickness: 2pt), mark: (end: "straight"))
    line((0, 2.5, 0), (-0.375, 2.875, 0), stroke: (paint: red, thickness: 2pt), mark: (end: "straight"))
    line((2.5, 0, 0), (2.875, 0, -0.375), stroke: (paint: red, thickness: 2pt), mark: (end: "straight"))

    line(
      (0, 0),
      (2.5, 0, 0),
      stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"),
      name: "AB",
    )
    line((0, 0), (0, 2.5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"))
    line((0, 0), (0, 0, 2.5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt, dash: "dashed"))

    line((0, 2.5, 2.5), (0, 2.5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))

    line((0, 2.5, 2.5), (0, 0, 2.5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))

    line((2.5, 0, 2.5), (0, 0, 2.5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "CD")
    line((2.5, 0, 2.5), (2.5, 0, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))


    line((2.5, 2.5, 0), (0, 2.5, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt), name: "EF")
    line((2.5, 2.5, 0), (2.5, 0, 0), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))


    content("AB.start", [A(0,0,0)], anchor: "east")
    content("AB.end", [B(5,0,0)], anchor: "west")
    content("CD.start", [C(5,0,5)], anchor: "north")
    content("CD.end", [D(0,0,5)], anchor: "east")
    content("EF.start", [F(5,5,0)], anchor: "west")
    content("EF.end", [F(0,5,0)], anchor: "east")
    line("AB.end", "CD.end", "EF.end", close: true, fill: blue.transparentize(70%))

    line((2.5, 0, 2.5), (2.5, 2.5, 2.5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))
    line(
      (0, 2.5, 2.5),
      (2.5, 2.5, 2.5),
      stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt),
      name: "GH",
    )
    line((2.5, 2.5, 0), (2.5, 2.5, 2.5), stroke: (paint: color.mix((red, 70%), (blue, 30%)), thickness: 2pt))
    content("GH.start", [G(0,5,5)], anchor: "east")
    content("GH.end", [H(5,5,5)], anchor: "west")
  })
]

如上图，当蓝色的晶面作为滑移面时，其上可以有三个滑移方向（图中红色箭头标出），每个滑移方向都能与该滑移面构成一个滑移系，共3个。因为有4个滑移面，所以有12个滑移面。

【注】上图 b 出现的{110}、\<111\>等指的并不是晶面和晶向，而是晶面族和晶向族。
#v(0em)

== 多晶体的塑性变形

=== 晶界的阻碍作用

当位错运动到晶界附近时，受到晶界的阻碍而堆积起来，称#text(red)[位错的塞积]。要使变形继续进行, 则必须增加外力, 从而使金属的变形抗力提高。显然，#Red("晶界越多，多晶体的塑性变形抗力越高。")

=== 各晶粒变形需要相互协调
由于各相邻晶粒位向不同，当一个晶粒发生塑性变形时，为了保持金属的连续性，周围的晶粒若不发生塑性变形，则必以弹性变形来与之协调。这种弹性变形便成为塑性变形晶粒的变形阻力。由于晶粒间的这种相互约束，#Red("使得多晶体金属的塑性变形抗力提高。")

=== 各晶粒变形的不同时
单个晶粒变形与单晶体相似,多晶体变形比单晶体复杂。

== 塑性变形对金属组织的影响

=== 纤维组织形成

金属发生塑性变形时，外形发生变化，其内部的晶粒也相应地被拉长或压扁。当变形量很大时，晶粒将被拉长为纤维状。#Red("性能趋于各向异性，纵向性能高于横向性能。")

#figure(
  image("pic/2.3.1.png", width: 70%),
  caption: [
    纤维组织
  ],
)

#let example(body) = {
  line(length: 100%, stroke: (paint: tips, thickness: 1pt, dash: "dashed"))
  v(-0.5em)
  body
  v(-0.5em)

  line(length: 100%, stroke: (paint: tips, thickness: 1pt, dash: "dashed"))
}

#example()[
  #text(tips)[
    【例】（课本思考题 2-11）]#text(blue)[冷拉处理后的钢丝吊工件进行热处理，退火之后钢丝断裂，]

  #text(tips)[【解】] 冷拉处理使钢丝形成纤维组织，纤维组织的纵向强度和硬度提高，。热处理时，纤维组织沿纵向膨胀，而横向收缩，强度下降导致钢丝断裂。

]
=== 亚结构形成

塑性变形还使晶粒破碎为亚晶粒。胞壁由高密度位错构成。

=== 形变织构
塑性变形达到某一程度时，绝大部分晶粒的某一位向会与变形方向趋于一致，这种现象叫#Red("织构")或#Red("择优取向")。

#box()[
  #figure(
    image("pic/2.3.2.png", width: 46%),
    caption: [
      亚结构形成
    ],
  )
]
#box()[
  #figure(
    image("pic/2.3.3.png", width: 45%),
    caption: [
      形变织构
    ],
  )
]

== 塑性变形对金属性能的影响

=== 产生加工硬化现象
随冷塑性变形量增加，金属的强度、硬度提高，塑性、韧性下降的现象称加工硬化。
=== 使金属的性能产生各向异性
形变织构使金属呈现各向异性，在深冲零件时，易产生“制耳”现象(图23右)，使零件边缘不齐，厚薄不匀。#Red("但织构可提高硅钢片的导磁率")。
=== 影响金属的物理、化学性能

=== 产生残余内应力
内应力是指平衡于金属内部的应力。是由于金属受力时, 内部变形不均匀而引起的。

#text(gray)[内应力分为三类：

  - 第一类内应力平衡于表面与心部之间 （宏观内应力）。
  - 第二类内应力平衡于晶粒之间或晶粒内不同区域之间（微观内应力）。
  - 第三类内应力是由晶格缺陷引起的畸变应力。
]

== 塑性变形金属的再结晶

金属经冷变形后，组织处于不稳定状态，有自发恢复到稳定状态的倾向。但在常温下，原子扩散能力小，不稳定状态可长时间维持。加热可使原子扩散能力增加，金属将依次#Red("发生回复、再结晶和晶粒长大。")

#figure(image("pic/2.4.1.png", width: 50%), caption: [])

=== 回复

回复是指在加热温度较低时，由于金属中的点缺陷及位错近距离迁移而引起的晶内某些变化。如空位与其他缺陷合并、同一滑移面上的异号位错相遇合并而使缺陷数量减少等。

位错的滑移和攀移运动使位错重新排列为更加稳定的状态。缺陷的减少，使金属的晶格畸变减轻。

在回复阶段，#Red("金属组织变化不明显，其强度、硬度略有下降，塑性略有提高，但内应力、电阻率等显著下降。")

工业上，常利用回复现象将冷变形金属低温加热，既稳定组织又保留加工硬化，这种热处理方法称#Red("去应力退火")。
#v(0em)
=== 再结晶

冷变形组织在加热时重新彻底改组的过程称再结晶。

再结晶也是一个晶核形成和长大的过程，但不是相变过程，再结晶前后新旧晶粒的晶格类型和成分完全相同。


1. 影响再结晶温度的因素

(1) #text(blue)[金属的预先变形程度:]

金属预先变形程度越大, 再结晶温度越低。当变形度达到一定值后，再结晶温度趋于某一最低值，称最低再结晶温度。

纯金属的最低再结晶温度与其熔点之间的近似关系：$T_再 ≈ 0.4T_熔$，其中$T_再、T_熔$为绝对温度。

(2) #text(blue)[金属的纯度:]

金属中的微量杂质或合金元素，尤其高熔点元素起阻碍扩散和晶界迁移作用，使再结晶温度显著提高。

(3) #text(blue)[再结晶加热速度和加热时间:]

提高加热速度会使再结晶推迟到较高温度发生，延长加热时间，使原子扩散充分，再结晶温度降低。

#text(tips)[ฅ( ̳•◡• ̳)ฅ  atri的提示喵：经常考]


#v(20em)

生产中，把消除加工硬化的热处理称为#text(red)[再结晶退火]。再结晶退火温度比再结晶温度高$100 ~ 200 ℃$。
2. 影响再结晶退火后晶粒度的因素

(1) #text(blue)[加热温度和保温时间]

加热温度越高，保温时间越长，金属的晶粒越粗大，加热温度的影响尤为显著。

(2) #text(blue)[预先变形度]

预先变形度的影响，实质上是变形均匀程度的影响。当变形度很小时，晶格畸变小，不足以引起再结晶。当变形达到$2~10%$时，只有部分晶粒变形，变形极不均匀，再结晶晶粒大小相差悬殊，易互相吞并和长大，再结晶后晶粒特别粗大，这个变形度称*临界变形度*。
=== 晶粒长大
再结晶完成后，若继续升高加热温度或延长保温时间，将发生晶粒长大，这是一个自发的过程。

#v(0em)
#example()[
  #figure(image("pic/2.4.2.png", width: 70%))
  #text(tips)[
    【例】（《工程材料补天计划》古明地莲）]

  #text(blue)[给上面的三幅图选择合适的描述：

    （A）580℃ 保温 8 秒后的组织

    （B）580℃ 保温 15 分后的组织

    （C）700℃ 保温 10 分后的组织]

  #text(tips)[【解】] 三幅图分别对应 A,B,C。A的加热温度低，保温时间短，晶粒最细小；B与C相  比，虽然C的保温时间短，但是C的加热温度高，而加热温度的影响更加显著，因此C的晶粒最粗大。
]

== 金属的热加工
=== 冷加工与热加工
在金属学中，冷热加工的界限是以#text(red)[再结晶温度]来划分的。

低于再结晶温度的加工称为冷加工(易产生加工硬化)，如车铣磨刨钳，

而高于再结晶温度的加工称为热加工，如铸锻焊。

=== 热加工对金属组织与性能的影响
1. 热加工可使铸态金属与合金中的气孔焊合。
2. 使粗大的树枝晶或柱状晶破碎，从而使组织致密、成分均匀、晶粒细化，力学性能提高。
3. 热加工使铸态金属中的非金属夹杂沿变形方向拉长，形成彼此平行的宏观条纹，称作流线，由这种流线体现的组织称纤维组织。它使钢产生各向异性，在制定加工工艺时，应使流线分布合理，尽量与拉应力方向一致。
4. 在加工亚共析钢时，发现钢中的铁素体(F)与珠光体(P)呈带状分布，这种组织称带状组织。\ 带状组织使金属的力学性能呈现方向性，横向的塑性、韧性明显降低、并且切削性能也恶化。
#v(0em)
#example()[
  #figure(image("pic/2.6.2.png", width: 70%), caption: [])
  #text(tips)[
    【分析】（《工程材料补天计划》古明地莲）]

  图26中，左图的流线分布更合理。左图是锻出来的（热加工），右图是车出来的（冷加工），前者性能更好。飞机的起落架就是锻造出来的。
]
=== 形变强化的应用
- 形变强化——金属经冷塑性变形提高强度、硬度的方法。特别适合于不能用热处理来强化的金属。
- 常用的形变强化方法：冷挤、冷拉、冷轧、冷镦、冷压、滚压和喷丸。

#v(4em)
#text(gray)[以下部分和第7页有重合。]

== 金属的晶粒度对材料性能的影响
- 晶粒愈细，晶界愈多，位错运动愈困难，强度与硬度愈高。同时，细小的晶粒使金属具有较好的塑性和韧性
- #text(red)[晶粒细化可提高金属强度、硬度而不降低塑性、韧性。]
=== 细晶强化的主要方法
1. #text(blue)[提高过冷度]

  提高液态金属的冷却速度。如，选用吸热和导热性较强的铸型材料(用金属型代替砂型);采用水冷铸型;降低浇注温度等。但这些措施只对小型或薄壁的铸件有效。
2. #text(blue)[变质处理]

  在浇注前往液态金属中加入某些难熔的固态粉末(变质剂)，促进非均匀形核来细化晶粒。
3. #text(blue)[振动]

  促进形核，破碎枝晶。对正在结晶的金属进行机械振动、超声波振动或电磁振动，使晶核数目显著增加。
=== 细晶强化的应用
主要应用于铸造生产领域。
- 灰铸铁的孕育处理
- 铝活塞采用金属型铸造。
=== 金属的合金化
（一） 固溶强化

溶质原子溶入金属基体而形成固溶体，使金属的强度、硬度升高，塑性、韧性有所下降，这一现象称为固溶强化。

例如单相的黄铜单相锡青铜和铝青铜都是以固溶强化为主来提高合金强度和硬度的。(如置换型溶质原子或面心立方晶体中的间隙型溶质原子或体心立方晶体中的间隙型溶质原子造成点阵畸变，其应力场将与位错应力场发生弹性交互作用并阻碍位错运动，这是产生固溶强化的主要原因。)

（二） 第二相强化（时效强化或弥散强化）

单纯的固溶强化，其强化程度毕竟有限，还必须进一步以第二相或更多的相来强化。当第二相以细小弥散的微粒均匀分布于基体相中时，将阻碍位错运动，产生显著的强化作用
1. 时效强化（沉淀强化）：第二相微粒是通过过饱和固溶体的时效处理而沉淀析出并产生的强化。
2. 弥散强化：如果第二相微粒是通过粉末冶金方法加入并起强化作用。

#v(40em)


= 铁碳合金
铁碳合金是工业应用最广的合金。含碳量为$0.0218% ~2.11%$的称钢。含碳量为$2.11%~ 6.69%$的称铸铁。
== 二元合金状态图
相图是用来表示合金系中各合金在缓冷条件下结晶过程的简明图解。又称状态图或平衡图。

合金的结晶过程比纯金属复杂，常用相图进行分析。

=== 匀晶相图

两组元在液态和固态下均#text(red)[无限互溶的固溶体]时所构成的相图称二元匀晶相图。

#figure(image("pic/3.1.1-1.png", width: 80%), caption: [匀晶相图及其合金的结晶过程])
相图由两条线构成，上面是液相线，下面是固相线。
相图被两条线分为三个相区，液相线以上为液相区L ，固相线以下为 $alpha$ 固溶体区，两条线之间为两相共存的两相区（L+$alpha$ ）。


#v(40em)
==== 合金的结晶过程

除纯组元外，其它成分合金结晶过程相似，以Ⅰ合金为例说明。
#grid(
  columns: (1fr, 1.6fr),
  gutter: 0em,
  box()[

    1. 当液态金属自高温冷却到$t_1$时，#text(red)[开始结晶]出成分为$alpha_1$的固溶体($omega_(N i)>30%$)，此时液相成分为$L_1$($omega_(N i)=30%$);

    2. 随温度下降，固溶体重量增加，液相重量减少，液相成分沿液相线变化，固相成分沿固相线变化；$t_2$时，液相成分为$L_2$($omega_(N i)<30%$)，固相成分为$alpha_2$($omega_(N i)>30%$);
  ],
  box()[#image("pic/3.1.1-2.png")],
)
#v(0em)
3. 当合金冷却到$t_3$时，最后一滴$L_3$成分的液体也转变为固溶体，此时固溶体的成分又变回到合金成分$alpha_3$上来。#text(red)[(结束结晶)]

4. 此后，即便温度继续下降，成分也不再发生变化。相比于最开始的状态，$omega_(N i)$不变，只是由液态变成了固态。

#v(1em)
- 成分变化是通过原子扩散完成的。
- 这种从液相中结晶出单一固相的转变称为匀晶转变或匀晶反应;
- 液固相线不仅是相区分界线，也是结晶时两相的成分变化线；匀晶转变是变温转变。

==== 杠杆定律
处于两相区的合金，不仅由相图可知道固液两相的成分，还可用杠杆定律求出固液两相的相对重量。


#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  box()[
    以Cu-Ni合金为例，推导过程如下：

    #text(blue)[1.确定成分]

    如右图，$a$点为液相$L$，其$omega_(N i)=x_1$；$b$点为固相$alpha$，其$omega_(N i)=x_2$；纯液体或纯固体的$omega_(N i) = x$
  ],
  box()[#figure(image("pic/3.1.1-3.png"), caption: [杠杆定律示意图])],
)

#v(2em)
#text(blue)[2.确定液固两相的相对重量]

设合金的重量为1，液相重量为$Q_L$，固相重量为$Q_alpha$，则有：
$
  Q_L + Q_alpha = 1\
  Q_L dot x_1 + Q_alpha dot x_2 = x
$
解得：
$
  Q_L = display((x_2 - x)/(x_2 - x_1)) = (o b)/(a b)\
  Q_alpha = display((x - x_1)/(x_2 - x_1)) = (o a)/(a b)
$

这个结论与力学中的杠杆定律完全相似，因此称之为杠杆定律。#text(red)[杠杆定律只适用于两相区。]

#example()[
  #grid(
    columns: (1fr, 0.7fr),
    gutter: 0em,
    align: horizon,
    box()[
      #text(tips)[
        【例】]#text(
        blue,
      )[如右图]

      由杠杆定律得：#h(7em)
      $
        Q_alpha = display((53% - 45%)/(58% - 45%)) = 61.5%\
        Q_L = display((58% - 53%)/(58% - 45%)) = 38.5%
      $
    ],
    box()[#figure(image("pic/3.1.1-4.png"), caption: [杠杆定律示意图])],
  )
]

=== 共晶状态图
当两组元在液态下完全互溶，在固态下有限互溶，并发生共晶反应时所构成的相图称作共晶相图。
#figure(image("pic/3.1.2.png", width: 50%), caption: [Pb-Sn合金相图])

以 Pb（铅）-Sn（锡） 相图为例进行分析。

#text(blue)[相]：相图中有L、$bold(alpha)$、$bold(beta)$三种相,  $bold(alpha)$是溶质Sn在Pb中的固溶体，$bold(beta)$是溶质Pb在Sn中的固溶体。

#text(blue)[相区]：相图中有三个单相区： L、$bold(alpha)$、$bold(beta)$；三个两相区： L+$bold(alpha)$、L+$bold(beta)$、$bold(alpha)$+$bold(beta)$；一个三相区：即水平线cde。

液固相线：#text(blue)[液相线]adb，#text(blue)[固相线]acdeb。a、b分别为Pb、Sn的熔点。

#text(blue)[固溶线]：溶解度点的连线称固溶线。相图中的cf、eg线分别为Sn在Pb中和Pb在Sn中的溶解度曲线。

#text(blue)[共晶线]：水平线cde。在共晶线对应的温度下（183 ℃），d点成分的合金同时结晶出c点成分的$bold(alpha)$固溶体和e点成分的$bold(beta)$固溶体，形成这两个相的机械混合物：
Ld $harpoons.rtlb$ ($bold(alpha)_c$ + $bold(beta)_e$)该反应叫共晶转变或共晶反应。

- 共晶反应的产物，即两相的机械混合物称共晶体或共晶组织。发生共晶反应的温度称共晶温度。代表共晶温度和共晶成分的点称共晶点(d)。

- 具有共晶成分的合金称共晶合金。在共晶线上，凡成分位于共晶点以左(cd段)的合金称亚共晶合金，位于共晶点以右(de段)的合金称过共晶合金。

- 凡具有共晶线成分的合金液体冷却到共晶温度时都将发生共晶反应。

#text(stroke: 0.5pt + blue, size: 12pt, weight: "regular")[#h(-2em)合金的结晶过程]

1. $omega_(S n) < c$（I合金）的结晶过程

在3点以前为匀晶转变，结晶出单相$bold(alpha)$固溶体，这种直接从液相中结晶出的固相称一次相或初生相。

温度降到3点以下， $bold(alpha)$固溶体中Sn过饱和，由于晶格不稳，开始析出（相变过程也称析出）新相—$bold(beta)$相（$bold(beta)_(II)$），由已有固相析出的新固相称二次相或次生相。随着温度下降，$bold(alpha)$沿着cf线变化，$bold(beta)_(II)$沿着eg线变化，$bold(beta)_(II)$的重量增加。

形成二次相的过程称二次析出，是固态相变的一种。相比于初生相，次生相的析出温度更低，过冷度更大，因此晶粒更加细小。
2. $omega_(S n) = c$ 共晶合金（II合金）的结晶过程

液态合金冷却到d点时同时被Pb和Sn饱和，发生共晶反应：
$ "Ld" harpoons.rtlb (bold(alpha)_c + bold(beta)_e) $

在共晶转变过程中，L、$bold(alpha)$、$bold(beta)$三相共存，三个相的量在不断变化，但它们各自成分是固定的。

共晶组织中的相称共晶相。
#v(2em)
共晶转变结束时，$bold(alpha)$ 和 $bold(beta)$相的相对重量百分比为：
$
  Q_alpha = (d e)/(c e) \
  Q_beta = (c d)/(c e)
$

3. $c < omega_(S n) < d$ 亚共晶合金（III合金）的结晶过程

合金液体在2点以前为匀晶转变。冷却到2点，固相成分变化到c点，液相成分变化到d点，此时合金成分αc+Ld,此时两相的相对重量为：

$
  Q_L = (c 2)/(c d) \
  Q_alpha = (2 d)/(c d)
$
在共晶线上，$L_d$继续发生共晶反应

温度从2点继续下降，将从$bold(alpha)$中析出$bold(beta)_(II)$，其室温组织$bold(alpha)+ (bold(alpha)+bold(beta)) + bold(beta)_(II)$。
4. $omega_(S n) > d$ 过共晶合金（IV合金）的结晶过程

与亚共晶合金相似，不同的是一次相为$bold(beta)$，二次相为$bold(alpha)_(II)$。

其室温组织为$bold(beta) + (bold(alpha)+bold(beta)) + bold(alpha)_(II)$。

=== 包晶状态图 (不考，仅了解)

当两组元在液态下完全互溶，在固态下有限互溶，并发生包晶反应时所构成的相图称作包晶相图。

在一定温度下，由一个液相包着一个固相生成另一新固相的反应称包晶转变或包晶反应。

=== 共析反应的合金的结晶

共析反应（共析转变）是指在一定温度下，由一定成分的固相同时析出两个成分和结构完全不同的新固相的过程。共析转变也是固态相变。

最常见的共析转变是铁碳合金中的珠光体转变: $gamma_S harpoons.rtlb alpha_P + F e_3C$。

#grid(
  columns: (5fr, 3fr),
  gutter: 1em,
  align: horizon,
  box()[
    共析相图与共晶相图相似，对应的有共析线（PSK线）、共析点（S点）、共析温度、共析成分、共析合金（共析成分合金）、亚共析合金（共析线上共析点以左的合金）、过共析合金（共析线上共析点以右的合金）。
  ],
  box()[#figure(image("pic/3.1.4.png"))],
)
共析反应的产物是共析体（铁碳合金中的共析体称珠光体），也是两相的机械混合物（铁素体+渗碳体)。

与共晶反应不同的是，共析反应的母相是固相，而不是液相。

另外，由于固态转变过冷度大，因而共析组织比共晶组织细。

== 铁碳合金

=== 纯铁（$omega_(F e) = 99.8% ~ 99.9%$）

物质在固态下晶体结构随温度变化的现象称同素异构转变。同素异构转变属于相变之一——固态相变。

铁在固态冷却过程中有两次晶体结构变化，其变化为：
$
  op(delta - F e, limits: #true)_(体 心 立 方) harpoons.rtlb^(1394℃) op(gamma - F e, limits: #true)_(面 心 立 方) harpoons.rtlb^(912℃) op(alpha - F e, limits: #true)_(体 心 立 方)
$

=== 铁碳合金的基本组织

组元：$F e$、 $F e_3 C$'

==== 铁素体(相、组织)：
碳在$bold(alpha)$-Fe中的固溶体称铁素体, 用F或$bold(alpha)$表示。

是体心立方间隙固溶体。铁素体的溶碳能力很低，在$727℃$时最大为$0.0218%$，室温下仅为$0.0008%$。

铁素体的组织为多边形晶粒，性能与纯铁相似。
#figure(image("pic/3.2.2.png", width: 30%), caption: [铁素体])

==== 奥氏体(相、组织)：

碳在$bold(gamma)$-Fe中的固溶体称奥氏体。用A或 $bold(gamma)$ 表示。

是面心立方晶格的间隙固溶体。溶碳能力比铁素体大，$1148℃$时最大为$2.11%$，$727℃$时为$0.77%$。

组织为不规则多面体晶粒，晶界较直。#text(red)[强度低、塑性好]，#text(red)[钢材热加工]都在奥氏体区进行。

碳钢室温组织中无奥氏体。

#example()[
  #text(tips)[
    【例】(atri)
  ]
  #text(blue)[为什么奥氏体溶碳能力大于铁素体]

  1. 奥氏体温度大于铁素体，温度越高碳的溶解度越大，原子活性也越大。

  2. 面心立方晶格晶胞中间无占位原子，溶碳能力更高。体心立方晶格中心原子将晶格碎片化，不利于溶碳。
]




==== 渗碳体(相、组织)：

$F e_3 C$，含碳$6.69%$，间隙化合物，用$F e_3 C$或$C_m$表示。

$F e_3 C$硬度高、强度低($sigma_b approx 35 M P a$)，脆性大，塑性几乎为零。

$F e_3 C$是一个亚稳相，在一定条件下可发生分解：$F e_3 C arrow 3 F e + C$（石墨）, 该反应对铸铁有重要意义。

由于碳在$bold(alpha)$-Fe中的溶解度很小，因而常温下碳在铁碳合金中主要以$F e_3 C$或石墨的形式存在。

==== 珠光体(共析组织)：

铁素体（F）与渗碳体（$F e_3 C$）的机械混合物，用P表示。

珠光体的组织特点是两相呈片层相间分布，性能介于两相之间。

光镜下呈指纹状

==== 莱氏体(共晶组织)：

高温莱氏体：$727 ℃$以上，由奥氏体(A)与渗碳体($F e_3 C$)组成，以$L d$表示。

低温莱氏体：$727 ℃$以下，由珠光体(P)与渗碳体($F e_3 C$)组成，以$L d'$表示。

机械混合物，为蜂窝状，以Fe3C为基，性能硬而脆。

=== 铁碳合金相图
#grid(
  columns: (1fr, 1.03fr),
  gutter: 1em,
  box()[铁和碳可形成一系列稳定化合物： $F e_3 C$、 $F e_2 C$、 $F e C$，它们都可以作为纯组元看待。含碳量大于$F e_3 C$成分($6.69%$)时，合金太脆，已无实用价值。

    实际所讨论的铁碳合金相图是$F e - F e_3 C$相图。
  ],
  box()[#figure(image("pic/3.3.0.png"))],
)
==== 特征点
#text(tips)[【atri 注】考试会给各点的温度和碳含量，但是不会给出各相区的成分。]
#grid(
  columns: (1fr, 1.1fr),
  gutter: 1em,
  align: center,
  box()[#figure(image("pic/3.3.1-2.png", width: 90%))], box()[#figure(image("pic/3.3.1-1.png", width: 90%))],
)
==== 特征线
#figure(
  table(
    columns: (1fr, 2fr),
    [特征线], [含义],
    [ABCD], [液相线],
    [AHJECF], [固相线],
    [ECF], [共晶线$L_C harpoons.rtlb A_E+F e_3 C$],
    [PSK], [共析线$A_S harpoons.rtlb F_P+ F e_3 C$],
    [GS，GP], [$bold(gamma) harpoons.rtlb bold(alpha)$固溶体转变线，GS又称$A_3$线。],
    [ES], [碳在$bold(gamma)-F e$中的固溶线，又称$A_(c m)$线。],
    [PQ], [碳在$bold(alpha)-F e$中的固溶线。],
  ),
)
==== 相区
#v(-1em)
#figure(image("pic/3.3.1-3.png", width: 73%))


==== 铁碳合金的分类
#figure(
  table(
    columns: (1fr, 1fr),
    [含碳量], [合金种类],
    [$0-0.0218%$], [工业纯铁],
    [$0.0218%-0.77%$], [亚共析钢],
    [$0.77%$], [共析钢],
    [$0.77%-2.11%$], [过共析钢],
    [$2.11%-4.3%$], [亚共晶白口铸铁],
    [$4.3%$], [共晶白口铸铁],
    [$4.3%-6.69%$], [过共晶白口铸铁],
  ),
)


==== 典型铁碳合金的平衡结晶过程

1. 共析钢
#grid(
  columns: (1fr, 0.2fr),
  gutter: 1em,
  // align: center,
  box()[
    合金液体在1-2点间开始转变为$bold(gamma)$（奥氏体）。到S点发生共析转变：$bold(gamma)_S harpoons.rtlb bold(alpha)_P+F e_3 C$，$bold(gamma)$全部转变为 P（珠光体）。

    相变结束时，珠光体中两相的相对重量百分比为：
    $
      Q_alpha = (K S)/(P K) = 88.8% #h(1em)
      Q_(F e_3 C) = (S P)/(P K) = 11.2%
    $
    珠光体中的渗碳体称共析渗碳体。

    S点以下，共析$bold(alpha)$中析出$F e_3 C_Ⅲ$，与共析$F e_3 C$结合不易分辨。室温组织为P。
    #text(red)[若要求室温下两相的相对质量百分数，只需要把铁素体的溶解度换成室温下的溶解度即可。]
    $
      Q_alpha = (6.69-0.77)/(6.69-0.0008) = 88.5% #h(1em)
      Q_(F e_3 C) = (0.77-0.0008)/(6.69-0.0008) = 11.5%
    $
  ],
  box()[#figure(image("pic/3.2.3.5-1.png", width: 100%))],
)
2. 亚共析钢

合金在4点以前通过匀晶—包晶—匀晶反应全部转变为A（奥氏体）。从4点开始，由A中析出F，A成分沿GS线变到S点。在5点，A发生共析反应转变为珠光体。温度继续下降，F中析出$F e_3 C_Ⅲ$，量少，忽略不计。组织组成物为：P+F。
#grid(
  columns: (1fr, 0.3fr),
  gutter: 1em,
  // align: center,
  box()[
    共析温度下两相的相对重量为：
    $
      Q_alpha = (5 K)/(P K) #h(1em)
      Q_(F e_3 C) = (P 5)/(P K)
    $
    组织组成物的相对重量为：
    $
      Q_F = (5 S)/(P S) #h(1em)
      Q_P = (P 5)/(P S)
    $

  ],
  box()[#figure(image("pic/3.2.3.5-2.png", width: 100%))],
)
同样的，室温情况只需要把铁素体的溶解换成室温下的溶解度即可。

3. 过共析钢
从3点开始析出$F e_3 C$。从A中析出的$F e_3 C$称二次渗碳体($F e_3 C_Ⅱ$），其沿晶界呈网状分布。温度下降，$F e_3 C_Ⅱ$量增加。从3点到4点，A成分沿ES线变化到S点，温度继续下降，A转变为P。

#grid(
  columns: (1fr, 0.3fr),
  gutter: 1em,
  align: horizon,
  box()[
    #h(-2em)共析温度两相的相对重量为：$display(Q_alpha = (4 K)/(P K) #h(1em)Q_(F e_3 C) = (P 4)/(P K))$
    #v(1em)
    #h(-2em)组织组成物的相对重量为：$display(Q_P = (4 K)/(S K) #h(1em)Q_(F e_3 C) = (S 4)/(S K))$
  ],
  box()[#figure(image("pic/3.2.3.5-3.png", width: 100%))],
)
同样的，室温情况只需要把铁素体的溶解换成室温下的溶解度即可。

4. 共晶合金

合金冷却到C点发生共晶反应全部转变为莱氏体($L_d$)，莱氏体是共晶奥氏体($gamma$)与共晶$F e_3 C$的机械混合物，呈蜂窝状。

#grid(
  columns: (1fr, 0.3fr),
  gutter: 1em,
  // align: center,
  box()[
    共晶转变结束时，两相的相对重量为：
    $
      Q_gamma = (C K)/(E K)= (6.69-4.3)/(6.69-2.11)= 52.2% #h(1em)
      Q_(F e_3 C) = (C E)/(E K) = 47.8%
    $
    C点以下，$bold(gamma)$成分沿ES线变化，共晶$bold(gamma)$将析出$F e_3 C_Ⅱ$。$F e_3 C_Ⅱ$与共晶$F e_3 C$结合，不易分辨。温度降到3点，$bold(gamma)$成分达到$0.77%$，相的相对重量:
    $
      Q_gamma = (3 K)/(S K) = (6.69-4.3)/(6.69-0.77)= 40.4% #h(1em)
      Q_(F e_3 C) = (S 3)/(S K) = 59.6%
    $

  ],
  box()[#figure(image("pic/3.2.3.5-4.png", width: 100%))],
)
在3点，共晶$gamma$发生共析反应，转变为珠光体，这种由P与$F e_3 C$组成的共晶体称低温莱氏体，用$L_d'$表示。3点以下，共晶体中P的变化同共析钢。室温算法同上。

亚共晶合金和过共晶合金类上。下为铁碳相图的各区成分图。
#v(-1em)
#figure(image("pic/3.2.3.5-5.png", width: 65%))
#example()[
  #text(tips)[课本思考题3-6]．#text(blue)[$omega_C = 3.0％$的亚共晶生铁，自液态冷却至室温，组织发生了什么变化？室温时的组织是什么？各组织成分的质量分数分别是什么？]

  #h(-4em)
  #box()[#figure(image("pic/kb3-6.png", width: 40%))]
  #box()[#figure(image("pic/kb3-6-1.png", width: 60%))]

  #text(tips)[【解】]

  液态合金冷却到2点开始析出奥氏体($bold(gamma)$)。随着温度下降，液体的碳含量沿液相线AC变化；析出的奥氏体碳含量沿固相线AE变化。

  当温度达到共晶温度时，液体发生共晶反应转变为莱氏体$L_d$（A+$L_d$）。

  随着温度继续下降，奥氏体沿ES线降低。这导致二次渗碳体$(F e_3 C_Ⅱ)$ 从奥氏体中析出。

  当温度达到共析温度时，所有剩余的奥氏体发生共析转变为珠光体(P)。

  随着温度继续下降至室温，铁素体沿PQ线降低。二次渗碳体$(F e_3 C_Ⅱ)$ 析出。

  因此室温时组织：$P+F e_3C_Ⅱ+L_d '$

  各组织成分的质量分数为：
  - $display(Q_(L_d^') = Q_(L_d) = (3-2.11)/(4.3-2.11) = 40.6%)$ #v(0.6em)
  - $Q_A = display((4.3-3)/(4.3-2.11) = 59.4%)$#v(0.6em)
  - $Q_(F e_3 C_Ⅱ) = Q_A times display((2.11-0.77)/(6.69-0.77)) = 13.4%$#v(0.6em)
  - $Q_P = 1- Q_(L_d^')-Q_(F e_3 C_Ⅱ) = 46%$
]

#v(40em)
==== 含碳量对碳钢组织与性能的影响
1. 含碳量对碳钢室温平衡组织的影响
含碳量与缓冷后相及组织组成物之间的定量关系为：
#figure(image("pic/3.2.4.1-1.png"))
2. 含碳量对力学性能的影响
  1. 亚共析钢随含碳量增加，P 量增加，钢的强度、硬度升高，塑性、韧性下降。

  2. $0.77%$C时，组织为$100%$ P,  钢的性能即P的性能。

  3. $＞0.9%$C，$F e_3C_Ⅱ$为晶界连续网状，强度下降，但硬度仍上升。

  4. $＞2.11%$C，组织中有以$F e_3C$为基的$L_d '$，合金太脆。
3. 含碳量对工艺性能的影响
① 切削性能：中碳钢合适

② 可锻性能：低碳钢好

③ 焊接性能：低碳钢好

④ 铸造性能：共晶合金好

⑤ 热处理性能：下章介绍

4. 铁碳合金相图的应用
  1. 选材料方面的应用。
  2. 制定热加工工艺方面的应用。
    - 在铸造生产方面，根据相图可以确定铸钢和铸铁的浇注温度。
    - 在锻造生产方面，可确定始锻、终锻温度。
    - 在焊接方面，可分析碳钢的焊接组织。
    - 对热处理来说，可确定加热范围。

#v(4em)
=== 碳素钢
#text(blue)[碳素钢]: 指在冶炼过程中不人为加入合金元素的钢种。

#text(blue)[合金钢]: 指在冶炼过程中人为加入合金元素的钢种。

==== 化学成分对碳钢性能的影响

1. 碳的影响
  - $0.77%$C时，组织为$100%$珠光体，钢的性能即珠光体的性能。
  - $<0.9%$C，渗碳体数量增加，作为强化相阻止位错运动。
  - $＞0.9%$C，$F e_3C_Ⅱ$为晶界连续网状，P被$F e_3C_Ⅱ$割断，强度下降，硬度仍上升。
  - $＞2.11%$C，组织中有以$F e_3C$为基的$L_d '$，合金太脆。

2. 硅的影响

  硅可固溶于铁素体中，使钢的强度、硬度升高（固溶强化）。但硅含量过高时降低钢的塑性、韧性。

3. 锰的影响

  锰也可固溶于铁素体中，使钢的强度、硬度升高（固溶强化）。而且当锰的含量不十分高时，对钢的塑性、韧性也有改善作用。另外锰易与钢中的硫生成MnS塑性夹杂物，可降低硫的有害作用。

#text(
  gray,
)[作为杂质元素存在时，Si、Mn量一般控制在规定值之下($omega_(S i)＜0.5%$，$omega_(M n)＜0.8%$)，此时它们是有益元素。]

4. 硫的影响

  硫与铁能生成FeS，FeS常与Fe一起形成低熔点（约989 ℃）的共晶体，分布在奥氏体晶界上；当钢进行热加工时（如在900～1200 ℃锻造或轧制、焊接等），共晶体将熔化，使钢的强度、尤其是韧性大大下降而产生脆性开裂，这种现象称为热脆性。增加钢中的含锰量，使S与Mn优先生成高熔点（约1620 ℃）的MnS，从而避免热脆。

5. 磷的影响

  磷主要溶于铁素体中，过多的磷也会生成极脆的$F e_3P$化合物，偏析于晶界上。它虽然有明显的提高钢的强度、硬度的作用，但会剧烈地降低钢的塑性、韧性、尤其是低温韧性，并使冷脆转化温度升高；这种现象称为冷脆性。

==== 碳钢的分类

1. 按钢的含碳量分类：
  - 低碳钢：$omega_C<0.25%$ ——广泛用于工程构件
  - 中碳钢： $omega_C ：0.25~0.6%$ ——广泛用于机器零件
  - 高碳钢： $omega_C >0.6%$ ——广泛用于工具制造

2. 按钢的质量分类：
  - 普通碳素钢： $omega_S<0.050%$，$omega_P<0.045%$
  - 优质碳素钢： $omega_P$，$omega_S <0.035%$
  - 高级优质碳素钢： $omega_S<0.020%$，$omega_P<0.030%$

3. 按钢的用途分类：
  - 碳素结构钢：制造各种工程构件和机器零件
  - 碳素工具钢：制造各种刀具、量具、模具
==== 碳钢的编号和用途
- 普通碳素结构钢
- 优质碳素结构钢
- 碳素工具钢
- 铸造碳钢

#v(1em)
1. #text(blue)[普通碳素结构钢]
- 牌号：由屈服强度，质量等级和脱氧方法组成。方法是由代表屈服点的字母（Q），屈服强度数值（MPa），质量等级符号（A，B，C，D）及脱氧方法符号（F，b，Z）等四部分按顺序组成。如Q235-A∙F，表示屈服强度数值为235 MPa的A级沸腾钢。质量等级符号表示普碳钢中杂质硫磷含量的高低，C，D级的含量最低，质量好。脱氧方法符号从F起依次分别表示沸腾钢，半镇静钢，镇静钢及特殊镇静钢。

- 应用特点：
  - 价格便宜
  - 与优质钢比较，属普通质量钢，价格便宜，应用甚广。
  - 不进行热处理，直接使用，主要考虑力学性能和常存杂质的含量，含碳量仅作参考。
- 用途：

  1. 一般在钢厂供应状态下（即热轧状态）直接使用，出厂时#text(red)[保证机械性能]
  2. 工程结构（薄钢板，钢筋，钢管，各种型材）
  3. 要求不高的机器零件（螺钉，螺栓，手柄，小轴）
- 特点：塑韧性优良

2. #text(blue)[优质碳素结构钢]
- 牌号：该类钢的钢号用钢中平均含碳量的两位数字表示，单位为万分之一。如钢号45，表示平均含碳量为$0.45%$的钢，这是正常含锰量（按杂质含量）的优质碳素结构钢的钢号表示方法。对含锰量较高的钢，须将锰元素标出。所谓较高含锰量系指含碳量大于$0.6%$、含锰量在$(0.9~1.2)%$者及含碳量小于$0.6%$、含锰量$(0.7~1.0)%$者。沸腾钢，半镇静钢以及专门用途的优质碳素结构钢，应在钢号后特别标出，如08F表示含碳量为0.08%的沸腾钢。

- 应用特点
  - 属优质钢。
- 用途：
  - 出厂时#text(red)[保证成分]，用来制造较重要的机器零件，一般都经过热处理以提高力学性能。
  - 08～10：强度较低而塑性很好，适于作冷冲压和焊接用钢。
  - 15～25：强度较低，但塑性、韧性好，并具有良好的焊接性能。常做冲压件、焊接件、渗碳件。用来制造螺钉、螺母、垫圈等。#text(red)[碳素渗碳钢]。
  - 30～50：调质后有良好的综合机械性能。用作轴、连杆、丝杠、键。#text(red)[碳素调质钢]。
  - 55～65：热处理后有良好的弹性。用作弹簧、轧辊、钢丝绳。#text(red)[碳素弹簧钢]。

3. #text(blue)[碳素工具钢]
工具钢用于制造各种加工和测量工具，按用途可分为刃具钢、模具钢和量具钢。碳素工具钢的质量分数较高，0.65%~ 1.35%。

- 牌号:
  碳素工具钢是在钢号前加“T”表示，其后跟以表示钢中平均含碳量的千分之几的数字。如平均含碳量为$0.8%$的工具钢，其钢号记为“T8”。含锰量较高者须在钢号后标以“Mn”。若为高级优质碳素工具钢则在钢号末端加“A”，如T10A。
- 应用特点: 必须经过热处理后使用。
  - 高级优质钢（后缀加A），$omega_S≤0.020%$，$omega_P≤0.030%$；
  - 优质钢，$omega_S ≤0.030%$，$omega_P ≤0.035%$。

- 用途：各种刀具、刃具、量具，淬透性不高，适于小截面的工具。
#figure()[
  #set text(size: 10pt)
  #table(
    columns: (0.4fr, 1fr, 1fr),
    [T7，T8], [中等硬度，高韧性工具], [冲头、凿子、锻造工具、錾子、锤子。],
    [T9～T11], [高硬度、中等韧性工具], [钻头、车刀、丝锥、钢锯条、小冲模。],
    [T12～T13], [高硬度、耐磨性而韧性要求不高的工具], [精车刀、量具、锉刀、刮刀。],
  )
]

4. #text(blue)[铸造碳钢]
简称铸钢，用于铸造的碳素钢。

- 牌号:
  ZG加两组数字组成，第一组为屈服强度，第二组数字为抗拉强度，如ZG340-640。
- 应用特点:
  制造形状复杂，力学性能要求高（如很大冲击），用锻钢难以成型，用铸铁不能满足要求的零件。

  5. #text(blue)[选材]
#figure()[
  #set text(size: 10pt)
  #table(
    columns: (0.4fr, 1fr, 1fr, 1fr),
    [目标], [受力情况], [性能要求], [材料选择],
    [齿轮],
    [工作时齿表面承受较大的压力和摩擦，齿部还承受较大的交变应力和冲击力],
    [较高强度，硬度，优良的综合力学性能],
    [中碳优质碳素结构钢，如55钢],

    [叶片], [承受较小的冲击载荷和磨擦力], [要求一般的强度，硬度], [普通碳素结构钢，如Q195],
    [锉刀], [承受较大的磨擦力], [要求高的硬度，耐磨性], [碳素工具钢，如T12],
  )
]

6. #text(blue)[小结]
#figure()[
  #image("pic/3.2.4.3.png", width: 60%)
]

#example()[
  #text(tips)[
    【例】(ppt)
  ]
  #text(blue)[
    解释下列牌号并为下列构件选择合适的制造材料。

    Q215 –A∙F    65      40Mn      T12    ZG200-400
  ]
  #figure(image("pic/3.2.4.3-1.png", width: 60%))
  #text(tips)[【解】]

  #grid(
    columns: (1fr, 0.3fr),
    gutter: 1em,
    align: horizon,
    box()[
      #set text(size: 10pt)
      Q215-A∙F：普通碳素结构钢，屈服强度215MPa，质量等级A，沸腾钢

      65：优质碳素结构钢，含碳量$0.65%$

      40Mn：优质碳素结构钢，含碳量$0.40%$，含Mn量$0.7~1.0%$

      T12：碳素工具钢，含碳量$1.2%$

      ZG200-400：铸造碳钢，屈服强度 200MPa，抗拉强度400MPa
    ],
    box()[#figure(image("pic/3.2.4.3-2.png", width: 100%))
    ],
  )]

=== 铸铁

==== 概述
铸铁是碳含量大于2.11%、并常含有较多的硅、锰、硫、磷等元素的铁碳合金。

铸铁的生产设备和工艺简单，价格便宜，并具有许多优良的使用性能和工艺性能，所以应用非常广泛，是工程上最常用的金属材料之一。它可用于制造各种机器零件，如机床的床身、床头箱；发动机的汽缸体、缸套、活塞环、曲轴、凸轮轴；轧机的轧辊及机器的底座等。

按照碳的存在形式（总的分类），铸铁可分为：
#figure()[
  #set text(size: 10pt)
  #table(
    columns: (0.4fr, 1fr, 0.4fr),
    inset: 0.5em,
    [白口铸铁], [碳全部以渗碳体形式存在的（组织中有$L_d '$）], [很少使用],
    [灰口铸铁], [碳大部分以石墨（G）形式存在的（组织中无$L_d '$）], [大量使用],
    [麻口铸铁], [碳部分以渗碳体、部分以石墨存在的（组织中有$L_d '$）], [废品],
  )
]

灰口铸铁按照石墨的形态，可分为:
// #figure()[
//   #set text(size: 10pt)
//   #table(
//     columns: 2,
//     inset: 1em,
//     [灰铸铁], [石墨呈片状],
//     [可锻铸铁], [石墨呈团絮状],
//     [球墨铸铁], [石墨呈球状],
//     [蠕墨铸铁], [石墨呈蠕虫状],
//   )
// ]
- 灰铸铁——石墨呈片状灰口铸铁；(性能最差但使用最多)
- 可锻铸铁——石墨呈团絮状的灰口铸铁；
- 球墨铸铁——石墨呈球状的灰口铸铁；（性能最好）
- 蠕墨铸铁——石墨呈蠕虫状的灰口铸铁。

==== 铸铁的石墨化
铸铁中碳原子以石墨形态析出的过程称为石墨化。

#text(
  gray,
)[
  铁碳合金中，渗碳体并不是一种稳定的相，而石墨是一种稳定的相。在铁碳合金结晶的过程中，因为渗碳体的含碳量较石墨的含碳量更接近合金成分的含碳量，故易形成渗碳体晶核。但在极其缓慢冷却条件下，或在合金中含有促进石墨化的元素时，在铁碳合金的结晶过程中，便会直接自液体或奥氏体中析出石墨相。因此，对铁碳合金的结晶过程来说，实际存在两种相图，即亚稳定状态的$F e-F e_3C$相图和稳定的$F e-G$相图。

  铁碳合金按照$F e-G$相图进行结晶，则铸铁的石墨化过程可分为两个阶段：

  第一阶段：共析转变温度以上进行的石墨化；

  第二阶段：共析转变进行的石墨化；

  一般，铸铁在高温冷却过程中，由于具有较高的原子扩散能力，故其第一阶段的石墨化是较容易进行的，而在较低温度下的第二阶段的石墨化，则常因铸铁的成分及冷却速度等条件的不同，石墨化被部分或全部抑制，从而得到三种不同的组织，即：F+G，F+P+G，P+G。

]
#figure(
  image("pic/3.2.5.2-1.png", width: 72%),
  caption: [石墨化程度对铸铁组织的影响],
)
#text(blue)[影响石墨化的因素]

1. 内因--化学成分
  - C：形成石墨化的元素。

  - Si：强烈促进石墨化的元素

    #text(
      gray,
    )[硅能减弱碳和铁的亲合力，不利于渗碳体的析出，从而促进了石墨化； 在铸铁中，$1%$Si对石墨化的作用相当于$1/3%$C，所以有：
      碳当量$C_E=C%+1/3S i%$
      在灰口铸铁中含有大量的硅，这就是铸铁以灰口组织出现的根本原因！]

  - Mn：具有双重作用：本身是阻碍石墨化的元素，但它可以减弱S的有害性；

  - S：严重阻碍石墨化的元素；

  - P：促进石墨化的元素，但含量很低，影响不大，冷脆性。
2. 外因--冷却速度

铸铁的冷却速度越小，或在高温下长时间保温，均有利于石墨化。

生产过程中铸件壁厚越厚，铸型导热性越差(使用砂型铸造)，冷却速度越慢，越有利于石墨化。

==== 常见灰口铸铁

1. #text(blue)[灰铸铁]
  1. 组织：钢基体+片状石墨
  2. 工艺：直接浇注（或经孕育处理）
  3. 成分：C： $3.0%～3.8%$
    Si：$1.5%～3.0%$
  4. 性能特点：铸造性能最好，力学性能最差（有效承载面积只有$30-50%$）
  5. 热处理：由于这种铸铁中G的破坏作用很大，一般不进行以提高强度为目的的热处理，主要进行消除内应力退火，有时进行表面淬火
  6. 孕育处理(铸铁石墨细晶强化):

    为了细化灰铸铁的组织，提高铸铁的机械性能，并使其均匀一致。通常在浇注前往铁水中加和少量强烈促进石墨化的物质 （即孕育剂）进行处理，这一处理过程称为孕育处理。 经过孕育处理的灰铸铁称孕育铸铁。
  7. 牌号及应用: #text(red)[HTxxx]（灰）xxx为三位数字，表示最低抗拉强度。
  #figure(
    image("pic/3.2.5.3-1.png", width: 48%),
  )

  8. 性能特点：
  ① 优良的铸造性能 #text(gray)[收缩小— G有补缩作用；流动性好—成分接近共晶点]

  ② 优良的切削加工性 #text(gray)[不缠刀—G易断屑：刀具磨损小—G是一种固态润滑剂]

  ③ 良好的减摩性 #text(gray)[G是一种固态润滑剂； G处可储存液态润滑剂]

  ④ 良好的减震性 #text(gray)[G吸收震动波]

  ⑤ 较低的缺口敏感性 #text(gray)[G本身是一种缺陷；G有一定的止裂作用]

  ⑥ 较低力学性能，但抗压性能不低于钢 #text(gray)[G有切割作用；G有缩减作用]

  ⑦ 锻压性能和焊接性能很差 #text(gray)[塑性、韧性低；含碳量太高]

2. #text(blue)[球墨铸铁]
  1. 组织：钢基体+球状石墨
  2. 工艺：球化处理，球化剂为镁、稀土和稀土镁
  3. 成分：$3.6%～3.9%$C，$2.2%～3.1%$Si
  4. 性能特点：力学性能最好（有效承载面积可达$70-90%$），铸造性能较差
  5. 热处理：与钢相同，可进行各种热处理。退火、正火、调质、等温淬火等
  6. 用途：承受震动、载荷大的零件，如曲轴、传动齿轮等。
  7. 牌号及应用: QTxxx(球), xxx为三位数字，表示最低抗拉强度。
  #figure(
    image("pic/3.2.5.3-2.png", width: 48%),
  )

3. #text(blue)[可锻铸铁]
  1. 组织：钢基体+团絮状石墨
  2. 工艺：先浇注成白口铸铁件，再进行石墨化退火
  3. 成分：$2.4~2.8%$C，$1.4~1.8%$Si
  4. 性能特点：力学性能好，铸造性能差#text(red)[(名为可锻，实不可锻，因较高的塑性)]
  5. 热处理：一般不热处理
  6. 用途：用于制造形状复杂且承受振动载荷的薄壁小型件，如汽车、拖拉机的前后轮壳、管接头、低压阀门等。
  7. 牌号： KT+数字+数字，后面的两组数字分别表示最低抗拉强度和最低伸长率。
#v(2em)
4. #text(blue)[蠕墨铸铁]
  1. 组织：钢基体+蠕虫状石墨
  2. 工艺：蠕化处理
  3. 成分：碳 = $3.0%~4.0%$，硅 = $2.0%~3.0%$
  4. 性能特点：力学性能较好（耐热性突出），铸造性能稍差
  5. 热处理：与灰铸铁类似
  6. 用途：常用于制造承受热循环载荷的零件和结构复杂、强度要求高的铸件。如钢锭模、玻璃模具、柴油机汽缸、汽缸盖、排气阀、液压阀的阀体、耐压泵的泵体等。
  7. 牌号：RuTxxx，xxx为三位数字。

5. 特殊性能铸铁

在铸铁中加入某些元素，以形成具有特殊性能的铸铁(又称合金铸铁)。

（一）耐磨铸铁：灰铸铁中提高磷含量；白口铸铁中加入Cr、Ni、Mo（钼）、V（钒）等元素。

（二）耐蚀铸铁：向铸铁中加入Si、Al、 Cr、Cu、Ni、P等元素。
#v(80em)


= 钢的热处理

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  // align: horizon,
  box()[

    热处理：是指将钢在固态下加热、保温和冷却，以改变钢的组织结构，获得所需要性能的一种工艺。

    为简明表示热处理的基本工艺过程，通常用温度—时间坐标绘出热处理工艺曲线。
  ],
  box()[#figure(image("pic/4.0-1.png", width: 70%), caption: [热处理工艺曲线])],
)
热处理原理：描述热处理时钢中组织转变的规律称热处理原理。

热处理工艺：根据热处理原理制定的温度、时间、介质等参数称热处理工艺。

#text(red)[钢在加热和冷却时的组织转变]是热处理的核心问题。
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  // align: horizon,
  box()[#figure(image("pic/4.0-2.png", width: 100%), caption: [])],
  box()[
    $A_1、A_3、A_(c m)$线是研究钢在热处理时反复使用的三个重要的相变临界点，但他们属于#text(red)[平衡临界点]。而实际热处理条件下的加热与冷却速度都很快，属于#text(red)[非平衡状态]，这样钢在实际加热与冷却时的$A_1、A_3、A_(c m)$都要#text(red)[偏离其平衡值]，这是由加热与冷却时的相变需要一定的过热与过冷引起的。加热时铁碳相图中对应线的名称在A后面加c表示"increase"，冷却时则加r表示"reduce"

  ],
)

== 钢在加热时的组织转变

加热是热处理的第一道工序。加热分两种：一种是在$A_1$以下加热，不发生相变；另一种是在$A_1$以上加热，目的是获得均匀的奥氏体组织，称#text(red)[奥氏体化]。

=== 奥氏体的形成过程
奥氏体化也是形核和长大的过程，分为四步。现以共析钢为例说明：
1. 奥氏体晶核形成：首先在铁素体与渗碳体相界形成奥氏体晶核。
2. 奥氏体晶核长大：奥氏体晶核通过碳原子的扩散向铁素体和渗碳体方向长大。
3. 残余渗碳体溶解：铁素体的成分、结构更接近于奥氏体，因而先消失。残余的渗碳体随保温时间延长继续溶解直至消失。
4. 奥氏体成分均匀化：渗碳体溶解后，其所在部位碳含量仍很高，通过长时间保温使奥氏体成分趋于均匀。
亚共析钢和过共析钢的奥氏体化过程与共析钢基本相同。但由于共析铁素体或二次渗碳体的存在，要获得全部奥氏体组织，必须相应加热到$A c_(3)$或$A c_(c m)$以上。

=== 奥氏体晶粒长大及其控制
==== 晶粒大小的表示方法:
通常分为8级，1级最粗，8级最细。
==== 奥氏体晶粒度的概念
奥氏体化刚结束时的晶粒度称#text(blue)[起始晶粒度]，此时晶粒细小均匀。

随着加热温度升高或保温时间延长，奥氏体晶粒将进一步长大，这也是一个自发的过程。奥氏体晶粒长大过程与再结晶晶粒长大过程相同。

实际热处理条件下所获得的奥氏体晶粒大小称#text(blue)[实际晶粒度]。

加热至 $930±10 ℃$，保温8小时后的奥氏体晶粒大小称#text(blue)[本质晶粒度]。

==== 奥氏体晶粒大小的控制
1. 加热温度和保温时间：加热温度高、保温时间长，奥氏体晶粒粗大。
2. 加热速度：加热速度越快，过热度越大, 形核率越高，晶粒越细。
3. 钢的化学成分：Co（钴）和Ni等加快转变过程；Cr、Mo、V等减慢转变过程；Si、Mn、Al等基本不影响转变过程。

== 钢在冷却时的组织转变
=== 过冷奥氏体等温转变曲线和连续冷却转变曲线
$A_1$温度以下存在的尚未发生转变的奥氏体，称为过冷奥氏体。过冷奥氏体的转变方式有等温转变和连续冷却转变两种。
#figure(
  image("pic/4.2.1-1.png", width: 72%),
  caption: [过冷奥氏体的等温转变曲线和连续冷却转变曲线],
)

==== 共析钢过冷奥氏体的等温转变曲线（C曲线）
过冷奥氏体的等温转变图是表示奥氏体急速冷却到临界点$A_1$以下在各不同温度下的保温过程中转变量与转变时间的关系曲线。又称C 曲线、S 曲线或TTT曲线。

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  box()[
    #figure(image("pic/4.2.1-2.png", width: 100%), caption: [])
  ],
  box()[#figure(image("pic/4.2.1-3.png", width: 100%), caption: [])],
)

$A_1-M_s$ 间及转变开始线以左的区域(蓝色部分)为#text(blue)[过冷奥氏体区]。

转变终了线以右及$M_f$以下(绿色部分)为#text(green)[转变产物区]。

两线之间及$M_s$与$M_f$之间(黄色部分)为#text(rgb("ffc500"))[*转变区*]。
1. 转变开始线与纵坐标之间的距离为孕育期。
  1. 孕育期越小，过冷奥氏体越不稳定。
  2. 孕育期最小处称C曲线的“鼻尖”。碳钢鼻尖处的温度为$550℃$。
  3. 在鼻尖以上，温度较高，相变驱动力小。
  4. 在鼻尖以下，温度较低，扩散困难，从而使奥氏体稳定性增加。
2. C曲线明确表示过冷奥氏体在不同温度下的等温转变产物。(图53)

==== 珠光体转变
===== 珠光体的组织形态
过冷奥氏体在$A_1$到$550℃$间将转变为珠光体类型组织，它是铁素体与渗碳体片层相间的机械混合物，根据片层厚薄不同，又细分为珠光体(P)、索氏体(S)和屈氏体(T)。
#v(10em)
1. #text(blue)[珠光体(P)]：
形成温度为$A_1-650 ℃$，片层较厚，500倍光镜下可辨，用符号P表示。

2. #text(blue)[索氏体(S)]：
形成温度为$650-600 ℃$，片层较薄，800-1000倍光镜下可辨，用符号S表示。
3. #text(blue)[屈氏体(T)]：
形成温度为$600-550 ℃$，片层极薄，电镜下可辨，用符号T表示。

珠光体、索氏体、屈氏体三种组织无本质区别，只是形态上的粗细之分，因此其界限也是相对的。

===== 珠光体的力学性能
片间距越小，钢的强度、硬度越高，塑性和韧性略有改善。（细晶强化）
===== 珠光体转变过程
珠光体转变也是形核和长大的过程。
珠光体转变是扩散型转变。，即铁原子和碳原子均可动。
#v(0em)
==== 贝氏体转变
===== 贝氏体的组织形态
过冷奥氏体在$550- 230 ℃$ ($M_s$)间将转变为贝氏体类型组织，用符号B表示。

根据其组织形态不同，贝氏体又分为上贝氏体（$B_上$）和下贝氏体（$B_下$）。

1. #text(blue)[上贝氏体]
形成温度为$550-350 ℃$。在光镜下呈羽毛状。电镜下为不连续棒状的渗碳体分布于自奥氏体晶界向晶内平行生长的铁素体条之间。
2. #text(blue)[下贝氏体]
形成温度为$350 ℃-M_s$。在光镜下呈黑针状。在电镜下为细片状碳化物分布于铁素体针内。

===== 贝氏体的力学性能
上贝氏体强度与塑性都较低，无实用价值。

下贝氏体除了强度、硬度较高外，塑性、韧性也较好，即具有良好的综合力学性能，是生产上常用的强化组织之一。

#text(tips)[【atri】生产中需要避免的三种组织：上贝氏体，莱氏体，网状渗碳体（含碳量高于$1%$）]

===== 贝氏体的转变过程：
半扩散型转变，即碳原子可动、铁原子不动。

#v(10em)
==== 马氏体转变
当奥氏体过冷到$M_s$以下将转变为马氏体类型组织，用符号M表示。马氏体转变是强化钢的重要途径之一#text(red)[(淬火)]。

碳在$alpha-F e$中的过饱和固溶体用M表示。

马氏体转变时，奥氏体中的碳全部保留到马氏体中。

===== 马氏体的晶体结构

马氏体具有体心正方晶格（a = b ≠ c）。轴比$c/a$称马氏体的正方度。

$C%$ 越高，正方度越大，正方畸变越严重。

当$＜0.25%C$时，$c/a$ = 1，此时马氏体为体心立方晶格。

===== 马氏体的组织形态
1. $C%<0.2%$时，为板条马氏体。

在光镜下板条马氏体为一束束的细条组织。板条内的亚结构主要是高密度的位错，又称位错马氏体。

2. $C%>1.0%C$时，为针状马氏体。

立体形态为双凸透镜形的片状。显微组织为针状。在电镜下，亚结构主要是孪晶，又称孪晶马氏体。

===== 马氏体的性能
高硬度是马氏体性能的主要特点。其硬度主要取决于其含碳量。含碳量增加，其硬度增加。当含碳量大于$0.6%$时，其硬度趋于平缓。

合金元素对马氏体硬度的影响不大。

马氏体强化的主要原因是过饱和碳引起的固溶强化。此外，马氏体转变产生的组织细化也有强化作用。

马氏体的塑性和韧性主要取决于其亚结构的形式。针状马氏体脆性大，板条马氏体具有较好的塑性和韧性。

===== 马氏体转变的主要特点
马氏体转变也是形核和长大的过程。其主要特点是：
1. 无扩散性
铁和碳原子都不扩散，因而马氏体的含碳量与奥氏体的含碳量相同。
2. 在一个温度范围内进行的
马氏体转变开始的温度称上马氏体点，用$M_s$表示。马氏体转变终了温度称下马氏体点，用$M_f$表示。

只要温度达到$M_s$以下即发生马氏体转变，随温度下降，转变量增加，冷却中断，转变停止。
3. 转变不完全
即使冷却到$M_f$点，也不可能获得$100%$的马氏体，总有部分奥氏体未能转变而残留下来，称残余奥氏体，用$A'$或$gamma'$表示。


#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  box()[
    #figure(image("pic/4.2.1.5-2.png"), caption: [亚共析钢等温转变曲线])
  ],
  box()[
    #figure(image("pic/4.2.1.5-1.png"), caption: [过共析钢等温转变曲线])
  ],
)
==== 亚共析钢过冷奥氏体的等温转变
转变曲线多一条过冷奥氏体转变为铁素体的转变开始线。

亚共析钢随着碳含量的增加，C曲线位置往右移，同时$M_s、M_f$线住下移

==== 过共析钢过冷奥氏体的等温转变
过共析钢过冷奥氏体的C曲线的上部为过冷奥氏体中析出二次渗碳体开始线。
当加热温度为Ac1以上30～50 ℃时，过共析钢随着碳含量的增加，C曲线位置向左移, 同时$M_s、M_f$线往下移。

=== 过冷奥氏体连续冷却转变图
过冷奥氏体连续冷却转变图又称CCT（Continuous Cooling Transformation Diagram）曲线，是通过测定不同冷速下过冷奥氏体的转变量获得的。

==== 共析钢的CCT曲线
共析钢的CCT曲线没有贝氏体转变区，在珠光体转变区之下多了一条转变中止线。当连续冷却曲线碰到转变中止线时，珠光体转变中止，余下的奥氏体一直保持到$M_s$以下转变为马氏体。
#figure(image("pic/4.2.2-0.png", width: 50%))
#figure(image("pic/4.2.2-1.png", width: 100%))
==== 过共析钢CCT曲线
无贝氏体转变区，但比共析钢CCT曲线多一条$A→F e_3C$转变开始线。由于$F e_3C$的析出，奥氏体中含碳量下降, 因而$M_s$线右端升高。
==== 亚共析钢CCT 曲线
有贝氏体转变区，还多$A→F$开始线，F析出使A含碳量升高，因而$M_s$线右端下降。

== 钢的热处理工艺
热处理工艺是指通过在固态下的加热、保温及冷却，改变材料的组织，以获得所需性能的方法。根据钢在加热和冷却时组织与性能的变化规律，热处理工艺有退火、正火、淬火及回火等常规热处理工艺，还有表面淬火、表面化学热处理等表面热处理工艺。

机械零件的一般加工工艺为：毛坯（铸、锻）$→$预备热处理$→$机加工$→$最终热处理。

退火与正火主要用于预备热处理，只有当工件性能要求不高时才作为最终热处理。

=== 退火
将钢加热至适当温度保温，然后缓慢冷却（炉冷）的热处理工艺叫做退火。

==== 退火目的：
调整硬度，便于切削加工。适合加工的硬度为170-250 HB。

消除内应力，防止加工中变形。

均匀成分及组织，细化晶粒，为最终热处理作组织准备。

==== 退火工艺：
退火的种类很多，常用的有完全退火、等温退火、球化退火、扩散退火、去应力退火、再结晶退火。

===== 完全退火
将工件加热到$A c_3+30~50 ℃$保温后缓冷至$500 ℃$左右的退火工艺，主要用于亚共析钢 。（过共析钢不宜）。

【目的】得到珠光体。
===== 等温退火
亚共析钢加热到$A c_3+30~50 ℃$，共析、过共析钢加热到$A c_1+30~50 ℃$，保温后快冷到$A_1$以下的某一温度下停留，待珠光体转变完成后出炉空冷。

【目的】缩短工件在炉内停留时间，更适合于孕育期长的合金钢。

#example()[
  #text(tips)[
    (atri)为什么是$A c_1$线：
  ]

  由杠杆定律，设合金碳含量$c$，取SE线上溶解度$c_1$，计算可得在$A c_1$线以上奥氏体的含量$display((6.69-c)/(6.69-c_1))$已经占绝大多数。无必要加热到$A c_(c m)$线以上。$A c_1+30~50 ℃$既保证奥氏体转化完成，又保留了细小的渗碳体颗粒，它们在接下来的等温转变（退火）过程中，可以作为形核的核心，促进珠光体组织均匀细化，从而获得更细密、更均匀的退火组织，提高切削加工性能。如果加热到 $A c_(c m)$​ 以上，所有渗碳体溶解，晶粒反而会粗大。
  #v(0.2em)
]

#v(4em)
===== 球化退火

将工件加热到$A c_1+ 20~30 ℃$保温后缓冷至$600 ℃$以下出炉空冷，或者加热后冷却到略低于 $A r_1$ 的温度下保温，然后炉冷至$600 ℃$以下空冷，使珠光体中的渗碳体球化后出炉空冷。#text(red)[主要用于共析、过共析钢。]

球化退火的组织为铁素体基体上分布着颗粒状渗碳体的组织，称球状珠光体, 用$P_球$表示。对于有网状二次渗碳体的过共析钢，球化退火前应先进行正火，以消除网状。

【目的】将钢中渗碳体球状化。

===== 扩散退火（均匀化退火）
铸锭或铸件在凝固过程中不可避免的要产生枝晶偏析等化学成分不均匀现象，为达到#text(red)[化学成分的均匀化]，必须对其进行扩散退火。

【特点】加热温度高（一般在$A c_3$或$A c_(c m)$以上$150~300 ℃）$，保温时间长（10 h以上）。
===== 去应力退火
用来#text(red)[消除因变形加工及铸造、焊接过程中引起的残余内应力]，以提高工件的尺寸稳定性，防止变形和开裂。

【特点】工件随炉缓慢加热至$500~600 ℃$，经一段时间保温后随炉缓慢冷却至$300~200 ℃$以下出炉。

===== 再结晶退火
冷变形后的金属加热到再结晶温度以上，保持适当的时间，使变形晶粒重新转变为均匀的等轴晶粒。

【目的】消除加工硬化、提高塑性、改善切削加工及成形性能。

【特点】加热温度通常比理论再结晶温度高$100~200 ℃$，通常在去应力退火温度之上。
#figure(image("pic/4.3.1.png", width: 80%), caption: [退火温度示意图])

=== 正火
正火是将亚共析钢加热到$A c_3+30~ 50 ℃$，共析钢加热到$A c_1+30~50 ℃$，过共析钢加热到$A c_(c m)+30~ 50 ℃$保温后空冷的工艺。

正火与退火相比，操作简单，生产周期短，效率高，珠光体组织更细，强度和硬度更高。

#text(blue)[正火的目的]：

（1）对于低、中碳钢（$≤0.6C%$），目的与退火的相同。（均匀和细化晶粒、消除内应力、便于切削加工）

（2）对于过共析钢，用于消除网状二次渗碳体，为球化退火作组织准备。

（3）普通件最终热处理。

要改善切削性能，低碳钢用正火，中碳钢用退火或正火，高碳钢用球化退火。
#text(gray)[高碳意味着高渗碳体，当然需要球化退火]

=== 淬火
淬火是将钢加热到$A c_1$或$A c_3$以上$30~50℃$，保温后以大于$v_k$速度冷却，使奥氏体转变为马氏体的热处理工艺。

淬火是应用最广的热处理工艺之一。

淬火目的是为获得马氏体组织，提高钢的性能。
==== 淬火加热温度
===== 亚共析钢：
淬火温度为$A c_3+30~50 ℃$；马氏体均匀细小。

温度过高：粗大的马氏体组织。

温度过低：残留未完全溶解的铁素体，导致淬火硬度不足，“淬火软点”。

===== 共析钢
淬火温度为$A c_1+30~50 ℃$。

淬火组织为$M+A'$。

===== 过共析钢
淬火温度: $A c_1+30~50 ℃$。

温度过高，则奥氏体晶粒粗大、含碳量高，淬火后马氏体晶粒粗大、$A'$量增多。使钢硬度、耐磨性下降，脆性、变形开裂倾向增加。

淬火组织:  $M+F e_3C_(颗 粒)+A'$。

合金钢适当提高淬火温度。

==== 淬火冷却介质
淬火是比较难操作的一种热处理工艺。一方面：为得到马氏体组织需要快冷；另一方面：快冷会导致很大的内应力，使钢件容易发生变形及开裂。

理想淬火曲线：慢冷（减少热应力）-快冷-慢冷（减少组织应力）。


常用淬火介质是水和油。
===== 水
水的冷却能力强，但低温冷却能力太大，只使用于形状简单的碳钢件。
===== 油
油在低温区冷却能力较理想，但高温区冷却能力太小，使用于合金钢和小尺寸的碳钢件。

===== 熔盐
熔盐作为淬火介质称盐浴，冷却能力在水和油之间,用于形状复杂件的分级淬火和等温淬火。

==== 淬火方法
采用不同的淬火方法可弥补介质的不足。

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  box()[
    ===== 单液淬火法
    加热工件在一种介质中连续冷却到室温的淬火方法。

    操作简单，易实现自动化。

    ===== 双液淬火法
    工件先在一种冷却能力强的介质中冷却，躲过鼻尖后，再在另一种冷却能力较弱的介质中发生马氏体转变的方法。如水淬油冷，油淬空冷。

    优点是冷却过程理想，缺点是不易掌握。用于形状复杂的碳钢件及大型合金钢件。
  ],
  box()[
    #figure(image("pic/4.3.3.3.png", width: 100%), caption: [淬火方法示意图])
  ],
)
===== 分级淬火法
在$M_s$附近的盐浴或碱浴中淬火，待内外温度均匀后再取出缓冷。

可减少内应力，用于小尺寸工件。

===== 等温淬火法
将工件在稍高于$M_s$的盐浴或碱浴中保温足够长时间，从而获得下贝氏体组织的淬火方法。

经等温淬火零件具有良好的综合力学性能，淬火应力小。适用于形状复杂及要求较高的小型件。


==== 钢的淬透性
淬透性是钢的主要热处理性能，是选材和制订热处理工艺的重要依据之一。

#text(blue)[淬透性]是指钢在淬火时获得淬硬层深度的能力。其大小是用规定条件下淬硬层深度来表示。

#text(blue)[淬硬层深度]是指由工件表面（高马氏体）到半马氏体区（$50%$M +$50%$P）的深度。

#text(blue)[淬硬性]是指钢淬火后所能达到的最高硬度，即硬化能力。与马氏体的含碳量有关。
#figure(image("pic/4.3.3.4-1.png", width: 80%), caption: [钢的淬透性曲线 ])

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  box()[
    #figure(image("pic/4.3.3.4-2.png", width: 80%), caption: [全淬透])
  ],
  box()[
    #figure(image("pic/4.3.3.4-3.png", width: 80%), caption: [未淬透])
  ],
)

#text(blue)[影响淬透性的因素]

1. 淬透性与临界冷速有关，取决于过冷奥氏体的稳定性。过冷奥氏体越稳定，钢的淬透性就越好；反之，钢的淬透性就越差。

2. 含碳量：共析钢的淬透性好；
必须是淬火+回火，二者绑定，不能只淬火，也不能只回火
3. 合金元素：除Co（钴）、Al外，其他使淬透性提高；

4. 奥氏体化条件：奥氏体化温度越高，保温时间越长，过冷奥氏体越稳定，钢的淬透性越好。

=== 回火

回火是指将淬火钢加热到$A_1$以下的某温度保温，让马氏体发生分解，以获得不同组织及性能，然后以适当方式冷却到室温的工艺。#text(red)[必须是淬火+回火，二者绑定，不能只淬火，也不能只回火]。

==== 回火的原因
1. 钢件淬火后的组织为马氏体和残余奥氏体，这两种组织都是不稳定的，具有自发向其他稳定组织转变的趋势，这在工件服役中是不允许的。
2. 淬火钢存在很大内应力，容易导致工件的变形甚至开裂。

==== 回火的目的
1. 获取所需力学性能，提高淬火钢的塑性和韧性，降低其脆性，但不可避免地降低其强度和硬度
2. 降低或消除淬火所引起的残余应力，防止变形或开裂，稳定工具钢制品的尺寸
3. 未经淬火的钢回火无意义。钢经淬火后应立即进行回火。回火决定了钢在使用状态的组织和寿命。

==== 钢在回火时的组织转变

===== 马氏体的分解
$< 80 ℃$回火时，钢的组织无变化。

$80~350 ℃$加热时，马氏体将发生分解，从马氏体中析出$epsilon$-碳化物，使马氏体过饱和度降低，马氏体的正方度减少，晶格畸变减轻，淬火内应力减少。析出的$epsilon$-碳化物以细片状分布在马氏体基体上，这种组织称#text(blue)[回火马氏体]，用$M_回$表示。

===== 残余奥氏体转变
$200~300 ℃$时,  由于马氏体分解，奥氏体所受的压力下降，$M_s$上升，$A'$ 分解为$epsilon$-碳化物和饱和铁素体，即$M_回$或下贝氏体。

#v(4em)

===== 碳化物的转变
发生于$300~400 ℃$，此时，$epsilon$-碳化物溶解于铁素体中，并从铁素体中析出$F e_3C$。
$M_回$转变为在保持马氏体形态的铁素体基体上分布着细粒状Fe3C组织，称回火屈氏体，用$T_回$表示。

===== 碳化物的聚集长大和铁素体的再结晶（$400 ℃$以上）
$400 ℃$以上，$F e_3C$开始聚集长大。

$500 ℃$ 以上铁素体发生多边形化，由针片状变为多边形。这种在多边形铁素体基体上分布着颗粒状$F e_3C$的组织称回火索氏体，用$S_回$表示。

$600 ℃$以上，回火珠光体，$P_回$。

==== 回火脆性
1. 总规律：随着回火温度升高，强度、硬度下降，塑性、韧性升高。

2. 淬火钢的韧性并不总是随着温度升高而提高。在某些温度范围内回火时，会出现冲击韧性下降的现象，称#text(blue)[回火脆性]。


#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  box()[
    ==== 低温回火脆性（第一类回火脆性）
    又称不可逆回火脆性。是指淬火钢在$250~400 ℃$回火时出现的脆性。

    这种回火脆性是#text(red)[不可逆]的，只要在此温度范围内回火就会出现脆性，目前尚无有效消除办法。回火时应避开这一温度范围。

    ==== 高温回火脆性（第二类回火脆性）
    又称可逆回火脆性。是指淬火钢在$500~650 ℃$范围内回火后缓冷时出现的脆性。

    防止办法：
    - 回火后快冷。
    - 加入合金元素W（约$1%$）、 Mo（约$0.5%$）。该法更适用于大截面的零部件。
  ],
  box()[
    #figure(image("pic/4.3.4.5-1.png", width: 100%), caption: [回火脆性示意图])
  ],
)
#v(5em)

==== 总结 #text(tips)[(24-25秋简答题)]
#figure(
  table(
    columns: 4,
    inset: 0.5em,
    [], [低温回火], [中温回火], [高温回火],
    [回火温度], [$150-250 ℃$], [$350~500 ℃$], [$500~650 ℃$],
    [回火组织], [$M_回$], [$T_回$], [$S_回$],
    [回火目的],
    [保留高硬度、高耐磨性，降低内应力。],
    [提高$sigma_e$及$sigma_s$，同时使工件具有一定韧性 。
    ],
    [获得良好的综合力学性能，即高强度+塑性+韧性。
    ],

    [应用],
    [多用于要求具有高硬度的刃具、量具及各种工具的处理

      #text(red)[(结构钢、工具钢)]
    ],
    [适用弹性元件热处理

      #text(red)[(弹簧钢)]
    ],
    [广泛用于各种结构件如轴、齿轮等热处理。也可作为要求较高精密件、量具等预备热处理。

      #text(red)[(高碳钢)]
    ],
  ),
)
淬火加高温回火的热处理称作调质处理，简称调质。


=== 钢的表面热处理

==== 钢的表面淬火
表面淬火是指在不改变钢的化学成分及心部组织情况下，利用快速加热将表层奥氏体化后进行淬火以强化零件表面的热处理方法。
===== 表面淬火常用加热方法
1. 感应加热：
利用交变电流在工件表面感应巨大涡流，使工件表面迅速加热的方法。
#figure(
  table(
    columns: 3,
    inset: 1em,
    [类别], [频率], [淬硬层深度],
    [高频感应加热], [200-300 KHz], [0.2-2 mm],
    [中频感应加热], [2500-8000 Hz], [2-8 mm],
    [工频感应加热], [50 Hz], [10-15 mm],
  ),
)

2. 火焰加热：
利用乙炔火焰直接加热工件表面的方法。成本低，但质量不易控制。
3. z激光热处理：
利用高能量密度的激光对工件表面进行加热的方法。效率高，质量好。

==== 钢的化学热处理
化学热处理是将工件置于特定介质中加热保温，使介质中活性原子渗入工件表层从而改变工件表层化学成分和组织，进而改变其性能的热处理工艺。


#text(blue)[化学热处理的基本过程：]
1. 介质（渗剂）的分解：分解的同时释放出活性原子。
2. 工件表面的吸收：活性原子向固溶体溶解或与钢中某些元素形成化合物。
3. 原子向内部扩散。形成一定的厚度的扩散层，即渗层。
#text(blue)[化学热处理最常用的是渗碳、渗氮和氰化。]

===== 钢的渗碳
钢的渗碳是指向钢的表面渗入碳原子的过程。

1. 渗碳目的
提高工件表面硬度、耐磨性及疲劳强度，同时保持心部良好的韧性。

(渗碳应用低碳钢或低碳合金钢)

#text(tips)[(atri):齿轮]

#text(tips)[(莲莲)：还是那句话，碳越多越硬，所以渗碳能提高表面硬度]
#grid(
  columns: (1fr, 0.5fr),
  gutter: 1em,
  box()[
    2. 渗碳方法
      - 气体渗碳法

        将工件放入密封炉内，在高温渗碳气氛中渗碳。

        渗剂为气体（煤气、液化气等）或有机液体（煤油、甲醇等）。

        优点：质量好，效率高。
      - 固体渗碳法，反应产生出活性碳原子。
      - 离子渗碳法，辉光放电。
  ],
  box()[
    #figure(image("pic/4.3.5.2-1.png", width: 100%), caption: [气体渗碳法示意图])
  ],
)

3. 渗碳层成分、组织及厚度
工件经渗碳后，表面的碳的质量分数可达到$1~ 1.2%$，由表及里，含碳量逐渐降低，直至原始含碳量。

含碳量太低，则耐磨性且疲劳抗力小；含碳量过高，则渗层变脆容易剥落。

表层为过共析组织(P+$F e_3C_Ⅱ$);中间为共析组织(P)；心部为亚共析组织(F+P)。

4. 渗碳后的热处理
#text(red)[淬火+低温回火]，回火温度为$180~200 ℃$。

#v(1em)
- 淬火方法有：

  - 直接淬火法：渗碳后预冷到略高于$A r_3$温度直接淬火，然后低温回火。

  - 一次淬火法：即渗碳缓冷后重新加热淬火。

  - 二次淬火法：即渗碳缓冷后第一次加热为心部$A c_3+30-50 ℃$，细化心部；第二次加热为$A c_1+30-50 ℃$，细化表层。

- 常用方法:

  渗碳缓冷后，重新加热到$A c_1+30-50 ℃$淬火+低温回火。此时组织为：

  - 表层：$M_回$+颗粒状碳化物+$A'$（少量）
  - 心部：$M_回$+$F$（淬透时）

#example()[
  #text(tips)[【问】(莲莲）]#text(blue)[前面反复出现低碳钢、中碳钢、高碳钢的概念，那它们的含碳量到底是多少？]

  #text(tips)[【解】]按照课本所述：低碳钢小于$0.25$，中碳钢$0.25 ~ 0.6$，高碳钢大于$0.6$。
]
===== 钢的渗氮
氮化是指向钢的表面渗入氮原子的过程。

1. 氮化用钢：
为含Cr、Mo、Al、Ti、V的中碳钢。常用钢号为38CrMoAl，氮化温度为$500-570 ℃$。氮化层厚度不超过$0.6-0.7 m m$。

2. 常用氮化方法
气体氮化法与离子氮化法。

气体氮化法与气体渗碳法类似，渗剂为氨（$N H_3$）。
3. 氮化的特点及应用

氮化件表面硬度高（HV1000-2000），耐磨性高。

疲劳强度高，由于表面存在压应力。

工件变形小。原因是氮化温度低，氮化后不需进行热处理。

耐蚀性好。因为表层形成的氮化物化学稳定性高。

氮化的缺点：工艺复杂，成本高，氮化层薄。

用于耐磨性、精度要求高的零件及耐热、耐磨及耐蚀件。如仪表的小轴、轻载齿轮及重要的曲轴等。

===== 钢的碳氮共渗
同时向钢的表面渗入碳和氮原子的化学热处理工艺，俗称氰化。

高温（$900~950 ℃$）、中温($820 ~860 ℃$)，渗碳为主，需淬火及低温回火；

低温（$500~600 ℃$），渗氮为主（软氮化），无需淬火，气体碳氮共渗的应用较为广泛。

渗层组织：细片（针）回火马氏体加少量粒状碳氮化合物和残余奥氏体。
