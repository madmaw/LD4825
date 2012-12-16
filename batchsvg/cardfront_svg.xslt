<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:random="http://exslt.org/random"
                xmlns:math="http://exslt.org/math"
                xmlns:exsl="http://exslt.org/common"
                xmlns:temp="http://temp.org/temp"
                extension-element-prefixes="exsl"
                exclude-result-prefixes="random math exsl">

 	<xsl:param name="width"/>
 	<xsl:param name="height"/>
    <xsl:param name="rounding"/>
    <xsl:param name="stroke"/>
    <xsl:param name="stroke-width"/>
    <xsl:param name="fill"/>
    <xsl:param name="title"/>
    <xsl:param name="description"/>
    <xsl:param name="title-height"/>
    <xsl:param name="description-height"/>

  	<xsl:output method="xml"/>

  	<xsl:template match="/">

		<svg width="{$width}" height="{$height}" viewBox="0 0 {$width} {$height}" version="1.1">
            <defs>
                <rect id="outer-rect" x="{$stroke-width * 2}" y="{$stroke-width * 2}" width="{$width - $stroke-width * 4}" height="{$height - $stroke-width * 4}" rx="{$rounding}" ry="{$rounding}"/>
            </defs>
	    	<g>
                <use xlink:href="#outer-rect" fill="{$fill}"/>
                <text x="{$width div 2}" y="{$title-height + $stroke-width * 4}" text-anchor="middle" font-size="{$title-height}" fill="{$stroke}"><xsl:value-of select="$title"/></text>
                <flowText xmlns="http://xml.apache.org/batik/ext">
                    <flowRegion vertical-align="middle">
                        <rect x="{$stroke-width * 4}" y="{$title-height + $stroke-width * 6}" width="{$width - $stroke-width * 8}" height="{$height - $title-height - $stroke-width * 10}"/>
                    </flowRegion>
                    <flowDiv>
                        <flowPara top-margin="0" justification="begin" fill="{$stroke}" font-size="{$description-height}"><xsl:value-of select="$description"/></flowPara>
                    </flowDiv>
                </flowText>

                <use xlink:href="#outer-rect" stroke-width="{$stroke-width * 2}" stroke="{$stroke}" fill="none"/>
	        </g>
		</svg>
  	</xsl:template>


</xsl:stylesheet>