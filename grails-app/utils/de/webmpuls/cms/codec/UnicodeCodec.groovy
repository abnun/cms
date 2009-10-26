package de.webmpuls.cms.codec

import org.apache.commons.lang.StringEscapeUtils

/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 12.10.2009
 * Time: 13:16:22
 */
class UnicodeCodec
{
	/**
	 * Wandelt normale Zeichen in einem String zu Unicode-Entities um.
	 */
	public static String encode(Object target)
	{
		String result = target.toString()
		println("encodeAsUnicode before encode-> $result")

		// normale Zeichen als Unicode enkodieren
		result = StringEscapeUtils.escapeXml(result)
		println("encodeAsUnicode after encode-> $result")
		return result
	}

	/**
	 * Wandelt Unicode-Entities in einem String zu normalen Zeichen um.
	 */
	public static String decode(Object target)
	{
		String result = target.toString()
		println("decodeUnicode before decode-> $result")

		// Unicode-Zeichen dekodieren, damit wir normale Zeichen haben
		result = StringEscapeUtils.unescapeXml(result)
		println("decodeUnicode after decode-> $result")
		return result
	}
}