#import "cv.typ": *

#let cvdata = yaml("example.yml")
#set text(font:("Times New Roman","Source Han Serif"))
#let uservars = (
    headingfont: "Linux Libertine",
    bodyfont: "Linux Libertine",
    fontsize: 10pt, // 10pt, 11pt, 12pt
    linespacing: 6pt,
    showAddress: true, // true/false show address in contact info
    showNumber: true,  // true/false show phone number in contact info
    headingsmallcaps: false
)

// setrules and showrules can be overridden by re-declaring it here
// #let setrules(doc) = {
//      // add custom document style rules here
//
//      doc
// }

#let customrules(doc) = {
    // add custom document style rules here
    set page(
        paper: "us-letter", // a4, us-letter
        numbering: "1 / 1",
        number-align: center, // left, center, right
        margin: 1.25cm, // 1.25cm, 1.87cm, 2.5cm
    )

    doc
}

#let cvinit(doc) = {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)

    doc
}

// each section body can be overridden by re-declaring it here
// #let cveducation = []

// ========================================================================== //

#show: doc => cvinit(doc)

#cvheading(cvdata, uservars)
#cveducation(cvdata)
#cvskills(cvdata)
#cv获奖(cvdata)
#cv获奖1(cvdata)
#cvwork(cvdata)
// #cvaffiliations(cvdata)
#v(-9em)
#cvprojects(cvdata)
// #cvawards(cvdata)
// #cvcertificates(cvdata)
// #cvpublications(cvdata)
// #cvreferences(cvdata)
// = 个人陈述及关键事迹介绍

// 一个是一丝不苟进行测试，比赛场中仅有一次因为撞击工况十分剧烈导致的系统失效。

// 勇于担责，用于挺身而出。

// 有团队意识，有责任感。

// 自主学习欲望强烈。


#endnote()
