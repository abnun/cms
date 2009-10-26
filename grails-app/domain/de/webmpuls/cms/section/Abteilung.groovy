package de.webmpuls.cms.section

import de.webmpuls.cms.people.Person
import de.webmpuls.cms.people.Funktion

class Abteilung
{
	static hasMany = [mitarbeiterfunktionen: Funktion, unterabteilungen: Abteilung, personen: Person]

	String name
	String code

	static mapping =
	{
		//mitarbeiterfunktionen(sort: 'name')
		sort("name")
		order("asc")

		cache(true)
		mitarbeiterfunktionen(cache: true)
		unterabteilungen(cache: true)
		personen(cache: true)
	}

	static constraints =
	{
		name()
		code(validator: { String v ->
			boolean isValid = (v ==~ /[a-z_]+/)
			println("validation for '$v' evaluates to $isValid")
			return isValid
		})
    }

	def String toString()
	{
		return name
	}
}
