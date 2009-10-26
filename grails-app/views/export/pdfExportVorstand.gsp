<%@ page import="de.webmpuls.cms.section.Abteilung; de.webmpuls.cms.people.Funktion; de.webmpuls.cms.people.Person" %>
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
					<tr class="even">
						<th>Name</th>
						<th>Vorname</th>
						<th>Strasse</th>
						<th>PLZ</th>
						<th>Ort</th>
						<th>Telefon</th>
						<th>Handy</th>
						<th>E-Mail</th>
						<th></th>
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
						Funktion seniorenbeauftragterFunktion = Funktion.findVorstandByCode(Funktion.SENIONERBEAUFTRAGTER)
						Funktion schriftfuehrerFunktion = Funktion.findVorstandByCode(Funktion.SCHRIFTFUEHRER)
						Funktion geschaeftsstelleFunktion = Funktion.findVorstandByCode(Funktion.GESCHAEFTSSTELLE)
						Funktion jugendLeiterFunktion = Funktion.findVorstandByCode(Funktion.JUGENDLEITER)
						Funktion jugendSprecherFunktion = Funktion.findVorstandByCode(Funktion.JUGENDSPRECHER)
						Funktion abteilungsLeiterFunktion = Funktion.findByCode(Funktion.ABTEILUNGSLEITER)

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
							kassierer = kassiererFunktion.personen.asList()[0]
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

						Person seniorenbeauftragter = null
						if(seniorenbeauftragterFunktion)
						{
							seniorenbeauftragter = seniorenbeauftragterFunktion.personen.asList()[0]
						}

						Person schriftfuehrer = null
						if(schriftfuehrerFunktion)
						{
							schriftfuehrer = schriftfuehrerFunktion.personen.asList()[0]
						}

						Person geschaeftsstelle = null
						if(geschaeftsstelleFunktion)
						{
							geschaeftsstelle = geschaeftsstelleFunktion.personen.asList()[0]
						}

						Person jugendLeiter = null
						if(jugendLeiterFunktion)
						{
							jugendLeiter = jugendLeiterFunktion.personen.asList()[0]
						}

						Person jugendSprecher = null
						if(jugendSprecherFunktion)
						{
							jugendSprecher = jugendSprecherFunktion.personen.asList()[0]
						}

						Map abteilungsLeiterMap = new HashMap()

						def abteilungList = Abteilung.list()

						Abteilung targetAbteilung = null

						for (Abteilung abteilungInstance: abteilungList)
						{
							if (abteilungsLeiterFunktion)
							{
								abteilungsLeiterMap.put(abteilungInstance, abteilungInstance.personen.findAll
								{
									Person tmpPerson ->
									abteilungsLeiterFunktion.personen.contains(tmpPerson)
								})
							}
						}

						abteilungsLeiterMap = abteilungsLeiterMap.sort{a,b -> a.key.toString() <=> b.key.toString()}
					%>
					<g:render template="tableCell" model="[person: vorsitzender1, funktion: vorsitzender1Funktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: vorsitzender2, funktion: vorsitzender2Funktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: vorsitzender3, funktion: vorsitzender3Funktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: kassierer, funktion: kassiererFunktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: wirt_tech_leiter, funktion: wirt_tech_leiterFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: sport_tech_leiter, funktion: sport_tech_leiterFunktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: beisitzer, funktion: beisitzerFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: referent, funktion: referentFunktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: webmaster, funktion: webmasterFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: seniorenbeauftragter, funktion: seniorenbeauftragterFunktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: schriftfuehrer, funktion: schriftfuehrerFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: geschaeftsstelle, funktion: geschaeftsstelleFunktion, tableClass: 'even']" />
					<g:render template="tableCell" model="[person: jugendLeiter, funktion: jugendLeiterFunktion, tableClass: 'odd']" />
					<g:render template="tableCell" model="[person: jugendSprecher, funktion: jugendSprecherFunktion, tableClass: 'even']" />
				</table>
				<br/>
				<table>
					<tr class="odd">
						<th colspan="9" align="left">
							Abteilungsleitung:
						</th>
					</tr>
					<tr class="even">
						<th>Name</th>
						<th>Vorname</th>
						<th>Strasse</th>
						<th>PLZ</th>
						<th>Ort</th>
						<th>Telefon</th>
						<th>Handy</th>
						<th>E-Mail</th>
						<th></th>
					</tr>
					<g:if test="${abteilungsLeiterMap != null && !abteilungsLeiterMap.isEmpty()}">
						<%
						    def z = 0
						%>
						<g:each var="abteilungsLeiterMapEntry" in="${abteilungsLeiterMap}">
							<%
							    Abteilung tmpAbteilung = abteilungsLeiterMapEntry.key

								def abteilungsLeiterList = abteilungsLeiterMapEntry.value

								if(abteilungsLeiterList)
								{
									abteilungsLeiterList = abteilungsLeiterList.sort{a, b -> a.toString() <=> b.toString()}
							%>
							<g:each var="abteilungsLeiter" in="${abteilungsLeiterList}">
								<g:render template="tableCell" model="[person: abteilungsLeiter, funktion: tmpAbteilung, tableClass: (z % 2) == 0 ? 'even' : 'odd']" />
								<%
								    z++
								%>
							</g:each>
							<%
								}

								//z++
							%>
						</g:each>
					</g:if>
				</table>
			</div>
		</div>
    </body>
</html>