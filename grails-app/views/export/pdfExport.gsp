<%@ page import="de.webmpuls.cms.people.Funktion; de.webmpuls.cms.people.Person" %>
<html>
    <head>
        <title>
            Adressliste
        </title>
        <meta name="layout" content="main" />
		<style type="text/css">
		@page { size: A4 landscape }			
		</style>
    </head>
    
    <body>
		<div class="body">
        	<h1>Adressliste</h1>

			<div class="list">
				<table>
					<tr class="odd">
						<th colspan="9" align="left">
							Vorstand
						</th>
					</tr>
					<%
						Funktion vorsitzender1Funktion = Funktion.findVorstandByCode(Funktion.VORSITZENDER1)
						Funktion vorsitzender2Funktion = Funktion.findVorstandByCode(Funktion.VORSITZENDER2)
						Funktion vorsitzender3Funktion = Funktion.findVorstandByCode(Funktion.VORSITZENDER3)
						Funktion kassiererFunktion = Funktion.findVorstandByCode(Funktion.KASSIERER)
						Funktion wirt_tech_leiterFunktion = Funktion.findVorstandByCode(Funktion.LEITER_TECH_WIRT)
						Funktion sport_tech_leiterFunktion = Funktion.findVorstandByCode(Funktion.LEITER_TECH_SPORT)
						Funktion beisitzerFunktion = Funktion.findVorstandByCode(Funktion.BEISITZER)
						Funktion referentFunktion = Funktion.findVorstandByCode(Funktion.REFERENT)
						Funktion webmasterFunktion = Funktion.findVorstandByCode(Funktion.WEBMASTER)

						Person vorsitzender1 = null
						if(vorsitzender1Funktion)
						{
							vorsitzender1 = vorsitzender1Funktion.personen.asList()[0]
						}

						Person vorsitzender2 = null
						if(vorsitzender2Funktion)
						{
							vorsitzender2 = vorsitzender2Funktion.personen.asList()[0]
						}

						Person vorsitzender3 = null
						if(vorsitzender3Funktion)
						{
							vorsitzender3 = vorsitzender3Funktion.personen.asList()[0]
						}

						Person kassierer = null
						if(kassiererFunktion)
						{
							kassierer3 = kassiererFunktion.personen.asList()[0]
						}

						Person wirt_tech_leiter = null
						if(wirt_tech_leiterFunktion)
						{
							wirt_tech_leiter = wirt_tech_leiterFunktion.personen.asList()[0]
						}

						Person sport_tech_leiter = null
						if(sport_tech_leiterFunktion)
						{
							sport_tech_leiter = sport_tech_leiterFunktion.personen.asList()[0]
						}

						Person beisitzer = null
						if(beisitzerFunktion)
						{
							beisitzer = beisitzerFunktion.personen.asList()[0]
						}

						Person referent = null
						if(referentFunktion)
						{
							referent = referentFunktion.personen.asList()[0]
						}

						Person webmaster = null
						if(webmasterFunktion)
						{
							webmaster = webmasterFunktion.personen.asList()[0]
						}
					%>
					<g:render template="tableCell" model="[person: vorsitzender1, funktion: vorsitzender1Funktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: vorsitzender2, funktion: vorsitzender2Funktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: vorsitzender3, funktion: vorsitzender3Funktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: kassierer, funktion: kassiererFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: wirt_tech_leiter, funktion: wirt_tech_leiterFunktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: sport_tech_leiter, funktion: sport_tech_leiterFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: beisitzer, funktion: beisitzerFunktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: referent, funktion: referentFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: webmaster, funktion: webmasterFunktion, tableClass: 'even']" />
				</table>
			</div>
		</div>
    </body>
</html>