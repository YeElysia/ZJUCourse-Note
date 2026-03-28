#let base_color = (
  _red: (189, 81, 81),
  _orange: (199, 122, 35),
  _yellow: (177, 140, 27),
  _green: (71, 143, 20),
  _cyan: (18, 125, 82),
  _blue: (5, 132, 168),
  _purple: (114, 98, 147),
)
#let callout_color = (
  info: base_color._blue,
  warning: base_color._orange,
  note: base_color._blue, // default
  question: base_color._orange,
  abstract: base_color._cyan, // summary
  summary: base_color._cyan,
  todo: base_color._blue,
  success: base_color._green,
  failure: base_color._red,
  danger: base_color._red, //error
  error: base_color._red,
  tip: base_color._cyan,
  bug: base_color._red,
  example: base_color._purple,
  folder: base_color._purple,
  quote: (158, 158, 158),
)
#let callout(type, body, title) = {
  block(
    width: 100%,
    fill: rgb(callout_color.at(type).at(0), callout_color.at(type).at(1), callout_color.at(type).at(2), 25),
    inset: (left: 24pt, rest: 12pt),
    radius: 8pt,
    breakable: true,
  )[
    #block(
      height: 22pt,
      inset: (top: 3pt, bottom: 3pt),
      grid(
        align: horizon,
        columns: (18pt, auto),

        image("svg/" + type + ".svg", width: 16pt),
        text(
          rgb(callout_color.at(type).at(0), callout_color.at(type).at(1), callout_color.at(type).at(2)),
          size: 16pt,
          font: ("Maple Mono NF", "LXGW WenKai Mono Screen"),
        )[#h(0.25em) *#upper(type)* #title],
      ),
    )

    #set text(size: 12pt, font: ("Maple Mono NF", "LXGW WenKai Mono Screen"))
    #v(0em)
    #body
    #v(0.2em)
  ]
}




#let Info(body, title: "") = callout("info", body, title)
#let Warning(body, title: "") = callout("warning", body, title)
#let Note(body, title: "") = callout("note", body, title)
#let Question(body, title: "") = callout("question", body, title)
#let Abstract(body, title: "") = callout("abstract", body, title)
#let Summary(body, title: "") = callout("summary", body, title)
#let Todo(body, title: "") = callout("todo", body, title)
#let Success(body, title: "") = callout("success", body, title)
#let Failure(body, title: "") = callout("failure", body, title)
#let Danger(body, title: "") = callout("danger", body, title)
#let Error(body, title: "") = callout("error", body, title)
#let Tip(body, title: "") = callout("tip", body, title)
#let Bug(body, title: "") = callout("bug", body, title)
#let Example(body, title: "") = callout("example", body, title)
#let Folder(body, title: "") = callout("folder", body, title)
#let Quote(body, title: "") = callout("quote", body, title)
