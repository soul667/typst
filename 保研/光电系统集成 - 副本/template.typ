// 创建自己的主题
#import "@preview/touying:0.4.2": *

#let register(
  self: themes.default.register(),
  aspect-ratio: "16-9",
) = {
  self.page-args += (
    paper: "presentation-" + aspect-ratio,
  )
  self.methods.init = (self: none, body) => {
    set text(size: 20pt)
    body
  }
  self
}

// main.typ
#import "@preview/touying:0.4.2": *
#import "bamboo.typ"

#let s = bamboo.register(aspect-ratio: "16-9")
#let (init, slides, touying-outline, alert, speaker-note) = utils.methods(s)
#show: init

#show strong: alert

#let (slide, empty-slide) = utils.slides(s)
#show: slides

= First Section

== First Slide

#slide[
  A slide with a title and an *important* information.
]