#import "touying/lib.typ": *
#import "template.typ": *
#import "todo.typ": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm
#import "notes.typ"
#let s = themes.simple.register(s, aspect-ratio: "16-9", footer: [Harbin Engineering University])
#let s = (s.methods.enable-transparent-cover)(self: s)
#let (init, slide, slides, title-slide, centered-slide, focus-slide,touying-outline) = utils.methods(s)
#show: init
#let codeblock(raw, caption: none, outline: false) = {
  figure(
    if outline {
      rect(width: 100%)[
        #set align(left)
        #raw
      ]
    } else {
      set align(left)
      raw
    },
    caption: caption, kind: "code", supplement: ""
  )
}

#let themeColor = rgb(46, 49, 124)

#let head_main=info(
  color: black,
  (
    icon: "1024px-Buckminsterfullerene-3D-balls.png",
    content:"M 大作业研讨",
    content1:"研讨"

  )
)
// #align(left+top,image("icon/校标.png",width: 15em))
#slide[
#v(-1.3em)
// #h(1em)

#align(top+right,image("icon/校标.png",width: 10em))
#align(center+horizon, text(size: 35pt)[
  #head_main
])
#v(0.5em)

#align(center,[
#for c in data.成员 [
  #text(font: "FangSong",size: 0.75em)[#c
  #h(0.6em)
  ]
]
#v(-0.7em)
// #h(-6.8em)
#for c in data.成员1 [
    // #h(3.4em)
  #text(font: "FangSong",size: 0.75em)[#c
    #h(0.6em)
  ]
]
]
)
]

#set heading(numbering: "1.")
#set text(font:("Times New Roman","Source Han Serif"),size: 0.76em,spacing: 0.3em,weight: "extralight")
#show heading.where(level: 2):set text(themeColor, 0.9em,font: "Microsoft YaHei")
#show heading.where(level: 3):set text(themeColor, 0.8em,font: "Microsoft YaHei")
// #show strong:set text(font: "HYCuFangSongJ")
// #show footnote:set text(themeColor, 0.9em,font: "Microsoft YaHei")
  // 小标题样式
#show heading.where(level: 1):set text(themeColor, 1.5em,font:("Times New Roman","Microsoft YaHei"))
#set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
// #set footnote(numbering: "*")
  // 二级标题下加一条横线
#show heading.where(level: 2): it => stack(
    v(-1.1em),
align(top+right,image("icon/校标.png",width: 8em)),
    // v(-1.1em),
  //  str(type( locate(loc => query(heading.where(level: 1), loc)))),
    // str(type((1,2,3,4,5))),
//       align(center,
//       rect(fill: themeColor)[
//       #for c in ("背景及意义","项目概述") [
// #text(fill:white,font: "Microsoft YaHei")[#c]
//   ]
//       ]
//   )
      // ,
    // header_rect(),
align(center,[]),
  v(-1em),
    v(0.1em),
    it,
    v(0.6em),
    // line(length: 100%, stroke: 0.05em + themeColor),
    line(length: 100%,stroke: (paint: themeColor, thickness: 0.06em)),
    v(0.8em),
  )
// #set heading.where(level: 3)(numbering: "1.");
// #show heading.where(level: 3):set heading(numbering: "1.")
#show heading.where(level: 3): it => stack(

    v(-0.0em),
    it,
    v(0.6em),
    // line(length: 100%, stroke: 0.05em + themeColor),
    line(length: it.body.text.len()*0.25em+2.8em,stroke: (paint: themeColor, thickness: 0.06em, dash: "dashed")),
    v(0.1em),
    
  )
  // #centered-slide()

// = 111
#show heading: it =>  {
    it
    v(-0.8cm)
    par()[#text()[#h(0.0em)]]
}
  // #show centered-slide : it=>{
  //   it
  // }

  #centered-slide(section: [简介],[])
  // #set 
// #show footnote.entry: it => {
//   let loc = it.note.location()
//   numbering(
//     "1: ",
//     ..counter(footnote).at(loc),
//   )
//   it.note.body
// }

#slide[
// 用typst的语法介绍一下纳米材料的历史以及他在光电传感器中的应用的历史
  == #box(
  baseline: 0.135em,
  height: 1.0em,
  width: 1.0em,
  image(data.icon.文件夹+"/1024px-Buckminsterfullerene-3D-balls.png")
)纳米技术
#v(-2em)
=== 自然界中的纳米材料
纳米技术的历史可以追溯到古代。早期的纳米材料使用可以在公元前600年至300年的#notes.note[印度陶器][Keeladi陶器]中找到，其中包含碳纳米管，尽管人们不知道它们是如何形成的。此外，大约公元900年的大马士革钢中也观察到了渗碳体纳米线。

一千年以前，我国古代的人们收集
蜡烛燃烧后产生的炭黑作为原料，
制作墨或黑色染料。我国古代的铜镜表面长久不发生锈钝，经检验发现其表面有
层纳米氧化锡颗粒构成的薄膜.
#v(3.2em)

#notes.display() // Endnotes
#v(10em)
=== 纳米技术的现代发展
- 诺贝尔奖获得者 *理查德·费曼* (Richard Feynman) 在1959年的一次演讲上@feiman1959 提出了纳米技术的概念  ，他预见了在原子级别操纵物质的可能性。
- 1962年，日本科学家Kubo（久保）建立了与尺寸有关的Kubo理论
- *诺里奥·谷口* (Norio Taniguchi) 在1974年首次使用了“纳米技术”这个词。
- *K. Eric Drexler* 在1986年的著作《创造之引擎》中进一步推广了纳米技术的概念。
- 1981年扫描隧道显微镜的发明对纳米科技的发展起到了积极的促进作用。
  #v(6.3em)
]
#slide[

  == #box(
  baseline: 0.135em,
  height: 1.0em,
  width: 1.0em,
  image(data.icon.文件夹+"/1024px-Buckminsterfullerene-3D-balls.png")
)纳米材料与工业
    #v(-1.5cm)
=== 纳米材料的性质

#notes.note[纳米材料][【纳米材料的定义】欧盟委员会则将纳米材料定义为一种由基本颗粒组成的材料，这一颗粒在1纳米至100纳米之间，并且占所有颗粒总数中占50%以上]
由于独特的#notes.note[*小尺寸效应*][【小尺寸效应】
  小尺寸效应是指纳米材料的性质与宏观材料的性质存在差异的现象。这是由于当颗粒的尺寸与光波波长、德布罗意波长以及超导态的
相干长度等物理特征尺寸相当或更小时，晶体周期性的边
界条件将被破坏，非晶态纳米粒子的颗粒表面层附近的原
子密度减少，导致声、光、电、磁、热、力学等特性发生
显著变化，称为小尺寸效应]，#notes.note[*量子效应*][【量子效应】当粒子尺寸下降到某一值时，金属费米能级附近的电子能级由准连续变为离散能级的
现象；纳米半导体微粒存在不连续的最高被占据分子轨道和最低未被占据的分子轨道能
级，能隙变宽现象均称为量子尺寸效应。]，#notes.note[*介电限域效应*][【介电限域效应】介电限域效应是纳米微粒分散在异质介质中由于界面引起的体系介电增强的现象，
主要来源于微粒表面和内部局域场强的增强。例如，当介质的折射率对比微粒的折
射率相差很大时，就产生了折射率边界，这就导致微粒表面和内部的场强比入射场
强明显增加，这种局域场强的增强称为介电限域]以及#notes.note[*宏观量子隧道效应*][【宏观量子隧道效应】当微观粒子的总能量小于势垒高度时
，该粒子仍能穿越这一势垒。近年来，人们发现一些宏观量，例如微颗粒的磁化强度，
量子相干器件中的磁通量等亦有隧道效应，称为宏观的量子隧道效应]等使得材料
#notes.note[展现出独特的物理和化学性质][
- 【光学性质】 所有的金属在超微颗粒状态都呈现为黑色。尺寸越小，颜色愈黑，与常规大块材料相比，纳米微晶的吸收和发射光谱存在着蓝移现象，即移向短波方向。
- 【热学性质】 当材料的尺寸降低到一定程度后，材料的弹性和热力学参数将发生显著变化，原有的平衡相的关系被打破。
- 【磁学性质】小尺寸磁性与大块材料显著的不同。
- 【力学性质】 陶瓷材料在通常情况下呈脆性，然而由纳米超微颗粒压制成的纳米陶瓷材料却具有良好的韧性；美国学者报道氟化钙纳米材料在室温下可以大幅度弯曲而不断裂；金属/陶瓷等复合纳米材料可在更大的范围内改变材料的力学性质

]这些性质与宏观材料截然不同。
#notes.display() // Endnotes
]
#slide[
 === 在工业中的应用
 
 纳米尺度的效应导致了电子性质、磁性、机械强度、以及光学特性的显著变化。

在工业领域，这些独特的特性使得纳米材料在多个前沿科技领域中显示出其不可替代的重要性。尤其是在*光电子器件*领域，纳米材料的应用正在引领一场技术革命。@palit2020

*光电子器件*，如发光二极管（LED）、太阳能电池板、激光器和光电探测器等，都在从纳米材料的进步中受益。这些设备中使用的纳米结构材料，比如量子点、纳米线和纳米片，能有效改进设备的性能，通过控制光的吸收和发射，提高能量转换效率和灵敏度。
  
纳米技术的应用不仅限于改进现有产品的性能，也包括开发全新的功能化设备。例如，通过调整纳米材料的组成和结构，可以精确控制其对光的响应行为，从而在传感器和显示技术等领域开发出新的应用。

此外，纳米材料的小尺寸和高反应性使得它们在信息存储技术中也表现出极大的潜力，如通过使用纳米尺度的磁性材料来提高存储设备的数据密度。

在光电子领域，纳米材料的应用正促使设备更小型化、效率更高、成本更低，同时也推动了新一代光电系统的开发。这些技术的进步不仅对科技产业的发展至关重要，也对能源效率和可持续发展具有深远的影响。 
]

  // #v(1.3em)
// #notes.display() // Endnotes
  // 这种性质的改变，也使其在光电传感器的*设计和制造*方面具有十分广阔的应用前景 ( @1 @2 @palit2020 ) 。 

  // skowpekodwkepodke @2

  
  // #v(1em)
  // 小尺寸效应。量子效应。介电限域效应。宏观量子隧道效应。

  #centered-slide(section: [工业应用概览],[ #h(4em)纳米材料的工业应用已经扩展到多个领域，从医疗健康到环保，再到能源和催化。
  
  以下内容将详细展开纳米材料在这些领域中的应用情况，]
  
  )



#slide[
#set rect(
  width: auto
)

== 医疗领域

#grid(
  columns: (50%,auto),
  gutter: 1cm,
  [
    // #v(-1.0em)
#h(2em) 在医疗领域，纳米材料被用于改进药物输送系统、制造更高效的疗法和诊断工具。

例如，纳米粒子因其能够穿透生物膜而在目标药物输送中显示出独特的优势，可以直接将药物运送到病变部位，减少对健康组织的副作用并提高治疗效果。

此外，纳米材料也被用于构建生物相容性极好的植入物和支架，以及在再生医学中用于组织工程。


  ],
  [
      #figure(
    align(center,
    image("img/1.png",height: 54%)
    )
    , caption: [使用 400 nm（A、C）和 800 nm（B、D）孔径模板制造的 CHI/LAC（A、B）和 BSA/CAR（C、D）纳米管。]
  )
  ]
  
    
  // image("tiger.jpg", height: 100%),
  // image("tiger.jpg", height: 100%),
)

]


#slide[
#set rect(
  width: auto
)

==  环保领域
#v(-1.5em)

在环保领域，纳米技术已经成为*水*和*空气*等污染质净化技术的关键。

#v(-0em)

=== 对于水
#notes.note[水污染][水污染物包括无机污染物（即砷、镉、铬、氟化物、铅和汞）、有机污染物（即丙烯酰胺、苯酚、六氯化苯和四氯化碳）以及不同的有机染料（即刚果红、甲基红）。蓝色和甲基橙）。]导致疾病和死亡，是一个重大的全球性问题。
虽然重金属离子、氟化物等无机污染物在适当浓度下是人体必需的营养物质，但当超过适当浓度时，就会对环境和人体健康造成威胁。

世界卫生组织（WHO）和许多国家已经制定了饮用水中这些无机污染物的最大可接受浓度，如下图所示。
#v(2em)

#notes.display()

     #figure(
    align(center,
    image("img/2.png",height: 44%)
    )
    , caption: [不同国家饮用水中特定无机污染物的允许限量（mg/L）。]
  )

#h(2em) 一些有毒金属离子，如 Hg(II)、Pb(II)、Cr(VI)、Cd(II)、As(III)/(V) 和氟化物 ($F^-$) 是不可生物降解的，会在环境中积聚,具有毒性、致癌性和致突变性。在废水排放到天然水流之前去除这些无机污染物至关重要。


纳米过滤器能有效去除水中的有害物质，包括重金属（As、Cd、Hg、Cr、Pb和F等）和有机污染物。例如，纳米级零价铁（nZVI）因其高效的还原特性而被广泛用于地下水中的有害化学物质的去除。

// #v(4em)

]
#slide[
#set rect(
  width: auto
)

== 能源领域

#grid(
  columns: (50%,auto),
  gutter: 1cm,
  [
    // #v(-1.0em)
#h(2em) 
在能源产业，纳米材料正被用于开发更高效的能源转换和存储系统。

在太阳能电池中，纳米结构如纳米线和量子点被应用于太阳能电池中，通过最大化光捕获和光电转换效率来提升整体的能量收集能力，增加光的吸收和转换效率，从而提高整体的能源产出。

纳米材料同样关键于下一代电池技术，例如锂离子电池中的纳米结构电极可以大大增加电池的储能容量和循环寿命。
  ],
  [
#h(2em) 同时采用导电聚合物或碳纳米管制造超级电容器电极，实现了高能量密度和快速充放电的性能。
  ]
)

]


#slide[
#set rect(
  width: auto
)

== 催化领域

#grid(
  columns: (50%,auto),
  gutter: 1cm,
  [
    // #v(-1.0em)
#h(2em) 
在催化领域，纳米催化剂由于其*表面积大*和*活性高*的特点，显著提高了化学反应的效率和选择性。

这不仅在工业生产过程中节省了大量的能源和原材料，也在减少环境污染方面发挥了重要作用。纳米催化技术已经被应用于从简单的有机合成到复杂的环境净化过程。



  ],
  [
    #figure(
          align(center,
    image("img/4.png",height: 54%)
    )
    , caption: [一些HER电催化剂的性能总结]
  )
  ]
  
    
  // image("tiger.jpg", height: 100%),
  // image("tiger.jpg", height: 100%),
)

]

 #centered-slide(section: [纳米材料在光电子器件中的具体应用],[


 纳米材料在提高光电器件效率方面表现出巨大潜力。
 
 以下是纳米材料在光电子器件中的具体应用，包括改进性能的方法和一些具体的应用实例。]
  
  )

#slide[
#set rect(
  width: auto
)

== 改进光电子器件性能的方法

#grid(
  columns: (50%,auto),
  gutter: 1cm,
  [
    #v(-2.0em)
    === 量子点

#notes.note[量子点][量子点(QuantumDots，QD)是极其微小的,由有限数目的原子组成，三个维度尺寸均在纳米数量级，一般为球形或类球形，稳定直径在1~10 nm；获得2023年诺贝尔化学奖]是一种半导体纳米晶体，具有独特的光电特性，如宽带隙调节能力，使其能够发出多种颜色的光，是一项真正改变世界的技术。

受到光的刺激时，量子点便会发出纯净的有色光线，颜色由量子点大小形状决定。#notes.note[][电子获得能量跃迁到导带是不稳定的，还会回到价态，束缚态，以光子形式释放光子形式能量，不同的能带间隙不同的光]


  ],
  [
#h(2em) 球形量子点多用核壳结构（如下图）。

    #figure(
          align(center,
    image("img/5.png",height: 34%)
    )
    , caption: [球形量子点结构图]
  )
  ]
  
    
  // image("tiger.jpg", height: 100%),
  // image("tiger.jpg", height: 100%),
)
#v(-0.0em)
#notes.display()
// #todo([再加两张图])
]

#slide[
  ==== QLED实际应用
  // #v(2em)
  比如量子点LED（QLED）显示技术通过在显示屏中使用不同尺寸的量子点来调节发光颜色，从而实现更广的色域和更高的能效
@deng2022solution。
  三星电子推出的QLED电视就是利用量子点技术的一个商业成功案例。这种电视使用量子点增强色彩显示，能够覆盖100%的色域，提供比传统LED更明亮、更生动的色彩表现，有效地提高了视觉体验。
]

#slide[
#figure(
  align(center,
  image("img/6.png",width: 100%)
  )
  , caption: [三星85英寸级 Neo QLED 8K电视 QN900D]
)


]

#slide[
  ==== 量子点太阳能电池应用
  // #v(2em)
  量子点在太阳能电池中的应用是一个激动人心的研究领域，因为它们的独特光学和电子性质为提高光电转换效率提供了新的可能性。@kamat2013quantum

  量子点因其量子尺寸效应具备可调谐的带隙特性。这意味着可以通过改变量子点的尺寸来调整它们吸收和发射光的波长。在太阳能电池中，这一特性可以被用来优化*太阳光谱的利用效率*，从而提高整体的能量转换效率。

]

#slide[
  === 其他纳米结构改善太阳能电池
  // #v(2em)
  纳米材料，如纳米线和纳米棒，可以在太阳能电池中用来增加光的捕获和光电转换效率。
  
  这些纳米结构能有效地降低光反射，并通过多次内部反射增加光在材料中的路径长度，从而增加光吸收。此外，纳米结构还可以帮助更有效地收集产生的电荷，减少能量损失。

  研究人员开发了含碲化镉纳米线的太阳能电池，这种新型太阳能电池表现出超过传统平面电池的光电转换效率。纳米线的独特排列和结构不仅增加了光的吸收，还减少了载流子在电池中的复合，从而提高了电池的总体性能。
]

#slide[
  === 其他纳米结构改善太阳能电池
  // #v(2em)
 纳米材料也被用于提高光纤通信系统的性能。
 
 例如，使用纳米粒子如纳米金和纳米银来制造光纤通信中的非线性光学元件，这些元件可以增强信号的传输效率和处理速度。

 在光纤激光器中引入掺杂纳米颗粒，如掺杂铒的纳米颗粒，可以显著提高激光的输出功率和效率。这些纳米颗粒通过增强光的局部场强度来提高激光的增益效率。
]


 #centered-slide(section: [未来趋势和挑战]
  )

  #slide[
  === 新材料的研发
  // #v(2em)
纳米科技的未来发展将极大依赖于新材料的研发。

科研人员正在探索具有更高效能、更强耐用性和更低成本的新型纳米材料。

例如，开发具有超高导电性或超强光电效应的纳米材料将推动电子和光电子设备的性能到新的高度。

此外，生物兼容性和环境友好性纳米材料的研发也是未来的重点，这将确保纳米科技在医疗和环保领域的可持续发展。
]


  #slide[
  === 现有材料的改进
  // #v(2em)
现有纳米材料的改进也是未来纳米科技发展的一个关键方向。

这包括通过纳米工程技术提高材料的稳定性、效率和生产可控性。

例如，通过表面修饰或掺杂来改善纳米材料的光学和电学性质，使其更适合特定的应用，如高效太阳能电池和更敏感的生物传感器。
]


  #slide[
  === 市场和制造过程中的挑战
  ==== 成本效益
  // #v(2em)
尽管纳米材料提供了许多独特的优势，但高昂的制造成本仍是其广泛商业化的一大障碍。未来的研究需要寻找更经济的制造方法，以降低生产成本。

==== 规模化生产
规模化生产是纳米材料面临的另一个挑战。目前许多纳米材料的合成方法难以扩展到工业级别，这限制了它们的广泛应用。

==== 环境和健康风险
纳米材料可能对环境和人体健康带来潜在风险。因此，开发新材料或改进现有材料时，必须对其生态毒性和生物兼容性进行彻底评估
]

  #centered-slide(section: [结论和讨论])
  #slide[
  === 纳米材料的应用成果
  // #v(2em)
纳米材料已在多个工业领域展示出显著的成果，特别是在光电子领域。例如，使用量子点和纳米结构增强的太阳能电池和LED显示技术已经显示出超越传统材料的性能。纳米材料的独特性质使其在医疗诊断、治疗和环境净化等领域具有巨大的应用潜力。

=== 未来研究方向的建议
==== 跨学科研究
这包括通过纳米工程技术提高材料的稳定性、效率和生产可控性。

例如，通过表面修饰或掺杂来改善纳米材料的光学和电学性质，使其更适合特定的应用，如高效太阳能电池和更敏感的生物传感器。

==== 可持续性研究
研发可降解或可循环再用的纳米材料，以保证技术的环境可持续性

==== 安全性和标准化
建立全面的纳米材料安全性评估标准和监管政策，确保纳米技术的健康发展。
]

// 
// // #header_rect(data.成员)
//   // section: [Let's start a new section!]
// // #align(top,rect([111111111]))



// // #grid(
// //       columns: (2em, 1fr),
// //       gutter: (0em),
// //     [1],[2]
// //     )

// #set rect(
//   inset: 8pt,
//   fill: rgb("e4e5ea"),
//   width: 100%,
// )

// #grid(
//   columns: (70%, 30%),
//   // rows: (auto, 60pt),
//   gutter: 1cm,
  
//   [
//     // #par()[]
//     #par()[
//       #h(2em)现代化经济发展导致环境问题严峻，特别是
// *水资源问题*。 水资源对人类生存和发展至关重要，但海洋水质惨遭受污染和退化，影响海洋生态和人类利益。因此，及时获取海洋水环境信息非常重要和紧迫@HHAI202304008。]

// 目前海洋水质检测方法存在着测量速度慢、操作复杂、数据统计困难、成本高昂等问题（多基于ARM架构）@基于物联网的水质监测系统设计与实现，无法满足效率和实时性要求。因此，我们设计了一款基于STM32F103C8T6的海洋水质监测系统，能够实时采集并同步显示 pH 值、温度、浊度、TDS等参数信息，并通过NB-IOT模块实时存储至服务器。

//     ]
//   ,
//   [
//     #figure(
//       align(center,
//       image("img/1.png", height: 70%)
//     )
//     , caption: [污染后的海洋]
//     )
//   ]
//   // image("tiger.jpg", height: 100%),
//   // image("tiger.jpg", height: 100%),
// )

// ]


// #slide[
//   == 研究意义

// #set rect(
//   width: auto
// )
// #grid(
//   columns: (50%,auto),
//   rows: (4cm, auto),
//   gutter: 1cm,
  
//   [
//     #align(center+horizon,([#yiyi *保护海洋生态环境：* 

//     及时发现并解决海洋污染问题])
// )
//     ]
//   ,
//     [
//     #align(center+horizon,([#yiyi *维护生态平衡：* 
    
//     及时调整和管理海洋资源利用
// ])
// )
//     ],
//         [
//     #align(center+horizon,([#yiyi *支撑海洋产业发展：*
    
//      为海洋产业提供数据支持
// ])
// )
//     ],
//             [
//     #align(center+horizon,([#yiyi *政策制定依据*
    
//     为政府制定环保政策、规范提供可靠依据
  
// ])
// )
//     ],
    
//   // image("tiger.jpg", height: 100%),
//   // image("tiger.jpg", height: 100%),
// )
// ]

//   #centered-slide(section: [项目介绍])

//   #slide[
//   == 概览

// // 本项目基于STM32F103C8T6，搭载各种传感器，按键，0.96OLED屏幕，搭载锂电池模块，NC-05蓝牙模块，NB-IOT物联网模块。
//     #figure(
//       align(center,
//       image("img/框架图.drawio.svg",width: 80%)
//     )
//     , caption: [整体系统框架图( )]
//     )

// ]

//   #slide[
//   == 硬件部分
//     #v(-1.0em)
// #set rect(
//   width: auto
// )
// #grid(
//   columns: (50%,50%),
//   gutter: 1cm,
//   [
//     === 最小系统板
    
//   首先我们需要一块STM32C8T6*最小系统板*。调试阶段我们使用*成品*的最小系统板（如右图所示），最终我们将使用自己绘制的最小系统板。其包括SWD调试接口、基本供电、IO引出、外置高速晶振、BOOT和复位电路/按键。
  
//   // 下面给出一些成品模块的照片以及部分绘制的。
//   ],[
//   #figure(
//       align(center,
//       image("img/2.png",width: 35%)
//     )
//     , caption: [成品最小系统板（￥11.2）]
//     )])]


//   #slide[
//   // == 硬件部分
//     #v(0em)
// #set rect(
//   width: auto
// )
// #grid(
//   columns: (50%,50%),
//   gutter: 1cm,
//   [
//     === 调试电路
//     ARM支持两种调试端口：*SWD*(Serial Wire Debug) 和 *JTAG*(Joint Test Action Group，即联合测试行动小组)。
    
//     为了节省空间以及使用开源的硬件驱动，我们使用SWD调试。
// SWD的物理层由两条线组成：

// - SWDIO: 双向数据线
// - SWCLK: 时钟线

// #h(2em) 在测试阶段先使用成品CMSIS-DAPLINK/JLINK/STLINK。
//   下面给出一些成品模块的照片以及部分绘制的原理图。
//   ],[
//   #figure(
//       align(center,
//       grid(
//       columns: (45%,40%),
//       rows: (40%,30%),
//       image("img/3.png",width: 55%),
//       image("img/4.png",width: 95%),
//       image("img/5.png",width: 45%)
//       )
//     )
//     , caption: [STlink（左上）,Jlink（右上）,CMSIS-DAPlink（左下）]
//     )])]
//   #slide[
//   // == 软件
//   #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       50%,auto),
//       // rows: (40%,30%),
// [
//  #figure(
//   align(center,
//   image("img/6.png",width: 80%)
//   )
//   , caption: [引出的SWD接口原理图]
// )
// #h(2em) 上图中做了一些常见的保护和外接电路，根据一些开发板的原理图和官方手册@STM32F103x8B @ROBOMASTERC。
// ]
// ,[
// #h(2em) 之后会板载一个DAPlink，使用沁恒公司的CH552G，不需要很复杂的外围电路（5V供电）。TYPE-C口也可作为电源输入同时提供一路串口(虚拟串口)。

//  #figure(
//   align(center,
//   image("img/7.png",width: 120%)
//   )
//   , caption: [CH552G接线原理图]
// )
// #h(2em) 略去TYPE-C部分原理图。
// ]
// // 上图

//       // image("img/4.png",width: 95%),
//       // image("img/5.png",width: 45%)
//       )
// ]

//   #slide[
//   === OLED

// #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       50%,5%,40%),
//       // rows: (40%,30%),
// [
//   #h(2em) 使用0.96OLED，使用I2C驱动连接即可，我们将其连接到芯片的I2C1接口（参考官方手册）。

//   #figure(
//     align(center,
//     image("img/8.png",width: 100%)
//     )
//     , caption: [OLED接线原理图]
//   )
//   驱动部分参考 @STM32F103xx。
  
// ],[]
// ,[
//   #v(-2.2em)
// === 按键
// // 通过用户按键设置。补充
// 添加三个用户自定义的按键，设置上拉模式（pull-up）。原理图如下，可以完成一系列预置的操作

//   #figure(
//     align(center,
//     image("img/9.png",width: 100%)
//     )
//     , caption: [按键原理图]
//   )

// ])
// ]
// #slide[
//   #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       50%,5%,40%),
//       [ === 温度传感器模块
//   使用防水式DS18B20温度传感器@DS18B20，而不是TO-92封装。
//     #figure(
//     align(center,
//     image("img/10.png",width: 70%)
//     )
//     , caption: [DS18B20（防水式封装）]
//   )
//   #h(2em)精度为±0.5°C,并且无需外部组件即可工作。
//   ],[],[
// #figure(
//     align(center,
//     image("img/11.png",width: 60%)
//     )
//     , caption: [接线原理图]
//   )
// GND接地。VDD供电(3.3V至5.5V,我们给5V供电)。DQ 是1-Wire数据总线。
//   ]
//       // rows: (40%,30%),
//  )
 
 
// ]

// #slide[
//   #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       40%,15%,45%),
//       [ 
//   //   #figure(
//   //   align(center,
//   //   image("img/12.png",width: 80%)
//   //   )
//   //   , caption: [DS18B20内部结构]
//   // )
// #h(2em) 采用16位补码储温度（摄氏度）。整体操作流程如下：

// #h(-2em)①初始化：
// // #algorithm({
//   // import algorithmic: *
//  ```c
//  DQ=1;Delay(10);             //初始化
//  DQ=0;Delay(80);             //复位脉冲
//  q=DQ;Delay(20);
//  DS18B20_DQ = 1;               //释放总线
// ```

// ②写时序：
//  ```c
//   for(i=0; i<8; i++) 
//   { DQ=0;
//     DQ=dat&0x01;Delay(5);
//     DQ=1;
//     dat >>= 1;  
//   }
// ```

// // })
//   ],[],[
// 其中一些常用的是，

// / 温度转换:  0x44；
//  / 读取温度: 0xBE;
// // 读取高速暂存器存储的数据。
// ③读时序
//  ```c
//   uchar i,value;
//   for(i=0; i<8; i++) 
//   { DQ=0;
//     value >>= 1;  
//     DQ=1;
//     if(DQ) value|=0x80;  
//     Delay(5);
//   }
// ```
// #h(2em)最后通过计算公式计算出温度值.
//   ]
//       // rows: (40%,30%),
//  )
 
 
// ]
// #slide[

//   // #slide[
//   #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       50%,50%),
//       [
//   === 浊度传感器模块
//   使用浊度传感器TWS-30。利用光学原理，通过溶液中的透光率和 散射率来综合判断浊度情况。

//   内部是一个*红外线对管*，光接收端把透过的光强度转换为对应的电流大小。使用STM32的*ADC*采集电流大小，通过一定的算法转换为浊度值。

// 模块具体接线如figture12所示。
//       ],
//       [
//         #figure(
//     align(center,
//     image("img/13.png",width: 60%)
//     )
//     , caption: [
// TWS-30模块图]
//   )
//           #figure(
//     align(center,
//     image("img/14.png",width: 90%)
//     )
//     , caption: [
// 模块接线图]
//   )
//       ]
//       )


// ]
// #slide[
//    #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       50%,50%),
//       [
//   === 电导率传感器模块
//   使用TDS传感模块测量电导率。三个PIN接口分别为VCC(+)、GND(-)、A。VCC供电，GND接地，A接模拟输入（ADC）。

// TDS 测量主要通过给测试电极输入交变的驱动电压（防止探头极化），在被测液体中产生微小电流，从而得到被测液体的电导率。模块采用电极法测定水溶液的电导率，当两电极插入溶液中，可以测出两电极间的电阻，经过转接板转换，最终输出模拟电压值，根据电压值与TDS的线性关系式，最终得到TDS值。


//       ],
//       [
// #figure(
//     align(center,
//     image("img/15.png",width: 40%)
//     )
//     , caption: [
// TDS模块实物]
//   )
//   #figure(
//     align(center,
//     image("img/16.png",width: 50%)
//     )
//     , caption: [
// TDS模块实物]
//   )

//       ])
// ]
// #slide[
//   === PH
//   使用E201-C传感器模块。包括一个 BNC 电极 pH 传感器探头和一个前置放大模块。还是模拟输出，通过STM32 的 ADC（模数转换器）引脚来读取传感器的模拟输出
//   #figure(
//     align(center,
//     image("img/19.png",width: 40%)
//     )
//     , caption: [实物图]
//   )
  
  
// ]

// #slide[

//    #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       50%,50%),
//       [
//   === 蓝牙模块
//   使用HC-05蓝牙模块，通过UART1（AT指令控制）。
//   #figure(
//     align(center,
//     image("img/21.png",width: 100%)
//     )
//     , caption: [连接示意图]
//   )

//       ],[
//   #figure(
//     align(center,
//     image("img/22.png",width: 100%)
//     )
//     , caption: [实物图]
//   )

//       ]
//       )
// ]

// #slide[
//   // 
//    #set rect(
//   width: auto
// )
//  #grid(
//       columns: (
//       46%,8%,46%),
//       [
//         === NB-IIOT模块
//         NB-IoT（Narrow Band Internet of Things）是一种基于蜂窝的窄带物联网技术，也是低功耗广域物联 (LPWA)的最佳联接技术。

//         这种模块不同于ESP 8266、ESP12S模块（局域网）,是可以使用SIM卡接入运营的网络的。

//         NB-IoT在2020年全球连接数已超过1亿，预计未来五年将实现10亿级连接，持续推动物联网设备的爆发性增长。其具有以下优点

//       ],[]
//       ,[        #figure(
//     align(center,
//     image("img/23.png",width: 90%)
//     )
//   )
//   #h(2em)其也是使用UART(AT指令)进行通讯，这里使用单片机的UART2。同时我们这里选用安信可的EC-01F模块。如下。

//         #figure(
//     align(center,
//     image("img/24.png",width: 70%)
//     ),
//     caption: [实物图]
//         )
//   ]

//       )
//   // 简单介绍一下8266那种局域网模块和这种物联网模块的区别。
//   // 使用安信可的EC-01F模块，搭配SIM卡使用。使用UART2，配置以及原理图如下。
//   // #rec

// ]
// #slide[
//   === 系统供电
//   系统使用3.7V锂电池供电，使用TP5400模块进行充电和升压，同时使用一个NMOS和二极管选择TYPE-C口输入的5V电源和锂电池升压后的电源（有USB供电优先使用USB供电），然后使用AMS1117-3.3稳压芯片将选择后的5V电压稳压到3.3V，为系统提供3.3V电压，供电拓扑图如下。
//   #figure(
//     align(center,
//     image("img/电源拓扑图.drawio.svg",width: 90%)
//     ),
//     caption: [供电拓扑图]

//   )
// ]
//   #centered-slide(section: [APP])
// #slide[
//   == 框架选择
//   // === 系统供电
//   综合考虑了一些APP的框架和结构，最后选择一种相对简单，易于上手，页面优美的APP框架——
//   #box(image("img/25.png",height: 1em))
//   。
  
//   Meteor是一个开源的*全栈*框架，它可以使用JavaScript来构建和部署响应式的网页，移动和桌面应用程序。之所以说他是全栈是因为打包的时候会直接构建出可以直接服务器部署的代码。

// 其具有以下优点
//   + Meteor可以与所有流行的前端框架集成，如 React, Vue
//   + Meteor可以使用任何具有Node.js驱动的数据库，但是MongoDB是Meteor开发者最常用的选择，因为它存储JSON对象，并使用JavaScript作为查询语言
//   + 可以使用一系列的`npm`包来开发你的软件。
//   + 经过十多年的发展，深受行业巨头的信赖。

//   // 这是一个2015年出生的相对年轻的框架。

//   // 简单介绍一下gradle。
// ]

// #slide[
//   == Some Packages
//   下面介绍一下我们可能用到的几个包
//   + `chakra-ui`：一个简单丰富的React组件库，用于构建一些基本的组件。
//   + `cordova:cordava-plugin-bluetooth-serial`：一个蓝牙插件，用于连接蓝牙设备。
//   + `react-native-ble-plx`：一个蓝牙插件，用于连接蓝牙设备。



//   // 现在真正测试，还没有真正开发代码。
// ]
// #slide[
//   == Develop with AI

//   不久前，谷歌的Gemini API免费开放。如果可能我们希望在我们的应用中集成它，使我们的用户更便捷地分析数据。我们打算在应用中使用它集成一个聊天机器人，完成一些便携的任务，比如

//   + 分析一下这一周的水质变化，并说明一下可能是什么原因导致的
//   + 分析一下这里的水质，给出一份水质监测报告
// ]
// #centered-slide(section: [人员分工以及进度安排])
// #import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx


// #slide(
//   [
//   == 分工
//     // 主要分工：一个机械方面，三个负责STM32硬件和软件方面，一个负责APP开发。具体分工如下：
//     #align(center,[

//       #tablex(
//   columns: 2,
//   align: center + horizon,
//   auto-vlines: true,
//   // font: 

//   // indicate the first two rows are the header
//   // (in case we need to eventually
//   // enable repeating the header across pages)
//   header-rows: 1,

//   // color the last column's cells
//   // based on the written number


//   /* --- header --- */
//   [姓名], [分工],
//   // [2021251124古翱翔], [NB IOT物联网模块设计及验证，最小系统板原理图绘制、选型及验证，PCB布线、打样，各模块的焊接],
//   ..data.分工以及成员
// )
//     ])
//   ])

//   #slide(
//   [
//   == 进度安排
//   #let data1=()
//   #for i in data.进度安排{
//     data=data+data
//     data1.push([#i.节点 ])
//     data1.push([#i.验收])

//   }
//     // 主要分工：一个机械方面，三个负责STM32硬件和软件方面，一个负责APP开发。具体分工如下：
//     #align(center,[

//       #tablex(
//   columns: 2,
//   align: center + horizon,
//   auto-vlines: false,
//   // font: 

//   // indicate the first two rows are the header
//   // (in case we need to eventually
//   // enable repeating the header across pages)
//   header-rows: 1,

//   // color the last column's cells
//   // based on the written number


//   /* --- header --- */
//   [时间节点], [任务],
//   // [2021251124古翱翔], [NB IOT物联网模块设计及验证，最小系统板原理图绘制、选型及验证，PCB布线、打样，各模块的焊接],
//   ..data1
// )
//     ])
//   ])
// #centered-slide(section: [其他的引用参考文献])
// #slide[
// @刘硕2021基于单片机的智能水质检测系统设计
// @林华2020基于
// @邓洁2023基于
// @徐思维2020基于物联网的多参数水质监测系统设计
// @基于物联网的水质监测系统设计与实现
// @杜魁2012浅谈水质监测的意义
// @王天钊2023基于
// @综述2
// @9824243
// @1234567
// @guomarine
// @12341234

// ]

#slide[
#bibliography("cankao.bib")
]


// // #slide[
// // #todo_outline

// // ]
