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
                    <section class="page-accueil">
                        <h1><xsl:value-of select="upper-case('Les Fleurs du Mal')"/></h1>
                        
                        <article>
                            <h3>Contexte de parution</h3>
                            <p>« Dans ce livre atroce... » Publié en 1857...</p>
                        </article>
                        
                        <aside class="infos-edition">
                            <hr/>
                            <p>Édition basée sur le texte de <xsl:value-of select="substring(//tei:publicationStmt/tei:date/@when, 1, 4)"/>.</p>
                            <p>Structure : le poème comporte <xsl:value-of select="count(//tei:lg[@type='quatrain'])"/> quatrains.</p>
                        </aside>
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
                    
                    <article class="content-section">
                        <h2>Analyse de l'œuvre</h2>
                        <section class="intro">
                            <h3>Introduction</h3>
                            <p>Le poème <em>L'Albatros</em> fonctionne comme une parabole...</p>
                        </section>
                        </article>

                    <hr/>

                    <section class="references">
                        <h2>Bibliographie et Sitographie (APA 7)</h2>
                        
                        <div class="biblio">
                            <h3>Bibliographie (Livres)</h3>
                            <ul class="apa-style">
                                <xsl:for-each select="//tei:bibl[@type='livre'] | //tei:biblStruct">
                                    <xsl:sort select=".//tei:author | .//tei:editor"/>
                                    <li>
                                        <xsl:choose>
                                            <xsl:when test="tei:author"><xsl:value-of select="tei:author"/></xsl:when>
                                            <xsl:otherwise><xsl:value-of select=".//tei:editor"/> (Éd.)</xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:text> (</xsl:text><xsl:value-of select=".//tei:date"/><xsl:text>). </xsl:text>
                                        <span class="italic-title"><xsl:value-of select=".//tei:title"/></span>. 
                                        <xsl:text> </xsl:text><xsl:value-of select=".//tei:publisher"/>.
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>

                        <div class="sito">
                            <h3>Ressources multimédias</h3>
                            <h4>Vidéos</h4>
                            <ul class="apa-style">
                                <xsl:for-each select="//tei:bibl[@type='video']">
                                    <li>
                                        <xsl:value-of select="tei:author"/> (<xsl:value-of select="tei:date"/>). 
                                        <em><xsl:value-of select="tei:title"/></em> [Vidéo]. 
                                        <br/><a href="{tei:ptr/@target}"><xsl:value-of select="tei:ptr/@target"/></a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
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
                <header>
                    <nav>
                        <a href="index.html">Accueil</a> | 
                        <a href="poeme.html">Le Poème</a> | 
                        <a href="analyse.html">L'Analyse</a>
                    </nav>
                </header>
                <main>
                    <xsl:copy-of select="$body_content"/>
                </main>
                <footer>
                    <p>Mini-site littéraire - <xsl:value-of select="$auteur"/> - Joséphine Maire, M2 TNAH</p>
                </footer>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
