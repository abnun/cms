package de.webmpuls.cms.section

import de.webmpuls.cms.result.Tabelle
import de.webmpuls.cms.result.TabelleHelper

class ResultService
{

    boolean transactional = true

	static scope = "session"

    // aktuelle Ergebnisse
	public ArrayList fetchResultsForAbteilung(Abteilung abteilung)
	{
		ArrayList ergebnisse = []

		String kuerzel = abteilung.kuerzel
		String name = abteilung.name

		GregorianCalendar gregorianCalendarSomeDaysAgo = new GregorianCalendar()
		gregorianCalendarSomeDaysAgo.add(GregorianCalendar.DAY_OF_WEEK, - TabelleHelper.FETCH_RESULTS_DAYS_AGO)

		//println kuerzel
		//println name

		AbteilungHelper abteilungHelper = new AbteilungHelper()

		String identifier = abteilungHelper.ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.get(kuerzel)

		//println "identifier -> $identifier"

		def tabelleCriteria = Tabelle.createCriteria()

		def tabelleList = tabelleCriteria.list
		{
			and
			{
				eq("spielklasse", identifier)
				or
				{
					eq("gastmannschaft", name)
					eq("heimmannschaft", name)
				}
				ge("spieldatum", gregorianCalendarSomeDaysAgo.getTime())
			}
		}

		for(Tabelle tabelle in tabelleList)
		{
			//println tabelle
			if(tabelle.tore)
			{
				ergebnisse.add(tabelle)
			}
		}

		return ergebnisse
	}
}
