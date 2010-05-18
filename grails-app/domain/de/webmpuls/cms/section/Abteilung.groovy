package de.webmpuls.cms.section

import de.webmpuls.cms.people.Person
import de.webmpuls.cms.people.Funktion

class Abteilung
{
	static hasMany = [mitarbeiterfunktionen: Funktion, unterabteilungen: Abteilung, personen: Person, trainingszeiten: Trainingszeit, berichte: Bericht, spielplaene: Spielplan]

	String name
	String anzeigeName
	String spielklasse
	String code
	String kuerzel

	Boolean anzeigeImMenu = true

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
		berichte(cache: true)
		spielplaene(cache: true)
	}

	static constraints =
	{
		name(blank: false, nullable: false)
		anzeigeName(blank: true, nullable: true)
		spielklasse(blank: true, nullable: true)
		code(unique: true, nullable: true, blank: true/*, validator: { String v ->
			boolean isValid = (v ==~ /[a-z_0-9]+/)
			println("validation for '$v' evaluates to $isValid")
			return isValid
		}*/)
		kuerzel(nullable: true, validator: { String v ->
			if(v == null)
			{
				return true
			}
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

		code = AbteilungHelper.formatNameToCode(name, code)
	}

	def beforeInsert()
	{
		code = AbteilungHelper.formatNameToCode(name, code)
	}

	def String toString()
	{
		return name
	}
}
