#import "@tuhh/tet-thesis:0.1.0": *
#set text(lang: "de")
#show: tet-thesis.with(
  title: [Review of profiling as a tool for debugging and code improvement],
  author: "Lennart Brandin",
  institute-logo: image("assets/institute-logo.svg"),
  //thesis-type: "",
  language: "en",
  date: datetime.today(),
  date-of-issue: datetime(year: 2024, month: 03, day: 17),
  date-of-submission: datetime(year: 2024, month: 03, day: 17),
  date-format: "[day]. [month repr:long] [year repr:full]",
  first-examiner: [Prof. Dr.-Ing. Aulë],
  second-examiner: [Prof. Dr. rer. nat. Manwë],
  first-supervisor: [Prof. Dr.-Ing. Aulë],
  // second-supervisor: [Somone Else\ and another],
  summary: include "preface/summary.typ",
  notation: include "preface/acro-notation-symbols.typ",
  appendix: (
    enabled: true,
    heading-numbering-format: "A.1.1",
    body: include "appendix/appendix.typ",
  ),
  bibliography: bibliography("references.bib"),
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
  head-font: "Poppins",  // needs to be installed!
  body-font: "New Computer Modern",
)

= Electrodynamic Stuff is Important

This is the link to an external page https://tet.tuhh.de/.
Followed by a reference to the dear Clayton Paul~@Paul_1992_Book.
Somwhere in there you can surely find Maxwell's Equations:
$
nabla dot bold(D) &= rho
$
$
nabla dot bold(B)&=0
$
$
nabla times bold(E) &= -partial/(partial t) bold(B)
$
$
nabla times bold(H) &= bold(J) + partial/(partial t) bold(D)
$



#lorem(50)

== Section 1.1 Title

#lorem(50)

=== Subsection 1.1.1 Title

#lorem(50)

=== Subsection 1.1.1 Title

#lorem(40)

=== Subsection 1.1.1 Title

#lorem(30)

=== Subsection 1.1.1 Title

#lorem(20)

== Section 1.2 Title

#lorem(100)

#figure(
  caption: "All is well!",
  rect(width: 50%)
)

#lorem(250)

#figure(
  caption: "All is good!",
  rect(width: 50%, fill: black)
)

```python
print("Hello World!")
```
<code:hello-world>

#figure(
  ```python
  print("Hello World!")
  ```,
  caption: "This is a listing."
)

#lorem(350)

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}

#let a = table.cell(
  fill: green.lighten(60%),
)[A]
#let b = table.cell(
  fill: aqua.lighten(60%),
)[B]
#figure(
  placement: auto,
  caption: "This is a Table of smth.",
  table(
    columns: 4,
    [], [Exam 1], [Exam 2], [Exam 3],

    [John], [], a, [],
    [Mary], [], a, a,
    [Robert], b, a, b,
  ),
)

= This is the title of my second Chapter Title

#lorem(50)

== My first subsection here

#lorem(1000)

= Another Chapter Title

#lorem(100)

== Another Section Title

#lorem(700)

== Zet Another Section Title

#lorem(1000)
