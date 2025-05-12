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
  (
    key: "PHot",
    short: "performance hotspot",
    plural: "performance hotspots",
    long: [ "sections of code that, if optimized, would yield the best overall speed-up" @bernecky_profiling_1989 ]
  ),
  (
    key: "IDE",
    short: "IDE",
    long: "Integrated Development Environment",
    //long: "A toolset for writing, analysing, testing and executing software."
  )
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
    Using profiling tools, it is possible to locate #glspl("PHot", long: false) which are #gls("PHot", long: true). \
    To achieve this, the written user code is executed and recorded as a call graph, i. e. the relationship between a function and those it is calling. Such a recording can provide information about the number of calls and time spent in each function.
    This report aims to describe different techniques of profiling, including their benefits, limitations and possible inaccuracies. Additionally a conceptual overview of a predictive profiling tool, as proposed in @hu_towards_2025, is given.
  ],
  acronyms: [
    #heading(outlined: false)[Glosarry / Acronyms Index]

    #print-glossary(glossary, disable-back-references: true)
  ],
  bibliography: bibliography("bib/bib.bib", full: true),
  acknowledgements: none,
)


= Introduction

Improving the perfomance of a computational program is consistent goal in software development, while underlying platforms and abstractions are becoming more optimized, the computational tasks are growing increasingly complex.

Provided with the task of improving runtime, a software designer might take an educated guess or create specific tests to narrow down the hypothesis. Both lack a qualitative assurance, do the tests reflect accurately the performance issue or describe an entirely different performance issue? @bernecky_profiling_1989
CPU profiling offers quantitative measurements of runtime associated with specific user symbols, the profiling techniques vary in degree of intrusion, detail and accuracy of measurement.

#linebreak()
This report will describe an overview different profiling tools and their uses.
Those presented base on an iterative code-improvement cycle:
- Execution using a profiler
- Analysing results for #glspl("PHot", long: false)
- Inspecting hotspot code for optimization
The concept of predictive profiling, i. e. predicting the profiling results without compiling the source code, as part of an #gls("IDE"), will be summarized. @hu_towards_2025

== Motivation
In the process of iterative code-improvement, badly designed code may be visible early on, for example a long running function with little computational complexity.
Manually finding #glspl("PHot") in basic concepts as data structures or wrapping abstractions may be less obvious or simply infeasible due to the size of complex programs.

== Usage of electronic tools
- Typst - General Visualization framework
- VSCode - Editing && Debugging
- #gls-short("TUHH") typst ies-report template
- Google Scholar - Source discovery
- Generative AI - ChatGPT acquiring topic outline, source discovery
- Generative AI - Github Copilot code autocomplete, not used for writing passges

= Preliminaries

= Conclusion

Using an abbreviation like #gls("TUHH") is a good idea.