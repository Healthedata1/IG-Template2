<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://hl7.org/fhir" exclude-result-prefixes="html f">
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="f:extension[@url='http://hl7.org/fhir/StructureDefinition/igpublisher-spreadsheet']"/>
  <xsl:template match="f:ImplementationGuide/f:definition/f:page">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
      <xsl:if test="not(descendant-or-self::f:page[f:nameUrl/@value='artifacts.html'])">
        <page xmlns="http://hl7.org/fhir">
          <nameUrl value="artifacts.html"/>
          <title value="Artifacts Summary"/>
          <generation value="html"/>
          <xsl:call-template name="artifactPages"/>
        </page>
      </xsl:if>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="f:page[f:nameUrl/@value='artifacts.html']">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
      <xsl:call-template name="artifactPages"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template name="artifactPages">
    <xsl:for-each select="/f:ImplementationGuide/f:definition/f:grouping">
      <xsl:for-each select="parent::f:definition/f:resource[f:groupingId/@value=current()/@id]">
        <page xmlns="http://hl7.org/fhir">
          <nameUrl value="{f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-page']/f:valueUri/@value}"/>
          <title value="{f:name/@value}"/>
          <generation value="html"/>
        </page>      
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>  