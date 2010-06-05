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
import org.springframework.context.ApplicationContextAware
import org.springframework.context.ApplicationContext
import de.webmpuls.cms.section.AbteilungHelper
import org.cyberneko.html.Version

class ImportService implements ApplicationContextAware
{

	boolean transactional = false

	ApplicationContext applicationContext

	public void importHTMLTable(String link)
	{
		log.debug(Version.getVersion())
		SAXParser parser = new SAXParser()
		parser.setFeature('http://xml.org/sax/features/namespaces', false)
		parser.setProperty('http://cyberneko.org/html/properties/default-encoding', 'UTF-8')
		Node page = new XmlParser(parser).parse(link)

		log.debug("page -> $page")

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("E, dd.MM.yyyy")

		Date tmpDate = null

		ArrayList arrayListTR = page.depthFirst().'TR'

		if (arrayListTR)
		{
			//for (NodeList nodeListTR in arrayListTR)
			for (Node nodeTR in arrayListTR)
			{
				Tabelle newTable = null

				//if(nodeListTR)
				//{
					newTable = new Tabelle()

					//for (Node nodeTR in nodeListTR)
					//{
						ArrayList arrayListTD = nodeTR.depthFirst().'TD'
						if (arrayListTD)
						{
							//for (NodeList nodeListTD in arrayListTD)
							for (Node tmpNodeTD in arrayListTD)
							{
								//if (nodeListTD)
								if (tmpNodeTD)
								{
									//for (Node tmpNodeTD in nodeListTD)
									//{
										println tmpNodeTD
										if(tmpNodeTD instanceof Node)
										{
											//String tmpText = new String(tmpNodeTD.text().getBytes("ISO-8859-1"), "UTF-8")
											String tmpText = tmpNodeTD.text()

											// Spielkennung rausfischen
											if (tmpNodeTD.attributes())
											{
												if(tmpNodeTD.attributes().'class'.contains('edVSpielkennung'))
												{
													ArrayList arrayListAnker = tmpNodeTD.depthFirst().'A'

													if (arrayListAnker)
													{
														//for (NodeList nodeListAnker in arrayListAnker)
														for (Node nodeAnker in arrayListAnker)
														{
															//if (nodeListAnker)
															if (nodeAnker)
															{
																//for (Node nodeAnker in nodeListAnker)
																//{
																	tmpText = nodeAnker.text()
																//}
															}
														}
													}

													println "Spielkennung: $tmpText"

													Tabelle existingTable = Tabelle.findBySpielkennung(tmpText)
													if (existingTable)
													{
														newTable = existingTable
														println "found existing table"
													}
													newTable.spielkennung = tmpText
												}

												// Heim-Mannschaft rausfischen
												else if (tmpNodeTD.attributes().'class'.contains('edVHeim'))
												{
													println "Heimmannschaft: $tmpText"
													newTable.heimmannschaft = tmpText
												}

												// Gast-Mannschaft rausfischen
												else if (tmpNodeTD.attributes().'class'.contains('edVGast'))
												{
													println "Gastmannschaft: $tmpText"
													newTable.gastmannschaft = tmpText
												}

												// Anstoss-Uhrzeit rausfischen
												else if (tmpNodeTD.attributes().'class'.contains('edVAnstoss'))
												{
													println "Anstoss: $tmpText"
													newTable.anstoss = tmpText
												}

												// Tore rausfischen
												else if (tmpNodeTD.attributes().'class'.contains('edVTore'))
												{
													ArrayList arrayListDIV = tmpNodeTD.depthFirst().'DIV'
													if (arrayListDIV)
													{
														for(Node tmpNodeDIV in tmpNodeTD.depthFirst())
														{
															if(tmpNodeDIV.attributes().'style')
															{
																tmpText = tmpNodeDIV.attributes().'style'
																println "Style: $tmpText"
																newTable.toreImageStyle = tmpText
															}
															if (tmpNodeDIV.attributes().'src')
															{
																String tmpLink = "http://www.fussball.de${tmpNodeDIV.attributes().'src'}"

																URL tmpURL = new URL(tmpLink)

																println tmpLink.tokenize("/")[-1]

																String targetFileName = newTable.spielkennung
																targetFileName = targetFileName.replaceAll(" ", "_")
																targetFileName = targetFileName + ".png"

																println targetFileName

																String targetPath = applicationContext.getResource(File.separator + "bilder" + File.separator + "tabellen" + File.separator + "tore" + File.separator + targetFileName).getFile().getAbsolutePath()

																println "Zielpfad für Image: $targetPath"

																FileOutputStream fileOutputStream = new FileOutputStream(targetPath)
																BufferedOutputStream out = new BufferedOutputStream(fileOutputStream)
																out << tmpURL.openStream()
																out.close()

																tmpText = targetFileName
																println "Tore: $tmpText"
																newTable.tore = tmpText
															}
															else
															{
																println "Tore: $tmpText"
																newTable.tore = tmpText
															}
														}

													}
													else
													{
														println "Tore: $tmpText"
														newTable.tore = tmpText
													}
												}

												// Spielklasse rausfischen
												else if (tmpNodeTD.attributes().'class'.contains('edVSpielklasse'))
												{
													println "Spielkasse: $tmpText"
													newTable.spielklasse = tmpText
												}

												// Typ rausfischen
												else if (tmpNodeTD.attributes().'class'.contains('edVTyp'))
												{
													println "Typ: $tmpText"
													newTable.typ = tmpText
												}

												// Datum der Spieltage rausfischen
												if (tmpNodeTD.attributes().'class' == 'edDatum')
												{
													println "Datum: $tmpText"
													tmpDate = simpleDateFormat.parse(tmpText)
													newTable.spieldatum = tmpDate
													break
												}
												else
												{
													newTable.spieldatum = tmpDate
												}
											}
										}
									}
								}
							//}
						//}
					//}

					if(newTable)
					{
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
			def personenNew = []

			def abteilungenForLaterSave = []

			def funktionenForLaterSave = []

			int s = 1;

			//			HSSFRow row = sheet.getRow(s)
			//			HSSFCell cell  = row.getCell((short)1);
			//			println cell.getStringCellValue()

			boolean isOldExcelFormat = true

			while (s <= sheet.getLastRowNum())
			{
				HSSFRow row = sheet.getRow(s)

				int r = 0;

				def substring = ""

				tmpPerson = new Person()
				tmpPerson.adresseAnzeigen = true

				String telefon1String = ""

				short cellCount = row.getLastCellNum()
				if (cellCount == 9)
				{
					isOldExcelFormat = false
				}

				while (row && r < row.getLastCellNum())
				{
					HSSFCell cell = row.getCell((short) r);

					if (cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
					{
						String value = cell.getStringCellValue()
						if (value)
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

						String tmpNachname = tmpPerson.nachname
						String tmpVorname = tmpPerson.vorname
						if (tmpNachname && tmpVorname)
						{
							Person checkPerson = Person.findByNachnameAndVorname(tmpNachname, tmpVorname)

							if (checkPerson)
							{
								log.debug("Gespeicherte Person bereits gefunden -> $checkPerson")
								tmpPerson = checkPerson
							}
						}

						if (r == 2)
						{
							tmpPerson.strasse = value

						}

						if (isOldExcelFormat)
						{
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

								if (tmpFunktion && !tmpAbteilung)
								{
									log.debug("Funktion: $tmpFunktion")

									if (!tmpPerson.funktionen?.contains(tmpFunktion))
									{
										tmpPerson.addToFunktionen(tmpFunktion)
									}

									if (!tmpFunktion.personen?.contains(tmpPerson))
									{
										tmpFunktion.addToPersonen(tmpPerson)
									}

									funktionenForLaterSave << tmpFunktion
								}

								else if (!tmpAbteilung)
								{
									String tmpCode = value.toLowerCase()

									tmpCode = AbteilungHelper.formatNameToCode(value, tmpCode)

									Abteilung newAbteilung = new Abteilung(name: value, code: tmpCode, anzeigeImMenu: true)

									//abteilungenForLaterSave << newAbteilung

									tmpAbteilung = newAbteilung
								}
								if (tmpAbteilung)
								{
									log.debug("Abteilung: $tmpAbteilung")
									Funktion abteilungsLeiterFunktion = Funktion.findByCode(Funktion.ABTEILUNGSLEITER)
									if (abteilungsLeiterFunktion)
									{
										if (!tmpPerson.funktionen?.contains(abteilungsLeiterFunktion))
										{
											tmpPerson.addToFunktionen(abteilungsLeiterFunktion)
										}

										if (!tmpAbteilung.mitarbeiterfunktionen?.contains(abteilungsLeiterFunktion))
										{
											tmpAbteilung.addToMitarbeiterfunktionen(abteilungsLeiterFunktion)
										}

										if (!tmpAbteilung.personen?.contains(tmpPerson))
										{
											tmpAbteilung.addToPersonen(tmpPerson)
										}
										abteilungenForLaterSave << tmpAbteilung
									}
								}
							}
						}
						else
						{
							if (r == 3)
							{
								tmpPerson.plz = value
							}

							if (r == 4)
							{
								tmpPerson.ort = value

							}

							if (r == 5)
							{
								tmpPerson.telefon1 = value
							}

							if (r == 6)
							{
								tmpPerson.telefon2 = value
							}

							if (r == 7)
							{
								tmpPerson.email = value

							}

							if (r == 8)
							{
								Funktion tmpFunktion = Funktion.findByName(value)

								Abteilung tmpAbteilung = Abteilung.findByName(value)

								if (tmpFunktion && !tmpAbteilung)
								{
									log.debug("Funktion: $tmpFunktion")

									if (!tmpPerson.funktionen?.contains(tmpFunktion))
									{
										tmpPerson.addToFunktionen(tmpFunktion)
									}

									if (!tmpFunktion.personen?.contains(tmpPerson))
									{
										tmpFunktion.addToPersonen(tmpPerson)
									}

									funktionenForLaterSave << tmpFunktion
								}

								else if (!tmpAbteilung)
								{
									String tmpCode = value.toLowerCase()
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
									Abteilung newAbteilung = new Abteilung(name: value, code: tmpCode)

									abteilungenForLaterSave << newAbteilung

									tmpAbteilung = newAbteilung

									if (tmpAbteilung)
									{
										log.debug("Abteilung: $tmpAbteilung")
										Funktion abteilungsLeiterFunktion = Funktion.findByCode(Funktion.ABTEILUNGSLEITER)
										if (abteilungsLeiterFunktion)
										{
											if (!tmpPerson.funktionen?.contains(abteilungsLeiterFunktion))
											{
												tmpPerson.addToFunktionen(abteilungsLeiterFunktion)
											}

											if (!tmpAbteilung.mitarbeiterfunktionen?.contains(abteilungsLeiterFunktion))
											{
												tmpAbteilung.addToMitarbeiterfunktionen(abteilungsLeiterFunktion)
											}

											if (!tmpAbteilung.personen?.contains(tmpPerson))
											{
												tmpAbteilung.addToPersonen(tmpPerson)
											}
											abteilungenForLaterSave << tmpAbteilung
										}
									}
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

							if (telefon1String.toString().size() < 5)
							{
								telefon1String = "0${telefon1String}"

								tmpPerson.telefon1 = telefon1String

								log.debug("Vorwahl: $telefon1String")
							}
						}

						if (r == 6)
						{
							if (telefon1String.startsWith("0"))
							{
								telefon1String += "/${value.intValue().toString()}"
								tmpPerson.telefon1 = telefon1String

								log.debug("Komplette Rufnummer: $telefon1String")
							}
						}
					}
					r++;
				}

				if (tmpPerson.validate() && !personenNew.contains(tmpPerson))
				{
					personenNew << tmpPerson
				}

				s++;
			}
			if (funktionenForLaterSave)
			{
				for (Funktion funktion: funktionenForLaterSave)
				{
					Funktion checkFunktion = Funktion.findByCode(funktion.code)
					if (checkFunktion)
					{
						log.debug("Gespeicherte Funktion gefunden ...")
						checkFunktion.name = funktion.name
						checkFunktion.code = funktion.code

						for (Person tmpFPerson: funktion.personen)
						{
							if (!checkFunktion.personen.contains(tmpFPerson))
							{
								checkFunktion.addToPersonen(tmpFPerson)
							}
						}


						checkFunktion.save(flush: true)
					}
					else
					{
						log.debug("Lege neue Funktion an ...")
						funktion.save(flush: true)
					}
				}
			}
			if (abteilungenForLaterSave)
			{
				for (Abteilung abteilung: abteilungenForLaterSave)
				{
					Abteilung checkAbteilung = Abteilung.findByCode(abteilung.code)
					if (checkAbteilung)
					{
						log.debug("Gespeicherte Abteilung gefunden ...")
						checkAbteilung.name = abteilung.name
						checkAbteilung.code = abteilung.code

						for (Funktion tmpAFunktion: abteilung.mitarbeiterfunktionen)
						{
							if (!checkAbteilung.mitarbeiterfunktionen.contains(tmpAFunktion))
							{
								checkAbteilung.addToMitarbeiterfunktionen(tmpAFunktion)
							}
						}

						for (Person tmpAPerson: abteilung.personen)
						{
							if (!checkAbteilung.personen.contains(tmpAPerson))
							{
								Person checkAPerson = Person.findByNachnameAndVorname(tmpAPerson.nachname, tmpAPerson.vorname)

								if (checkAPerson)
								{
									for (Funktion tmpPFunktion: tmpAPerson.funktionen)
									{
										if (!checkAPerson.funktionen.contains(tmpPFunktion))
										{
											checkAPerson.addToFunktionen(tmpPFunktion)
										}
									}
								}
								checkAbteilung.addToPersonen(tmpAPerson)
							}
						}

						checkAbteilung.save(flush: true)
					}
					else
					{
						log.debug("Lege neue Abteilung an ...")
						abteilung.save(flush: true)
					}
				}
			}
			if (personenNew)
			{
				for (Person person: personenNew)
				{
					Person checkPerson = Person.findByVornameAndNachname(person.vorname, person.nachname)
					if (checkPerson)
					{
						log.debug("Gespeicherte Person gefunden ...")
						checkPerson.vorname = person.vorname
						checkPerson.nachname = person.nachname
						checkPerson.strasse = person.strasse
						checkPerson.plz = person.plz
						checkPerson.ort = person.ort
						checkPerson.telefon1 = person.telefon1
						checkPerson.telefon2 = person.telefon2
						checkPerson.email = person.email
						checkPerson.adresseAnzeigen = person.adresseAnzeigen

						for (Funktion tmpPFunktion: person.funktionen)
						{
							if (!checkPerson.funktionen.contains(tmpPFunktion))
							{
								checkPerson.addToFunktionen(tmpPFunktion)
							}
						}

						for (Abteilung tmpPAbteilung: person.abteilungen)
						{
							if (!checkPerson.abteilungen.contains(tmpPAbteilung))
							{
								checkPerson.addToAbteilungen(tmpPAbteilung)
							}
						}

						checkPerson.save(flush: true)
					}
					else
					{
						log.debug("Lege neue Person an ...")
						person.save(flush: true)
					}
				}
			}
		}
		log.debug(Person.list()*.toString())
	}
}
