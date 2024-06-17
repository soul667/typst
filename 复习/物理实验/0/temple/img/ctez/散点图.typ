#import "@preview/cetz:0.2.2"
#import cetz.plot
#import cetz.plot
#import cetz.draw: *
#let 横轴长度=15
#let 纵轴长度=7.5
#let 横轴步长=5
#let 纵轴步长=5
#let 横轴脚注="x"
#let 纵轴脚注="y"
#let 表格地址="./1.csv"





// #type(out_data.at(0).at(0))
#let 散点图=(表格地址,x,y,z,mark)=>{
  let data=csv(表格地址)

let out_data=data.slice(1)
let i_=0
for i in out_data{
    out_data.at(i_).at(0)=float(i.at(0))
    out_data.at(i_).at(1)=float(i.at(1))
    i_+=1
}
  return cetz.canvas(
  length:1cm,
  {
import cetz.plot
plot.plot(
  // color: "black",
  unit: 1cm,
 size: (10,10),
 x-tick-step: 10,
 y-tick-step: 纵轴步长,
 x-label: x,
 y-label: y,
x-grid: true,
y-grid: true,
// color: black,
// style: (color: black),
 legend: "legend.north", {
 plot.add(
 out_data,
 mark: mark,
//  stroke: black,
// fill: white,
//  mark-style: (stroke: black, fill: white),
//  mark-size: 3mm,
 label: z,
 
//  size: 1.5mm,
 )
})


})
}

#let 散点图1=散点图("./5.1.csv",[驱动电流 $(m A)$],[光功率当量],[光功率当量],"o")
#let 横轴长度=50
#let 纵轴长度=75
#let 横轴步长=1
#let 纵轴步长=250


#let 散点图_2=(表格地址,x,y,z,mark)=>{
  let data=csv(表格地址)

let out_data=data.slice(1)
let i_=0
for i in out_data{
    out_data.at(i_).at(0)=float(i.at(0))
    out_data.at(i_).at(1)=float(i.at(1))
    i_+=1
}

// scale(x: 10%)
  return cetz.canvas(
  // 缩放
  // scale: 0.5,
  length:10cm,
  {
import cetz.plot
plot.plot(
  // color: "black",
 size: (1,1),
   colors: (black),
 x-tick-step: 横轴步长,
 y-tick-step: 纵轴步长,
 x-label: x,
 y-label: y,
x-grid: true,
y-grid: true,
// color: black,
// style: (color: black),
 legend: none, {
 plot.add(
 out_data,
 mark: mark,
//  stroke: black,
// fill: white,
//  mark-style: (stroke: black, fill: white),
 mark-size: 0.02,
 label: z,
 
//  size: 1.5mm,
 )
})


})
}
#let 散点图2=散点图_2("./5.1.csv",[驱动电流 $(m A)$],[输出电压$(m V) $],[],"o")
// #散点图1


#let 横轴长度=50
#let 纵轴长度=75
#let 横轴步长=0.5
#let 纵轴步长=0.4


#let 散点图_3=(表格地址,x,y,z,mark)=>{
  let data=csv(表格地址)

let out_data=data.slice(1)
let i_=0
for i in out_data{
    out_data.at(i_).at(0)=float(i.at(0))
    out_data.at(i_).at(1)=float(i.at(1))
    i_+=1
}

// scale(x: 10%)
  return cetz.canvas(
  // 缩放
  // scale: 0.5,
  length:1cm,
  {
import cetz.plot
plot.plot(
  // color: "black",
 size: (10,10),
   colors: (black),
 x-tick-step: 横轴步长,
 y-tick-step: 纵轴步长,
 x-label: x,
 y-label: y,
x-grid: true,
y-grid: true,
// color: black,
// style: (color: black),
 legend: "legend.north", {
 plot.add(
 out_data,
 mark: mark,
//  stroke: black,
// fill: white,
//  mark-style: (stroke: black, fill: white),
 mark-size: 0.25,
 label: z,
 
//  size: 1.5mm,
 )
})


})
}
#let 散点图3=散点图_3("./6.2.csv",[距离 $("mm")$],[功率$(m w) $],[功率],"o")
// #散点图1



#let 横轴长度=100
#let 纵轴长度=5000
#let 横轴步长=5
#let 纵轴步长=250


#let 散点图_4=(表格地址1,表格地址2,x,y,z,mark)=>{
  let data1=csv(表格地址1)
  let data2=csv(表格地址2)

let out_data=data1.slice(1)
let i_=0
for i in out_data{
    out_data.at(i_).at(0)=float(i.at(0))
    out_data.at(i_).at(1)=float(i.at(1))
    i_+=1
}

let out_data2=data2.slice(1)
let i_=0
for i in out_data2{
    out_data2.at(i_).at(0)=float(i.at(0))
    out_data2.at(i_).at(1)=float(i.at(1))
    i_+=1
}

// scale(x: 10%)
  return cetz.canvas(
  // 缩放
  // scale: 0.5,
  length:1cm,
  {
import cetz.plot
plot.plot(
  // color: "black",
 size: (10,10),
  //  colors: (black),
 x-tick-step: 横轴步长,
 y-tick-step: 纵轴步长,
 x-label: x,
 y-label: y,
x-grid: true,
y-grid: true,
// color: black,
// style: (color: black),
 legend: "legend.north", {
 plot.add(
 out_data,
 mark: mark,
//  stroke: black,
// fill: white,
//  mark-style: (stroke: black, fill: white),
 mark-size: 0.10,
 label: $z=0.5$
//  size: 1.5mm,
 )
 plot.add(
 out_data2,
 mark: mark,
//  stroke: black,
// fill: white,
 mark-style: (stroke: red, fill: rgb("#ff4032")),
 mark-size: 0.10,
 label: $z=1$,
 
//  size: 1.5mm,
 )
})


})
}
#let 散点图4=散点图_4("./6.3.1.csv","./6.3.2.csv",[焦距 $(mu m)$],[光强],[光功率当量],"o")
// #散点图1
#散点图3