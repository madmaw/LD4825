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
    <xsl:param name="tongue-width"/>
    <xsl:param name="tongue-length"/>
    <xsl:param name="diamonds-across"/>
    <xsl:param name="diamonds-down"/>
    <xsl:param name="diamond-fill"/>

  	<xsl:output method="xml"/>

  	<xsl:template match="/">

		<svg width="{$width}" height="{$height}" viewBox="0 0 {$width} {$height}" version="1.1">
            <defs>
                <rect id="inner-rect" x="{$stroke-width + $rounding}" y="{$stroke-width + $rounding}" width="{$width - $stroke-width * 2 - $rounding * 2}" height="{$height - $stroke-width * 2 - $rounding * 2}" rx="{$rounding div 2}" ry="{$rounding div 2}"/>
                <rect id="outer-rect" x="{$stroke-width * 2}" y="{$stroke-width * 2}" width="{$width - $stroke-width * 4}" height="{$height - $stroke-width * 4}" rx="{$rounding}" ry="{$rounding}"/>
            </defs>
	    	<g>
                <clipPath id="inner-rect-clip">
                    <use xlink:href="#inner-rect"/>
                </clipPath>
                <use xlink:href="#outer-rect" fill="{$fill}"/>
                <g clip-path="url(#inner-rect-clip)">
                    <g  transform="translate({$rounding + $stroke-width}, {$rounding + $stroke-width})">
                        <xsl:call-template name="cross-hatch">
                            <xsl:with-param name="diamond-width" select="($width - $stroke-width * 2 - $rounding * 2) div $diamonds-across"/>
                            <xsl:with-param name="diamond-height" select="($height - $stroke-width * 2 - $rounding * 2) div $diamonds-down"/>
                            <xsl:with-param name="diamonds-across" select="$diamonds-across"/>
                            <xsl:with-param name="diamonds-down" select="$diamonds-down"/>
                        </xsl:call-template>
                    </g>
                </g>
                <use xlink:href="#inner-rect" stroke-width="{$stroke-width}" stroke="{$stroke}" fill="none"/>
                <path d="
                    M {($width - $tongue-width) div 2} {$stroke-width * 2}
                    L {($width - $tongue-width) div 2} {$tongue-length}
                    L {$width div 2} {$tongue-length - $tongue-width div 2}
                    L {($width + $tongue-width) div 2} {$tongue-length}
                    L {($width + $tongue-width) div 2} {$stroke-width * 2}
                    z
                " stroke-width="{$stroke-width}" stroke="{$stroke}" fill="{$fill}"/>
                <use xlink:href="#outer-rect" stroke-width="{$stroke-width * 2}" stroke="{$stroke}" fill="none"/>
	        </g>
		</svg>
  	</xsl:template>

    <xsl:template name="cross-hatch">
        <xsl:param name="diamond-width"/>
        <xsl:param name="diamond-height"/>
        <xsl:param name="diamonds-across"/>
        <xsl:param name="diamonds-down"/>
        <xsl:param name="diamond-row">0</xsl:param>
        <xsl:param name="diamond-col">0</xsl:param>
        <xsl:choose>
            <xsl:when test="$diamond-col >= $diamonds-across">
                <xsl:call-template name="cross-hatch">
                    <xsl:with-param name="diamond-col" select="0"/>
                    <xsl:with-param name="diamond-row" select="$diamond-row + 1"/>
                    <xsl:with-param name="diamond-height" select="$diamond-height"/>
                    <xsl:with-param name="diamond-width" select="$diamond-width"/>
                    <xsl:with-param name="diamonds-across" select="$diamonds-across"/>
                    <xsl:with-param name="diamonds-down" select="$diamonds-down"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$diamonds-down > $diamond-row">

                <path d="
                M {$diamond-col * $diamond-width + $diamond-width div 2} {$diamond-row * $diamond-height}
                L {$diamond-col * $diamond-width} {$diamond-row * $diamond-height + $diamond-height div 2}
                L {$diamond-col * $diamond-width + $diamond-width div 2} {($diamond-row + 1) * $diamond-height}
                L {($diamond-col + 1) * $diamond-width} {$diamond-row * $diamond-height + $diamond-height div 2}
                z
                " stroke="{$stroke}" stroke-width="{$stroke-width}" fill="{$diamond-fill}"/>

                <xsl:call-template name="cross-hatch">
                    <xsl:with-param name="diamond-col" select="$diamond-col + 1"/>
                    <xsl:with-param name="diamond-row" select="$diamond-row"/>
                    <xsl:with-param name="diamond-height" select="$diamond-height"/>
                    <xsl:with-param name="diamond-width" select="$diamond-width"/>
                    <xsl:with-param name="diamonds-across" select="$diamonds-across"/>
                    <xsl:with-param name="diamonds-down" select="$diamonds-down"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>


    </xsl:template>

</xsl:stylesheet>