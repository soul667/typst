//Function to insert TODO
#let todo(body, inline: false, big_text: 40pt, small_text: 15pt, gap: 2mm) = {
    // set text(fill: red)
    box([#rect(fill: black)[
#text(fill:white)[TODO:#body]
    ] 
    // #rect(fill: blue)
    #place()[    
      #set text(size: 0pt)
      #figure(kind: "todo", supplement: "", caption: body, [])
    ]])
    
  }
 

//Function to insert TODOs outline
// #let todo_outline = outline(
//     title: [TODOs],
//     target: figure.where(kind: "todo"),
// )

