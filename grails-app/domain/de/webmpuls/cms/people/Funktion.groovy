package de.webmpuls.cms.people

class Funktion
{
	static final String ABTEILUNGSLEITER = "abteilungsleiter"
	static final String VORSITZENDER1 = "vorsitzender1"
	static final String VORSITZENDER2 = "vorsitzender2"
	static final String VORSITZENDER3 = "vorsitzender3"
	static final String BEISITZER = "beisitzer"
	static final String WEBMASTER = "webmaster"
	static final String KASSIERER = "kassierer"
	static final String LEITER_TECH_WIRT = "leiter_tech_wirt"
	static final String LEITER_TECH_SPORT = "leiter_tech_sport"
	static final String SENIONERBEAUFTRAGTER = "seniorenbeauftragter"
	static final String SCHRIFTFUEHRER = "schriftfuehrer"
	static final String GESCHAEFTSSTELLE = "geschaeftsstelle"
	static final String REFERENT = "referent"
	static final String JUGENDLEITER = "jugendleiter"
	static final String JUGENDSPRECHER = "jugendsprecher"

	static hasMany = [personen: Person]
	static belongsTo = Person

	String name
	String code
	Boolean vorstand = false

	static mapping =
	{
		sort("name")
		order("asc")

		cache(true)
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
    }

	def String toString()
	{
		return name
	}
}
