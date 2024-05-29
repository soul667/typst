#import "@preview/touying:0.2.1": *
#import "notes.typ": note, notes

#let (init, slide, slides) = utils.methods(s)
#show: init

#set text(font:("Times New Roman","STSong"))
// #set heading(numbering: "none")
#let bianxi(word1,word2)=[
  #word1,
  #word2
]
#show: slides
// 用于辨析
= 雅思笔记

== 3-4日

/ Alternatively: instead or else 或者
  
- The *_agency_* will make travel _*arrangements*_ for you. Alternatively, you can organize your own _*transport*_.旅行社将为你安排旅行，或者你也可以自己安排交通工具。

/ scope: the range of a subject covered by a book, programme, discussion, class, etc. 范围
- The book covers a wide _*scope*_ of topics. 这本书涵盖了很广泛的话题。

/ Coordinate: 坐标
- The _*coordinates*_ of the ship were reported to the _*coastguard*_. 船的坐标已经报告给了海岸警卫队。
// 
/ Anchors: 锚


== 公式推导

#align(center,image("img/1.png",width:10em))
以车体坐标系为原点，
在世界坐标系下，假设装甲板中心坐标是$(x,y,z)$，装甲板宽度长度分别为$(2a,2b)$,假设旋转角度$theta=0$,四个点的坐标分别为


#import "@preview/cetz:0.2.1"


假设上述转动角度为$theta$，其有一个旋转矩阵已经确定为$R_1$（前哨站，车两种情况，一种$+25^o$,一种$-25^o$）,另外一个旋转矩阵为$R_2(theta)$

四个点以左上角开始1编号，顺时针，有四个点$P_1,P_2,P_3,P_4$