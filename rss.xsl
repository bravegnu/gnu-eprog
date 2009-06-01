<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="article">
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<channel>
<link>http://www.bravegnu.org/gnu-eprog/revision.rss</link>
<description>Updates for <xsl:apply-templates select="articleinfo/title" mode="text"/>
</description>
<title>Updates for <xsl:apply-templates select="articleinfo/title" mode="text"/>
</title>
<atom:link href="http://www.bravegnu.org/gnu-eprog/revision.rss" 
           rel="self" type="application/rss+xml" />
<xsl:apply-templates/>
</channel>
</rss>
</xsl:template>

<xsl:template match="articleinfo">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="title" mode="text">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="revhistory">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="revision">
<item>
<title><xsl:apply-templates select="revremark" mode="text"/></title>
<description><xsl:apply-templates select="revremark" mode="text"/></description>
<xsl:apply-templates/>
</item>
</xsl:template>

<xsl:template match="revnumber">
<guid isPermaLink="false">
<xsl:apply-templates/>
</guid>
</xsl:template>

<xsl:template match="date">
<pubDate>
<xsl:apply-templates/>
</pubDate>
</xsl:template>

<xsl:template match="revremark" mode="text">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="*"></xsl:template>

</xsl:stylesheet>