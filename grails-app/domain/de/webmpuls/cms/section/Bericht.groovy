package de.webmpuls.cms.section

class Bericht
{
	String inhalt
	String ueberschrift
	Date dateCreated
   	Date lastUpdated

    static constraints =
	{
		inhalt()
		ueberschrift()
		dateCreated(display: false)
		lastUpdated(display: false)
    }
}
