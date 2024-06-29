// 字体
#import "tablex.typ": tablex, rowspanx,colspanx

#let data=yaml("use.yaml");


#let font = (
  main: "SimSun",
  mono: "SimSun",
  cjk: "Times New Roman",
  english:"Times New Roman"
)

// 图标
#let icon(path) = box(
  baseline: 0.135em,
  height: 1.0em,
  width: 1.0em,
  image(data.icon.文件夹+"/"+path)
)

#let faAngleRight = icon("fa-angle-right.svg")

// 主体
#let resume(
  size: 10pt,
  themeColor: rgb(46, 49, 124),
  top: 1.5cm,
  bottom: 2cm,
  left: 2cm,
  right: 2cm,
  photograph: "",
  photographWidth: 0em,
  gutterWidth: 0em,
  // name,
  header,
  body
) = {
  // 设置页边距设定
  set page(paper: "a4", numbering: "1", margin: (
    top: top,
    bottom: bottom,
    left: left,
    right: right,
  ))
  
  // 基础字体设定
  set text(font: (font.main, font.cjk), size: size, lang: "zh")

  // show heading: set text(themeColor, 1.1em)
  // 标题样式
  show heading.where(level: 2):set text(themeColor, 1.1em)
  // 小标题样式
  show heading.where(level: 1):set text(themeColor, 1.2em)
  // 二级标题下加一条横线
  show heading.where(level: 2): it => stack(
    v(0.3em),
    it,
    v(0.6em),
    // line(length: 100%, stroke: 0.05em + themeColor),
    line(length: 100%,stroke: (paint: themeColor, thickness: 0.06em, dash: "dashed")),
    v(0.1em),
  )
  
  // 更改 bullet list 的图标
  // set list(indent: 1em, body-indent: 0.8em, marker: faAngleRight)
  // 上面的语句无法精确控制图标位置, 因此改用了下列方法重写 list
  show list: it => stack(spacing: 0.4em, ..it.children.map(item => {
    grid(
      columns: (2em, 1fr),
      gutter: (0em),
      box({
        h(0.75em)
        faAngleRight
      }),
      pad(top: 0.15em, item.body)
    )
  }))
  
  // 链接颜色
  show link: set text(fill: themeColor)
  
  // 主体设定
  set par(justify: true)
  show par: set block(spacing: 0.5em)
  
  // 首部与照片
  grid(
    columns: (auto, 1fr, photographWidth),
    gutter: (gutterWidth, -1em),
    header,
    if (photograph != "") {
      image(photograph, width: photographWidth)
    }
  )
  
  body
}


// 带竖线的侧边栏
#let sidebar(side, content, withLine: true, sideWidth: 12%) = style(styles => {
  let sideSize = measure(side, styles)
  let contentSize = measure(content, styles)
  let height = calc.max(sideSize.height, contentSize.height) + 0.5em
  grid(
    columns: (sideWidth, 0%, 1fr),
    gutter: (0.75em),
    {
      set align(right)
      v(0.25em)
      side
      v(0.25em)
    },
    if (withLine) {line(end: (0em, height), stroke: 0.05em)},
    {
      v(0.25em)
      content
      v(0.25em)
    },
  )
})


// 个人信息
// 分两行
#let info(
  color: black,
  ..infos
) = {
    set text(font: ("youshebiaotihei"), fill: color)
    infos.pos().map(dir => {
    v(-2.3em)
      box(
        // line(length: 100%,stroke: (paint: black, thickness: 0.03em, dash: "dashed"))
        {

          line(length: 57%,stroke: (paint: black, thickness: 0.03em))
    v(-0.9em)

        if "icon" in dir {
          if (type(dir.icon) == "string") {
            icon(dir.icon)
          } else {
            dir.icon
          }
        }
        h(0.15em)
        if "link" in dir {
          link(dir.link, dir.content)
    v(-0.5em)
        // line(length: 100%,stroke: (paint: black, thickness: 0.03em, dash: "dashed"))

        } else {
           text(font: "YouSheBiaoTiHei",size: 1.4em)[#dir.content]
    v(-0.8em)
            align(center,text(font: "FangSong",size: 0.65em)[#dir.content1])
          

    v(-0.9em)
    // line(length: 100%,stroke: (paint: black, thickness: 0.03em, dash: "dashed"))
        line(length: 57%,stroke: (paint: black, thickness: 0.03em))

        }
      })
    }).join(h(0.2em) + "·" + h(0.2em))
    v(-0.5em)
}
#let add_h1(body)={
  body
  h(1em)
}



// 日期： 颜色变灰
#let date(body) = text(
  fill: rgb(108, 108, 108),
  size: 0.9em,
  font: "Times New Roman",
  body
)


// 技术: 字体变细
#let tech(body) = block({
  set text(weight: "extralight"
  ,font: "Times New Roman"
  )
  body
})

// 叶首的名字
#let name_header(body) = block({
  set text(
    weight: "semibold"
  // ,font: "SimHei",
  ,font: "STSong",
  size: 1.5em
    // fill: rgb(46, 49, 124),

  )
  body
})
// 项目
#let item(
  title,
  desc,
  endnote
) = {
  v(0.25em)
  grid(
    columns: (30%, 1fr, auto),
    gutter: (0em),
    title, desc, endnote
  )
}

// 姓名首行居中
#let name-header(
  empty,
  name,
  header,
  img 
)={
 grid(
    columns: (15%, 70%, 15%),
    gutter: (0em),
    empty,name+header,img
  )
}



// 排名和成绩，分两栏
// 左边是成绩+部分均分   右边是英语成绩列表
// 其他成绩如计算机几级建议写道后面
#let grade_rank(rank,english)={
  grid(
    columns: (46%, 30%),
    gutter: (0em),
  [#rank]
  ,
  english
  )
}


#let get_grade_name()={
  // for i in data.展示的成绩.科目
  
}




// 一些变量


// #let zhuxiu_use=[
//   主修
  
//   课程
// ]
// #let english_use=[
//   英语
  
//   成绩
// ]
// #let english_socre_num=data.英语科目.len();
// #let 数组测试=[
//   1,2,3,4,5
// ]
// #let table_english=tablex(
//   columns: english_socre_num+1,
//   align: center + horizon, // 水平居中+垂直居中
//   auto-vlines: false, // 不显示垂直线
//   header-rows: 2,

//   // color the last column's cells

//   // based on the written number


//   /* --- header --- */
//   rowspanx(2)[#english_use],
//   // #数组测试
  

// )
// #let table_auto(list1,list2)=
// {
//   #tablex(
//   columns:data.展示科目.len()+1 ,
//   align: center + horizon, // 水平居中+垂直居中
//   auto-vlines: false, // 不显示垂直线
//   header-rows: 2,

//   // color the last column's cells

//   // based on the written number

//   /* --- header --- */
//   rowspanx(2)[#zhuxiu_use],
//   ..data.展示科目,
//    ..data.展示成绩
// )
// }
#let table_auto(list1,list2,use)={
  
  tablex(
  columns:list1.len()+1 ,
  align: center + horizon, // 水平居中+垂直居中
  auto-vlines: false, // 不显示垂直线
  header-rows: 2,

  // color the last column's cells

  // based on the written number

  /* --- header --- */
  rowspanx(2)[#use],
  ..list1,
  ..list2
)
}


// #let table_grade={
// table_auto(data.展示科目,data.展示成绩,zhuxiu_use)
// }

// #let table_english={
// table_auto(data.英语科目,data.英语成绩,english_use)
// }

// tablex(
//   columns:data.展示科目.len()+1 ,
//   align: center + horizon, // 水平居中+垂直居中
//   auto-vlines: false, // 不显示垂直线
//   header-rows: 2,

//   // color the last column's cells

//   // based on the written number

//   /* --- header --- */
//   rowspanx(2)[#zhuxiu_use],
//   ..data.展示科目,
//    ..data.展示成绩
// )