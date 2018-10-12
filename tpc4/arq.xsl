<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:result-document href="website/index.html">
            <html>
                <meta charset="UTF-8"/>
            </html>
            <body>
                <h2>Arqueossítios do NW português</h2>
                <hr/>
                <ol>
                    <xsl:apply-templates select="//CONCEL[not(.=preceding::CONCEL)]">
                        <xsl:sort select="."/>
                    </xsl:apply-templates>
                </ol>
            </body>
        </xsl:result-document>
        <xsl:apply-templates mode="conteudo"/>
    </xsl:template>
    
   <!-- Páginas individuais -->
    
    <xsl:template match="ARQELEM" mode="conteudo">
        <xsl:result-document href="website/html/arq{generate-id()}.html">
            <html>
                <head>
                    <meta charset="UTF-8"/>
                    <title><xsl:value-of select="IDENTI"/></title>
                </head>
                <body>
                    <h1><xsl:value-of select="IDENTI"/></h1>
                    <h2><xsl:value-of select="DESCRI"/></h2>
                    <dl>
                        <dt>Lugar:</dt>
                        <dd><xsl:value-of select="LUGAR"/></dd>
                        <dt>Freguesia:</dt>
                        <dd><xsl:value-of select="FREGUE"/></dd>
                        <dt>Concelho:</dt>
                        <dd><xsl:value-of select="CONCEL"/></dd>
                    </dl>
                    <p>
                        <xsl:value-of select="ACESSO"/>
                    </p>
                    <p>
                        <xsl:value-of select="QUADRO"/>
                    </p>
                    <p>
                        <xsl:value-of select="DARQ"/>
                    </p>
                    <address>[<a href="http://localhost:12345/website/index.html">Voltar à página principal</a>]</address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="CONCEL">
        <xsl:variable name="c" select="."/>
        <li>
            <xsl:value-of select="."/>
            <ol>
                <xsl:for-each select="//ARQELEM[$c=CONCEL]">
                    <xsl:sort select="IDENTI"/>
                    <li>
                        <a href="http://localhost:12345/website/html/arq{generate-id()}.html">
                            <xsl:value-of select="IDENTI"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ol>
        </li>
    </xsl:template>
    
</xsl:stylesheet>