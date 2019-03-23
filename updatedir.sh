#!/bin/bash
name="IG-Template"


# NO "/" AT THE END
path1=/Users/ehaas/Documents/FHIR/IG-Template2
pathlist="/Users/ehaas/Documents/FHIR/Argo-ClinicalNotes"

# pathlist="/Users/ehaas/Documents/FHIR/IG-Template2/newfolder"

# /Users/ehaas/Documents/FHIR/IG-Test3 /Users/ehaas/Documents/FHIR/IG-Sample
# /Users/ehaas/Documents/FHIR/US-Core-R4
# /Users/ehaas/Documents/FHIR/Davinci-DEQM
# /Users/ehaas/Documents/FHIR/Davinci-DEQM-r4 /Users/ehaas/Documents/FHIR/VhDir
# /Users/ehaas/Documents/FHIR/OMHtoFHIR
# /Users/ehaas/Documents/FHIR/Argo-ClinicalNotes
# /Users/ehaas/Documents/FHIR/Argo-Questionnaire"
dir="framework"
#filelist="source/pages/html_pages.html source/pages/toc.md framework/_includes/toc-generator.md source/pages/all-examples.md framework/_includes/example-list-generator.md framework/_config.yml framework/_includes/breadcrumbs.html framework/_includes/pagenumber.html framework/_includes/publish-box.html framework/_includes/footer.html framework/_layouts/default.html framework/_layouts/fhir-artifact.html framework/assets/css/project.css sd.html pub3.sh push.sh source/pages/downloads.md framework/_includes/schematron-list-generator.md framework/_includes/examplebutton.html framework/_includes/header.html framework/_includes/copy-me.html framework/assets/js/clipboard.min.js"
for p in ${pathlist}; do
for f in ${dir}/*; do
echo copy -R ${path1}/${f} to ${p}/${dir}
cp -R ${path1}/${f} to ${p}/${dir}
done;
done;
