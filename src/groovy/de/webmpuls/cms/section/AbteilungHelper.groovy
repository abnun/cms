package de.webmpuls.cms.section
/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 04.03.2010
 * Time: 16:59:27
 */
class AbteilungHelper 
{
	// Codes
	static final String CODE_ABTEILUNGEN = "abteilungen"
	static final String CODE_BADMINTON = "badminton"
	static final String CODE_BASKETBALL = "basketball"
	static final String CODE_FUSSBALL_AH = "fussball_-_ah"
	static final String CODE_FUSSBALL_DAMEN = "fussball_-_damen"
	static final String CODE_FUSSBALL_HERREN = "fussball_-_herren"
	static final String CODE_FUSSBALL_JUGEND = "fussball_-_jugend"
	static final String CODE_HANDBALL = "handball"
	static final String CODE_KARATE = "karate"
	static final String CODE_LEICHTATHLETIK = "leichtathletik"
	static final String CODE_RADSPORT = "radsport"
	static final String CODE_REITEN = "reiten"
	static final String CODE_SCHACH = "schach"
	static final String CODE_SKI = "ski"
	static final String CODE_TANZEN = "tanzen"
	static final String CODE_TENNIS = "tennis"
	static final String CODE_TISCHTENNIS = "tischtennis"
	static final String CODE_TURNEN = "turnen"
	static final String CODE_VOLLEYBALL = "volleyball"

	// Names
	static final String NAME_BADMINTON = "Badminton"
	static final String NAME_BASKETBALL = "Basketball"
	static final String NAME_FUSSBALL_AH = "Fußball - AH"
	static final String NAME_FUSSBALL_DAMEN = "Fußball - Damen"
	static final String NAME_FUSSBALL_HERREN = "Fußball - Herren"
	static final String NAME_FUSSBALL_JUGEND = "Fußball - Jugend"
	static final String NAME_HANDBALL = "Handball"
	static final String NAME_KARATE = "Karate"
	static final String NAME_LEICHTATHLETIK = "Leichtathletik"
	static final String NAME_RADSPORT = "Radsport"
	static final String NAME_REITEN = "Reiten"
	static final String NAME_SCHACH = "Schach"
	static final String NAME_SKI = "Ski"
	static final String NAME_TANZEN = "Tanzen"
	static final String NAME_TENNIS = "Tennis"
	static final String NAME_TISCHTENNIS = "Tischtennis"
	static final String NAME_TURNEN = "Turnen"
	static final String NAME_VOLLEYBALL = "Volleyball"

	public static String formatNameToCode(String value, String tmpCode)
	{
		if(value)
		{
			value = value.toLowerCase()
			tmpCode = value
			if (value.contains(" "))
			{
				tmpCode = tmpCode.replaceAll(" ", "_")
			}
			if (value.contains("."))
			{
				tmpCode = tmpCode.replaceAll(".", "")
			}
			if (value.contains("/"))
			{
				tmpCode = tmpCode.replaceAll("/", "_")
			}
			if (value.contains("("))
			{
				tmpCode = tmpCode.replaceAll("\\(", "")
			}
			if (value.contains(")"))
			{
				tmpCode = tmpCode.replaceAll("\\)", "")
			}
			if (value.contains("ß"))
			{
				tmpCode = tmpCode.replaceAll("ß", "ss")
			}
			if (value.contains("ä"))
			{
				tmpCode = tmpCode.replaceAll("ä", "ae")
			}
			if (value.contains("ü"))
			{
				tmpCode = tmpCode.replaceAll("ü", "ue")
			}
			if (value.contains("ö"))
			{
				tmpCode = tmpCode.replaceAll('ö', "oe")
			}
		}

		return tmpCode
	}
}