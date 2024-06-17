#import "template.typ": *

#let data=yaml("./data.yaml")
#import "@preview/tablex:0.0.8": tablex, rowspanx, 




#show: doc => conf(

    

  linespacing: 1em,

  outlinedepth: 3,

  blind: false,

  listofimage: true,

  listoftable: true,

  listofcode: true,

  alwaysstartodd: true,

  doc

)
#import "@preview/colorful-boxes:1.3.1": *
// = 实验7
// == 原理
// #figure(
//   align(center,
//   [#image("img/1.png",width: 35%),
//   #image("img/2.png",width: 35%)]

//   )
//   , caption: [干涉仪]
// )
// 光程的改变可以通过观测干涉条纹来进行分析，光路结构如图1所示，由一个光纤Michelson干涉仪构成。该干涉仪中，作为参考臂和测量的两臂通过使用一个3dB的耦合器对光进行了分路和合路，干涉仪的光程差(OPD)通过一个扫描镜来改变。当二个光束之间光程差小于光源相干长度的时候，就会产生一个白光干涉图。当两光束的光程绝对相等时，光程精确匹配，干涉图出现中央条纹，该中央条纹位于干涉图中心，振幅极大。



// == 结果分析和讨论
// === 实验结论
// === 结果讨论 
// === 误差分析
// === 本实验的应用
// === 收获和体会
// === 思考题
// 思考题：
// 干涉的基本条件是什么？什么是相干长度？什么是相干时间？二者之间什么关系？

// 频率，振动方向相同，相位差恒定；相干长度是两列波在传播过程中相位关系不变，能发生干涉地最大距离；

// 基于光纤Michelson干涉仪设计一种传感器（温度、压力、折射率）。

// = 图片
// = 图片




// #import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx
// #v(0.5em)


// #h(-3em)*插入损耗*
// #v(0.5em)

// #align(center,[

//     #tablex(

//   columns: 4,

//   align: center + horizon,

//   auto-vlines: false,

//   header-rows: 4,

//   /* --- header --- */
//   [*种类*], [*输入$(m w)$*],

  
//   [*输出$(m w)$*],  [*插入损耗*],
//   [单模光纤-单模光纤], [4.234 (5.26dBm)],
//   [3.313(3.124dBm)], {str({calc.ceil(-10*(calc.log(3.313/4.234)/calc.log(10))*100)}/100)+"dB"},
//   [单模光纤-多模光纤], [4.098(6.024dBm)],
//   [4.007(6.12dBm)], {str({calc.ceil(-10*(calc.log(4.007/4.098)/calc.log(10))*100)}/100)+"0dB"},
//   [多模光纤-多模光纤], [11.12(10.24dBm)],[1.198(0.87dBm)],{str({calc.ceil(-10*(calc.log(1.198/11.12)/calc.log(10))*100)}/100)+"0dB"},



  


// )
// ])
// 其中插入损耗计算为
// $ I_("THP") -10 lg P_("out")/P_("in") $

// #let use_1=(功率,损耗)=>{
//   $功率"mw"(损耗 "dBm")$
// }

// #let 比值形式=(比值1,比值2)=>{
//   let ans=float(比值1)/float(比值2)
//   ans=calc.round(ans,digits: 3)
//   $比值1 ":" 比值2 = ans$
// }
// #v(0.5em)
// #h(-3em)*分光比*

// #align(center,[

//     #tablex(

//   columns: 4,

//   align: center + horizon,

//   auto-vlines: false,

//   header-rows: 4,

//   /* --- header --- */
//   [*输入端*], [*输出端*],

  
//   [*功率*],  [*分光比*],
//   rowspanx(2)[白],[红],[#use_1(1.6,2.1)],rowspanx(2)[#比值形式(1.6,1.67)],[蓝],[#use_1(1.67,2.27)]

//   ,
//   rowspanx(2)[黑],[红],[#use_1(1.618,2.31)],rowspanx(2)[#比值形式(1.618,1.609)],[蓝],[#use_1(1.609,2.29)]
//   ,
//   rowspanx(2)[红],
//   [白],[#use_1(1.706,2.39)],
//   rowspanx(2)[#比值形式(1.706,1.698)],
//   [黑],[#use_1(1.698,2.3)],

//     rowspanx(2)[蓝],
//   [白],[#use_1(1.746,2.59)],
//   rowspanx(2)[#比值形式(1.746,1.728)],
//   [黑],[#use_1(1.728,2.34)]
  
  



// )
// ])

// 分光比计算公式为
// $ alpha=P_3/P_4 $

// 光衰减器
// 加衰减器后
// $ 2.587mu w (-24.67"dBm")- 500u w (-3.09"dBm") $
// 衰减范围
// $ 24.67"dBm"-3.09"dBm" $


// *菲涅尔反射*

// #let 菲涅尔反射 = (输入功率,a1,输出功率,a2)=>{
//   let ans=2*(输入功率*calc.pow(10,(a1)))/(输出功率*calc.pow(10,(a2)))
//   ans=calc.ceil(ans*10000)/100
//   $ 2*P_("IN")/P_("OUT")= (2 times 输入功率 times 10^(a1))/ (输出功率 times 10^(a2))= ans "%" $
// }

// 输入端光功率$17.89mu w$,输除端光功率$1.089m w$

// #菲涅尔反射(17.89,-6,1.066,-3)
// #import "img/ctez/散点图.typ":*

// #散点图2

= 思考题
== 光纤的操作与处理

#h(-2em) 1. *学习回波损耗的概念，设计一个能测试回波损耗的光路（2021251124古翱翔）*

*回波损耗定义*：
当入射光传输至光器件时，入射光总有部分光被光器件反射回来。其中后向反射光功率与入射光功率的比值称为该器件的反射率R。光回波损耗和反射率定义为

$ R=P_(#text(font: "Source Han Serif")[后向])/P_(#text(font: "Source Han Serif")[入射光功率]) #h(3em) R_L("dB")=lg(1/R) $

*设计题*：

光回波损耗的测试方法主要有相干域反射法（OCDR），光时域反射法（OTDR）和光连续波反射法（OCWR）三种。

这里采用最简单的*光连续波反射法*
由图可得
$ P_I=P_s times k_1 , P_("RD")=P_(I) R_("DUT"), P_("DD")=P_("RD")k_2+P_s S $
#h(2em) 待测件的光回波损耗RL(dB)为
$ R_L("dB")=10lg(1/R_("DUT"))=10lg(P_I/P_("RD")) $
#figure(
  align(center,
  image("img/3.png",width: 80%)
  )
  , caption: []
)

== 光纤的焊接与损耗
#h(-2em)*1. 光纤接续的方法有哪些种，比较并说明如何选择*（2021251124古翱翔）

熔接法和粘接法。优点是损耗小，可靠，受外界影响小，缺点是需要昂贵的熔接设备。适用于需要长期固定连接，如光缆等。
活动连接 优点是灵活，简单，缺点是会有较大的损耗。适用于经常需要插拔的场合。

#h(-2em)*2. 简述光纤焊接工具结构及其光纤焊接过程*（2021251124古翱翔）

#import "img/ctez/散点图.typ":*
// #散点图1

#散点图2

#散点图3

#散点图4
