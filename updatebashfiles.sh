#!/bin/bash
name="IG-Template"


# NO "/" AT THE END
path1=/Users/ehaas/Documents/FHIR/IG-Template2
# path2=/Users/ehaas/Documents/FHIR/IG-Template2/newfolder
# path2=/Users/ehaas/Documents/FHIR/IG-Test3
# path2=/Users/ehaas/Documents/FHIR/IG-Sampler
# path2=/Users/ehaas/Documents/FHIR/US-Core-R4
#  path2=/Users/ehaas/Documents/FHIR/Davinci-DEQM-r4
# path2=/Users/ehaas/Documents/FHIR/Davinci-DEQMVhDir
# path2=/Users/ehaas/Documents/FHIR/OMHtoFHIR
# path2=/Users/ehaas/Documents/FHIR/Argo-ClinicalNotes
# path2=/Users/ehaas/Documents/FHIR/Argo-Questionnaire

filelist="pub3.sh push.sh"
for f in ${filelist}; do
echo copy ${path1}/${f} to ${path2}/${f}
cp ${path1}/${f} ${path2}/${f}
done;
