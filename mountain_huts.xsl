<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4-portrait"
              page-height="29.7cm" page-width="21.0cm" margin="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4-portrait">
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-family="Calibri" linefeed-treatment="preserve">
            <xsl:apply-templates select="catalogue/huts/hut"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="catalogue/huts/hut">
    <fo:block page-break-before="always" />

    <fo:block position="relative" text-align = "center" font-family="Calibri" font-weight="normal" font-size="36pt" color="#145A32" margin-bottom="0.8cm">
      <xsl:apply-templates select="@typeID"/>
      <fo:inline position="relative" text-align = "center" font-weight="bold" font-size="48pt">
        <xsl:apply-templates select="name"/>
      </fo:inline>
    </fo:block>

    <fo:block position="absolute" text-align = "center" margin-bottom="0.8cm">
      <fo:external-graphic content-width="130mm"  src="./images/{@image}"/>
    </fo:block>

    <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black">
      <xsl:text>Планина:</xsl:text>
      <fo:inline position="relative" padding-left="4mm" font-family="Calibri">
        <xsl:apply-templates select="@mountainID"/>
      </fo:inline>
    </fo:block>



        <xsl:apply-templates select="gps"/>
        <xsl:apply-templates select="location"/>
        <xsl:apply-templates select="description"/>
        <xsl:apply-templates select="beds"/>
        <xsl:apply-templates select="nearby"/>
  </xsl:template>

  <xsl:template match="@typeID">
    <xsl:variable name="typeRef" select="."/>
    <xsl:value-of select="/catalogue/types/type[@id = $typeRef]/@name"/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="name">
    <xsl:text>"</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="@mountainID">
    <xsl:variable name="mountainRef" select="."/>
    <xsl:value-of select="/catalogue/mountains/mountain[@id = $mountainRef]/@name"/>
  </xsl:template>

  <xsl:template match="location">
    Разположение: <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="gps">
    Координати:
    • Надморска височина: <xsl:value-of select="./altitude"/>
    • Географска ширина: <xsl:value-of select="./latitude"/>
    • Географска дължина: <xsl:value-of select="./longitude"/>
  </xsl:template>










</xsl:stylesheet>
