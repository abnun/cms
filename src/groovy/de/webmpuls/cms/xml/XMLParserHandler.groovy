package de.webmpuls.cms.xml

import org.xml.sax.helpers.XMLFilterImpl
import org.xml.sax.ext.LexicalHandler
import org.xml.sax.InputSource
import org.xml.sax.SAXException

/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 07.01.2010
 * Time: 15:09:01
 */
class XMLParserHandler extends XMLFilterImpl implements LexicalHandler
{
	public InputSource resolveEntity(String publicId, String systemId) throws SAXException, IOException
	{
		System.out.println(systemId);
		return new InputSource(new StringReader(""));
	}

	public void startDocument() throws SAXException
	{
		super.startDocument();
	}

	public void skippedEntity(String name) throws SAXException
	{
		System.out.println("Skipped entity: " + name);
	}

	public void startEntity(String name) throws SAXException
	{
		System.out.println("Start entity: " + name);
	}

	public void endEntity(String name) throws SAXException
	{
		System.out.println("End entity: " + name);
	}

	public void startCDATA() throws SAXException
	{}

	public void endCDATA() throws SAXException
	{}

	public void startDTD(String name, String publicId, String systemId)
	throws SAXException
	{}

	public void endDTD() throws SAXException
	{}

	public void comment(char[] ch, int start, int length) throws
			SAXException
	{}

}