#import "../PreviewTemplate/phylab.typ": phylab
#import "@preview/cetz:0.4.2" 
#show: phylab.with(
  name: "万用表的设计",
  instructor: "方则正",
  class: "机械2402",
  author: "叶畅飞", 
  author-id: "3240103132",
  date: datetime(year: 2025, month: 10, day: 21),
  week: "第5周",
  am-pm: "下午",
)

#set enum(numbering:"(1).")
// 此处填写正文，如：

= 预习报告（10分）
== 实验综述（5分）
// * （自述实验现象、实验原理和实验方法，包括必要的光路图、电路图、公式等。不超过500字。）

1. 实验现象

  通过改变简易万用表接入电路的方式得到电流表和电压表，通过调节不同的分流或附加电阻，能够实现多量程测量，且在不同量程档位下，表头指针能正确指示对应的电流或电压值。欧姆表档位下，短接表笔时指针满偏（调零），断开时指针指在零电流处（$infinity$电阻）；测量电阻时，指针的偏转角度与电阻大小一一对应，并可观察到欧姆刻度不均匀的现象。

2. 实验原理

  万用表的设计原理核心在于利用磁电式电流计（表头）的特性，通过配置不同的电阻网络，将其改装成多量程的电流表、电压表和欧姆表。磁电式电流计的两个关键参数:

  - 量程$I_g$：允许通过的最大电流。
  - 内阻$R_g$：表头的内部电阻。可用替代法或中值法获得
  #set enum(numbering:"I).")

  1. 改装多量程电流表

    电流表的扩程通过将电流计与分流电阻（$R_s$）并联实现。当电流计与分流电阻并联时，大部分电流通过分流电阻，只有小部分电流通过电流计，从而达到扩大总电流测量范围的目的。

    若改装后的电流表量程为$I$，则有：
    $
      R_s = (R_g I_g)/(I - I_g)
    $
    并联不同阻值的分流电阻，可实现多量程电流测量。如图1所示，电流计量程为$1m A$，改装后有$5m A$和$10m A$的量程。
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        line((0,0),(2.5,0))
        circle((3,0),radius: 0.5,name: "Rg",stroke: 2pt)
        content((name: "Rg", anchor: 90deg), [#text(12pt)[$R_g$]], anchor: "south", padding: 2pt)
        line((2.8, -0.2), (3.2, 0.2), mark: (end: ">", fill: black, stroke: 1pt))
        
        line((4, 0), (5, 0), mark: (end: ">", fill: black, stroke: 1pt),name: "Ig")
        content((name: "Ig"), [#text(12pt)[$I_g$]], anchor: "south-west", padding: 4pt)

        line((3.5,0),(6,0))
        line((0,0),(0,-3.9))
        line((0,-2),(1,-2))
        line((1,-1.85),(2,-1.85),(2,-2.15),(1,-2.15),close:true,stroke: 2pt, name: "R1")
        content((name: "R1"), [#text(12pt)[$R_1$]], anchor: "south", padding: 8pt)
        line((2,-2),(4,-2))
        line((4,-1.85),(5,-1.85),(5,-2.15),(4,-2.15),close:true,stroke: 2pt, name: "R2")
        content((name: "R2"), [#text(12pt)[$R_2$]], anchor: "south", padding: 8pt)
        line((5,-2),(6,-2))
        line((6,0),(6,-3.9))
        line((3,-3.9),(3,-2))
        circle((0,-4),radius:0.1)
        circle((6,-4),radius:0.1,name:"5mA")
        content((name: "5mA"), [#text(12pt)[$5m A$]], anchor: "north", padding: 8pt)
        content((name: "5mA"), [#text(12pt)[$I_2$]], anchor: "north", padding: (24pt,0,0,0))
        circle((3,-4),radius:0.1,name:"10mA")
        content((name: "10mA"), [#text(12pt)[$10m A$]], anchor: "north", padding: 8pt)
        content((name: "10mA"), [#text(12pt)[$I_1$]], anchor: "north", padding: (24pt,0,0,0))
        line((7.8,-1.85),(7.5,-1.7),(7.8,-1.55))
        line((7.8,-1.65),(8.1,-1.65))
        line((7.8,-1.75),(8.1,-1.75))
        line((8.1,-1.55),(8.4,-1.7),(8.1,-1.85))

        circle((9.4,-1.7),radius:0.5,stroke: 2pt,name:"A")
        circle((9.4,-1.7),radius:0.65,stroke: 2pt)
        content((name: "A"), [#text(14pt)[*A*]], padding: 2pt)
      })

      图1： 多量程电流表电路图
    ]
    #v(2em)
    根据改装后的电路图，可得：
    $
      (R_2 + R_g)I_g = R_1 (I_1-I_g) \
      (R_1 + R_2)(I_2-I_g) = R_g I_g \ 
    $
    计算出$R_1$、$R_2$后,即可设计出多量程电流表。然后,用图 2 所示电路较正,并分析误差。
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        
        line((0,0),(1,0))
        circle((1.5,0),radius: 0.5,name: "1",stroke: 2pt)
        content((name: "1"), [#text(12pt)[$A_标$]])
        line((2,0),(2.85,0))
        circle((3.5,0),radius: 0.5,name: "2",stroke: 2pt)
        circle((3.5,0),radius: 0.65,stroke: 2pt)
        content((name: "2"), [#text(12pt)[$A$]])
        line((4.15,0),(5,0))
        line((5,0.15),(6,0.15),(6,-0.15),(5,-0.15),close:true,stroke: 2pt, name: "R")
        content((name: "R"), [#text(12pt)[$R$]], anchor: "south", padding: (0,0,8pt,0))
        line((6,0),(7,0))
        line((7,0),(7,-3),(6,-3))
        line((6,-3),(5.5,-3.3),stroke: 2pt,name:"S")
        content((name: "S"), [#text(12pt)[$S$]], anchor: "south", padding: (0,0,8pt,0))
        line((5.5,-3),(3.6,-3))
        line((3.6,-2.8),(3.6,-3.2),stroke: 1pt)
        line((3.4,-2.6),(3.4,-3.4),name:"epsilon")
        content((name: "epsilon"), [#text(16pt)[$epsilon$]], anchor: "south-west", padding: (0,0,16pt,0))
        line((3.4,-3),(2,-3))
        rect((1,-2.85),(2,-3.15),stroke: 2pt,name:"R'")
        content((name: "R'"), [#text(12pt)[$R'$]], anchor: "south", padding: (0,0,8pt,0))
        line((1,-3),(0,-3),(0,0))
      })
      图2： 电流表校正电路图
    ]
    
  2. 改装多量程电压表

    电压表的扩程通过将电流计与分压电阻（$R_x$）串联实现。当电流计与附加电阻串联时，增加了电压表的总内阻，从而达到扩大总电压测量范围的目的。
    若改装后的电压表量程为$U$，则有：
    $
      R_p = (U/I_g^') - R_g^'
    $
    其中，$R_g^'$和$I_g^'$分别为电流计在电压表中的等效内阻和等效量程。

    串联不同阻值的分压电阻，可实现多量程电压测量。如图3所示，改装后有$5 V$和$10 V$的量程。
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        line((0,0),(2.5,0))
        circle((3,0),radius: 0.5,name: "Rg'",stroke: 2pt)
        //content((name: "Rg'"), [#text(12pt)[$R_g'$]], anchor: "south", padding: 2pt)

        line((2.8, -0.2), (3.2, 0.2), mark: (end: ">", fill: black, stroke: 1pt))
        
        line((4, 0), (5, 0), mark: (end: ">", fill: black, stroke: 1pt),name: "Ig'")
        //content((name: "Ig'"), [#text(12pt)[$I_g'$]], anchor: "south-west", padding: 4pt)

        line((3.5,0),(6,0))
        line((0,0),(0,-3.9))
        line((0,-2),(1,-2))
        line((1,-1.85),(2,-1.85),(2,-2.15),(1,-2.15),close:true,stroke: 2pt, name: "R1")
        content((name: "R1"), [#text(12pt)[$R_1$]], anchor: "south", padding: 8pt)
        line((2,-2),(4,-2))
        line((4,-1.85),(5,-1.85),(5,-2.15),(4,-2.15),close:true,stroke: 2pt, name: "R2")
        content((name: "R2"), [#text(12pt)[$R_2$]], anchor: "south", padding: 8pt)
        line((5,-2),(6,-2))
        line((6,0),(6,-2))
        line((3,-3.9),(3,-2))
        circle((0,-4),radius:0.1)
        circle((3,-4),radius:0.1)
        line((6,-2),(7,-2))
        line((7,-1.85),(8,-1.85),(8,-2.15),(7,-2.15),close:true,stroke: 2pt, name: "R3")
        content((name: "R3"), [#text(12pt)[$R_3$]], anchor: "south", padding: 8pt)
        line((8,-2),(9,-2))
        line((9,-1.85),(10,-1.85),(10,-2.15),(9,-2.15),close:true,stroke: 2pt, name: "R4")
        content((name: "R4"), [#text(12pt)[$R_4$]], anchor: "south", padding: 8pt)
        line((10,-2),(11,-2))
        line((8.5,-2),(8.5,-3.9))
        circle((8.5,-4),radius:0.1,name:"5V")
        content((name: "5V"), [#text(12pt)[$5 V$]], anchor: "north", padding: (8pt,0,0,0))
        content((name: "5V"), [#text(12pt)[$U_1$]], anchor: "north", padding: (24pt,0,0,0))
        line((11,-2),(11,-3.9))
        circle((11,-4),radius:0.1,name:"10V")
        content((name: "10V"), [#text(12pt)[$10 V$]], anchor: "north", padding: (8pt,0,0,0))
        content((name: "10V"), [#text(12pt)[$U_2$]], anchor: "north", padding: (24pt,0,0,0))

        line((11.8,-1.85),(11.5,-1.7),(11.8,-1.55))
        line((11.8,-1.65),(12.1,-1.65))
        line((11.8,-1.75),(12.1,-1.75))
        line((12.1,-1.55),(12.4,-1.7),(12.1,-1.85))

        circle((13.4,-1.7),radius:0.5,stroke: 2pt,name:"V")
        circle((13.4,-1.7),radius:0.65,stroke: 2pt)
        content((name: "V"), [#text(14pt)[*V*]], padding: 2pt)

        rect((-0.3,0.8),(6.3,-4.3),stroke:(dash:"dashed"),name:"box")
        content((name: "box",anchor: 270deg), [#text(12pt)[电流计]], anchor: "north", padding: (8pt,0pt,0,0))
        content((name: "box",anchor: 270deg), [#text(12pt)[$I_g^'$ $R_g^'$]], anchor: "north", padding: (24pt,0pt,0,0))
      })
      图3： 多量程电压表电路图
    ]

    #v(2em)
    根据改装后的电路图，可得：
    $
      U_1 &= I_g^' (R_3+R_g) \
      U_2 &= I_g^' (R_3+R_4+R_g)\

      R_g^' &= (R_g (R_1+R_2)) / (R_g + R_1 + R_2), #h(2em) I_G^' = 5 m A
    $
    计算出$R_1$、$R_2$、$R_3$、$R_4$后,即可设计出多量程电压表。然后,用图 4 所示电路较正,并分析误差。
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        
        line((0,0),(2.85,0))
        circle((3.5,0),radius: 0.5,name: "1",stroke: 2pt)
        circle((3.5,0),radius: 0.65,stroke: 2pt)
        content((name: "1"), [#text(12pt)[$V$]])
        line((4.15,0),(7,0))

        line((0,-2),(3,-2))
        circle((3.5,-2),radius: 0.5,name: "2",stroke: 2pt)
        // circle((3.5,-2),radius: 0.65,stroke: 2pt)
        content((name: "2"), [#text(12pt)[$V_标$]])
        line((4,-2),(7,-2))

        line((0,-4),(3,-4))
        rect((3,-3.85),(4,-4.15),stroke: 2pt, name: "R")
        content((name: "R"), [#text(12pt)[$R$]], anchor: "south", padding: (0,0,8pt,0))
        line((4,-4),(7,-4))
        line((3, -4.5), (4, -3.5), mark: (end: ">", fill: black, stroke: 1pt))


        line((6,0),(7,0))
        line((7,0),(7,-6),(6,-6))
        line((6,-6),(5.5,-6.3),stroke: 2pt,name:"S")
        content((name: "S"), [#text(12pt)[$S$]], anchor: "south", padding: (0,0,8pt,0))
        line((5.5,-6),(3.6,-6))
        line((3.6,-5.8),(3.6,-6.2),stroke: 1pt)
        line((3.4,-5.6),(3.4,-6.4),name:"epsilon")
        content((name: "epsilon"), [#text(16pt)[$epsilon$]], anchor: "south-west", padding: (0,0,16pt,0))
        line((3.4,-6),(2,-6))
        rect((1,-5.85),(2,-6.15),stroke: 2pt,name:"R'")
        content((name: "R'"), [#text(12pt)[$R'$]], anchor: "south", padding: (0,0,8pt,0))
        line((1,-6),(0,-6),(0,0))
      })
      图4： 电压表校正电路图
    ]

  3. 改装欧姆表
  
    欧姆表的改装是将电流计与电池和附加电阻串联组成一个闭合回路。通过调节附加电阻，使得在欧姆表两端短接时，电流计指针满偏（调零）。

    原理图如图5所示：
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        line((0,0),(2,0))
        circle((2.5,0),radius: 0.5,name: "Rg",stroke: 2pt)
        line((2.3, -0.2), (2.7, 0.2), mark: (end: ">", fill: black, stroke: 1pt))
        line((3, 0), (4, 0), mark: (end: ">", fill: black, stroke: 1pt),name: "Ig")
        line((3,0),(5,0))

        line((0,0),(0,-2.9))
        line((0,-2),(1,-2))
        line((1,-1.85),(2,-1.85),(2,-2.15),(1,-2.15),close:true,stroke: 2pt, name: "R1")
        content((name: "R1"), [#text(12pt)[$R_1$]], anchor: "south", padding: 8pt)
        line((2,-2),(3,-2))
        line((3,-1.85),(4,-1.85),(4,-2.15),(3,-2.15),close:true,stroke: 2pt, name: "R2")
        content((name: "R2"), [#text(12pt)[$R_2$]], anchor: "south", padding: 8pt)
        line((4,-2),(5,-2))
        line((5,0),(5,-2))
        circle((0,-3),radius:0.1,name: "a")
        content((name: "a"), [#text(12pt)[$a$]], anchor: "north", padding: (12pt,0,0,0))

        rect((-0.3,0.8),(5.3,-3.3),stroke:(dash:"dashed"),name:"box")
        content((name: "box",anchor: 90deg), [#text(12pt)[$I_g^'$ $R_g^'$]], anchor: "south", padding: (0pt,0pt,8pt,0))

        line((5,0),(5.5,0))
        rect((5.5,-0.15),(6.5,0.15),stroke: 2pt, name: "R5")
        content((name: "R5"), [#text(12pt)[$R_5$]], anchor: "south", padding: (0,0,8pt,0))
        line((6.5,0),(7,0))
        rect((7,-0.15),(8,0.15),stroke: 2pt, name: "R6")
        content((name: "R6"), [#text(12pt)[$R_6$]], anchor: "south", padding: (0,0,8pt,0))
        line((7, -0.5), (8, 0.5), mark: (end: ">", fill: black, stroke: 1pt))
        line((8,0),(8.65,0))
        line((8.65,0.2),(8.65,-0.2))
        line((8.85,0.4),(8.85,-0.4),name:"epsilon")
        content((name: "epsilon"), [#text(16pt)[$epsilon$]], anchor: "south-east", padding: (0,0,12pt,0))
        line((8.85,0),(9.5,0),(9.5,-2.9))
        circle((9.5,-3),radius:0.1,name:"b")
        content((name: "b"), [#text(12pt)[$b$]], anchor: "north", padding: (12pt,0,0,0))
        
        line((0,-4),(0,-4.5),(4.25,-4.5),stroke:(dash:"dashed"))
        rect((4.25,-4.35),(5.25,-4.65),stroke:2pt,name:"Rx")
        content((name: "Rx"), [#text(12pt)[$R_x$]], anchor: "south", padding: (0,0,8pt,0))
        line((5.25,-4.5),(9.5,-4.5),(9.5,-4),stroke:(dash:"dashed"))

      })
      图5： 欧姆表电路图
    ]

    #v(2em)

    首先，短接 a 和 b，调节$R_6$使得电流计指针满偏，此时有$display(I_0 = epsilon/(R_g^' + R^'))$ , 其中 $R^'$ 为电路回路中的其他电阻总和。然后，断开 a 和 b，接入$R_x$，此时有$display(I_x = epsilon/(R_g^' + R^' + R_x))$。

    当$R_x = R_g^' + R^'$时，有$display(I_x = I_0/2)$，此时$R_x$称为欧姆表的中值电阻，根据此法可以在电流计面板上标出欧姆刻度，刻度不均匀。

  3. 实验方法

    #set enum(numbering:"1.")
    0. 替代法测量电流计内阻$R_g$：
    先将电流计与标准电流表串接在测量回路中$R$，调节可变电阻使回路电流为合适值$I$；再用电阻箱替代电流计，调节电阻箱使回路电流仍为$I$，此时电阻箱的阻值即为电流计的内阻$R_g$。

    1. 多量程电流表的设计与校正
    2. 多量程电压表的设计与校正
    3. 欧姆表的设计与刻度曲线绘制


== 实验重点（3分）
// * （简述本实验的学习重点，不超过100字。）


1. 通过设计万用表，深入理解其工作逻辑，并加强设计电路的能力。

2. 加强学生对电路中欧姆定律的认知。


== 实验难点（2分）
// * （简述本实验的实现难点，不超过100字。）
1. 了解指针式万用表测量电流、电压以及电阻的基本原理。

2. 掌握多量程电流表、电压表和万用表的设计方法，并能设计出具体电路。

3. 记录数据并作出欧姆表刻度曲线曲线。
// * - 注意事项：
// * + 用PDF格式上传“预习报告”，文件名：学生姓名+学号+实验名称+周次。
// * + “预习报告”必须递交在“学在浙大”本课程内对应实验项目的“作业”模块内。
// * + “预习报告”还须拷贝到“实验报告”中（以便教师批改）。
// * + “大学物理实验”课程选做实验使用本“预习报告”；必做实验无须写预习报告，前往“学在浙大”完成预习测试即可。