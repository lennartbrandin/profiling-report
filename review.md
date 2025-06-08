# "Code Profiling" Report Review

by Danylo Kozak

## Form and Structure

### Structure

The report is well structured into sections and subsections, which are clearly defined and logically ordered. Each subsections dives deeper into specific aspects of profiling, starting from the basics and moving towards more advanced topics.

However, the outline granularity could be improved. For example, the section on "Usage of electronic tools" splits too much into subsections that could be combined for better readability. You could use bulleted list instead of subsections for the tools.

### Citations

The citations are placed appropriately throughout the text. However, the format of citations should be reworked to follow an academic style (which I guess is planned as a TODO).

### Tables and Figures

There is currently only one table, which is gives a nice overview of the profiling methods. It may be beneficial to add more tables or figures to illustrate the concepts discussed.

Listings 1-3 are used effectively to demonstrate the output of profiling tools, but they could benefit from more context or explanation in the text.

### Language

The language used is appropriate for an academic report. It is precise and avoids unnecessary filler words. I would recommend using bulleted lists for the parts where you list title in bold and describe them in the text, as this would improve readability, so that:

**Call count (Total)** Collective count of all calls to this function

**Call duration (Total & per call)** CPU time inside the call including children

**Call time usage (Total and per call)** CPU time used exclusively in the call

**Call relationship/graph** Call stack, for hierarchy visualization

becomes:

- **Call count (Total)**: Collective count of all calls to this function
- **Call duration (Total & per call)**: CPU time inside the call including children
- **Call time usage (Total and per call)**: CPU time used exclusively in the call
- **Call relationship/graph**: Call stack, for hierarchy visualization

### Argumentation and Logic

The reasoning is generally clear and logical, and I cannot object to any major gaps in the argumentation.

### Conciseness

The report is concise and avoids unnecessary repetition. However, some sections could benefit from more detailed explanations, especially for readers who may not be familiar with the topic.

## Content

### Motivation

The motivation is really factual and provides sort of TL;DR for the topic. However, it provides too much information, in my opinion, and could be shortened to focus on the motivation for profiling in general, rather than the specific tools and methods.

### Topic

The argumentation for the contents is pretty clear and doesn't leave any important aspects unanswered. Some section currently left as TODOs, would contribute to a more complete understanding of the topic.

### Independence

The report does not develop new solutions approaches, but I guess this is not the goal of the report. It does, however, show an independent reflection on the topic and examines it critically.

### Contemplation

Report currently lacks a conclusion (TODO).

## Summary

Overall, the report provides a solid overview of profiling, its methods, and tools. It is well-structured and uses appropriate language. However, it could benefit from more detailed explanations in some sections, additional figures or tables, and a conclusion to summarize the findings. The TODOs should be addressed to complete the report and improve its comprehensiveness.