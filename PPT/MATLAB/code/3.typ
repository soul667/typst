// #align(center,image("img/1.png",width:10em))
#set text(font: ("Times New Roman","STSong"))
#set heading(numbering: "1.")
#set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
#set list(indent:4em)

#show heading: it =>  {
    it
    par()[#text()[#h(0.0em)]]
}

= 光纤光栅
我晚上晚上