#import "@preview/cetz:0.4.2"

#set text(12pt, font: ("Maple Mono NF", "LXGW WenKai Mono Screen"))
#set par(justify: true, leading: 1em, first-line-indent: (amount: 2em, all: true))
#set par(spacing: 1.24em)

#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,
    right: 3cm,
  ),
  header: {
    set text(10pt, baseline: 8pt, spacing: 3pt)
    grid(
      columns: (auto, 1fr),
      align(left, "设计与制造I"), align(right, "试鸢"),
    )

    line(length: 100%, stroke: 0.7pt)
  },
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
// 设置前缀
#show figure.where(kind: image): set figure(supplement: [图])

#show figure.where(kind: table): set figure(supplement: [表])
#show figure.where(kind: table): set figure.caption(position: top)

// 使用正确的编号与图表标题字体及分隔符
#show figure.caption: set text()
#set figure.caption(separator: "　")

// show figure.caption: it => [
//   #it.supplement
//   #context counter(heading).display((..args) => {
//     let nums = args.pos()
//     if nums.len() == 0 { return none } else { return numbering("1.1", ..nums) }
//   })-#context it.counter.display(it.numbering)
//   #it.body
// ]
#set math.equation(supplement: [公式])
#set heading(numbering: "一、")
#set enum(numbering: "1.")

#let kong(width: 5em, it) = {
  box(width: width, stroke: (bottom: 1pt), inset: (bottom: 20%, left: -10%, right: -10%))[#align(center)[#it]]
}

// 设置背景水印

#let _set_watermark(body) = {
  set page(
    background: [
      #rotate(24deg, text(50pt, fill: rgb(128, 128, 128, 40))[
        *My CC98 My Home* $"         "$
      ])
      #v(5cm)
      #rotate(24deg, text(50pt, fill: rgb(128, 128, 128, 40))[
        $"         "$ *My CC98 My Home*
      ])
      #v(5cm)
      #rotate(24deg, text(50pt, fill: rgb(128, 128, 128, 40))[
        *My CC98 My Home* $"         "$
      ])],
  )

  body
}
#show: _set_watermark

#align(center)[
  #text(size: 20pt, weight: "regular")[浙江大学 2025-2026 学年秋学期]
  #v(-1em)
  #text(size: 14pt, weight: "regular")[《设计与制造I》期末回忆卷]
]
#v(2em)
#grid(
  columns: (1fr, 1fr),
  align(left)[课程号： #kong(width: 12em)[ME2003M]], align(left)[开课学院： #kong(width: 12em)[机械工程学院]],
)
// 考试试卷：√A卷、B卷（请在选定项上打√）
#grid(
  columns: 1fr,
  align(left)[考试形式：闭、√开卷(请在选定项上打√）)],
)
#grid(
  columns: (1fr, 1fr),
  align(left)[考试日期：#kong(width: 3em)[2026]年 #kong(width: 1.5em)[1] 月 #kong(width: 1.5em)[7] 日],
  align(left)[考试时间：  #kong(width: 4em)[120] 分钟],
)
#grid(
  columns: (1fr, 1fr, 1fr),
  align(left)[考生姓名：#kong[]], align(left)[学　　号： #kong[]], align(left)[所属院系：#kong[] ],
)
#v(2em)

= 选择题 2 $times$ 10
1. 铸造合金在凝固过程中，液、固相混杂的双相区域的宽窄，即凝固区域的宽度，对合金的流动性有较大影响，下列不会影响到凝固区域宽度的因素是 ( )
  #grid(
    columns: (1fr, 1fr),
    align(left)[A. 合金的固态收缩量], align(left)[B. 合金的凝固温度范围],
  )
  #grid(
    columns: (1fr, 1fr),
    align(left)[C. 合金导热率], align(left)[D. 铸型的激冷能力],
  )
2. 如下图，具有大平面铸件的4种分型面的浇注位置中（ ）最合理
#image("assets/e4578605ac357968494d8dc1ddb0b67a.jpeg")
3. 将板料或坯料弯曲时，弯曲形变量取决于（ ）
  #grid(
    columns: (1fr, 1fr),
    align(left)[A. 板料厚度t], align(left)[B. 弯曲半径r],
  )
  #grid(
    columns: (1fr, 1fr),
    align(left)[C. r/t], align(left)[D. 弯曲材料的弹性模量],
  )
4. 金属材料拉深时采用压边圈的作用是（ ）
  #grid(
    columns: (1fr, 1fr),
    align(left)[A. 避免工件被拉裂], align(left)[B. 避免工件起皱],
  )
  #grid(
    columns: (1fr, 1fr),
    align(left)[C. 减少拉伸系数], align(left)[D. 提高拉伸模寿命],
  )
5. 在电弧焊工艺中，（ ）不能用来进行电弧保护
  #grid(
    columns: (1fr, 1fr),
    align(left)[A. 氩气$" Ar"$], align(left)[B. 活性气体$" CO"_2$],
  )
  #grid(
    columns: (1fr, 1fr),
    align(left)[C. 氢气$" H"_2$], align(left)[D. 焊条的溶剂材料涂层(药皮)],
  )
#v(5em)
6. 布置焊缝时应尽量使焊缝对称，其目的是（ ）
  #grid(
    columns: (1fr, 1fr),
    align(left)[A. 使焊接件结构简单], align(left)[B. 便于焊接],
  )
  #grid(
    columns: (1fr, 1fr),
    align(left)[C. 减少焊接变形], align(left)[D. 提高焊接生产率],
  )
7. 影响切削层厚度的主要因素是（ ）
  #grid(
    columns: (1fr, 1fr),
    align(left)[A. 进给量和主偏角], align(left)[B. 切削深度和进给量],
  )
  #grid(
    columns: (1fr, 1fr),
    align(left)[C. 切削速度和进给量], align(left)[D. 进给量和刃倾角],
  )
8. 切削刀在从工件外表面向工件回转中心逐渐切断时，其工作后角（ ）
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    align(left)[A. 逐渐增大], align(left)[B. 逐渐减小], align(left)[C. 基本不变], align(left)[D. 变化不定],
  )
9. 下图所示是何种铣削方式（ ）
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    align(left)[A. 立铣], align(left)[B. 端铣], align(left)[C. 顺铣], align(left)[D. 逆铣],
  )
10. 在电火花加工中，工件一般接电源的（ ）
  #grid(
    columns: (1fr, 1fr),
    align(left)[A. 正极，称为正极性接法], align(left)[B. 负极，称为负极性接法],
  )
  #grid(
    columns: (1fr, 1fr),
    align(left)[C. 正极，称为负极性接法], align(left)[D. 负极，称为正极性接法],
  )
= 问答题（30）
1. 铸造工艺中的冒口有何作用？冒口设计的基本原则是什么？在砂型铸造的铸型设计中，冒口的(V/S)与铸件自身的(V/S)相比，应该是：a)相等，b)较大，c)较小 #align(right)[(4分)]
#v(8em)
2. 某公司为生产医药包装产品的专业厂家，塑胶瓶盖是其主要产品之一，工人发现一台压机床身(材料为灰铁HT300)的两侧压力不均匀，并出现大量不合格产品，维修部人员经过仔细检查，发现床身侧壁有一条细小竖裂纹，请根据以上情况，分析切实可行的修复方法和具体的焊接修复工艺。 #align(right)[(10分)]
#v(8em)
3. 砂轮的特性由哪些因素决定？什么是砂轮的硬度，如何正确选择砂轮的硬度？ #align(right)[(8分)]
#v(5em)
4. 电火花加工的极性效应是什么？如何利用极性效应提高电火花加工效率和降低工具损耗？ #align(right)[(8分)]
#v(5em)

= 综合题
1. 铸造图所示的绳轮铸件在大批量生产时的铸造工艺图，需考虑哪些因素（汪sir提醒说要画图）#align(right)[(12分)]
#image("assets/6ee5636b45c081a600deb7d8b80cd804.jpeg", width: 100%)
#v(15em)
2. 如图所示的压弯模具将厚度为2mm的铝合金弯曲为图示零件，其内表面曲率半径为5mm，试分析
  1. 弯曲过程弯曲件受力情况并计算弯曲件表面的最大工程应变量是多少
  2. 弯曲过程中发生了弯曲回弹，什么是弯曲回弹，并请解释其发生原因是什么
  3. 如果板料中性层曲率的弯曲回弹量为1/100mm，其计算方式为$K_0= 1/rho_0-1/rho_0^{'}$，试设计凸模的半径
  注：弯曲变形较少，可认为材料不变薄，且中性层位于板料厚度的中央位置
  #align(right)[(13分)]
  #v(10em)
3. 某机床厂开发了一款由直线电机驱动的精密车床，试切工件的相关情况如下：
  1) 工件：模具钢Cr12（塑性较好），硬度HRC300，长200mm，外径50mm
  2) 硬质合金刀具，主偏角60°，负偏角10°，前角20°，后角7°，刃倾角+5°，0.4mm刀尖
  3) 加工工艺参数：主轴转速1500r/min，刀具进给速度135mm/min，切削深度0.1mm，切屑输送方式为带传输，试切现场如图1，图2为粘附在机床内的切屑
  试分析：
  1. 主偏角，负偏角，前角，后角，刃倾角分别在哪个参考平面上并作图表示#align(right)[(8分)]
  2. 试计算切削速度与进给量，并计算单位时间的金属切除率#align(right)[(6分)]
  3. 带状切屑形成机理#align(right)[(3分)]
  4. 带状切屑对自动化加工的负面影响是什么，并提出相关改进措施#align(right)[(8分)]
  #align(right)[(共25分)]

