package de.webmpuls.cms.util

import de.webmpuls.cms.result.Tabelle
import java.text.SimpleDateFormat
import org.cyberneko.html.parsers.SAXParser
import org.springframework.web.multipart.MultipartFile
import org.apache.poi.poifs.filesystem.POIFSFileSystem
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.hssf.usermodel.HSSFSheet
import org.apache.poi.hssf.usermodel.HSSFRow
import de.webmpuls.cms.people.Person
import org.apache.poi.hssf.usermodel.HSSFCell
import de.webmpuls.cms.people.Funktion
import de.webmpuls.cms.section.Abteilung

class ImportService
{

	boolean transactional = false

    public void importHTMLTable(String link)
	{
		SAXParser parser = new SAXParser()
		parser.setFeature('http://xml.org/sax/features/namespaces', false)
		Node page = new XmlParser(parser).parse(link)

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("E, dd.MM.yyy")

		Date tmpDate = null

		page.depthFirst().'TR'.eachWithIndex
		{
			Node tmpNodeTR, int iTR ->

			Tabelle newTable = new Tabelle()

			tmpNodeTR.depthFirst().'TD'.eachWithIndex
			{
				Node tmpNodeTD, int iTD ->

				String tmpText = new String(tmpNodeTD.text().getBytes("ISO-8859-1"), "UTF-8")

				// Spielkennung rausfischen
				if(tmpNodeTD.attributes().'class'.contains('edVSpielkennung'))
				{
					if(tmpNodeTD.depthFirst().'A')
					{
						tmpText = tmpNodeTD.depthFirst().'A'.text()
					}
					println "$iTD -> Spielkennung: $tmpText"

					Tabelle existingTable = Tabelle.findBySpielkennung(tmpText)
					if(existingTable)
					{
						newTable = existingTable
						println "found existing table"
					}
					newTable.spielkennung = tmpText
				}

				// Heim-Mannschaft rausfischen
				else if(tmpNodeTD.attributes().'class'.contains('edVHeim'))
				{
					println "$iTD -> Heimmannschaft: $tmpText"
					newTable.heimmannschaft = tmpText
				}

				// Gast-Mannschaft rausfischen
				else if(tmpNodeTD.attributes().'class'.contains('edVGast'))
				{
					println "$iTD -> Gastmannschaft: $tmpText"
					newTable.gastmannschaft = tmpText
				}

				// Anstoss-Uhrzeit rausfischen
				else if(tmpNodeTD.attributes().'class'.contains('edVAnstoss'))
				{
					println "$iTD -> Anstoss: $tmpText"
					newTable.anstoss = tmpText
				}

				// Tore rausfischen
				else if(tmpNodeTD.attributes().'class'.contains('edVTore'))
				{
					if(tmpNodeTD.depthFirst().'DIV')
					{
						tmpNodeTD.depthFirst().each
						{
							Node tmpNodeDIV ->

							if(tmpNodeDIV.attributes().'src')
							{
								tmpText = "<img src=\"http://www.fussball.de${tmpNodeDIV.attributes().'src'}\" alt=\"\" border=\"0\" />"
								println "$iTD -> Tore: $tmpText"
								newTable.tore = tmpText
							}
						}

					}
					else
					{
						println "$iTD -> Tore: $tmpText"
						newTable.tore = tmpText
					}
				}

				// Spielklasse rausfischen
				else if(tmpNodeTD.attributes().'class'.contains('edVSpielklasse'))
				{
					println "$iTD -> Spielkasse: $tmpText"
					newTable.spielklasse = tmpText
				}

				// Typ rausfischen
				else if(tmpNodeTD.attributes().'class'.contains('edVTyp'))
				{
					println "$iTD -> Typ: $tmpText"
					newTable.typ = tmpText
				}

				// Datum der Spieltage rausfischen
				if(tmpNodeTD.attributes().'class' == 'edDatum')
				{
					println "$iTD -> Datum: $tmpText"
					tmpDate = simpleDateFormat.parse(tmpText)
					newTable.spieldatum = tmpDate
				}
				else
				{
					println "$iTD -> Datum: $tmpDate"
					newTable.spieldatum = tmpDate
				}
			}

			if (newTable.validate() && !newTable.hasErrors())
			{
				newTable.save(flush: true)
				println "table saved"
			}
			else
			{
				if (newTable.hasErrors())
				{
					newTable.errors.each
					{
						println it
					}
				}
			}
		}
    }

	public void importExcel(MultipartFile excelFile)
	{
		File file = new File('excel.tmp')
		file.deleteOnExit()
		excelFile.transferTo(file)

		Person tmpPerson

		if (file)
		{
			def tempFile = file
			log.debug("tempFile -> " + tempFile)
			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(tempFile));
			HSSFWorkbook hssfworkbook = new HSSFWorkbook(fs);
			int k = 0;

			HSSFSheet sheet = hssfworkbook.getSheetAt(0);

			// Liste fuer die neuen Personen
			def personenNeu = []

			int s = 1;

			//			HSSFRow row = sheet.getRow(s)
			//			HSSFCell cell  = row.getCell((short)1);
			//			println cell.getStringCellValue()

			while (s <= sheet.getLastRowNum())
			{
				HSSFRow row = sheet.getRow(s)

				int r = 0;

				def substring = ""

				tmpPerson = new Person()

				String telefon1String = ""

				while (row && r < row.getLastCellNum())
				{
					HSSFCell cell = row.getCell((short) r);

					if (cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
					{
						String value = cell.getStringCellValue()
						if(value)
						{
							value = value.trim()
						}
						log.debug("cellvalue string -> $r $value")

						if (r == 0)
						{
							tmpPerson.nachname = value
						}

						if (r == 1)
						{
							tmpPerson.vorname = value

						}

						if (r == 2)
						{
							tmpPerson.strasse = value

						}

						if (r == 3)
						{
							tmpPerson.strasse = value

						}

						if (r == 4)
						{
							tmpPerson.ort = value

						}

						if (r == 7)
						{
							tmpPerson.telefon2 = value

						}

						if (r == 8)
						{
							tmpPerson.email = value

						}

						if (r == 9)
						{
							Funktion tmpFunktion = Funktion.findByName(value)

							Abteilung tmpAbteilung = Abteilung.findByName(value)

							if(tmpFunktion)
							{
								log.debug("Funktion: $tmpFunktion")
								tmpPerson.addToFunktionen(tmpFunktion)
								tmpFunktion.addToPersonen(tmpPerson)

								if(tmpFunktion.save(flush: true))
								{
									log.debug("Funktion '${tmpFunktion}' gespeichert.")
								}
								else
								{
									tmpFunktion.errors.each
									{
										log.error(it)
									}
								}
							}

							else if(!tmpAbteilung)
							{
								String tmpCode = value.toLowerCase()
								if(value.contains(" "))
								{
									tmpCode = tmpCode.replaceAll(" ", "_")
								}
								if(value.contains("."))
								{
									tmpCode = tmpCode.replaceAll(".", "")
								}
								if(value.contains("/"))
								{
									tmpCode = tmpCode.replaceAll("/", "_")
								}
								if(value.contains("("))
								{
									tmpCode = tmpCode.replaceAll("\\(", "")
								}
								if(value.contains(")"))
								{
									tmpCode = tmpCode.replaceAll("\\)", "")
								}
								if(value.contains("ß"))
								{
									tmpCode = tmpCode.replaceAll("ß", "ss")
								}
								if(value.contains("ä"))
								{
									tmpCode = tmpCode.replaceAll("ä", "ae")
								}
								if(value.contains("ü"))
								{
									tmpCode = tmpCode.replaceAll("ü", "ue")
								}
								if(value.contains("ö"))
								{
									tmpCode = tmpCode.replaceAll('ö', "oe")
								}
								Abteilung newAbteilung = new Abteilung(name: value, code: tmpCode)

								if(newAbteilung.save(flush: true))
								{
									log.debug("Neue Abteilung -> ${newAbteilung.name}")
								}
								else
								{
									newAbteilung.errors.each
									{
										log.error(it)
									}
								}

								tmpAbteilung = newAbteilung
							}

							if(tmpAbteilung)
							{
								log.debug("Abteilung: $tmpAbteilung")
								Funktion abteilungsLeiterFunktion = Funktion.findByCode(Funktion.ABTEILUNGSLEITER)
								if (abteilungsLeiterFunktion)
								{
									tmpPerson.addToFunktionen(abteilungsLeiterFunktion)

									tmpAbteilung.addToMitarbeiterfunktionen(abteilungsLeiterFunktion)
									tmpAbteilung.save(flush: true)
								}
							}

						}
					}
					if (cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
					{
						Double value = cell.getNumericCellValue()
						log.debug("cellvalue numeric -> $r $value")
						log.debug("cellvalue numeric to int -> $r ${value.intValue()}")

						if (r == 3)
						{
							tmpPerson.plz = value.intValue()

						}

						if (r == 5)
						{
							telefon1String = value.intValue().toString()

							if(telefon1String.toString().size() < 5)
							{
								telefon1String = "0${telefon1String}"

								log.debug("Vorwahl: $telefon1String")
							}
						}

						if (r == 6)
						{
							if(telefon1String.startsWith("0"))
							{
								telefon1String += "/${value.intValue().toString()}"
								tmpPerson.telefon1 = telefon1String

								log.debug("Komplette Rufnummer: $telefon1String")
							}
						}
					}
					r++;
				}

				if (tmpPerson.validate())
				{
					personenNeu << tmpPerson
				}
				else
				{
					tmpPerson.errors.each
					{
						log.error(it)
					}
				}

				s++;
			}
			if (personenNeu)
			{
				for(Person person : personenNeu)
				{
					Person checkPerson = Person.findByVornameAndNachname(person.vorname,  person.nachname)
					if(checkPerson)
					{
						checkPerson.vorname =  person.vorname
						checkPerson.nachname =  person.nachname
						checkPerson.strasse =  person.strasse
						checkPerson.plz =  person.plz
						checkPerson.ort =  person.ort
						checkPerson.telefon1 =  person.telefon1
						checkPerson.telefon2 =  person.telefon2
						checkPerson.email =  person.email
						checkPerson.adresseAnzeigen = person.adresseAnzeigen

						checkPerson.save(flush: true)
					}
					else
					{
						person.save(flush: true)
					}
				}
			}
		}
		log.debug(Person.list()*.toString())
	}
}
