#import "themes/polylux/polylux.typ"
#import "themes/fudan.typ": *
 
 
#show: fudan-theme.with(
  footer: [Author, institution],
  short-title: [Short title],
)
  
#title-slide(
  title: [这是一个PPT模板的标题],
  subtitle: [哈尔滨工程大学],
  authors: ([Author A], [Author B], [Author C]),
  date: [January 1, 1970]
)

#slide(title: [First slide title])[
  #lorem(20)
]

#new-section-slide("The new section")

#slide(title: [Slide with multiple columns])[
  #lorem(20)
][
  #lorem(10)
][
  #lorem(30)
]

#focus-slide[
  _Focus!_

  This is very important.
]

#focus-slide[
哈哈哈哈哈哈1111
$lim_(x->oo) 1/x = 1$
1111111222222222


$vec(1, 2) dot.op
vec(3, 4) = 11$
]

#focus-slide[
单词：Former

意思：前者的，以前的

国际音标：/ˈfɔːrmər/

词性：形容词

词源解说：该词源于中古英语的"formere"，意为"以前的"。它由"fore"（前）和"mer"（更早的）两个词根组成。

词根：fore-，mer-

派生词：formation（形成），formal（正式的），formality（正式），formulate（阐述），formidable（可怕的）

常用短语：

1. former president（前总统）

2. former employee（前雇员）

3. in the former case（在前一种情况下）

4. former glory（昔日的辉煌）

5. former life（前世）

关联例句：

1. The former CEO of the company retired last year.

（该公司的前首席执行官去年退休了。）

2. She used to be a teacher, but now she works as a writer.

（她曾经是一名教师，但现在从事写作工作。）
]