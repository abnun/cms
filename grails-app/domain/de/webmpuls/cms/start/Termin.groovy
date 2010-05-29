package de.webmpuls.cms.start

import de.webmpuls.cms.section.Abteilung

class Termin
{
	Date startDatum
	Date endDatum
	String inhalt
	Boolean findetStatt = true
	String zusatzinfo
	String uhrzeit
	String ort
	Abteilung abteilung

    static constraints =
	{
		startDatum()
		endDatum()
		inhalt(widget: 'textarea')
		ort(blank: true, nullable: true)
		uhrzeit(blank: true, nullable: true)
		findetStatt(nullable: true)
		zusatzinfo(widget: 'textarea', blank: true, nullable: true)
		abteilung(nullable: true)
    }

	static namedQueries =
	{
		letzteTermine()
		{
			GregorianCalendar now = new GregorianCalendar()
			def firstOfMonth = now.getTime() - (now.get(GregorianCalendar.DAY_OF_MONTH) - 1)
			gt('startDatum', firstOfMonth)
			cache(true)
		}
	}
}
