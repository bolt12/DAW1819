<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" indent="yes"></xsl:output>
    
    <xsl:template match="/">
        <xsl:result-document href="website/index.html">
            <html>
                <head>
                    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1"/>
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css"/>
                    <title>The Quran</title>
                </head>
                <body class="container has-text-centered">
                    <h1 class="title">The Quran</h1>
                    <h2 class="subtitle">Índice</h2>
                    <ul class="">
                        <xsl:apply-templates select="//sura" mode="indice">
                            <xsl:sort select="bktlong" data-type="number"/>
                        </xsl:apply-templates>
                    </ul>
                    <xsl:apply-templates select="//sura"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="sura" mode="indice">
        <li class="">
            <a href="{generate-id()}.html">
                <xsl:value-of select="bktlong"/>
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="sura">
        <xsl:result-document href="website/{generate-id()}.html">
            <html>
                <head>
                    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1"/>
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css"/>
                    <title><xsl:value-of select="bktlong"/></title>
                </head>
                <body class="">
                    <div class="content">
                        <h1 class="title  has-text-centered"><xsl:value-of select="bktlong"/></h1>
                        <h2 class="subtitle  has-text-centered"><xsl:value-of select="epigraph"/></h2>
                        <br/>
                        <div class="">
                        <xsl:apply-templates select="v"/>
                        </div>
                        <br/>
                        </div>
                    <address class="has-text-centered">[<a href="index.html">Voltar à página principal</a>]</address>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="v">
        <p> <xsl:value-of select="."/> </p>
    </xsl:template>
    
</xsl:stylesheet>