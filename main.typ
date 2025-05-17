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
#show link: underline

#let glossary = (
  (
    key: "TUHH",
    short: "TUHH",
    long: "Hamburg University of Technology",
  ),
  (
    key: "PHot",
    short: "bottleneck",
    long: "performance hotspot",
    description: [ sections of code that, if optimized, would yield the best overall speed-up @bernecky_profiling_1989 ]
  ),
  (
    key: "IDE",
    short: "IDE",
    long: "Integrated Development Environment",
    description: "A toolset for writing, analysing, testing and executing software."
  ),
  (
    key: "HBug",
    short: "heisenbug",
    long: "Heisenberg bug",
    description: "A bug that occurs only while observing the program"
  ),
  (
    key: "PMU",
    short: "PMU",
    long: "Performance Monitoring Unit",
    description: "A hardware implementation of monitoring functions"
  ),
  (
    key: "VM",
    short: "VM",
    long: "Virtual Machine"
  ),
  (
    key: "PPredict",
    short: "Predictive Profiling",
    long: "Predicting Profiling results",
    description: "A method of predicting performance based on previous profiles"
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
    Using profiling tools, it is possible to locate @PHot:pl.
    To achieve this, the written user code is executed and recorded as a call graph, i. e. the relationship between a function and those it is calling. Such a recording can provide information about the number of calls and time spent in each function.
    This report aims to describe different techniques of profiling, including their benefits, limitations and possible inaccuracies. Additionally a conceptual overview of a predictive profiling tool, as proposed in @hu_towards_2025, is given and compared to the usage of "traditional" profiling tools.
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
- Analysing results for @PHot:pl
- Inspecting hotspot code for optimization
The concept of predictive profiling, i. e. predicting the profiling results without compiling the source code, as part of an @IDE will be summarized. @hu_towards_2025

== Motivation
In the process of iterative code-improvement, badly designed code may be visible early on, for example a long running function with little computational complexity.
Manually finding @PHot:pl in low level abstractions, for example, data structures or wrapping functions may be less obvious or simply infeasible due to the size and spread of function calls in complex programs.
While it is possible to manually measure function runtime by printing time stamps, it is tedious, error prone, and does not provide information about the summed or average execution time of all collective calls to a function.
Profilers aim to ease spotting these issues by collecting statistics during the execution and providing a profile used for visualising the performance distribution over the program.
// https://www.usenix.org/conference/atc17/program/presentation/gregg-flame
Different visualisation offer specialized insights, _flame graphs_ show a linear overview of functions calls and their hierarchy, which give a general clue what the program is doing as the program execution progesses. A table, listing the functions and their runtime statistics, provides condensed information about how to spend optimization efforts.

Profilers do not require any prior implementation so they can applied on any program.
Since the profile represents a statistical measure of the programs runtime, profiles can be accumulated and compared to indentify changes inbetween runs. This could be used to spot performance regression over multiple versions of a program.
When runs are performed with different inputs, the profiles could be used to predict the application runtime growth.

Monitoring these information provide a way of identifying and solving a broad spectrum of performance issues before they occur in a critical manner. @bernecky_profiling_1989



== Usage of electronic tools
The following tools were used to design, research, write this report in the described extent.
=== Typst - Typesetting
Typst is a typsetting language, used here to simplify the design process by providing an underlying system of using templates, styles and citations.
This report was designed using the #link("https://collaborating.tuhh.de/es/ce/public/tuhh-typst")[ @TUHH typst ies-report template ].
=== VSCode - @IDE
Visual Studio Code is a general purpose editor, mainly used here to write the report and provide macros and debugging features for Typst.
=== Git/Jujutsu - Version control
Jujutsu is a git based version control system, used for tracking changes, proof of work, and backing up the report.
=== Google Scholar - Research
Google Scholar a is a search engine used to find the papers and articles this report is founding upon.
=== Generative AI - LLMs
Different large language models were used in the creation process.

Different models were also used for general text conversion processes. (E.g converting between languages and formats)

==== ChatGPT
ChatGPT's "Deep Research" tool was used to generate a sourced, broad #link("https://chatgpt.com/share/6827512a-d998-8008-9d04-14b5d664b1c9", "overview of the topic") and finding articles covering the topic.
It was also used to generate a quick #link("https://chatgpt.com/share/68275243-c840-8008-b820-8b7fd4110ab8", "summary") of the paper @hu_towards_2025.

==== Github Copilot
Is a code completion tool, used as a more powerful alternative to verb suggestion or refactoring tools.

=== Other
TODO:
- Spellchecking
- Grammar checking

= State of the art
The concept of profiling, i.e the idea of measuring code performance for finding @PHot:pl has been well established since decades.
Many of the current papers concern themselves discuss the usage of profiling (especially focussing @PMU:pl) in higher abstractions, such as @VM:pl or other cloud deployments. Given the growing importance of GPU computing profiling GPU performance is also focused.

The paper @hu_towards_2025 proposes to integrate dynamic @PPredict into the code writing process, as opposed to measuring existing code and predicting runtime per input growth.

This report (and presentation) aims to convey the idea and usage of profilers in simple context in order to provide the other students with a founding knowledge with these tools.

= Preliminaries
This sections contains definitions and background information that will be used in the report.
== Profiling
In profiling were interested in statistical measurements of the function calls in the program including:
- Call count (Total)
- Call duration - CPU time inside the call including children (Total and per call)
- Call time usage - CPU time used exclusively in the call (Total and per call)
- Call relationship/graph - Call stack, for hierarchy visualisation.


=== Instrumentation Method
Using this method, code is _instrumented_ by altering existing functions. Depending on the tool, this includes some form of call counter, recording the amount of calls to this function often seperated per individual caller. Timing information can also be approximately collected but is "complicated on time-sharing systems" @graham_gprof_1982

Since the program is altered for measuring purposes, its behaviour might change in terms of performance or in extreme cases also introduce a @HBug

=== Sampling (Statistical) Method

=== Hypervisors



= Conclusion

Using an abbreviation like @TUHH is a good idea.

@TUHH