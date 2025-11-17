#import "@preview/cetz:0.4.2"

#set text(12pt, font: ("Maple Mono NF", "LXGW WenKai"))
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
      align(left, "工程材料"), align(right, "猫娘小蛋糕烘培组"),
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
#set enum(numbering: "1.A.")

#let kong = {
  box(width: 5em, stroke: (bottom: 1pt), inset: (bottom: 20%, left: -10%, right: -10%))
}

#align(center)[
  #text(size: 20pt, weight: "regular")[浙江大学 2025-2026 学年秋学期]
  #v(-1em)
  #text(size: 14pt, weight: "regular")[《工程材料》期末回忆卷]

  #v(2em)
  课程号：ME2004F #h(10em) 开课学院： 机械工程学院

  // 考试试卷：√A卷、B卷（请在选定项上打√）

  考试形式：√闭、开卷(请在选定项上打√）) #h(2em)不允许带计算器入场

  考试日期：2025年  11 月 16日#h(5em) 考试时间：  120 分钟

  考生姓名：#kong
  #h(1em)学号： #kong
  #h(1em)所属院系：#kong
  #v(2em)
]

#figure(image("1.png", width: 60%), caption: "应力应变曲线")
#figure(image("2.png", width: 60%), caption: "铁碳相图")




= 填空题（30分，每空1分）
1. 根据应力应变曲线(图1)，最大弹性形变对应的应力为 #kong，抗拉强度为 #kong，屈强比为 #kong。

2. 滑移的本质是 #kong 运动；面心立方晶格和体心立方晶格塑性更好的是 #kong；晶粒度越大，晶界越少，塑性 #kong (越高、越低)；硬度强度 #kong (越大、越小)

3. 根据铁碳相图(图2)，发生共晶反应的温度是 #kong ，共晶反应得到 #kong 。发生共析反应的温度是 #kong ，共析反应得到#kong，其是#kong 和 #kong 的机械混合物。

4. 球墨铸铁中石墨的形状为球状，灰铸铁石墨中石墨的形状为 #kong，可锻铸铁中石墨的形状为 #kong 。

5. #kong 是有害元素，会造成热脆性

6. #kong 温度是划分冷热加工的界限，高于该温度是热加工，低于该温度是冷加工；Mo在850℃下进行塑性变形是 #kong 加工。(Mo的熔点为2622℃)

7. 三种回火中，要获得良好的综合力学性能应选择 #kong 回火。

8. 完全退火(A)，球化退火(B)，去应力退火(C)，扩散退火(D)，这四种退火工艺的温度由高到低排序为(填字母)： #kong > #kong > #kong > #kong 。

9. 黄铜H70，其含铜的质量分数为 #kong ；对其进行拉伸提高刚度、强度、硬度是 #kong,强化；汽车铝合金气缸通过金属型铸造提高其塑性是 #kong 强化

10. 三原则，使用性，#kong ，#kong 。

= 选择题 （30分，每题2分）
1. 随冷塑性变形量增加，金属的强度、硬度提高，塑性、韧性下降的现象称 #kong 。

A. 加工硬化 #h(2em) B. 弥散强化#h(2em)  C. #h(7em) D. 细晶强化

2. 大截面弹簧应采用的热处理方式 #kong 。
A. 淬火 + 低温回火  #h(7em)B. 淬火 + 中温回火

C. 淬火 + 高温回火 #h(7em)D. 调质

#v(2em)
3. 下列哪种不是表面热处理 #kong 。
A. 渗碳 #h(2em) B. 淬火 #h(2em) C. 渗氮 #h(2em) D. 氰化

4. 加入某种合金元素后C曲线右移，淬透性 #kong 。
A. 提高 #h(2em) B. 降低 #h(2em) C. 不变 #h(2em) D. 小试样提高，大试样降低

5. 以下哪个操作能细化晶粒 #kong 。
A. #h(6.5em) B. 扩散退火  #h(2em) C. 喷丸 #h(4em)D. 变质处理

6. 亚共析钢，共析钢，过共析钢，过冷奥氏体最稳定的是 #kong ：

A. 亚共析钢 #h(2em) B. 共析钢 #h(3em) C. 过共析钢 #h(2em) D.

7. 铸铁第一、二阶段石墨化都完全进行，得到组织为 #kong ：

A. F+G #h(4.3em) B. P+G #h(4.2em) C. P+F+G  #h(2.9em)D. Ld+P+G

8. 若某晶面和晶向的晶面指数与晶向指数相同，它们的关系是 #kong ：

A. 平行 #h(4em) B. 垂直 #h(4em)C. 重合  #h(4em)D. 无关系

9. 下面哪个不是过冷奥氏体的等温转变产物 #kong ：

A. 珠光体 #h(3em)B. 屈氏体  #h(3em) C. 贝氏体 #h(3em)D. 马氏体

10. 下列钢材中含碳量最高的是 #kong ：

A. 45\#  #h(4.1em)B. 20Cr #h(3.6em)C. W18Cr4V #h(1.9em) D. 1Cr13

11. $A_(c m)$线的含义
A. 碳在奥氏体中的最大溶解度 #h(2.3em) B.

C. 奥氏体开始转变温度 #h(5.3em)      D.

12. 退火的目的

A.调整硬度，便于切削加工 #h(4em)B. 消除内应力，防止加工中变形

C.均匀成分及组织，细化晶粒 #h(3em) D. 以上都是

13. 以下属于线缺陷的是

A. 位错 #h(4em)B. 间隙原子 #h(2em) C. 晶界 #h(4em)D. 亚晶界

14. 手锯条用什么钢

A.T12 #h(4.8em)  B. 65 #h(4.9em) C. #h(6.5em) D.

15. 一次渗碳体和二次渗碳体来自哪里
A. 钢液和奥氏体 #h(8.6em)  B. 钢液和莱氏体

C. #h(15.2em) D.


= 简答题：
1. 利用杠杆定律分析T7和45号钢的组织质量分数，并且根据计算结果分析哪个更硬。
#v(6em)
2. 根据铁碳相图分析过共析钢的冷却过程，分析其涉及温度线的含义，如AC线为液固相线，代表了A在液体中的溶解度。并分析其各个过程的组分。
#v(6em)
3. 三个温度回火的组织(2分)、性能(3分)、用途(3分)(回火的目的)，以及为什么这个温度回火能达到这个目的(2分)。

= 分析题：
汽车变速箱高速转动齿轮(高速高载受冲击)，要求表面硬度为$58~62 upright(H R C)$，心部硬度为$35~40 upright(H R C)$，其工艺路线为：下料->锻造->预备热处理①->机加工→最终热处理②③④->喷丸->磨削->成品。回答下列问题

1. (2分)请从Q235-A$dot$F，65，20CrNiMo，T12中选取合适的材料，并说明原因。

2. (3分)预备热处理①在此处一般采用正火而非完全退火，为什么？试分析正火和完全退火的组织差异。

3. (9分)最终热处理组①，②， ③分别是什么；分别分析作用。

4. (3分)简述喷丸的作用。

5. (3分)结合铁碳相图，C曲线， 热处理工艺，谈谈你对《工程材料》这门课程的理解和评价。

