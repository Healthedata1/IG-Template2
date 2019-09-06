#!/bin/bash
# exit when any command fails
set -e
path1=/Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar
path2=/Users/ehaas/Downloads/org.hl7.fhir.igpublisher-old.jar
path3=/Users/ehaas/Documents/FHIR/IG-tools/
while getopts ds:tonpwi option
do
 case "${option}"
 in
 d) DEFN=1;;
 s) SOURCE=${OPTARG};;
 t) NA='N/A';;
 o) PUB=1;;
 n) USEDEF=1;;
 p) UPDATE=1;;
 w) WATCH=1;;
 i) INI=1;;
 esac
done
echo "================================================================="
echo === Publish $SOURCE IG!!! $(date -u) ===
echo see 'local workflow.md' file for how to use
echo "Optional Parameters"
echo '-d parameter = create definitions files  = ' $DEFN
echo '-n parameter = use definitions source directory definition files  = ' $USEDEF
echo '-s parameter = source directory = ' $SOURCE
echo '-t parameter for no terminology server (run faster and offline)= ' $NA
echo '-o parameter for running previous version of the igpublisher= ' $PUB
echo '-p parameter for downloading latest version of the igpublisher from source = ' $UPDATE
echo '-w parameter for using watch on igpublisher from source default is on = ' $WATCH
echo '-i parameter for for using the new publishing framework with ig.ini and ig.xml and templates ( oh my !) = ' $INI
echo ' current directory =' $PWD
echo "================================================================="
echo getting rid of .DS_Store files since they gum up the igpublisher....
find . -name '.DS_Store' -type f -delete
sleep 1
# git status
if [[ $UPDATE ]]; then
echo "================================================================="
echo === get the latest ig-pub file ===
echo "================================================================="
#mv /Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar /Users/ehaas/Downloads/org.hl7.fhir.igpublisher-old.jar
# _L flag for redirects
curl -L https://github.com/FHIR/latest-ig-publisher/raw/master/org.hl7.fhir.publisher.jar -o /Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar
sleep 3
fi

if [[ $DEFN ]]; then
  echo "================================================================="
  echo === run definitions maker with optional source directory name as first argument ===
  echo === create ig.json and ig.xml in $PWD and ../$SOURCE ===
  echo "================================================================="
  # need to install python 3.7+ and install "lxml"  module  using 'pip install lxml' on the command line
  python3.5 ${path3}definitions.py $SOURCE
  sleep 3
  git status
fi

if [[ $USEDEF ]]; then

  echo "================================================================="
  echo === use definition files from relative path ../$SOURCE ===
  echo "================================================================="
  cp ../$SOURCE/ig.json $PWD/ig.json
  sed -i "" "s|source/pages|../$SOURCE/source/pages|g" ${PWD}/ig.json
  sed -i "" "s|source/resources|../$SOURCE/source/resources|g" ${PWD}/ig.json
  sed -i "" "s|source/examples|../$SOURCE/source/examples|g" ${PWD}/ig.json
  sleep 3
  git status
fi

if [[ $INI ]]; then
  echo "================================================================="
  echo ===  using the new publishing framework with ig.ini by adding \-ig ig.ini instead of \-ig ig.json option===
  echo "================================================================="
  java -jar ${path1} -ig ig.ini -tx $NA
elif [[ $PUB ]]; then
  echo "================================================================="
  echo === run last known good version of the igpublisherrun most recent version of the igpublisher ===
  echo "================================================================="
  java -jar ${path2} -ig ig.json -watch -tx $NA
else
  echo "================================================================="
  echo ===run most recent version of the igpublisher ===
  echo "================================================================="
  java -jar ${path1} -ig ig.json -watch -tx $NA
fi
