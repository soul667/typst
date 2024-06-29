#import "@preview/touying:0.2.1": *
#import "template.typ": *

#let s = themes.simple.register(s, aspect-ratio: "16-9", footer: [Harbin Engineering University])
#let s = (s.methods.enable-transparent-cover)(self: s)
#let (init, slide, slides, title-slide, centered-slide, focus-slide,touying-outline) = utils.methods(s)
#show: init
#let faAward = icon(data.icon.faAward)
#let faBuildingColumns = icon(data.icon.faBuildingColumns)
#let faCode = icon(data.icon.faCode)
#let faEnvelope = icon(data.icon.faEnvelope)
#let faGithub = icon(data.icon.faGithub)
#let faGraduationCap = icon(data.icon.faGraduationCap)
#let faLinux = icon(data.icon.faLinux)
#let faPhone = icon(data.icon.faPhone)
#let faWindows = icon(data.icon.faWindows)
#let faWrench = icon(data.icon.faWrench)
#let python = icon(data.icon.python)
#let haiyang  = icon(data.icon.haiyang)

#let themeColor = rgb(46, 49, 124)

#let head_main=info(
  color: black,
  (
    icon: haiyang,
    content:"海洋水质监测系统",
    content1:"开题报告"

  )
)
// #align(left+top,image("icon/校标.png",width: 15em))
#slide[
#v(-1.8em)
// #h(1em)

#image("icon/校标.png",width: 10em)
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
#set text(font: "FangSong",size: 0.8em)
#show heading.where(level: 2):set text(themeColor, 0.9em,font: "Microsoft YaHei")
  // 小标题样式
#show heading.where(level: 1):set text(themeColor, 1.5em,font: "Microsoft YaHei")
  // 二级标题下加一条横线
#show heading.where(level: 2): it => stack(
    v(0.3em),
    it,
    v(0.6em),
    // line(length: 100%, stroke: 0.05em + themeColor),
    line(length: 100%,stroke: (paint: themeColor, thickness: 0.06em, dash: "dashed")),
    v(0.1em),
  )
  #centered-slide(section: [背景及意义])
  // #centered-slide()

// = 11111

#slide[
  == 背景
  // section: [Let's start a new section!]

大碗大碗大碗大碗单位的护卫的部位百度的的微博杜比五点八五东北部的动物的难忘的五年的为你耽误你耽误你电脑wind难忘的的女巫的你晚点问低洼低洼逗你玩逗你玩的单位i的那位年底我年底你的单位i的那位i的那位i耽误你的那位你的

11111 #footnote([11111111111111])
]

#focus-slide[
  _Focus!_

  This is very important.
]

#centered-slide(section: [Let's start a new section!])

#slide[
  == Dynamic slide
  Did you know that...

  #pause
  ...you can see the current section at the top of the slide?
]