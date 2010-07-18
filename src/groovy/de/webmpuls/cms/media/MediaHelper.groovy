package de.webmpuls.cms.media
/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 27.11.2009
 * Time: 15:21:01
 */
class MediaHelper 
{
	// Alben
	public static final String ALBUM_BERICHTE = "berichte"
	public static final String ALBUM_PERSONEN = "personen"
	public static final String ALBUM_SPONSOREN = "sponsoren"
	public static final String ALBUM_VERSCHIEDENES = "verschiedenes"

	// Dummy-Personen
	public static final String DUMMY_PERSON_MALE = "dummy"
	public static final String DUMMY_PERSON_FEMALE = "dummy"

	public static String formatNameForDisk(String name)
	{
		if(name)
		{
			name = name.toLowerCase()
			if (name.contains(" "))
			{
				name = name.replaceAll(" ", "_")
			}
			if (name.contains("."))
			{
				name = name.replaceAll(".", "")
			}
			if (name.contains("/"))
			{
				name = name.replaceAll("/", "_")
			}
			if (name.contains("("))
			{
				name = name.replaceAll("\\(", "")
			}
			if (name.contains(")"))
			{
				name = name.replaceAll("\\)", "")
			}
			if (name.contains("ß"))
			{
				name = name.replaceAll("ß", "ss")
			}
			if (name.contains("ä"))
			{
				name = name.replaceAll("ä", "ae")
			}
			if (name.contains("ü"))
			{
				name = name.replaceAll("ü", "ue")
			}
			if (name.contains("ö"))
			{
				name = name.replaceAll('ö', "oe")
			}
		}
		return name
	}
}