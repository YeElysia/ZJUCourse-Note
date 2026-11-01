// 三线表
#let tlt_header(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: (bottom: 1pt),
    [#content],
  )
}

#let tlt_cell(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: none,
    [#content],
  )
}

#let tlt_row(r) = {
  (..r.map(tlt_cell).flatten(),)
}

#let three_line_table(t) = {
  set table(stroke: none)
  show table: it => {
    if table.hline() in it.children {
      return it
    }
    let children = it.children
    let new_children = ()
    for i in children {
      new_children += (i,)
      if repr(i).starts-with("header") {
        new_children += (table.hline(),)
      }
    }
    let meta = it.fields()
    meta.remove("children")
    return table(..meta, table.hline(), ..new_children, table.hline())
  }
  t
}

#let Red(body) = {
  set text(red)
  body
}

#let eq(caption, body) = {
  math.equation(body, block: true, numbering: n => caption)
}

// 表格隔行底色，与《电工电子学》第4章表格一致
#let zebra = (_, y) => if calc.odd(y) { rgb("EAF2F5") }
