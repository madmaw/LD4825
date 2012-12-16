<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>

  <xsl:param name="outputType">svg</xsl:param>
  <xsl:param name="size"/>
  <xsl:param name="content"/>
  <xsl:param name="style"/>


  <xsl:template match="/">
  	<xsl:value-of select="$content"/>_<xsl:value-of select="$style"/>_<xsl:value-of select="$size"/>.<xsl:value-of select="$outputType"/>
  </xsl:template>

</xsl:stylesheet>