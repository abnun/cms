package de.webmpuls.cms.people

import de.webmpuls.cms.section.Abteilung
import de.webmpuls.photo_album.Picture

class Person
{
	static hasMany = [funktionen: Funktion, abteilungen: Abteilung]
	static belongsTo = Abteilung

	String vorname
	String nachname
	String strasse
	String plz
	String ort
	String telefon1
	String telefon2
	String email

	Picture bild
	Steckbrief steckbrief

	Boolean adresseAnzeigen = false

	static mapping =
	{
		sort("nachname")
		order("asc")

		cache(true)
		funktionen(cache: true)
		abteilungen(cache: true)
	}

    static constraints =
	{
		vorname()
		nachname()
		strasse()
		plz(maxSize: 5)
		ort()
		telefon1(blank: true, nullable: true)
		telefon2(blank: true, nullable: true)
		email(blank: true, nullable: true, email:true)
		bild(nullable: true)
		steckbrief(nullable: true)
    }

	def String toString()
	{
		return "$nachname, $vorname"
	}
}
