# IG-Template2  
Author:  Eric Haas

A template for building an FHIR Implemenation Guide(IG) using the IG publisher and profile spreadsheets.  This is based on the design of the [Argonaut](http://www.fhir.org/guides/argonaut/r2/) and [US-Core](http://hl7.org/fhir/us/core/) IGs.    See the [FHIR IG publisher documentation](http://wiki.hl7.org/index.php?title=IG_Publisher_Documentation)  for how to set up your local environment.

Shows how to create:

- Profiles
- Extensions ( complex and simple )
- CodeSystems
- ValueSets
- Logical Models [todo]
- ConformanceStatements

And the Jekyll templates and static pages to go with them...



### Rendered IG-Template at

http://build.fhir.org/ig/Healthedata1/IG-Template2/index.html


## Setup instructions

You will also need to add the following directories to the same path:

- `temp`
- `output`
- `qa`

[FHIR-IGPub-filebuilder](https://github.com/Healthedata1/FHIR-IGPub-filebuilder) can be used to automate the creation and updating of the `ig.json` and `ig.xml` files based on the content in the definitions.csv file and in `resources` and `examples` directories.  See the inline comments for how to use.  

Some screenshots....
