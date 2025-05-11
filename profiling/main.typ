#import "@preview/glossarium:0.5.4": (
  make-glossary,
  register-glossary,
  print-glossary,
  gls,
  gls-short,
  glspl,
)
#import "@tuhh/ies-report:0.1.0": report

#show: make-glossary
// #gls("TUHH") is a good idea.
#let glossary = (
  (
    key: "TUHH",
    short: "TUHH",
    long: "Hamburg University of Technology",
  ),
)
#register-glossary(glossary)

#show: report.with(
  title: "Debugging - CPU profiling",
  report-type: "Seminar Report",
  author: "Lennart Brandin",
  academic-grade: none,
  institute: "Debugging – Methodology instead of Confusion",
  date: datetime(year: 2025, month: 5, day: 11),
  first-examiner: none,
  second-examiner: none,
  supervisor: none,
  abstract: [
    Performance profiling is a method of analyzing where execution time is spent. 
    Using profiling tools, it is possible to yield "sections of code that, if optimized, would yield the best overall speed-up." 
  ],
  acronyms: [
    #heading(outlined: false)[Acronyms Index]

    #print-glossary(glossary, disable-back-references: true)
  ],
  bibliography: bibliography("literature.bib"),
  acknowledgements: none,
)


= Introduction

== Motivation

== Usage of electronic tools
- Typst - General Visualization framework
- VSCode - Editing && Debugging
- #gls-short("TUHH") typst ies-report template
- Generative AI - ChatGPT acquiring topic outline, source discovery
- Generative AI - Github Copilot code autocomplete, not used for writing passges

= Preliminaries

= Conclusion

Using an abbreviation like #gls("TUHH") is a good idea.
Citing stuff like @kalmanNewApproachLinear1960 is also a good idea.