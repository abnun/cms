package de.webmpuls.cms.people

class Steckbrief
{
	static hasMany = [eintraege: Eintrag]
	static belongsTo = Person

	String name

    static constraints =
	{
    }
}
