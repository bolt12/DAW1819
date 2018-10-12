<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="manifesto">
        <html>
            <head>
                <meta charset="UTF-8"></meta>
            </head>
            <body>
                <h1> Manifesto </h1>
                <xsl:apply-templates></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="meta">
        <hr></hr>
        <xsl:apply-templates></xsl:apply-templates>
        <hr></hr>
    </xsl:template>
    
    <xsl:template match="id">
        <div>
            <b>ID: </b> <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="tit">
        <div>
            <b>TÍTULO: </b> <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="subtit">
        <div>
            <b>SUBTÍTULO: </b> <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="begDate">
        <div>
            <b>Data de ínicio: </b> <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="endDate">
        <div>
            <b>Data de fim: </b> <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="supervisor">
        <div>
            <b>Supervisor: </b> <a href="{website}">
                <xsl:value-of select="nome"/>
            </a> - 
            <a href="mailto:{email}">
                Enviar correio
            </a>
        </div>
    </xsl:template>
    
    <xsl:template match="equipa">
        <hr></hr>
        <h2><b>Equipa: </b></h2>
        <ul>
        <xsl:apply-templates></xsl:apply-templates>
        </ul>
        <hr></hr>
    </xsl:template>
    
    <xsl:template match="membro">
        <li>
            <xsl:value-of select="numero"/> - <a href="{website}"> <xsl:value-of select="nome"/> </a> - <a href="mailto:{email}"> <xsl:value-of select="email"/> </a> - <a href="{foto/@path}"> <xsl:value-of select="foto"/> </a>
        </li>
    </xsl:template>
    
    <xsl:template match="resumo">
        <hr></hr>
        <h2>Resumo:</h2>
        <xsl:apply-templates></xsl:apply-templates>
        <hr></hr>
    </xsl:template>
    
    <xsl:template match="para">
        <p>
            <xsl:apply-templates></xsl:apply-templates>
        </p>
    </xsl:template>
    
    <xsl:template match="b">
        <b>
            <xsl:value-of select="."/>
        </b>
    </xsl:template>
    
    <xsl:template match="i">
        <i>
            <xsl:value-of select="."/>
        </i>
    </xsl:template>
    
    <xsl:template match="resultados">
        <hr></hr>
        <h2>Resultados:</h2>
        <ul>
            <xsl:apply-templates></xsl:apply-templates>
        </ul>
        <hr></hr>
    </xsl:template>
    
    <xsl:template match="resultado">
        <li>
        <a href="{@url}"> <xsl:value-of select="."/> </a>
        </li>
    </xsl:template>
    
</xsl:stylesheet>