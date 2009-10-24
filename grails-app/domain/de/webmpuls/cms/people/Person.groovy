package de.webmpuls.cms.people

import de.webmpuls.cms.section.Abteilung

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

	Boolean adresseAnzeigen = false

	static mapping =
	{
		sort("nachname")
		order("asc")
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
    }

	def String toString()
	{
		return "$nachname, $vorname"
	}
}
