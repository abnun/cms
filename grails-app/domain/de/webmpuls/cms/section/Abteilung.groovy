package de.webmpuls.cms.section

import de.webmpuls.cms.people.Person
import de.webmpuls.cms.people.Funktion

class Abteilung
{
	static final String JUGEND_FUSSBALL = "Fußball (Jugend)"

	static hasMany = [mitarbeiterfunktionen: Funktion, unterabteilungen: Abteilung, personen: Person]

	String name
	String code
	String kuerzel

	Boolean anzeigeImMenu = false

	static mapping =
	{
		//mitarbeiterfunktionen(sort: 'name')
		//personen(sort: 'nachname')
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
			boolean isValid = (v ==~ /[a-z_0-9]+/)
			println("validation for '$v' evaluates to $isValid")
			return isValid
		})
		kuerzel(validator: { String v ->
			boolean isValid = (v ==~ /[a-z_0-9]+/)
			println("validation for '$v' evaluates to $isValid")
			return isValid
		})
		anzeigeImMenu(nullable: true)
    }

	static namedQueries =
	{
   		hauptAbteilungen
		{
           eq('anzeigeImMenu', true)
       	}
	}

	def beforeUpdate()
	{
		if(unterabteilungen && !unterabteilungen.isEmpty())
		{
			anzeigeImMenu = true
		}
	}

	def String toString()
	{
		return name
	}
}
