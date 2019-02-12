<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<TPL>
			<xsl:apply-templates mode="copy" select="node()/*"/>
		</TPL>
	</xsl:template>
	<xsl:template match="node()">
		<xsl:copy-of select="*"/>stuff
	</xsl:template>
	<xsl:template match="*" mode="copy">
		<xsl:element name="{name()}" namespace="{namespace-uri()}">
			<xsl:apply-templates select="@*|node()" mode="copy"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="@*|text()|comment()" mode="copy">
		<xsl:copy/>
	</xsl:template>
</xsl:stylesheet>
