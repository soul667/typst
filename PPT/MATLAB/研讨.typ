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

  #centered-slide(section: [第一题],[])
  // #set 
// #show footnote.entry: it => {
//   let loc = it.note.location()
//   numbering(
//     "1: ",
//     ..counter(footnote).at(loc),
//   )
//   it.note.body
// }
#let 字体 = (
  仿宋: ("Times New Roman", "FangSong"),
  宋体: ("Times New Roman", "Source Han Serif"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)
// 设置代码字体
  #show raw: set text(font: 字体.代码)
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


#slide[
#let text1 = read("./code/use1.m")
#raw(text1, lang: "matlab")
]

#slide[
  #figure(
    align(center,
    image("./img/1.svg",width: 120%)
    )
    , caption: [第一题结果示意图]
  )
  
  
]

  #centered-slide(section: [第二题],[])

  #import "@preview/mitex:0.2.3": *
#slide[ 
  == 艾里斑
  #v(-2em)
    #image("./img/7.png",width: 70%)

#h(2em)艾里斑是点光源通过理想透镜成像时，由于衍射而在焦点处形成的光斑。中央是明亮的圆斑，周围有一组较弱的明暗相间的同心环状条纹，把其中以第一暗环为界限的中央亮斑称作艾里斑。这个光斑的大小可以用下面的公式来估计：
#mitex(`
r=d/2=1.22\frac{\lambda f}{D}
`)

在数学上，艾里斑的光强分布可以通过以下的公式来描述：
#mitex(`
I(r)=\left(\frac{2J_1(kr)}{kr}\right)^2
`)


]
#slide[
#figure(
  align(center,
     image("./img/8.png",width: 80%)

  )
  , caption: [艾里斑]
)


]
#slide[
#let text1 = read("./code/use2.m")
#raw(text1, lang: "matlab")
]

  #centered-slide(section: [第三题],[])

#slide[
只做了均匀光栅反射和透射谱

中心波长$lambda_B$有
#mitex(`
\lambda_B=2n_{eff}\Lambda 
`)

#mitex(`
\begin{aligned}&R=\frac{P_B(0)}{P_A(0)}=\frac{|B(0)|^2}{|A(0)|^2}=\frac{\kappa\kappa^*\sin^2(sL)}{s^2\cos^2(sL)+\delta^2\sin^2(sL)}\\\\\\&T=\frac{P_A(L)}{P_A(0)}=\frac{|A(L)|^2}{|A(0)|^2}=\frac{s^2}{s^2\cos^2(sL)+\delta^2\sin^2(sL)}\end{aligned}
`)
其中 $ Delta k=k-pi /lambda,s^2=Omega^2-Delta k^2$, 其中 $Omega$ 为耦合系数；

$ Omega= (pi Delta n )/lambda M_p $
近似为 $1 — V^2$
]

#slide[
#let text1 = read("./code/use3.m")
#raw(text1, lang: "matlab")
]

#slide[
#figure(
  align(center,
     image("./code/3.svg",width: 70%)

  )
  
)


]