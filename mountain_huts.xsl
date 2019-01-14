<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4-portrait"
              page-height="29.7cm" page-width="21.0cm" margin="1.5cm">
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
      <fo:inline position="relative" text-align = "center" font-family="Monotype Corsiva" font-weight="bold" font-size="48pt">
        <xsl:apply-templates select="name"/>
      </fo:inline>
    </fo:block>

    <fo:block position="absolute" text-align = "center" margin-bottom="0.8cm">
      <fo:external-graphic content-width="130mm"  src="./images/{@image}"/>
    </fo:block>

    <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black" margin-bottom="0.4cm">
      <xsl:text>Планина:</xsl:text>
      <fo:inline position="relative" padding-left="3mm" font-family="Calibri" font-weight="normal">
        <xsl:apply-templates select="@mountainID"/>
      </fo:inline>
    </fo:block>

    <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black" margin-bottom="0.4cm">
      <xsl:text>Разположение:</xsl:text>
      <fo:inline position="relative" padding-left="3mm" font-family="Calibri" font-weight="normal">
        <xsl:apply-templates select="location"/>
      </fo:inline>
    </fo:block>

    <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black" margin-bottom="0.4cm">
      <xsl:text>Координати:</xsl:text>
    </fo:block>
    <fo:table height="100px" width="450px">
  	<fo:table-header>
  		<fo:table-row>
  			<fo:table-cell padding-right="10mm" font-family="Calibri" font-weight="bold" font-size="12pt" text-align="center">
  				<fo:block>Надморска височина</fo:block>
  			</fo:table-cell>
  			<fo:table-cell padding-right="10mm" font-family="Calibri" font-weight="bold" font-size="12pt" text-align="center">
  				<fo:block>Географска ширина</fo:block>
  			</fo:table-cell>
        <fo:table-cell padding-right="10mm" font-family="Calibri" font-weight="bold" font-size="12pt" text-align="center">
          <fo:block>Географска дължина</fo:block>
        </fo:table-cell>
  		</fo:table-row>
  	</fo:table-header>
      <fo:table-body>
    		<fo:table-row>
    			<fo:table-cell padding-right="3mm" padding-before="2mm" padding-after="2mm">
    				<fo:block text-align="center">
    					<xsl:value-of select="./gps/altitude"/>
    				</fo:block>
    			</fo:table-cell>
    			<fo:table-cell padding-right="3mm" padding-before="2mm" padding-after="2mm">
    				<fo:block text-align="center">
    					<xsl:value-of select="./gps/latitude"/>
    				</fo:block>
    			</fo:table-cell>
          <fo:table-cell padding-right="3mm" padding-before="2mm" padding-after="2mm">
            <fo:block text-align="center">
              <xsl:value-of select="./gps/longitude"/>
            </fo:block>
          </fo:table-cell>
    		</fo:table-row>
      </fo:table-body>
    </fo:table>

    <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black" margin-bottom="0.4cm">
      <xsl:text>Описание:</xsl:text>
      <fo:inline position="relative" text-align = "justify" padding-left="3mm" font-family="Calibri" font-weight="normal">
      <xsl:apply-templates select="description"/>
      </fo:inline>
    </fo:block>

    <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black" margin-bottom="0.4cm">
      <xsl:text>Леглова база:</xsl:text>
      <fo:inline position="relative" padding-left="3mm" font-family="Calibri" font-weight="normal">
        <xsl:apply-templates select="beds"/>
      </fo:inline>
    </fo:block>

    <xsl:choose>
      <xsl:when test="./nearby">
        <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black">
          Обекти в близост:
          <fo:block position="relative" margin-left="4mm" font-family="Calibri" font-weight="normal" font-size="14pt" color="black" >
              <xsl:apply-templates select="nearby"/>
          </fo:block>
        </fo:block>
      </xsl:when>
    </xsl:choose>

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
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="gps">
    Координати:
    • Надморска височина: <xsl:value-of select="./altitude"/>
    • Географска ширина: <xsl:value-of select="./latitude"/>
    • Географска дължина: <xsl:value-of select="./longitude"/>
  </xsl:template>

  <xsl:template match="description">
    <xsl:for-each select="./detail">
      <xsl:value-of select="."/>
      <xsl:text> </xsl:text>
    </xsl:for-each>
  </xsl:template>


  <xsl:template match="nearby">
    <xsl:for-each select="./destination">
      • <xsl:value-of select="@name" />
      <xsl:choose>
        <xsl:when test="@time">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="@time" />
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
