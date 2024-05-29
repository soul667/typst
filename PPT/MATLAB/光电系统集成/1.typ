#import "@preview/touying:0.2.1": *
// #import "notes.typ": note, notes
#import "template.typ": *

#let (init, slide, slides) = utils.methods(s)
#show: init

#set text(font:("Times New Roman","STSong"))
// #set heading(numbering: "none")

#set heading(numbering: "1.")
#let s = (s.methods.info)(
  self: s,
  title: [111111],
  subtitle: [222],
  author: [33333],
  date: datetime.today(),
  institution: [Institution],
)
// #show: slides
// 用于辨析

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

#let head_main="M 大作业"
#slide[
#align(left+top,image("icon/校标.png",width: 15em))

#align(center+horizon, text(size: 55pt)[
#align(left,line(length: 100%,stroke: (paint: themeColor, thickness: 0.03em, dash: "dashed")))
  #head_main

  
// #align(center,text(20pt)[开题报告])
// #line(length: 100%,stroke: (paint: themeColor, thickness: 0.03em, dash: "dashed"))
])
#left.axis() \
#bottom.axis()
An inline
#box(
  fill: luma(205),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)[rectangle].]

#slide[

= 概述

]