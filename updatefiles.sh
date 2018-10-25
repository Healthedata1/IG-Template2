#!/bin/bash
name="IG-Template"


# DON'T FORGET THE "/" AT THE EN
path1=/Users/ehaas/Documents/FHIR/IG-Template2/
# path2=/Users/ehaas/Documents/FHIR/IG-Template2/newfolder
# path2=/Users/ehaas/Documents/FHIR/IG-Test3/
path2=/Users/ehaas/Documents/FHIR/IG-Sampler/
# path2=/Users/ehaas/Documents/FHIR/US-Core-R4/

filelist="source/pages/html_pages.html source/pages/toc.md framework/_includes/toc-generator.md source/pages/all-examples.md framework/_includes/example-list-generator.md framework/_config.yml framework/_includes/breadcrumbs.html framework/_includes/pagenumber.html framework/_includes/publish-box.html framework/_includes/footer.html framework/_layouts/default.html framework/_layouts/fhir-artifact.html framework/assets/css/project.css sd.html"
for f in ${filelist}; do
echo copy ${path1}${f} to ${path2}${f}
cp ${path1}${f} ${path2}${f}
done;
