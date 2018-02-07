#!/bin/bash
name="IG-Template2"
# path1=/Users/ehaas/Documents/FHIR/IG-Template-New/
path2=/Users/ehaas/Downloads/
path3=/Users/ehaas/Documents/FHIR/IG-tools/
echo "================================================================="
echo === Publish $name IG!!! $(date -u) ===
echo use for local source files only it takes no parameters
echo "================================================================="
echo getting rid of .DS_Store files since they gum up the igpublisher....
find . -name '.DS_Store' -type f -delete
sleep 1
git status
sleep 1
echo "================================================================="
echo === run definitions maker ===
echo === create ig.json and ig.xml in $PWD ===
echo === and in ../$1
echo "================================================================="
python3.5 ${path3}definitions.py
sleep 1
git status
echo "================================================================="
echo === run igpublisher ===
echo "================================================================="
java -jar ${path2}org.hl7.fhir.igpublisher.jar -ig ig.json -watch
