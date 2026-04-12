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
                            <p>« Dans ce livre atroce, j’ai mis toute ma pensée, tout mon cœur, toute ma religion, toute ma haine » confiait Baudelaire à propos des Fleurs du Mal. Publié en 1857 par l’éminent chartiste Auguste Poulet-Malassis, le recueil est immédiatement condamné pour « outrage à la morale publique ». Pour l'édition de 1861, Baudelaire recompose l'œuvre, remplaçant les pièces censurées par de nouveaux poèmes comme les « Tableaux parisiens » qui exposent sa vision de la modernité. Sa réhabilitation officielle n'aura lieu qu'en 1949.</p>
                        </article>
                        <article>
                            <h3>Contexte artistique</h3>
                            <p>Charles Baudelaire est un critique d’art avant d’être un poète maudit. Héritier des romantiques, Baudelaire en admire la poésie, mais surtout la peinture, en particulier celle de Delacroix dont il contemple l’expression de l’« intimité », de la « spiritualité » et de l’« aspiration vers l’infini » (Salon de 1846). Son influence romantique se dévoile lorsqu’il utilise son art pour réfléchir sur sa sensibilité et sa condition de poète.</p>
                            <p>Grand admirateur de Manet, Baudelaire est aussi un poète de la modernité où l’artiste observe le monde et détourne des scènes quotidiennes pour en faire des scènes symboliques. Si la poésie baudelairienne, s’affranchit de la rhétorique, elle reste fidèle à la conscience de soi, si importante chez les romantiques. Ainsi, le recueil des Fleurs du Mal apparaît comme une œuvre sur la poésie et sur la modernité esthétique. Fondée sur un dialogue entre les arts, où les échos entre poésie et peinture, poésie et sculpture ou poésie et musique sont nombreux, la poésie baudelairienne se caractérise également par un art de l’image. Le poème l’Albatros en est un exemple édifiant où le poète file une métaphore où l’oiseau est assimilé au poète.</p>
                        </article>
                        <article>
                            <h3>L’Albatros, un poème emblématique des Fleurs du Mal</h3>
                            <p>Placé en ouverture de « Spleen et Idéal », ce poème définit la mission de l’artiste : guérir l’âme de l’ennui par la création (Lagarde et Michard). Il illustre le déchirement entre l’Idéal (l’azur) et le Spleen (la chute). Le génie du poète est ici une force souveraine dans les hauteurs, mais une infirmité au sol. Inspiré d'un voyage maritime, ce portrait de l'oiseau captif consacre la figure du « poète maudit », dont la grandeur cause la solitude.</p>
                        </article>
                    </section>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:result-document>
        
        <xsl:result-document href="poeme.html" method="html">
            <xsl:call-template name="layout">
                <xsl:with-param name="page_title" select="'Un poème emblématique du recueil, l''Albatros'"/>
                <xsl:with-param name="body_content">
                    <h2>Un poème emblématique du recueil, <em>l'Albatros</em></h2>
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
                        <h3>Introduction</h3>
                        <p>Le poème L'Albatros ne se contente pas de décrire une scène maritime ; il fonctionne comme une parabole qui définit l'existence même de l'artiste. À travers un réseau de personnifications, Baudelaire transforme l'oiseau en un "roi déchu", faisant du pont du navire le théâtre d'une tragédie sociale où le sacré est confronté à la vulgarité.</p>
                        <h3>Analyse</h3>
                        <p>L'architecture du poème repose sur un jeu d'oppositions entre l'élévation et la chute.</p>
                        <p><strong>Le mouvement et l'espace :</strong> Dès l'ouverture, l'enjambement des vers 1 et 2 suggère l'immensité de l'azur, renforcé par l'hypallage « vaste oiseau des mers ». Cette fluidité aérienne est portée par des sonorités en [v], [s] et [f], évoquant la majesté du vol.</p>
                        <p><strong>Le jeu des antithèses :</strong> Le texte organise un contraste violent. À l'oiseau souverain (« roi de l'azur ») succède l'animal « gauche et veule ». Baudelaire utilise des antithèses systématiques pour marquer cette déchéance : la beauté du vers 10 s'oppose à la laideur, et le vol royal devient le boitement de l'infirme.</p>
                        <p><strong>Les sonorités du déchirement :</strong> La dégradation se traduit phonétiquement. Si l'envol est marqué par des assonances en [en] nobles, la chute amène des sonorités désagréables (allitérations en [c] et [gu] : « gauche », « comique »). Le mouvement des phrases suit cette logique : d'une période ample pour le vol, on passe à des phrases exclamatives hachées pour traduire la souffrance au sol.</p>
                        <h3>Analyse de la métaphore de l’oiseau-poète</h3>
                        <p>La métaphore centrale repose sur une analogie explicite révélée dans le quatrain final : « Le Poète est semblable au prince des nuées ».</p>
                        <p><strong>L'exil social :</strong> Comme l'albatros, le poète appartient à deux mondes irréconciliables. Dans les hauteurs, il domine les « tempêtes » de l'existence. Exilé sur le sol, il devient la proie des marins (représentant la foule vulgaire) qui transforment son sacré en comique.</p>
                        <p><strong>Le paradoxe des « ailes de géant » :</strong> Baudelaire souligne ici le paradoxe du génie. Ce qui fait la grandeur du poète dans l'Idéal devient la cause de son entrave dans le monde matériel. L'anacoluthe des deux derniers vers (« Exilé... ses ailes... ») accentue grammaticalement ce déchirement entre la réalité et l'idéal.</p>
                        <h3>Conclusion</h3>
                        <p>Baudelaire scelle ici la figure du Poète Maudit, incompris par ses contemporains. Majestueux dans son élément mais ridicule au contact des hommes, l'artiste est un étranger dont le génie (les ailes) gêne l'intégration sociale. Sa grandeur est inséparable de sa solitude.</p>
                    </article>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:p"><p><xsl:apply-templates/></p></xsl:template>
    <xsl:template match="tei:term"><span class="{substring-after(@ref, '#')}"><xsl:apply-templates/></span></xsl:template>
    <xsl:template match="tei:lg[@type='quatrain']"><div class="quatrain"><xsl:apply-templates/></div></xsl:template>
    <xsl:template match="tei:l"><p class="vers"><xsl:apply-templates/></p></xsl:template>
    
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
                        <a href="index.html">Accueil - Contexte artistique et littéraire des Fleurs du Mal</a> | 
                        <a href="poeme.html">Un poème emblématique du recueil, l'Albatros</a> | 
                        <a href="analyse.html">l'albatros, métaphore du poète chez Baudelaire</a>
                    </nav>
                </header>
                <main><xsl:copy-of select="$body_content"/></main>
                <footer>
                    <p>Mini-site littéraire sur l'Albatros de Baudelaire, Joséphine Maire, M2 TNAH - <xsl:value-of select="$auteur"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
