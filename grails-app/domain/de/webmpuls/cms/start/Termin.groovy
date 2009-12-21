package de.webmpuls.cms.start

class Termin
{
	Date datum
	String inhalt
	Boolean findetStatt = true
	String zusatzinfo

    static constraints =
	{
		datum()
		inhalt(widget: 'textarea')
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
