package de.webmpuls.cms.section

import java.text.SimpleDateFormat

class Spielplan
{
	String abteilungCode
	Date spieldatum
	String heimmannschaft
	String gastmannschaft
	String anstoss

    static constraints =
	{
		abteilungCode(blank: false)
		spieldatum()
		heimmannschaft(blank: false)
		gastmannschaft(blank: false)
		anstoss(nullable: true, blank: true)
    }

	def String toString()
	{
		return "${abteilungCode} ${new SimpleDateFormat("dd.MM.yyyy").format(spieldatum)} ${heimmannschaft} ${gastmannschaft} ${anstoss}"
	}
}
