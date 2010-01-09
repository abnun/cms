package de.webmpuls.cms.start

class Termin
{
	Date datum
	String inhalt
	Boolean findetStatt = true
	String zusatzinfo
	String uhrzeit
	String ort

    static constraints =
	{
		datum()
		inhalt(widget: 'textarea')
		ort(blank: true, nullable: true)
		uhrzeit(blank: true, nullable: true)
		findetStatt(nullable: true)
		zusatzinfo(widget: 'textarea', blank: true, nullable: true)
    }

	static namedQueries =
	{
		letzteTermine()
		{
			GregorianCalendar now = new GregorianCalendar()
			def firstOfMonth = now.getTime() - (now.get(GregorianCalendar.DAY_OF_MONTH) - 1)
			gt('datum', firstOfMonth)
			cache(true)
		}
	}
}
