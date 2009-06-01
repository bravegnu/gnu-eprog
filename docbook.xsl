<?xml version='1.0'?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:t="http://nwalsh.com/docbook/xsl/template/1.0"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
version="1.0">

<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/html/chunk.xsl"/>

<xsl:param name="use.id.as.filename" select="'1'"/>
<xsl:param name="chunk.quietly" select="1"/>

<xsl:param name="generate.revhistory.link" select="1"></xsl:param>

<xsl:param name="generate.toc">
article   toc,title
</xsl:param>

<xsl:param name="html.stylesheet">style.css</xsl:param>

<!-- Layout -->

<!-- 

We do not center the formal objects, because the tables cannot be
centered with in FOP. So we stick with left aligned formal object. For
left aligned formal objects the caption is best put before the object.

-->

<xsl:param name="body.start.indent">0pt</xsl:param>

<xsl:param name="formal.title.placement">
figure before
example before
equation before
table before
procedure before
</xsl:param>

<xsl:attribute-set name="figure.properties" 
     use-attribute-sets="formal.object.properties"/>

<xsl:attribute-set name="formal.object.properties">
  <xsl:attribute name="keep-together.within-column">always</xsl:attribute> 
</xsl:attribute-set>

<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="list.item.spacing">
  <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
</xsl:attribute-set>

<!-- Typography -->

<xsl:param name="section.autolabel">1</xsl:param>

<!-- We would like to call our examples as listings -->

<xsl:param name="local.l10n.xml" select="document('')"/> 
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
  <l:l10n language="en"> 
    <l:gentext key="Example" text="Listing"/>
    <l:gentext key="example" text="Listing"/>
    <l:gentext key="ListofExamples" text="List of Listings"/>
    <l:gentext key="listofexamples" text="List of Listings"/>
    <l:context name="title">
      <l:template name="example" text="Listing&#160;%n.&#160;%t"/>
    </l:context>
    <l:context name="xref">
      <l:template name="example" text="%t"/>
    </l:context>
    <l:context name="xref-number">
      <l:template name="example" text="Listing&#160;%n"/>
    </l:context>
    <l:context name="xref-number-and-title">
      <l:template name="example" text="Listing&#160;%n, &#8220;%t&#8221;"/>
    </l:context>
  </l:l10n>
</l:i18n>

<!-- A grey background for our listings, gives a better indication of
where the code starts and where it ends. -->

<xsl:param name="callout.graphics" select="0"></xsl:param>
<xsl:param name="callout.unicode" select="1"></xsl:param>

<xsl:param name="css.decoration" select="1"></xsl:param>

<xsl:param name="admon.graphics" select="1"></xsl:param>
<xsl:param name="navig.graphics" select="1"></xsl:param>

<xsl:param name="admon.graphics.extension" select="'.png'"></xsl:param>
<xsl:param name="navig.graphics.extension" select="'.png'"></xsl:param>


<xsl:template match="programlisting|screen|synopsis">
  <xsl:param name="suppress-numbers" select="'0'"/>
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:call-template name="anchor"/>

  <xsl:if test="$shade.verbatim != 0">
    <xsl:message>
      <xsl:text>The shade.verbatim parameter is deprecated. </xsl:text>
      <xsl:text>Use CSS instead,</xsl:text>
    </xsl:message>
    <xsl:message>
      <xsl:text>for example: pre.</xsl:text>
      <xsl:value-of select="local-name(.)"/>
      <xsl:text> { background-color: #E0E0E0; }</xsl:text>
    </xsl:message>
  </xsl:if>

  <xsl:choose>
    <xsl:when test="$suppress-numbers = '0'
		    and @linenumbering = 'numbered'
		    and $use.extensions != '0'
		    and $linenumbering.extension != '0'">
      <xsl:variable name="rtf">
	<xsl:call-template name="apply-highlighting"/>
      </xsl:variable>
      <pre class="{name(.)}"><code class="{@language}">
	<xsl:call-template name="number.rtf.lines">
	  <xsl:with-param name="rtf" select="$rtf"/>
	</xsl:call-template>
      </code></pre>
    </xsl:when>
    <xsl:otherwise>
      <pre class="{name(.)}"><code class="{@language}">
	<xsl:call-template name="apply-highlighting"/>
      </code></pre>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="user.head.content">
<script type="text/javascript" src="highlight.pack.js"></script>
<script type="text/javascript">
hljs.initHighlightingOnLoad();
</script>
</xsl:template>

</xsl:stylesheet>
