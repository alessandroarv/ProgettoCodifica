<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8"/> 
    <xsl:template match="/"> 
      <html lang="IT">
        <head> 
          <link rel="stylesheet" type="text/css" href="style.css"/>
          <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
          <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
          <script src="galleria.js"></script>
          <script src="script.js"></script>
          <script src="script2.js"></script>
          <title>Codifica digitale dei diari di Emanuele Artom
          </title>
        </head>
              
        <body> 
          <header>
            <div class="nav">
              <nav class="menu">
    <a href="#descrizione-fisica">DESCRIZIONE FISICA</a>
    <a href="#gallery">GALLERIA</a>
    <a href="#trascrizione">TRASCRIZIONE</a>
    <a href="#bibl">BIBLIOGRAFIA</a>
    <a href="#footer">ABOUT</a>
              </nav>
            </div>

            <div class="title">
              <h1><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='it']"/></h1>
              <h2><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='sub']"/></h2>
              <h3> Edizione digitale di un estratto del manoscritto originale </h3>
            </div>
          </header>


         <main id="main">
          
            <!-- Informazioni manoscritto--> 
            <section id="info">
              <div class="paragrafo">
                <h2>Informazioni sul manoscritto</h2> 
                <xsl:apply-templates select="//tei:msIdentifier"/>
              </div>
            </section>
            
            <!--Descrizione fisica-->
            <section id="descrizione-fisica">
              <div class="paragrafo">
                <h2>Descrizione fisica</h2>
                <xsl:apply-templates select="//tei:physDesc"/>
              </div>
            </section>



            <!--Contenitore galleria-->
            <section id="gallery">
              <div class="galleria">
                <xsl:apply-templates select="//tei:facsimile" />
                  <img class="prev" src="img/frecciasx.png" onclick="plusimgs(-1)" alt="Indietro" />
                  <img class="next" src="img/frecciadx.png" onclick="plusimgs(1)" alt="Avanti" />
              </div>
            </section>

            <!--Contenitore legenda -->
            <section id="legenda">
              <div class="edit">
                <h2>Legenda</h2>
                <div class="opzioni">
                  <div class="opzione">
                    <label for="corr">Parti mancanti</label>
                    <input type="checkbox" id="corr"></input>
                  </div>
                  <div class="opzione">
                    <label for="supplied">Aggiunte</label>
                    <input type="checkbox" id="supplied"></input>
                  </div>
                  <div class="opzione">
                    <label for="abbreviazioni">Abbreviazioni</label>
                    <input type="checkbox" id="abbreviazioni"></input>
                  </div>
                  <div class="opzione">
                    <label for="del">Cancellature</label>
                    <input type="checkbox" id="del"></input>
                  </div>

                  <div class="opzione">
                    <label for="num">Numeri</label>
                    <input type="checkbox" id="num"></input>
                  </div>
                  <div class="opzione">
                    <label for="nomipersone">Nomi di persone</label>
                    <input type="checkbox" id="pers"></input>
                  </div>
                  <div class="opzione">
                    <label for="nomiluoghi">Nomi di luoghi</label>
                    <input type="checkbox" id="place"></input>
                  </div> 
                  <div class="opzione">
                    <label for="nomiorganizzazioni">Nomi di organizzazioni</label>
                    <input type="checkbox" id="org"></input>
                  </div>                 
                </div>
              </div>
            </section>

            

            <!--Trascrizione diario-->
            <section id="trascrizione">  
              <h2>Trascrizione</h2>
              <div class="pages">
                <xsl:apply-templates select="//tei:text[@subtype='diario']/tei:body" />   
              </div>                            
            </section>


            <!--Bibliografia-->
            <section id="bibl"> 
            <div class="paragrafo">
              <h2>Bibliografia</h2>
                <div class="wrapper">
                  <xsl:apply-templates select="//tei:listBibl" />
                </div>
              </div>
            </section>

            <!--About-->
            <section id="footer"> 
            <div class="paragrafo">
              <h2>About</h2>
              <div class="footer-container">
                <xsl:apply-templates select="//tei:editionStmt"/>
                <xsl:apply-templates select="//tei:publicationStmt"/>
              </div>
            </div>
            </section>

          </main> 
      </body>
    </html> 
    </xsl:template>
   




   
    <!--TEMPLATES-->

    <!--Informazioni-->
    <xsl:template match="//tei:teiHeader/tei:fileDesc//tei:msIdentifier">
      <div class="infofonte">
        <table class="table-list"><!--Tabella-->
          <tr class="row-list"> <!--Righe-->
            <td class="cell-list"><!--Celle-->
              <span><strong>Titolo</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msContents/tei:msItem/tei:title"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Autore</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msContents/tei:msItem/tei:author"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Lingua</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msContents/tei:msItem/tei:textLang"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Collezione</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msIdentifier/tei:collection"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Manoscritto</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msIdentifier/tei:idno[@type='inventory']"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Luogo di conservazione</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msIdentifier/tei:repository"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Storia</strong></span>
            </td>
            <td class="cell-list-value">
              <p><xsl:value-of select="../tei:history/tei:origin/tei:p"/></p>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Acquisizione</strong></span>
            </td>
            <td class="cell-list-value">
              <p><xsl:value-of select="../tei:history/tei:acquisition/tei:p"/></p>
            </td>
          </tr>
        </table>
      </div>
    </xsl:template>

    <!--Descrizione fisica-->
    <xsl:template match="//tei:teiHeader/tei:fileDesc//tei:physDesc">
      <div class="desc">
        <table class="table-list">
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Supporto</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:material"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Quantità</strong></span>
            </td>
            <td class="cell-list-value">
              <xsl:value-of select="//tei:extent"/>. 
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Condizioni</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:condition"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Mani</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:handDesc"/></span>
            </td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Stesura</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:typeDesc"/></span>
            </td>
          </tr>
        </table>
      </div>
    </xsl:template>


    <!--Descrizione fisica-->

<xsl:template match="tei:encodingDesc">
  <div class="encoding-info">
    <xsl:apply-templates select="*"/>
  </div>
</xsl:template>

   <!-- Contenitore della galleria -->
    <xsl:template match="section[@id='gallery']">
      <div class="galleria">
        <xsl:apply-templates select="//tei:facsimile"/>
        <img class="prev" src="img/frecciasx.png" onclick="plusimgs(-1)" alt="Indietro" />
        <img class="next" src="img/frecciadx.png" onclick="plusimgs(1)" alt="Avanti" />
      </div>
    </xsl:template>

  <!-- Immagini della galleria -->
    <xsl:template match="tei:facsimile">
      <xsl:for-each select="//tei:surface">
        <div class="img">
          <img src="img/{tei:graphic/@url}" id="{@xml:id}"/>
        </div>
      </xsl:for-each>
    </xsl:template>

    
    <!-- Righe  -->
    <!--per mettere in colonna le righe del testo-->
    <xsl:template match="tei:lb"> 
      <xsl:element name="br"></xsl:element>
      <xsl:element name="span">
        <xsl:attribute name="id">
          <xsl:value-of select="@facs"/>
        </xsl:attribute>
        <xsl:attribute name="class">row-number</xsl:attribute>
        <xsl:value-of select="@n" />&#160;     <!-- 160 è per lo spazio  -->
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>





    <!-- Pagine -->
    <xsl:template match="tei:pb">
      <xsl:element name="h3">
        <xsl:attribute name="id">pagina-<xsl:value-of select="[@n]"/></xsl:attribute>
        <xsl:attribute name="class">section-title</xsl:attribute>
          Pagina <xsl:value-of select="[@n]"/>
      </xsl:element>
    </xsl:template>
    





<xsl:template match="div[@type='pagina']">
  <div class="trascrizione" id="trascrizione-{@n}">
    <xsl:for-each select=".//lb">
      <xsl:call-template name="process-line"/>
    </xsl:for-each>
  </div>
</xsl:template>

<xsl:template name="process-line">
  <span>
    <xsl:apply-templates select="node()"/>
  </span>
  <br/>
</xsl:template>




    <!-- Abbreviazioni con <abbr> -->
    <xsl:template match="tei:abbr">
      <xsl:element name="span">
        <xsl:attribute name="class">abbr</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

   
<xsl:template match="tei:gap">
    <span class="gap">
      [PARTE MANCANTE]
        <xsl:apply-templates/>
    </span>
</xsl:template>

<xsl:template match="tei:del">
    <del class="del">
        <xsl:apply-templates/>
    </del>
</xsl:template>

<xsl:template match="tei:add">
    <span class="add">
        <xsl:apply-templates/>
    </span>
</xsl:template>


<xsl:template match="tei:persName">
  <span class="evidenziazione">
    <xsl:apply-templates/>
  </span>
</xsl:template>    
    
<xsl:template match="tei:placeName">
  <span class="evidenziazione-blue">
    <xsl:apply-templates/>
  </span>
</xsl:template>
    
<xsl:template match="tei:orgName">
  <span class="evidenziazione-pink">
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="tei:num">
  <span class="evidenziazione-orange">
    <xsl:apply-templates/>
  </span>
</xsl:template>
    

<xsl:template match="tei:unclear">
  [--NON CHIARO--]
</xsl:template>
    
    


    <!-- Bibliografia -->
    <xsl:template match="//tei:listBibl">
      <div class="bibliografia">
        <xsl:element name="ul">
          <xsl:for-each select="current()//tei:bibl">
            <br/>
              <xsl:element name="li">
                <xsl:for-each select="tei:author/tei:persName">
                  <xsl:value-of select="."/>,
                </xsl:for-each>            
                <xsl:element name="i">                                
                  <xsl:value-of select="tei:title"/>
                </xsl:element>,
                <xsl:for-each select="tei:pubPlace">
                  <xsl:value-of select="."/>,
                </xsl:for-each>
                <xsl:value-of select="tei:publisher"/>,
                <xsl:value-of select="tei:date"/>
              </xsl:element>
            </xsl:for-each>
        </xsl:element>
      </div>
    </xsl:template>

    <!--Footer-->
    <xsl:template match="tei:editionStmt"> 
      <xsl:value-of select="current()/tei:edition"></xsl:value-of>
        <xsl:for-each select="current()/tei:respStmt">
          <p><xsl:value-of select="."/></p>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
      <div class="footer-container">
        <xsl:for-each select="*">
          <p><xsl:value-of select="."/></p>
        </xsl:for-each>
      </div>
    </xsl:template>
</xsl:stylesheet>









