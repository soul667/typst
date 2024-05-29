// #align(center,image("img/1.png",width:10em))
#set text(font: ("Times New Roman","STSong"))
#set heading(numbering: "1.")
#set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
#set list(indent:4em)

#show heading: it =>  {
    it
    par()[#text()[#h(0.0em)]]
}
= 假设

以车体坐标系为原点，采用新的坐标系定义。
- X - forward
- Y - left
- Z - up
#h(2em) 假设装甲板一开始正对世界坐标系，无任何旋转偏移。如下图所示
#import "@preview/cetz:0.2.0": *
#canvas({
import draw: *
let axis-line(p) = {
line((0, 0), (x: 4.5), stroke: red)
line((0, 0), (y: 4.5), stroke: blue)
line((0, 0), (z: 4.5), stroke: green)
circle((0, 0, 0), fill: black, radius:
0.05)
content((-0.4, 0.1, -0.2), p)
}

set-viewport((0, 0, 0), (4, 4, -4),
bounds: (4, 4, 4))
axis-line("A")
set-viewport((4, 4, 4), (0, 0, 0),
bounds: (4, 4, 4))
axis-line("B")
})


 在世界坐标系下，假设装甲板中心坐标是$(x,y,z)$，装甲板宽度长度分别为$(2a,2b)$,假设旋转角度$theta=0$,四个点的坐标分别为


#import "@preview/cetz:0.2.1"


假设上述转动角度为$theta$，其有一个旋转矩阵已经确定为$R_1$（前哨站，车两种情况，一种$+25^o$,一种$-25^o$）,另外一个旋转矩阵为$R_2(theta)$

四个点以左上角开始1编号，顺时针，有四个点$P_1,P_2,P_3,P_4$