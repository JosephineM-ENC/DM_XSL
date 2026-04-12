<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
    
    <xsl:variable name="auteur" select="'Charles Baudelaire'"/>
    <xsl:variable name="chemin_css" select="'style.css'"/>
    
    <xsl:template match="/">
        
        <xsl:result-document href="index.html" method="html">
            <xsl:call-template name="layout">
                <xsl:with-param name="page_title" select="'Accueil - Contexte artistique et littéraire des Fleurs du Mal'"/>
                <xsl:with-param name="body_content">
                    <section>
                        <h1><xsl:value-of select="upper-case('L''Albatros')"/></h1>
                        <h2>Accueil - Contexte artistique et littéraire des Fleurs du Mal</h2>
                        
                        <p>Édition critique basée sur le texte de <xsl:value-of select="substring(//tei:publicationStmt/tei:date/@when, 1, 4)"/>.</p>
                        
                        <p><strong>Forme du poème :</strong> L'œuvre se structure autour de <xsl:value-of select="count(//tei:lg[@type='quatrain'])"/> quatrains, .</p>
                    </section>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:result-document>
        
        <xsl:result-document href="poeme.html" method="html">
            <xsl:call-template name="layout">
                <xsl:with-param name="page_title" select="'Un poème emblématique du recueil - l''Albatros'"/>
                <xsl:with-param name="body_content">
                    <h2>Un poème emblématique du recueil - <em>l'Albatros</em></h2>
                    <article class="poeme-texte">
                        <xsl:apply-templates select="//tei:text/tei:body"/>
                    </article>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:result-document>
        
        <xsl:result-document href="analyse.html" method="html">
            <xsl:call-template name="layout">
                <xsl:with-param name="page_title" select="'l''albatros, métaphore du poète chez Baudelaire'"/>
                <xsl:with-param name="body_content">
                    <h2>l'albatros, métaphore du poète chez Baudelaire</h2>
                    
                    <section class="analyse">
                        <h3>Index sémantique</h3>
                        <xsl:for-each select="//tei:term">
                            <div class="terme">
                                <strong><xsl:value-of select="normalize-space(.)"/></strong>
                                <xsl:choose>
                                    <xsl:when test="@ref='#oiseau'"> : Figure de l'oiseau.</xsl:when>
                                    <xsl:when test="@ref='#poete'"> : Figure du poète.</xsl:when>
                                </xsl:choose>
                            </div>
                        </xsl:for-each>
                    </section>
                    
                    <section class="bibliographie">
                        <hr/>
                        <h3>Bibliographie</h3>
                        <ul>
                            <xsl:for-each select="//tei:listBibl/tei:bibl">
                                <xsl:sort select="tei:author"/>
                                <li>
                                    <strong><xsl:value-of select="tei:author"/></strong>
                                    <xsl:text> (</xsl:text><xsl:value-of select="tei:date"/><xsl:text>). </xsl:text>
                                    <span style="font-style: italic;"><xsl:value-of select="tei:title"/></span>
                                    <xsl:choose>
                                        <xsl:when test="@type='video'"> [Vidéo]. YouTube. <xsl:value-of select="tei:ptr/@target"/></xsl:when>
                                        <xsl:when test="@type='site'"> [En ligne]. BnF. <xsl:value-of select="tei:ptr/@target"/></xsl:when>
                                        <xsl:otherwise>. <xsl:value-of select="tei:publisher"/>.</xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </section>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:term">
        <span class="{substring-after(@ref, '#')}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:lg[@type='quatrain']">
        <div class="quatrain"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:l[@n='1']">
        <p class="vers-initial"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:l">
        <p class="vers"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template name="layout">
        <xsl:param name="page_title"/>
        <xsl:param name="body_content"/>
        <html lang="fr">
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:value-of select="$page_title"/></title>
                <link rel="stylesheet" href="{$chemin_css}"/>
            </head>
            <body>
                <nav>
                    <a href="index.html">Accueil</a> | 
                    <a href="poeme.html">Le Poème</a> | 
                    <a href="analyse.html">L'Analyse</a>
                </nav>
                <main><xsl:copy-of select="$body_content"/></main>
                <footer><p>Mini-site littéraire sur l'Albatros de Baudelaire, Joséphine Maire, M2 TNAH- <xsl:value-of select="$auteur"/></p></footer>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
