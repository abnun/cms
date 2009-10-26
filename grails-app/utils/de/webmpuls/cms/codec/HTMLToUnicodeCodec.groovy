package de.webmpuls.cms.codec

import org.apache.commons.lang.StringEscapeUtils

/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 12.10.2009
 * Time: 13:16:22
 */
class HTMLToUnicodeCodec 
{
	/**
	 * Wandelt HTML-Entities in einem String zu Unicode-Entities um.  
	 */
	public static String encode(Object target)
	{
		String result = target.toString()
//		println("encodeAsHTMLToUnicode before encode-> $result")

		// zuerst das HTML dekodieren, damit wir normale Zeichen haben
		result = result.decodeHTML()

		// danach die normalen Zeichen als Unicode enkodieren
		result = StringEscapeUtils.escapeXml(result)
//		println("encodeAsHTMLToUnicode after encode-> $result")
		return result
	}

	/**
	 * Wandelt Unicode-Entities in einem String zu HTML-Entities um.  
	 */
	public static String decode(Object target)
	{
		String result = target.toString()
//		println("decodeHTMLToUnicode before decode-> $result")

		// zuerst die Unicode-Zeichen dekodieren, damit wir normale Zeichen haben
		result = StringEscapeUtils.unescapeXml(result)

		// danach die normalen Zeichen als HTML enkodieren
		result = result.encodeAsHTML()
//		println("decodeHTMLToUnicode after decode-> $result")
		return result
	}
}