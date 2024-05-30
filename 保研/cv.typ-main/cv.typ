#import "utils.typ"

// #set text(font:("Times New Roman","Source Han Serif"))
// set rules
#let setrules(uservars, doc) = {
    set text(
        font: ("Times New Roman","Source Han Serif"),
        size: uservars.fontsize,
        hyphenate: false,
    )

    set list(
        spacing: uservars.linespacing
    )

    set par(
        leading: uservars.linespacing,
        justify: true,
    )

    doc
}

// show rules
#let showrules(uservars, doc) = {
    // uppercase section headings
    show heading.where(
        level: 2,
    ): it => block(width: 100%)[
        #set align(left)
        #set text(font: uservars.headingfont, size: 1em, weight: "bold")
        #if (uservars.at("headingsmallcaps", default:false)) {
            smallcaps(it.body)
        } else {
            upper(it.body)
        }
        #v(-0.75em) #line(length: 100%, stroke: 1pt + black) // draw a line
    ]

    // name title
    show heading.where(
        level: 1,
    ): it => block(width: 100%)[
        #set text(font: (uservars.headingfont,"Source Han Serif"), size: 1.5em, weight: "bold")
        #if (uservars.at("headingsmallcaps", default:false)) {
            smallcaps(it.body)
        } else {
            upper(it.body)
        }
        #v(2pt)
    ]

    doc
}

// set page layout
#let cvinit(doc) = {
    doc = setrules(doc)
    doc = showrules(doc)

    doc
}

// address
#let addresstext(info, uservars) = {
    if uservars.showAddress {
        block(width: 100%)[
            #info.personal.location.city, 男
            // #info.personal.location.city, #info.personal.location.region, #info.personal.location.country #info.personal.location.postalCode
            #v(-4pt)
        ]
    } else {none}
}

#let contacttext(info, uservars) = block(width: 100%)[
    #let profiles = (
        box(link("mailto:" + info.personal.email)),
        if uservars.showNumber {box(link("tel:" + info.personal.phone))} else {none},
        // if info.personal.url != none {
        //     box(link(info.personal.url)[#info.personal.url.split("//").at(1)])
        // }
    ).filter(it => it != none) // filter out none elements from the profile array

    #if info.personal.profiles.len() > 0 {
        for profile in info.personal.profiles {
            profiles.push(
                box(link(profile.url)[#profile.url.split("//").at(1)])
            )
        }
    }

    #set text(font: uservars.bodyfont, weight: "medium", size: uservars.fontsize * 1)
    #pad(x: 0em)[
        #profiles.join([#sym.space.en #sym.diamond.filled #sym.space.en])
    ]
]

#let cvheading(info, uservars) = {
    align(center)[
        = #info.personal.name
        #addresstext(info, uservars)
        #contacttext(info, uservars)
    ]
}

#let cvwork(info, isbreakable: true) = {
    if info.work != none {block[
        == #text(font:"Source Han Serif")[工作经历]

        #for w in info.work {
            // block(width: 100%, breakable: isbreakable)[
            //     // line 1: company and location
            //     #if w.url != none [
            //         *#link(w.url)[#w.organization]* #h(1fr) *#w.location* \
            //     ] else [
            //         *#w.organization* #h(1fr) *#w.location* \
            //     ]
            // ]
            // create a block layout for each work entry
            let index = 0
            for p in w.positions {
                if index != 0 {v(0.6em)}
                block(width: 100%, breakable: isbreakable, above: 0.6em)[
                    // parse ISO date strings into datetime objects
                    #let start = utils.strpdate(p.startDate)
                    #let end = utils.strpdate(p.endDate)
                    // line 2: position and date range
                    // #text(style: "italic")[#p.position] #h(1fr)
                    // font:"FangSong"
                    // #text(font: "Source Han Serif")
                     #text(style: "italic",font: ("Times New Roman","Source Han Serif"))[*#p.position*] #h(1fr)
                    #start #sym.dash.en #end \
                    #v(0.5em)
                    // highlights or description
                    #for hi in p.highlights [
                        - #eval(hi, mode: "markup")
                    ]
                ]
                index = index + 1
            }
        }
    ]}
}


#let cv获奖(info, isbreakable: true) = {
    if info.work != none {block[
        == #text(font:"Source Han Serif")[获奖/专利情况]

        #for w in info.获奖 {
            // block(width: 100%, breakable: isbreakable)[
            //     // line 1: company and location
            //     #if w.url != none [
            //         *#link(w.url)[#w.organization]* #h(1fr) *#w.location* \
            //     ] else [
            //         *#w.organization* #h(1fr) *#w.location* \
            //     ]
            // ]
            // create a block layout for each work entry
            let index = 0
            for p in w.positions {
                if index != 0 {v(0.6em)}
                block(width: 100%, breakable: isbreakable, above: 0.6em)[
                    // parse ISO date strings into datetime objects
                    #let start = utils.strpdate(p.startDate)
                    #let end = utils.strpdate(p.endDate)
                    // line 2: position and date range
                    // #text(style: "italic")[#p.position] #h(1fr)
                    // font:"FangSong"
                    // #text(font: "Source Han Serif")
                     #text(style: "italic",font: ("Times New Roman","Source Han Serif"))[*#p.position*] #h(0.9fr) *#p.highlights* #h(0.1fr)
                    #start #sym.dash.en #end \
                    #v(-0.3em)
                    // highlights or description
                    // #for hi in p.highlights [
                    //     - #eval(hi, mode: "markup")
                    // ]
                ]
                index = index + 1
            }
        }
    ]}
}

#let cveducation(info, isbreakable: true) = {
    if info.education != none {block[
        == #text(font:"Source Han Serif")[教育经历]
        #for edu in info.education {
            let start = utils.strpdate(edu.startDate)
            let end = utils.strpdate(edu.endDate)

            let edu-items = ""
            edu-items = edu-items + "- *成绩*: " + str(edu.成绩)+" , "+str(edu.排名)+"/"+ str(edu.总人数)+" ("+str({calc.round(edu.排名/edu.总人数*100,digits: 2)})+ "%)\n"
            if edu.英语 != none {edu-items = edu-items + "- *英语*: CET-4 (" + str(edu.英语.CET4) + ")\n"}
            if edu.主修课程 != none {edu-items = edu-items + "- *主修课程*: " + edu.主修课程.join(", ") + "\n"}
            // if edu.highlights != none {
            //     for hi in edu.highlights {
            //         edu-items = edu-items + "- " + hi + "\n"
            //     }
            //     edu-items = edu-items.trim("\n")
            // }

            // create a block layout for each education entry
            block(width: 100%, breakable: isbreakable)[
                // line 1: institution and location
                #if edu.url != none [
                    *#link(edu.url)[#edu.institution]* #h(1fr) *#edu.location* \
                ] else [
                    *#edu.institution* #h(1fr) *#edu.location* \
                ]
                // line 2: degree and date
                #text(style: "italic",font: "fangsong")[#edu.专业] #h(1fr)
                #start #sym.dash.en #end \
                #eval(edu-items, mode: "markup")
            ]
        }
    ]}
}

#let cvaffiliations(info, isbreakable: true) = {
    if info.affiliations != none {block[
        == #text(font:"Source Han Serif")[获奖经历]
        #for org in info.affiliations {
            // parse ISO date strings into datetime objects
            let start = utils.strpdate(org.startDate)
            let end = utils.strpdate(org.endDate)

            // create a block layout for each affiliation entry
            block(width: 100%, breakable: isbreakable)[
                // line 1: organization and location
                #if org.url != none [
                    *#link(org.url)[#org.organization]* #h(1fr) *#org.location* \
                ] else [
                    *#org.organization* #h(1fr) *#org.location* \
                ]
                // line 2: position and date
                #text(style: "italic")[#org.position] #h(1fr)
                #start #sym.dash.en #end \
                // highlights or description
                #if org.highlights != none {
                    for hi in org.highlights [
                        - #eval(hi, mode: "markup")
                    ]
                } else {}
            ]
        }
    ]}
}

#let cvprojects(info, isbreakable: true) = {
    if info.projects != none {block[
        == #text(font:"Source Han Serif")[项目经历]
        #for project in info.projects {
            // parse ISO date strings into datetime objects
            let start = utils.strpdate(project.startDate)
            let end = utils.strpdate(project.endDate)
            // create a block layout for each project entry
            block(width: 100%, breakable: isbreakable)[
                // line 1: project name
                    *#project.name* \

                // line 2: organization and date
                #v(-0.5em)
                 #text(style: "italic",font: "fangsong")[#project.affiliation]  #h(1fr) #start #sym.dash.en #end \
                // summary or description
                #for hi in project.highlights [
                    - #eval(hi, mode: "markup")
                ]
            ]
        }
    ]}
}

#let cvawards(info, isbreakable: true) = {
    if info.awards != none {block[
        == Honors & Awards
        #for award in info.awards {
            // parse ISO date strings into datetime objects
            let date = utils.strpdate(award.date)
            // create a block layout for each award entry
            block(width: 100%, breakable: isbreakable)[
                // line 1: award title and location
                #if award.url != none [
                    *#link(award.url)[#award.title]* #h(1fr) *#award.location* \
                ] else [
                    *#award.title* #h(1fr) *#award.location* \
                ]
                // line 2: issuer and date
                Issued by #text(style: "italic")[#award.issuer]  #h(1fr) #date \
                // summary or description
                #if award.highlights != none {
                    for hi in award.highlights [
                        - #eval(hi, mode: "markup")
                    ]
                } else {}
            ]
        }
    ]}
}

#let cvcertificates(info, isbreakable: true) = {
    if info.certificates != none {block[
        == Licenses & Certifications

        #for cert in info.certificates {
            // parse ISO date strings into datetime objects
            let date = utils.strpdate(cert.date)
            // create a block layout for each certificate entry
            block(width: 100%, breakable: isbreakable)[
                // line 1: certificate name
                #if cert.url != none [
                    *#link(cert.url)[#cert.name]* \
                ] else [
                    *#cert.name* \
                ]
                // line 2: issuer and date
                Issued by #text(style: "italic")[#cert.issuer]  #h(1fr) #date \
            ]
        }
    ]}
}

#let cvpublications(info, isbreakable: true) = {
    if info.publications != none {block[
        == Research & Publications
        #for pub in info.publications {
            // parse ISO date strings into datetime objects
            let date = utils.strpdate(pub.releaseDate)
            // create a block layout for each publication entry
            block(width: 100%, breakable: isbreakable)[
                // line 1: publication title
                #if pub.url != none [
                    *#link(pub.url)[#pub.name]* \
                ] else [
                    *#pub.name* \
                ]
                // line 2: publisher and date
                Published on #text(style: "italic")[#pub.publisher]  #h(1fr) #date \
            ]
        }
    ]}
}

#let cvskills(info, isbreakable: true) = {
    if (info.languages != none) or (info.skills != none) or (info.interests != none) {block(breakable: isbreakable)[
        == #text(font:"Source Han Serif")[技能，语言]
        #if (info.languages != none) [
            #let langs = ()
            #for lang in info.languages {
                langs.push([#lang.language (#lang.fluency)])
            }
            - *Languages*: #langs.join(", ")
        ]
        #if (info.skills != none) [
            #for group in info.skills [
                - *#group.category*: #group.skills.join(", ")
            ]
        ]
        #if (info.interests != none) [
            - *研究领域*: #info.interests.join(", ")
        ]
    ]}
}

#let cvreferences(info, isbreakable: true) = {
    if info.references != none {block[
        == References
        #for ref in info.references {
            block(width: 100%, breakable: isbreakable)[
                #if ref.url != none [
                    - *#link(ref.url)[#ref.name]*: "#ref.reference"
                ] else [
                    - *#ref.name*: "#ref.reference"
                ]
            ]
        }
    ]} else {}
}

#let endnote() = {
    place(
        bottom + right,
        block[
            #set text(size: 5pt, font: "Consolas", fill: silver)
            \*This document was last updated on #datetime.today().display("[year]-[month]-[day]") using #strike[LaTeX] #link("https://typst.app")[Typst].
        ]
    )
}
