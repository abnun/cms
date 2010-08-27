package de.webmpuls.cms.section

import java.text.SimpleDateFormat

class Spielplan
{
	String abteilungKuerzel
	Date spieldatum
	String heimmannschaft
	String gastmannschaft
	String anstoss
	String vermerk

	static mapping =
	{
		sort("spieldatum")
		order("asc")
	}

    static constraints =
	{
		abteilungKuerzel(blank: false)
		spieldatum()
		heimmannschaft(blank: false)
		gastmannschaft(blank: false)
		anstoss(nullable: true, blank: true)
		vermerk(nullable: true, blank: true)
    }

	def String toString()
	{
		return "${abteilungKuerzel} ${new SimpleDateFormat("dd.MM.yyyy").format(spieldatum)} ${heimmannschaft} - ${gastmannschaft} ${anstoss}"
	}
}
