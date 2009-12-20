package de.webmpuls.cms.start

import de.webmpuls.cms.section.Abteilung

class News
{

	Date dateCreated
	Date lastModified

	Abteilung abteilung
	String ueberschrift
	String inhalt

    static constraints =
	{
		ueberschrift()
		abteilung()
		inhalt(widget: 'textarea')
		dateCreated(display: false, nullable: true)
		lastModified(display: false, nullable: true)
    }

}
