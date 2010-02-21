package de.webmpuls.cms.section

class Trainingszeit
{
	String name = "Trainingszeiten"

	String tag

	String vonBis

	String ort

    static constraints =
	{
		name(blank: false)
		tag(nullable: false, blank: false)
		vonBis(nullable: false, blank: false)
		ort(nullable: true, blank: true)
    }
}
