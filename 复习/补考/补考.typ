#set text(font: "STSong")
= 基础
二极管的正向电流大，反向

== 半导体基本方程
由麦克斯韦方程组结合固体物理特性给出
#align(center,image("./1.png",width: 50%))

- 能带：容纳电子的一系列能级
- 禁带：不容na电子的能级
- 价带：0K最高能级
#align(center,image("./2.png",width: 40%))

假象的例子为空穴，没有真实存在。

== 半导体 导体 绝缘体
#align(center,image("./3.png",width: 60%))

#align(center,image("./4.png",width: 80%))

// #set terms(font("STSong"))
/ *本征半导体*: 无杂质，纯度高，具有晶体结构的半导体。

电子和空穴成对出现，称为电子-空穴对。

电子和空穴不断产生，成动态平衡，称为载流子。其浓度与温度密切相关。

2、施主杂质：向硅半导体提供一个自由电子而本身带正电的粒子杂质，此时电子为多数载流子，称为n型半导体。

3、受主杂质：向硅半导体提供一个空穴而本身带负点的杂质，主要靠受主提供空穴导电，空穴为多数载流子，称为p型半导体。

施点恩，受点骗。

#import "@preview/pyrunner:0.1.0" as py

#let compiled = py.compile(
```python
def find_emails(string):
    import re
    return re.findall(r"\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b", string)

def sum_all(*array):
    return sum(array)
```)

#let txt = "My email address is john.doe@example.com and my friend's email address is jane.doe111@example.net."

#py.call(compiled, "find_emails", txt)
#py.call(compiled, "sum_all", 1, 2, 3)

11111

#import "@preview/quick-maths:0.1.0": shorthands

#show: shorthands.with(
  ($+-$, $plus.minus$),
  ($|-$, math.tack),
  ($<=$, math.arrow.l.double) // Replaces '≤'
)

$ x^2 = 9 quad <==> quad x = +-3 $
$ A or B |- A $
$ x <= y $