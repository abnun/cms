package de.webmpuls.cms.start

import de.webmpuls.cms.section.Abteilung

class Anzeigen
{
	Abteilung abteilung
	String ueberschrift1
	String ueberschrift2
	String inhalt

    static constraints =
	{
		ueberschrift1()
		ueberschrift2()
		abteilung()
		inhalt()
    }
}
