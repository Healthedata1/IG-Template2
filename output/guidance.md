
{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

<!-- <div class="note-to-balloters" markdown="1"> -->
### Introduction
{:.self-link}

This is based on {{page.f}}index.html


{% include examplebutton.html example="example" b_title = "Example Button bar" %}

**Each MedicationRequest must have:**

1.  a status
1.  {: .note-to-balloters}an intent code to indicate whether an order or proposal
1.  a medication
1.  a patient
1.  a date for when written
1.  a prescriber

**Each MedicationRequest must support:**

1. {: .note-to-balloters}the `reported` flag signaling that information is from a secondary source such as a patient.
1. {: .note-to-balloters}the encounter
1. the prescription *Sig*


blah blah blah
<!-- </div>  -->

### More Stuff

inline json example exploiting Rouge to highlight inline comment (errors in json):

~~~json
{
"foo":  "bar"  \\adding comment here is shown as a error in jekyll,
"foo2":  "bar2"
}
~~~
<!-- {% raw %}{: .note-to-balloters}{% endraw %} -->

#### And More Stuff
