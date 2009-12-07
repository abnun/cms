package de.webmpuls.cms.people

class Eintrag
{
	String frage
	String antwort

	static belongsTo = Steckbrief

    static constraints = {
    }
}
