package de.webmpuls.cms.section

import de.webmpuls.cms.result.TabelleHelper

class SpielplanService
{
    boolean transactional = true

	static scope = "session"

    // Vorschau naechste Spieltage
	public ArrayList fetchPlayDaysForAbteilung(Abteilung abteilung)
	{
		ArrayList vorschau = []

		String kuerzel = abteilung.kuerzel
		String name = abteilung.name

		GregorianCalendar gregorianCalendarInSomeDays = new GregorianCalendar()
		gregorianCalendarInSomeDays.add(GregorianCalendar.DAY_OF_WEEK, TabelleHelper.FETCH_DAYS_OF_PLAY_FORWARD)

		GregorianCalendar gregorianCalendar = new GregorianCalendar()
		//println kuerzel
		//println name

		def spielplanCriteria = de.webmpuls.cms.section.Spielplan.createCriteria()

		def spielplanList = spielplanCriteria.list
		{
			and
			{
				eq("abteilungKuerzel", kuerzel)
				or
				{
					eq("gastmannschaft", name)
					eq("heimmannschaft", name)
				}
				ge("spieldatum", gregorianCalendar.getTime())
				le("spieldatum", gregorianCalendarInSomeDays.getTime())
			}
		}

		for(Spielplan tmpSpielplan in spielplanList)
		{
			//println tmpSpielplan
			vorschau.add(tmpSpielplan)
		}

		return vorschau
	}
}
