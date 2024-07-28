#import "@preview/touying:0.4.0": *
#let data=yaml("./example.yml")

// University theme

// Originally contributed by Pol Dellaiera - https://github.com/drupol
  #import "@preview/showybox:2.0.1": showybox

// #let colors_=()

#let slide(
  self: none,
  title: auto,
  subtitle: auto,
  header: auto,
  footer: auto,
  now_light:auto,
  display-current-section: auto,
  ..args,
) = {
  if title != auto {
    self.uni-title = title
  }
  if subtitle != auto {
    self.uni-subtitle = subtitle
  }
  if header != auto {
    self.uni-header = header
  }
  if footer != auto {
    self.uni-footer = footer
  }
    // if now_light != auto {
    self.uni-now_light = now_light
  // }
  if display-current-section != auto {
    self.uni-display-current-section = display-current-section
  }
  (self.methods.touying-slide)(
    ..args.named(),
    self: self,
    setting: body => {
      show: args.named().at("setting", default: body => body)
      body
    },
    ..args.pos(),
  )
}

#let title-slide(self: none, ..args) = {
  self = utils.empty-page(self)
  let info = self.info + args.named()
  info.authors = {
    let authors =  if "authors" in info { info.authors } else { info.author }
    if type(authors) == array { authors } else { (authors,) }
  }

  let content = {
    if info.logo != none {
      align(right, info.logo)
    }
    // place(top+left,dy:-0em,dx:2.6em,image("icon/SINTEF_Logo_Sentrert_RGB.jpg",width: 3.4em))
    place(bottom+left,dy:-0em,dx:0.6em,image("icon/校标.png",width: 12em))
    place(bottom+right,dy:-0em,dx:-0em,image("icon/background.png",width:18em))
      v(2em)
    place(center + horizon, dx:0em,{
      block(
        inset: 0em,
        breakable: false,
        {
            v(-5.9em)
          text(size: 2.1em, fill: self.colors.primary, strong(info.title))
          if info.subtitle != none {
            v(-1.1em)
            parbreak()
            text(size: 1.2em, fill: self.colors.primary, strong(info.subtitle))
          }
        }
      )
      // set text(size: .9em)
      // grid(
      //   columns: (1fr,) * calc.min(info.authors.len(), 3),
      //   column-gutter: 1em,
      //   row-gutter: 1em,
      //   ..info.authors.map(author => text(fill: black, author))
      // )
      // v(1em)
      // if info.institution != none {
      //   parbreak()
      //   text(size: .9em, info.institution)
      // }
      // if info.date != none {
      //   parbreak()
      //   text(size: .8em, utils.info-date(self))
      // }
      v(1em)
  place(center,dy:1em,[
    #showybox(
  width:30%,
  frame: (
    border-color: rgb("#19448e").darken(80%),
    title-color:rgb("#19448e").lighten(90%),
    // body-color: rgb("#19448e").lighten(80%)
        dash: "dashed",
    //     border-color: rgb("#19448e").darken(80%),
    // title-color:rgb("#19448e").lighten(90%),
    // // body-color: rgb("#19448e").lighten(80%)
    //     dash: "dashed",
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
  shadow: (
    offset: 3pt,
  ),
  title: [
     #text(size: 0.8em, strong("汇报人: "+ data.标题页.姓名))
  ]
  ,[
    #align(center,
    [
      #text(size: 0.8em, strong("汇报时间: "+ utils.info-date(self)))
      // #h(2em)
      // #text( "学校专业:"+info.institution)

    ])
    ],
)
  ])
      // block(
        // box[汇报人:古翱翔]


      
    })
  }
  (self.methods.touying-slide)(self: self, repeat: none, content)
}
#import "@preview/grayness:0.1.0": *
#let new-section-slide(self: none, short-title: auto, title) = {
  self = utils.empty-page(self)
  let content(self) = {
    set align(horizon)
    show: pad.with(20%)
    set text(size: 2.0em, fill: self.colors.primary, weight: "bold")
    states.current-section-with-numbering(self)
    v(-.6em)
    block(height: 2pt, width: 100%, spacing: 0pt, utils.call-or-display(self, self.uni-progress-bar))
    let data = read("img/浙江大学.png", encoding: none)
    place(center,dx:0em,dy:2em,[
    
    // #show-image(data,width: 2.5em)
    ])
  }
  (self.methods.touying-slide)(self: self, repeat: none, section: (title: title, short-title: short-title), content)
}

#let focus-slide(self: none, background-color: none, background-img: none, body) = {
  let background-color = if background-img == none and background-color ==  none {
    rgb(self.colors.primary)
  } else {
    background-color
  }
  self = utils.empty-page(self)
  self.page-args += (
    fill: self.colors.primary-dark,
    margin: 1em,
    ..(if background-color != none { (fill: background-color) }),
    ..(if background-img != none { (background: {
        set image(fit: "stretch", width: 100%, height: 100%)
        background-img
      })
    }),
  )
  set text(fill: white, weight: "bold", size: 2em)
  (self.methods.touying-slide)(self: self, repeat: none, align(horizon, body))
}

#let matrix-slide(self: none, columns: none, rows: none, ..bodies) = {
  self = utils.empty-page(self)
  (self.methods.touying-slide)(self: self, composer: (..bodies) => {
    let bodies = bodies.pos()
    let columns = if type(columns) == int {
      (1fr,) * columns
    } else if columns == none {
      (1fr,) * bodies.len()
    } else {
      columns
    }
    let num-cols = columns.len()
    let rows = if type(rows) == int {
      (1fr,) * rows
    } else if rows == none {
      let quotient = calc.quo(bodies.len(), num-cols)
      let correction = if calc.rem(bodies.len(), num-cols) == 0 { 0 } else { 1 }
      (1fr,) * (quotient + correction)
    } else {
      rows
    }
    let num-rows = rows.len()
    if num-rows * num-cols < bodies.len() {
      panic("number of rows (" + str(num-rows) + ") * number of columns (" + str(num-cols) + ") must at least be number of content arguments (" + str(bodies.len()) + ")")
    }
    let cart-idx(i) = (calc.quo(i, num-cols), calc.rem(i, num-cols))
    let color-body(idx-body) = {
      let (idx, body) = idx-body
      let (row, col) = cart-idx(idx)
      let color = if calc.even(row + col) { white } else { silver }
      set align(center + horizon)
      rect(inset: .5em, width: 100%, height: 100%, fill: color, body)
    }
    let content = grid(
      columns: columns, rows: rows,
      gutter: 0pt,
      ..bodies.enumerate().map(color-body)
    )
    content
  }, ..bodies)
}

#let slides(self: none, title-slide: true, slide-level: 1, ..args) = {
  if title-slide {
    (self.methods.title-slide)(self: self)
  }
  (self.methods.touying-slides)(self: self, slide-level: slide-level, ..args)
}

#let register(
  self: themes.default.register(),
  // nowlight:now_light,
  aspect-ratio: "16-9",
  progress-bar: true,
  display-current-section: true,
  footer-columns: (15%, 15%,15%,15%,15%,10%, 8%),
  footer-a: "01基本信息",
  footer-b: "02获得荣誉",
  footer-d: "03竞赛获奖",
  footer-e: "04项目经历",
  footer-f: "05其他荣誉",
  footer-g: "06规划",


  footer-c: self => {
    states.slide-counter.display() + " / " + states.last-slide-number
    h(1fr)
  },
) = {
  // color theme
  self = (self.methods.colors)(
    self: self,
    primary: rgb("#19448e"),
    secondary: rgb("#165e83"),
    tertiary: rgb("#507ea4"),
  )
  // save the variables for later use
  self.uni-enable-progress-bar = progress-bar
  self.uni-progress-bar = self => states.touying-progress(ratio => {
    grid(
      columns: (ratio * 100%, 1fr),
      rows: 2pt,
      components.cell(fill: self.colors.primary),
      components.cell(fill: self.colors.tertiary)
    )
  })
  self.uni-display-current-section = display-current-section
  self.uni-title = none
  self.uni-subtitle = none
  // self.now_light=now_light;
  self.uni-footer = (self) => {
    let cell(fill: none, it) = rect(
      width: 100%, height: 100%, inset: 1mm, outset: 0mm, fill: fill, stroke: none,
      align(horizon, text(fill: white, it))
    )
    show: block.with(width: 100%, height: auto, fill: self.colors.secondary)
    {
      // 划分颜色数组
    }
      let colors_=()
      // if(self)
      let num11 = states.slide-counter;
      // content to num;
      // if num11==3 {
      //   now_light=1;
      // }
      // if num11==5 or num11==6 {
      //   now_light=1;
      // }
      self.now_light=1
      for value in (0,1,2,3,4,5) {
      if(value==0 or value==2 or value==4){
      colors_.push(self.colors.secondary)
      }
      if(value==1 or value==3 or value==5){
      colors_.push(self.colors.primary)
      }

      }
    grid(
      columns: footer-columns,
      rows: (1.5em, auto),
      cell(fill: colors_.at(0), utils.call-or-display(self,footer-a)),

      // cell(fill: self.colors.primary, utils.call-or-display(self, footer-a)),
      cell(fill: colors_.at(1), utils.call-or-display(self, footer-b)),
      cell(fill: colors_.at(2), utils.call-or-display(self, footer-d)),
      cell(fill: colors_.at(3), utils.call-or-display(self, footer-e)),
      cell(fill: colors_.at(4), utils.call-or-display(self, footer-f)),
            cell(fill: colors_.at(5), utils.call-or-display(self, footer-g)),
      cell(fill: self.colors.secondary, utils.call-or-display(self, footer-c)),
    )
  }
  self.uni-header = self => {
    if self.uni-title != none {
      block(inset: (x: .5em), 
        grid(
          columns: 1,
          gutter: .3em,
          grid(
            columns: (auto, 1fr, auto),
            align(top + left, text(fill: self.colors.primary, weight: "bold", size: 1.2em, self.uni-title)),
            [],
            if self.uni-display-current-section {
              align(top + right, text(fill: self.colors.primary.lighten(65%), states.current-section-with-numbering(self)))
            }
          ),
          text(fill: self.colors.primary.lighten(65%), size: .8em, self.uni-subtitle)
        )
      )
    }
  }
  // set page
  let header(self) = {
    set align(top)
    
    place(bottom+left,dx: 0em,dy: -0.4em,[
          #showybox(
            width:100%,
            frame: (
    border-color: self.colors.primary.darken(50%),
    title-color: self.colors.primary.lighten(60%),
     body-color: self.colors.primary.lighten(-0%)
  ),
  [
    #text(size: 1.1em, fill: white)[#strong([#self.uni-header])]
  ]
  // [#text(font: "Microsoft YaHei",fill:white)[做最NB]]
)
    ])
    place(bottom+right,dy:-0.5em,dx:-0.3em,image("icon/school_logo.png",width: 8em))
    // grid(
    //   rows: (auto, auto),
    //   row-gutter: 5mm,
    //   if self.uni-enable-progress-bar {
    //     utils.call-or-display(self, self.uni-progress-bar)
    //   },
    //   utils.call-or-display(self, self.uni-header),
    // )
  }
  let footer(self) = {
    set text(size: .7em)
    set align(center + bottom)
    utils.call-or-display(self, self.uni-footer)
  }

  self.page-args += (
    paper: "presentation-" + aspect-ratio,
    header: header,
    footer: footer,
    header-ascent: 0em,
    footer-descent: 0em,
    margin: (top: 2.5em, bottom: 1.25em, x: 2em),
  )
  // register methods
  self.methods.slide = slide
  self.methods.title-slide = title-slide
  self.methods.new-section-slide = new-section-slide
  self.methods.touying-new-section-slide = new-section-slide
  self.methods.focus-slide = focus-slide
  self.methods.matrix-slide = matrix-slide
  self.methods.slides = slides
  self.methods.touying-outline = (self: none, enum-args: (:), ..args) => {
    states.touying-outline(self: self, enum-args: (tight: false,) + enum-args, ..args)
  }
  self.methods.alert = (self: none, it) => text(fill: self.colors.primary, it)
  self.methods.init = (self: none, body) => {
    set text(size: 25pt,font:("Times New Roman"))
    set text(font:"Source Han Serif")
    show footnote.entry: set text(size: .6em)
    body
  }
  self
}

#let basic_info(left_,right_)={
let size_=0.8em;
text(size: size_, fill: rgb("#19448e"), weight: "bold",font:("Times New Roman","Source Han Serif"), left_+": ")
text(size: size_, font:("Times New Roman","Source Han Serif"),fill: black, right_)
v(-0.5em)  

}

#let big_small(big_,small_,big_size,small_size)={
align(center,[
  #text(size: big_size, fill: rgb("#19448e"), weight: "bold", big_)
#v(-0.7em)
#text(size: small_size, fill: rgb("#19448e"), weight: "bold", small_)
])

}

#let big_small1(big_,small_,big_size,small_size)={
align(left,[
  #text(size: big_size, fill: rgb("#19448e"), weight: "bold", big_)
#v(-0.7em)
#text(size: small_size, weight: "bold", small_)
])

}

#let 荣誉表_名称(荣誉名称,荣誉介绍)={
  // box
 showybox(
  width:90%,
  frame: (
    border-color: rgb("#19448e").darken(80%),
    title-color:rgb("#19448e").lighten(90%),
    // body-color: rgb("#19448e").lighten(80%)
        dash: "dashed",
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center,
    boxed-style: (
 anchor: (
 x: center,
 y: horizon
 ),
 radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
 )

  ),
  shadow: (
    offset: 3pt,
  ),
  title: [
    //  #text(size: 0.8em, strong(荣誉名称))
      #text(size: 0.8em, fill: rgb("#19448e"), weight: "bold", 荣誉名称)
  ]
  ,[
    #align(center,
    [
      #text(size: 0.6em, strong(荣誉介绍))
      // #h(2em)
      // #text( "学校专业:"+info.institution)

    ])
    ],
)
}

// 图片+两段文字
#let 竞赛获奖(文字1,文字2,图片,size_,percent)={
  showybox(
  width:percent,
  frame: (
    border-color: rgb("#19448e").darken(80%),
    title-color:rgb("#19448e").lighten(90%),
    // body-color: rgb("#19448e").lighten(80%)
        dash: "dashed",
    //     border-color: rgb("#19448e").darken(80%),
    // title-color:rgb("#19448e").lighten(90%),
    // // body-color: rgb("#19448e").lighten(80%)
    //     dash: "dashed",
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
  shadow: (
    offset: 3pt,
  ),
  title: [
    //  #text(size: 0.8em, strong("汇报人: "+ data.标题页.姓名))
// #text(size: 0.8em, fill: rgb("#19448e"), weight: "bold", "第十八届挑战杯特等奖")
#文字2
  ]
  ,[
    #align(center,
    [
    #image(图片,width: size_)
      // #text(size: 0.8em, strong("汇报时间: "+ utils.info-date(self)))
      // #h(2em)
      // #text( "学校专业:"+info.institution)

    ])
    ],
)
// v(-0.5em)

}

#let 专利_两个图片(文字1,文字2,图片1,图片2,图片间距,size_,percent)={
  showybox(
  width:percent,
  frame: (
    border-color: rgb("#19448e").darken(80%),
    title-color:rgb("#19448e").lighten(90%),
    // body-color: rgb("#19448e").lighten(80%)
        dash: "dashed",
    //     border-color: rgb("#19448e").darken(80%),
    // title-color:rgb("#19448e").lighten(90%),
    // // body-color: rgb("#19448e").lighten(80%)
    //     dash: "dashed",
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
  shadow: (
    offset: 3pt,
  ),
  title: [
    //  #text(size: 0.8em, strong("汇报人: "+ data.标题页.姓名))
// #text(size: 0.8em, fill: rgb("#19448e"), weight: "bold", "第十八届挑战杯特等奖")
#文字2
  ]
  ,[
#align(center,  grid(
  columns: (auto,auto),
  rows: (auto),
  gutter: 3pt,
[#image(图片1,width: size_)],[#image(图片2,width: size_)]))
    // #align(center,
    // [
    // #image(图片1,width: size_) #image(图片2,width: size_)

    //   // #text(size: 0.8em, strong("汇报时间: "+ utils.info-date(self)))
    //   // #h(2em)
    //   // #text( "学校专业:"+info.institution)

    // ])
    ],
)
// v(-0.5em)

}

#let 分类(标题文字,list_,percent,bool)={
let data_=[];
let box_bssic(data1)=[
  #showybox(
  // height: 0.5em,
  frame: (
    border-color: rgb("#19448e").darken(80%),
    title-color:rgb("#19448e").lighten(90%),
    // body-color: rgb("#19448e").lighten(80%)
        dash: "dashed",
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
    shadow: (
    offset: 3pt,
  ),
  [
    // #v(-0.3em)
    // #align(center,data1)
#align(center,[
     #text(size: 0.6em, strong(data1))
])
  ]
  )
    #v(-0.6em)

]
for x in list_{
  if(bool==1){
  data_+=box_bssic(x);
  }
}
if(bool==0)   {
  data_+=box_bssic(list_);
}
  data_+=v(0.8em);
  showybox(
  width:percent,
  frame: (
    border-color: rgb("#19448e").darken(0%),
    title-color:rgb("#19448e").darken(0%),
    body-color: rgb("#19448e").lighten(100%),
        dash: "dashed",
  ),
  title-style: (
    // color: black,
    weight: "regular",
    align: center,
    boxed-style: (:),
    // background: 
//  title-style: (),

  ),
  shadow: (
    offset: 3pt,
  ),
  title: [
     #text(size: 0.8em, strong(标题文字))
  ]
  ,[
    #align(center,
    [
        #data_
    ])
    ],
)
// v(-0.5em)

}