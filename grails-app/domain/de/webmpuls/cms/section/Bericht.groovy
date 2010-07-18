package de.webmpuls.cms.section

import de.webmpuls.photo_album.Album
import de.webmpuls.cms.start.News

class Bericht extends News
{
	static belongsTo = [abteilung: Abteilung]
	
	Album album

	Date dateCreated
   	Date lastUpdated

	static mapping =
	{
		sort("lastUpdated")
		order("asc")
	}

    static constraints =
	{
		ueberschrift()
		inhalt(widget: 'textarea')
		dateCreated(display: false)
		lastUpdated(display: false)
		abteilung()
		album(nullable: true)
    }

	def afterInsert()
	{
		if(!album)
		{
			Album.withNewSession
			{
				album = new Album(name: "Album-Bericht-${id}", description: "Album für Bericht '${ueberschrift}'").save()
			}
			save()
		}
	}


	def String toString()
	{
		return ueberschrift
	}
}
