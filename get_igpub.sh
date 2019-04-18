#!/bin/bash

# get the latest ig-pub file
mv /Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar /Users/ehaas/Downloads/org.hl7.fhir.igpublisher-old.jar
curl http://build.fhir.org/org.hl7.fhir.igpublisher.jar -o /Users/ehaas/Downloads/org.hl7.fhir.igpublisher.jar
