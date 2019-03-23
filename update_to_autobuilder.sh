#!/bin/bash
name="IG-Template"
# NO "/" AT THE END
path1=/Users/ehaas/Documents/FHIR/IG-Template2
# path2=/Users/ehaas/Documents/FHIR/IG-Template2/newfolder
# path2=/Users/ehaas/Documents/FHIR/IG-Test3
# path2=/Users/ehaas/Documents/FHIR/IG-Sampler
# path2=/Users/ehaas/Documents/FHIR/US-Core-R4
# path2=/Users/ehaas/Documents/FHIR/Davinci-DEQM
# path2=/Users/ehaas/Documents/FHIR/Davinci-DEQM-r4
# path2=/Users/ehaas/Documents/FHIR/VhDir
# path2=/Users/ehaas/Documents/FHIR/OMHtoFHIR
# path2=/Users/ehaas/Documents/FHIR/Argo-ClinicalNotes

path2=/Users/ehaas/Documents/FHIR/ig_test

filelist="framework generated_output base.html ex.html format.html sd.html sd-definitions.html sd-mappings.html pub3.sh"
for f in ${filelist}; do
  echo copy -R ${path1}/${f} to ${path2}
  cp -R ${path1}/${f} ${path2}
done;
mkdir ${path2}/output
# change definitions file to work from local directory
sed -i '' -e 's/paths.output,docs/paths.output,output/g' ${path2}/definitions.csv  # change output from 'docs' to 'output'
sed -i '' -e 's/"output": "docs"/"output": "output"/g' ${path2}/ig.json  # change output from 'docs' to 'output'
#add docs to .gitIgnore file
sed -i '' -e 's/#docs  #if not using Git-Pages/docs  #if not using Git-Pages/g' ${path2}/.gitignore
