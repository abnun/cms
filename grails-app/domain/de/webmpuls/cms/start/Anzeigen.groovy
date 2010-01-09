package de.webmpuls.cms.start

import de.webmpuls.cms.section.Abteilung

class Anzeigen
{
	Abteilung abteilung
	String ueberschrift1
	String ueberschrift2
	String inhalt
	Boolean takeEndDate = false
	Date endDatum

	static constraints =
	{
		ueberschrift1()
		ueberschrift2()
		abteilung()
		inhalt()
		takeEndDate(nullable: true)
		endDatum(nullable: true)
    }
}
