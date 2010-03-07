package de.webmpuls.cms.section
/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 04.03.2010
 * Time: 16:59:27
 */
class AbteilungHelper 
{
	public static String formatCode(String value, String tmpCode)
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