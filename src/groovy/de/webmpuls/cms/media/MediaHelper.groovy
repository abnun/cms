package de.webmpuls.cms.media
/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 27.11.2009
 * Time: 15:21:01
 */
class MediaHelper 
{
	// Alben
	public static final String ALBUM_PERSONEN = "personen"
	public static final String ALBUM_SPONSOREN = "sponsoren"
	public static final String ALBUM_VERSCHIEDENES = "verschiedenes"

	// Dummy-Personen
	public static final String DUMMY_PERSON_MALE = "dummy"
	public static final String DUMMY_PERSON_FEMALE = "dummy"

	public static String formatNameForDisk(String name)
	{
		name = name.replaceAll(' ', '_')
		return name
	}
}