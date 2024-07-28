#import "@preview/touying:0.4.0": *
#import "university.typ"
#import "@preview/pinit:0.1.4": *

// #import "@preview/grayness:0.1.0":*
#let data=yaml("./example.yml")
// 设置16比9的幻灯片
#let s = university.register(aspect-ratio: "16-9")
#let s = (s.methods.info)(
  self: s,
  title: [#data.标题页.主标题 ],
  subtitle: [#data.标题页.副标题],
  author: [#data.标题页.姓名],
  date: datetime.today(),
  institution: [#data.标题页.学校],
)
#let (init, slides, touying-outline, alert) = utils.methods(s)
#show: init
#let themeColor=rgb("#19448e")
#let (slide, title-slide, focus-slide, matrix-slide) = utils.slides(s)
#show: slides
#slide(header:"目录 CONTENTS")[
  == Table of contents
  // #set text(size: 1.2em)
+ 基本信息
+ 获得荣誉
+ 竞赛获奖
+ 科研/项目经历
+ 其他影响
  // #set text(size: 1em)

  // #touying-outline()
]
// #heading(level: 1,[课题研究])
= 1 基本介绍

#slide(header:"1.1 基本信息",now_light:"0")[
  // == 1111222222
// 11
#place(left,dy:0.7em,dx:2em,[
  #image(data.第一页.照片链接,width: 6.5em)
])
// 左边放你的大头照
#place(left,dx:11em,dy:0.7em,[

#text(size: 32pt, fill: rgb("#19448e"), weight: "bold",[古翱翔])
#text(size: 17pt, fill: rgb("#19448e"), font:"FangSong",weight: "bold",[#data.第一页.描述])
  #v(-0.6em)
  // #university.basic_info("本科院校",)
  #let size_=0.8em;
#text(size: size_, fill: rgb("#19448e"), ([#data.标题页.学校 / #data.标题页.专业]))
  #v(-0.4em)

  // #line(  color: rgb("#19448e"))
  #line(length: 60%, stroke: 1pt + themeColor)
  // #university.basic_info("本科专业",)
      #let edu=data.第一页.成绩;
      #let grade=str(edu.成绩)+" ("+str(edu.排名)+"/"+str(edu.总人数)+" , "+str({calc.round(edu.排名/edu.总人数*100,digits: 2)})+ "%"+")"
      // #let edu-items = ""
      // #let 综合排名= " "+" 综合成绩预计"+str(edu.综合排名)+"/"+ str(edu.总人数)+" ("+str({calc.round(edu.综合排名/edu.总人数*100,digits: 2)})+ "%)"
      // edu-items = edu-items + "- *学业成绩*: " + str(edu.成绩)+" , "+str(edu.排名)+"/"+ str(edu.总人数)+" ("+str({calc.round(edu.排名/edu.总人数*100,digits: 2)})+ "%)"
  #v(-0.5em)
  #university.basic_info("出生年月",[2003年10月2日])

  #university.basic_info("专业成绩",strong([#grade]))
  #university.basic_info("英语成绩",edu.英语成绩)
    #university.basic_info("任职经历",data.第一页.任职经历)
#text(size: size_, fill: rgb("#19448e"), weight: "bold",font:("Times New Roman","Source Han Serif"), "已确定拿到推免资格")
  // #university.basic_info("","")

  // #university.big_small("95","数字图像处理",25pt,15pt)
  // #university.big_small("88.9","均分",25pt,15pt)
  // #university.big_small("88.9","均分",25pt,15pt)
  // 在某个地方放置分列
  // #place(left,dy:35pt,dx:1pt,[
  ])
#place(left,dx:1em,dy:11.7em,[
  #line(length: 90%, stroke: 1pt + themeColor)
  #v(-0.7em)
#set rect(
  inset: 8pt,
  fill: rgb("e4e5ea"),
  width: 100%,
)
#let  rect_size=4.5em
#grid(
  columns: (rect_size,rect_size,rect_size,rect_size,rect_size,rect_size),
  rows: (auto),
  gutter: 3pt,
  rect[#university.big_small("6.4%","RANK",25pt,15pt)
  ],

  rect[#university.big_small("135","已修学分",25pt,15pt)],

  rect[#university.big_small("99","线性代数",25pt,15pt)],
    rect[#university.big_small("98","概率论",25pt,15pt)],
  rect[#university.big_small("95","光电系统设计",25pt,15pt)],

      rect[#university.big_small("95","数字图像处理",25pt,15pt)],
)
  // ])

])
]
// = 2获得荣誉
#let 文字22=[
  // 第十八届挑战杯特等奖
    // #text(size: 0.8em, fill: black, weight: "bold",
    //  "RoboMaster")
  #text(size: 0.6em, fill: rgb("#19448e"), weight: "bold", "物理与光电工程学院院长特别奖学金")
    //  #text(size: 0.8em, fill: black, "(2/7)")
]
#let 文字23=[
  // 第十八届挑战杯特等奖
    // #text(size: 0.8em, fill: black, weight: "bold",
    //  "RoboMaster")
  #text(size: 0.6em, fill: rgb("#19448e"), weight: "bold", "2023-2024年度学生创新创业先进个人")
    //  #text(size: 0.8em, fill: black, "(2/7)")
]
// #slide(header:"2 获得荣誉")[

//   // #university.basic_info("物理与光电工程学院院长特别奖学金","本硕博同评、本科仅一")

//   //   #university.basic_info("校优秀奖学金","多次")

// // #university.big_small1("物理与光电工程学院院长特别奖学金","本硕博同评、本科仅一",25pt,15pt)

// // #university.big_small1("2023-2024年度“五四”评比表彰“学生创新创业先进个人","表彰在学校创新创业工作中做出突出贡献的学生",25pt,15pt)
// #v(1em)
// #align(
//   center,
//   [
//     #university.荣誉表_名称("物理与光电工程学院院长特别奖学金","本硕博同评、本科仅一")
// // #university.荣誉表_名称("校优秀奖学金","多次")
// #university.荣誉表_名称("2023-2024年度“五四”评比表彰“学生创新创业先进个人","表彰在学校创新创业工作中做出突出贡献的学生")

// #university.荣誉表_名称("校优秀奖学金","多次")
//   ]
// )
// ]
#slide(header:"1.2 获得荣誉")[
#place(left,dy:0.7em,dx:2em, university.竞赛获奖("11",文字22,"./img/院长特别奖学金.jpg",7.9em,42%))
#place(left,dy:0.7em,dx:17em, university.竞赛获奖("11",文字23,"./img/先进个人.jpg",7.9em,42%))
// #place(left,dy:0.7em,dx:19em,  university.竞赛获奖("11",文字2_,"./img/RoboMaster全国赛获奖证书.jpg",7.2em,38%))
] 
= 3 竞赛获奖
#let 文字2=[
  // 第十八届挑战杯特等奖
    #text(size: 0.8em, fill: black, weight: "bold", "第十八届挑战杯全国")
  #text(size: 1.1em, fill: rgb("#19448e"), weight: "bold", "特等奖")
     #text(size: 0.8em, fill: black, "(2/7)")
]
#let 文字2_=[
  // 第十八届挑战杯特等奖
    #text(size: 0.8em, fill: black, weight: "bold",
     "RoboMaster")
  #text(size: 0.8em, fill: rgb("#19448e"), weight: "bold", "全国二等奖")
    //  #text(size: 0.8em, fill: black, "(2/7)")
]
#let 文字21=[
    #text(size: 0.8em, fill: black, weight: "bold",
     "RoboMaster")
  #text(size: 0.8em, fill: rgb("#19448e"), weight: "bold", "北部亚军")
]
#let 文字24=[
  #text(size: 1.3em, fill: rgb("#19448e"), weight: "bold", "竞赛经历及任职")
]
#let 文字专利=[
  #text(size: 0.7em, fill: rgb("#19448e"), weight: "bold", "第一作者发表发明专利一项")
  #text(size: 0.3em, "（未授权）")

]
#let 文字25=[
  #text(size: 0.7em, fill: rgb("#19448e"), weight: "bold", "被黑龙江新闻联播采访")
  // #text(size: 0.3em, "（未授权）")

]
#slide(header:"3.1 比赛任职经历")[
#place(left,dy:0.7em,dx:1.7em,  university.竞赛获奖("11",文字24,"./img/竞赛经历v1.0.drawio.svg",17.2em,65%))
#place(left,dy:2.5em,dx:22.2em,  image("img/创梦之翼介绍.drawio.svg",width: 8em))

]
#slide(header:"3.1 比赛任职经历")[
#place(left,dy:0.5em,dx:-1.2em,  university.竞赛获奖("11",[
    #text(size: 0.6em, fill: rgb("#19448e"), weight: "bold", "RoboMaster 2024 区域赛合照（武汉）")
],"./img/武汉参赛照片.jpg",14.2em,51%))
// #place(left,dy:2.1em,dx:23.7em,  image("img/创梦之翼介绍.drawio.svg",width: 6em))
#place(left,dy:0.5em,dx:15.2em,  university.竞赛获奖("11",[
    #text(size: 0.6em, fill: rgb("#19448e"), weight: "bold", "第十八届挑战杯合照（贵州）")
],"./img/挑战杯合照.jpg",14.2em,51%))

]
#slide(header:"3.2  获得国家级特等奖一项，二等奖一项")[
#place(left,dy:0.7em,dx:2em, university.竞赛获奖("11",文字2,"./img/面向核电领域高性能智能检测获奖证书.png",15em,51%))
#place(left,dy:0.7em,dx:19em,  university.竞赛获奖("11",文字2_,"./img/RoboMaster全国赛获奖证书.jpg",7.2em,38%))
]
#slide(header:"3.3  省奖2 项,第一作者发表发明专利一项.")[
// #place(left,dy:0.7em,dx:2em, university.竞赛获奖("11",文字2,"./img/面向核电领域高性能智能检测获奖证书.png",15em,51%))
#place(left,dy:0.7em,dx:-1em,  university.竞赛获奖("11",文字21,"./img/RoboMaster区域赛获奖证书.jpg",7.2em,35%))
#place(left,dy:0.7em,dx:12em,  university.竞赛获奖("11",文字专利,"./img/一种轮足式机器人腿部结构-受通.jpg",7.2em,45%))


// #place(left,dy:0.7em,dx:11em,  university.专利_两个图片("11",文字专利,"./img/一种轮足式机器人腿部结构-受通.jpg","./img/一种轮足切换式机器人-受通.jpg",0em,7.5em,65%))

// #place(left,dy:0.7em,dx:11em,  university.竞赛获奖("11",文字24,"./img/竞赛经历v1.0.drawio.svg",17.2em,65%))
]

= 4 科研/项目经历
#slide(header:"4.0 概览")[
// #grid(
//   columns: (auto,auto,auto),
//   rows: (auto),
//   gutter: 3pt,
//   [
//     #university.分类("①视觉算法",("能量机关自动瞄准系统","装甲板自动瞄准系统","轮腿机器人仪表监测和导航"),8em,1)
//   ],[
//     #university.分类("②嵌入式",("能量机关嵌入式部分","海洋水质监测系统嵌入式部分"),8em,1)
//   ],
//   [
//     #university.分类("③软件/其他",("海洋水质监测系统后台系统"),8em,0)
//   ]
//   )
#place(left,dx:2.8em,dy:0.4em,[
#image("./img/项目概述.drawio.svg",width: 23em)

])
]
  #import "@preview/showybox:2.0.1": showybox

#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx


#slide(header:"4.1 RoboMaster-自动瞄准系统")[
// #v(-1em)
#place(right+bottom,dx:1.6em,dy:-1.1em,[
  #tablex(
  columns: 2,
  align: left + horizon,
  auto-vlines: false,
  header-rows: 2,
  [*参数*], [*值*],
  [*工作距离*], [1-10m],
  // [稳定工作], [超],
  [*帧率*],[约230fps],
  [*语言*],[C++],
  [*代码量*],[约2700行],
)
])
// #h(5em)
#place(left,dx:-1.2em,[
#image("./img/自瞄系统示意图-修正.drawio.svg",width: 31em)

])
]
#slide(header:"4.1 RoboMaster-自动瞄准系统-展示")[
// #v(-1em)

// #h(5em)
#place(left,dx:-1.2em,dy:1.3em,[
// #image("./img/自瞄视频1.png",width: 15em)
 #university.竞赛获奖("11",[
  #text(size: 0.7em, fill: rgb("#19448e"), weight: "bold", "自瞄系统场上效果")
 ],"./img/白色.png",14.9em,54%)

])
#place(left,dx:15em,dy:1.3em,[
// #image("./img/自瞄视频1.png",width: 15em)
 #university.竞赛获奖("11",[
  #text(size: 0.7em, fill: rgb("#19448e"), weight: "bold", "自瞄系统仿真测试")
 ],"./img/白色.png",14.9em,54%)

])
]
#slide(header:"4.2 RoboMaster-能量机关击打系统")[
#image("./img/能量机关击打系统.drawio.svg",width: 27em)
#place(right+bottom,dx:0.6em,dy:-0.8em,[
  #tablex(
  columns: 2,
  align: left + horizon,
  auto-vlines: false,
  header-rows: 2,
  [*参数*], [*值*],

  // [稳定工作], [超],
   [*工作距离*], [8-10m],
   [*帧率*],[约120fps],
  [*语言*],[C++],
  [*代码量*],[约1900行],
)
])
]

#slide(header:"4.2 RoboMaster-能量机关击打系统-展示")[
// #v(-1em)

// #h(5em)
#place(left,dx:-1.2em,dy:1.3em,[
// #image("./img/自瞄视频1.png",width: 15em)
 #university.竞赛获奖("11",[
  #text(size: 0.7em, fill: rgb("#19448e"), weight: "bold", "能量机关击打测试")
 ],"./img/白色.png",14.9em,54%)

])
#place(left,dx:15em,dy:1.3em,[
// #image("./img/自瞄视频1.png",width: 15em)
 #university.竞赛获奖("11",[
  #text(size: 0.7em, fill: rgb("#19448e"), weight: "bold", "算法效果展示")
 ],"./img/白色.png",14.9em,54%)

])
]
#slide(header:"4.3 RoboMaster-能量机关系统（嵌入式部分）")[
// 11
#image("./img/能量机关嵌入式部分.drawio.svg",width: 27em)
#place(right+bottom,dx:0.6em,dy:-2.8em,[
  #tablex(
  columns: 2,
  align: left + horizon,
  auto-vlines: false,
  header-rows: 2,
  [*参数*], [*值*],

  // [稳定工作], [超],
   [*语言*], [C],
   [*使用库*],[HAL库],
  // [*语言*],[C++],
  [*代码量*],[约1100行],
  [*EDA*],[嘉立创],

)
])
]
#slide(header:"4.4 面向核电领域高性能智能检测轮腿机器人")[
#image("./img/挑战杯项目.drawio.svg",width: 30em)

]

#slide(header:"4.5 海洋水质监测系统-电控+机械(课程设计)")[
#image("./img/海洋水质监测系统-嵌入式.drawio.svg",width: 28em)

]

#slide(header:"4.6 海洋水质监测系统-后台（课程设计）")[
#image("./img/海洋水质监测系统-后台系统.drawio.svg",width: 30em)
]

= 5 其他影响
#slide(header:"5 其他影响")[
  // #align(
  //   left,
  //   [
  //     获黑龙江省新闻联播报道。

  //     多次被校级媒体报道、采访。
  //     // #university.竞赛表_名称("全国大学生数学建模竞赛","二等奖")
  //   ]
  // )
#place(left,dy:0.7em,dx:-1em,  university.竞赛获奖("11",文字25,"./img/黑龙江省新闻联播2.png",15.2em,55%))
#place(left,dy:0.7em,dx:17em,  university.竞赛获奖("11",
[
  #text(size: 0.7em, fill: rgb("#19448e"), weight: "bold", "学校官方公众号报道")

],"./img/官号报道1.png",11.2em,44%))

]
// = 05 研究生规划