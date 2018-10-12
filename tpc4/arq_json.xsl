<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <xsl:template match="ARQELEM">
        <xsl:result-document href="website/json/arq{generate-id()}.json">
            {
                "id": "<xsl:value-of select="normalize-space(IDENTI)"/>",
                "desc": "<xsl:value-of select="normalize-space(DESCRI)"/>",
                "lugar": "<xsl:value-of select="normalize-space(LUGAR)"/>",
                "acesso": "<xsl:value-of select="normalize-space(FREGUE)"/>",
                "concelho": "<xsl:value-of select="normalize-space(CONCEL)"/>",
                "freguesia": "<xsl:value-of select="normalize-space(FREGUE)"/>",
                "quadro": "<xsl:value-of select="normalize-space(QUADRO)"/>",
                "descarq": "<xsl:value-of select="normalize-space(DESARQ)"/>"
            }
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>