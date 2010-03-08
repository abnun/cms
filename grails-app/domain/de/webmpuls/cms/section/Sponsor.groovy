package de.webmpuls.cms.section

import de.webmpuls.photo_album.Picture

class Sponsor
{
	String name
	String beschreibung
	String verlinkung

	Picture bild

	static mapping =
	{
		sort("name")
		order("asc")
	}

    static constraints =
	{
		name(nullable: true, blank: true)
		bild(nullable: true)
		beschreibung(nullable: true, blank: true, widget: 'textarea')
		verlinkung(nullable: true, blank: true)
    }

	def String toString()
	{
		return name
	}
}
