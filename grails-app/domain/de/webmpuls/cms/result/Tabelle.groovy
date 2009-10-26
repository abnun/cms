package de.webmpuls.cms.result

class Tabelle
{
	Date spieldatum
	String spielkennung
	String heimmannschaft
	String gastmannschaft
	String anstoss
	String tore
	String spielklasse
	String typ

	String spielbericht

	static mapping =
	{
		sort(spieldatum: 'asc')

		cache(true)
	}

    static constraints =
	{
		spieldatum()
		spielkennung(blank: false)
		heimmannschaft(blank: false)
		gastmannschaft(blank: false)
		anstoss(nullable: true, blank: true)
		tore(nullable: true, blank: true)
		spielklasse(blank: false)
		typ(blank: false)
		spielbericht(nullable: true, blank: true, widget:'textarea')
    }

	public String toString()
	{
		return spielkennung
	}
}
