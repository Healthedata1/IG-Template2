#!/bin/bash
name="IG-Template2"
# $PWD=/Users/ehaas/Documents/FHIR/IG-Template2
path2=/Users/ehaas/Downloads/
path3=/Users/ehaas/Documents/FHIR/IG-tools/
echo "================================================================="
echo === Publish $name IG!!! $(date -u) ===
echo see 'local workflow.md' file for how to use
echo "Positional Parameters"
echo 'source directory = ' $1
echo 'N/A for no terminology server (run faster and offline)= ' $2
echo '$3 = ' $3
echo === create ig.json and ig.xml in $PWD and ../$1 ===
echo "================================================================="
echo getting rid of .DS_Store files since they gum up the igpublisher....
find . -name '.DS_Store' -type f -delete
sleep 1
# git status
echo "================================================================="
echo === run definitions maker with optional source directory name as first argument ===
echo "================================================================="
python3.5 ${path3}definitions.py $1
sleep 1
git status
echo "================================================================="
echo === run igpublisher ===
echo "================================================================="
java -jar ${path2}org.hl7.fhir.igpublisher.jar -ig ig.json -watch -tx $2
