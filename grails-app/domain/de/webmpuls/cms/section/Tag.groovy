package de.webmpuls.cms.section

public enum Tag
{
	Montag('Montag'),
	Dienstag('Dienstag'),
	Mittwoch('Mittwoch'),
	Donnerstag('Donnerstag'),
	Freitag('Freitag'),
	Samstag('Samstag'),
	Sonntag('Sonntag')

	String name

	Tag(String name)
	{
		this.name = name
	}

	static list()
	{
		[Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag]
	}
}