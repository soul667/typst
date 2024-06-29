#import "touying/lib.typ": *
#import "template.typ": *
// #import "todo.typ": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm

#let s = themes.simple.register(s, aspect-ratio: "16-9", footer: [Harbin Engineering University])
#let s = (s.methods.enable-transparent-cover)(self: s)
#let (init, slide, slides, title-slide, centered-slide, focus-slide,touying-outline) = utils.methods(s)
#show: init

#let themeColor = rgb(46, 49, 124)

// #let head_main=info(
//   color: black,
//   (
//     // icon: haiyang,
//     content:"M 大作业答辩",
//     content1:"2021251124 古翱翔"

//   )
// )
// #align(left+top,image("icon/校标.png",width: 15em))
// #slide[
// #v(-1.3em)
// // #h(1em)

// #align(top+right,image("icon/校标.png",width: 10em))
// #align(center+horizon, text(size: 35pt)[
//   #head_main
// ])
// #v(0.5em)

// ]

#set heading(numbering: "1.")
#set text(font:("Times New Roman","HYFangSongS"),size: 0.76em,spacing: 0.3em,weight: "extralight")
#show heading.where(level: 2):set text(themeColor, 0.9em,font: "Microsoft YaHei")
#show heading.where(level: 3):set text(themeColor, 0.8em,font: "Microsoft YaHei")
#show strong:set text(font: "HYCuFangSongJ")
// #show footnote:set text(themeColor, 0.9em,font: "Microsoft YaHei")
  // 小标题样式
#show heading.where(level: 1):set text(themeColor, 1.5em,font:("Times New Roman","Microsoft YaHei"))
#set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符

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



#import "./use.typ": *
#slide[
  #header
]