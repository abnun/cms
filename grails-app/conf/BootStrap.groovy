import de.webmpuls.cms.people.Funktion
import de.webmpuls.cms.media.MediaUtils
import de.webmpuls.photo_album.Album
import de.webmpuls.cms.people.ShiroRole
import org.apache.shiro.crypto.hash.Sha1Hash
import de.webmpuls.cms.people.ShiroUser
import org.apache.catalina.core.ApplicationContextFacade
import org.codehaus.groovy.grails.commons.ApplicationAttributes
import org.springframework.context.ApplicationContext
import org.cyberneko.html.parsers.SAXParser
import groovy.xml.MarkupBuilder
import de.webmpuls.cms.xml.XMLParserHandler
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class BootStrap
{

	def init =
	{
		servletContext ->

		initContext()

		environments
		{
			development
			{
				if(Boolean.valueOf((String)ConfigurationHolder.getConfig().flatten().get("alter.static.files")))
				{
					alterStaticFiles(servletContext)
				}
			}
		}
	}

	def destroy =
	{
	}

	private void initContext()
	{
		// Funktionen

		Funktion vorsitzender1 = Funktion.findByCode(Funktion.VORSITZENDER1)
		Funktion vorsitzender2 = Funktion.findByCode(Funktion.VORSITZENDER2)
		Funktion vorsitzender3 = Funktion.findByCode(Funktion.VORSITZENDER3)
		Funktion beisitzer = Funktion.findByCode(Funktion.BEISITZER)
		Funktion webmaster = Funktion.findByCode(Funktion.WEBMASTER)
		Funktion referentin = Funktion.findByCode(Funktion.REFERENT)
		Funktion abteilungsleiter = Funktion.findByCode(Funktion.ABTEILUNGSLEITER)
		Funktion geschaeftsstelle = Funktion.findByCode(Funktion.GESCHAEFTSSTELLE)
		Funktion jugendleiter = Funktion.findByCode(Funktion.JUGENDLEITER)
		Funktion jugendsprecher = Funktion.findByCode(Funktion.JUGENDSPRECHER)
		Funktion kassierer = Funktion.findByCode(Funktion.KASSIERER)
		Funktion leiter_tech_sport = Funktion.findByCode(Funktion.LEITER_TECH_SPORT)
		Funktion leiter_tech_wirt = Funktion.findByCode(Funktion.LEITER_TECH_WIRT)
		Funktion schriftfuehrer = Funktion.findByCode(Funktion.SCHRIFTFUEHRER)
		Funktion seniorenbeauftrager = Funktion.findByCode(Funktion.SENIONERBEAUFTRAGTER)

		if (!vorsitzender1)
		{
			vorsitzender1 = new Funktion(name: '1. Vorsitzende(r)', code: Funktion.VORSITZENDER1, vorstand: true).save(flush: true)
		}

		if (!vorsitzender2)
		{
			vorsitzender2 = new Funktion(name: '2. Vorsitzende(r)', code: Funktion.VORSITZENDER2, vorstand: true).save(flush: true)
		}

		if (!vorsitzender3)
		{
			vorsitzender3 = new Funktion(name: '3. Vorsitzende(r)', code: Funktion.VORSITZENDER3, vorstand: true).save(flush: true)
		}

		if (!beisitzer)
		{
			beisitzer = new Funktion(name: 'Beisitzer(in)', code: Funktion.BEISITZER, vorstand: true).save(flush: true)
		}

		if (!referentin)
		{
			referentin = new Funktion(name: 'Referent(in) für Öffentlichkeitsarbeit', code: Funktion.REFERENT, vorstand: true).save(flush: true)
		}

		if (!webmaster)
		{
			webmaster = new Funktion(name: 'Beisitzer(in)/Webmaster', code: Funktion.WEBMASTER, vorstand: true).save(flush: true)
		}

		if (!abteilungsleiter)
		{
			abteilungsleiter = new Funktion(name: 'Abteilungsleiter(in)', code: Funktion.ABTEILUNGSLEITER, vorstand: false).save(flush: true)
		}

		if (!geschaeftsstelle)
		{
			geschaeftsstelle = new Funktion(name: 'Geschäftsstelle', code: Funktion.GESCHAEFTSSTELLE, vorstand: true).save(flush: true)
		}

		if (!jugendleiter)
		{
			jugendleiter = new Funktion(name: 'Jugendleiter(in)', code: Funktion.JUGENDLEITER, vorstand: true).save(flush: true)
		}

		if (!jugendsprecher)
		{
			jugendsprecher = new Funktion(name: 'Jugendsprecher(in)', code: Funktion.JUGENDSPRECHER, vorstand: true).save(flush: true)
		}

		if (!kassierer)
		{
			kassierer = new Funktion(name: 'Kassierer(in)', code: Funktion.KASSIERER, vorstand: true).save(flush: true)
		}

		if (!leiter_tech_sport)
		{
			leiter_tech_sport = new Funktion(name: 'Sportl. techn. Leiter(in)', code: Funktion.LEITER_TECH_SPORT, vorstand: true).save(flush: true)
		}

		if (!leiter_tech_wirt)
		{
			leiter_tech_wirt = new Funktion(name: 'Wirtsch. techn. Leiter(in)', code: Funktion.LEITER_TECH_WIRT, vorstand: true).save(flush: true)
		}

		if (!schriftfuehrer)
		{
			schriftfuehrer = new Funktion(name: 'Schriftführer(in)', code: Funktion.SCHRIFTFUEHRER, vorstand: true).save(flush: true)
		}

		if (!seniorenbeauftrager)
		{
			seniorenbeauftrager = new Funktion(name: 'Seniorenbeauftragte(r)', code: Funktion.SENIONERBEAUFTRAGTER, vorstand: true).save(flush: true)
		}

		def funktionList = Funktion.list()

		funktionList.each
		{
			println it
		}

		
		// Foto-Alben

		Album personen = Album.findByName(MediaUtils.ALBUM_PERSONEN)
		if(!personen)
		{
			personen =  new Album(name: MediaUtils.ALBUM_PERSONEN, description: "Foto-Album für die Mitglieder des SV-Leingartens")
			personen.save()
		}

		Album verschiedenes = Album.findByName(MediaUtils.ALBUM_VERSCHIEDENES)
		if(!verschiedenes)
		{
			verschiedenes =  new Album(name: MediaUtils.ALBUM_VERSCHIEDENES, description: "Foto-Album für alle anderen Bilder")
			verschiedenes.save()
		}

		Album sponsoren = Album.findByName(MediaUtils.ALBUM_SPONSOREN)
		if(!sponsoren)
		{
			sponsoren =  new Album(name: MediaUtils.ALBUM_SPONSOREN, description: "Foto-Album für die Sponsoren")
			sponsoren.save()
		}


		// System-Rollen

		ShiroRole adminRole = ShiroRole.findByName(ShiroRole.ADMINISTRATOR)
		if(!adminRole)
		{
			adminRole = new ShiroRole(name: ShiroRole.ADMINISTRATOR)
			adminRole.addToPermissions("*:*:*")
			adminRole.save(flush: true)
		}

		ShiroRole userRole = ShiroRole.findByName(ShiroRole.BENUTZER)
		if(!userRole)
		{
			userRole = new ShiroRole(name: ShiroRole.BENUTZER)
			userRole.addToPermissions("*:*:*")
			userRole.save(flush: true)
		}


		// Benutzer

		ShiroUser adminstrator  = ShiroUser.findByUsername(ShiroUser.ADMINISTRATOR)
		if(!adminstrator)
		{
			adminstrator = new ShiroUser(username: ShiroUser.ADMINISTRATOR, passwordHash: new Sha1Hash("xkermitS").toHex())
			adminstrator.addToRoles(adminRole)
			adminstrator.addToRoles(userRole)

			if(!adminstrator.save())
			{
				adminstrator.errors.allErrors.each
				{
					println it
				}
			}
		}

		ShiroUser webmasterUser  = ShiroUser.findByUsername(ShiroUser.WEBMASTER)
		if(!webmasterUser)
		{
			webmasterUser = new ShiroUser(username: ShiroUser.WEBMASTER, passwordHash: new Sha1Hash("test").toHex())
			webmasterUser.addToRoles(userRole)

			if(!webmasterUser.save())
			{
				webmasterUser.errors.allErrors.each
				{
					println it
				}
			}
		}
	}

	private void alterStaticFiles(ApplicationContextFacade servletContext)
	{
		// do those ugly things with the static HTML-files
		ApplicationContext applicationContext = (ApplicationContext) servletContext.getAttribute(ApplicationAttributes.APPLICATION_CONTEXT)

		File sitesDirectory = applicationContext.getResource(File.separator + "sites").getFile()
		if (sitesDirectory.exists())
		{
			ArrayList deleteList = [] as ArrayList

			sitesDirectory.eachFileRecurse
			{
				File tmpFileOrDir ->

				if (!tmpFileOrDir.isDirectory() && !tmpFileOrDir.getName().contains(".gsp"))
				{
					// only take content without menu etc.
					println "Current file -> ${tmpFileOrDir.getParent()}/${tmpFileOrDir.getName()}"

					SAXParser parser = new SAXParser()

					// features
					parser.setFeature('http://xml.org/sax/features/namespaces', false)
					//						parser.setFeature('http://xml.org/sax/features/external-general-entities', false)
					//						parser.setFeature('http://xml.org/sax/features/external-parameter-entities', false)
					//						parser.setFeature("http://apache.org/xml/features/scanner/notify-char-refs", true);
					//						parser.setFeature("http://apache.org/xml/features/scanner/notify-builtin-refs", true);
					//						parser.setFeature("http://cyberneko.org/html/features/scanner/notify-builtin-refs", true);
					parser.setFeature("http://cyberneko.org/html/features/scanner/fix-mswindows-refs", true);
					parser.setFeature("http://cyberneko.org/html/features/scanner/script/strip-comment-delims", true);

					// properties
					parser.setProperty("http://cyberneko.org/html/properties/default-encoding", "UTF-8");
					parser.setProperty("http://cyberneko.org/html/properties/names/elems", "lower");
					parser.setProperty("http://cyberneko.org/html/properties/names/attrs", "lower");
					parser.setProperty("http://xml.org/sax/properties/lexical-handler", new XMLParserHandler())

					Node page = new XmlParser(parser).parse(tmpFileOrDir)

					for (Node tmpNode in page.depthFirst())
					{
						if (tmpNode.attributes().containsKey('width'))
						{
							String width = tmpNode.attributes().get('width').toString()

							if (width == "614" || width == "570")
							{
								for (Node tmpChildNode in tmpNode.depthFirst())
								{
									if (tmpChildNode.attributes().containsKey('src'))
									{
										String imageSrc = tmpChildNode.attributes().get('src').toString()

										if (!imageSrc.contains("\${resource"))
										{
											StringBuilder newImageSrc = new StringBuilder()
											println imageSrc

											int lastIndexOfSlash = imageSrc.lastIndexOf('/')

											newImageSrc << "\${resource("
											newImageSrc << "dir: '"

											if (lastIndexOfSlash == -1)
											{
												imageSrc = tmpFileOrDir.getAbsolutePath()
												lastIndexOfSlash = imageSrc.lastIndexOf('/')
											}

											if (lastIndexOfSlash != -1)
											{
												int start = 0
												if (imageSrc.contains('../'))
												{
													start = imageSrc.lastIndexOf('../') + 3
													if (start > lastIndexOfSlash)
													{
														start = lastIndexOfSlash
													}
												}

												newImageSrc << imageSrc.substring(start, lastIndexOfSlash)
											}

											newImageSrc << "', "
											newImageSrc << "file: '"

											imageSrc = tmpChildNode.attributes().get('src').toString()
											lastIndexOfSlash = imageSrc.lastIndexOf('/')

											newImageSrc << imageSrc.substring(lastIndexOfSlash + 1, imageSrc.size())
											newImageSrc << "')}"

											println newImageSrc.toString()

											tmpChildNode.attributes().put('src', newImageSrc.toString())
										}
									}
									else if (tmpChildNode.attributes().containsKey('href'))
									{
										String ankerSrc = tmpChildNode.attributes().get('href').toString()

										StringBuilder newAnkerHref = new StringBuilder()
										println ankerSrc

										int lastIndexOfSlash = ankerSrc.lastIndexOf('/')

										if (!ankerSrc.contains('http://')
												&& !ankerSrc.contains('mailto:')
												&& !ankerSrc.contains("\${resource")
												&& !ankerSrc.contains("javascript"))
										{
											newAnkerHref << "\${resource("
											newAnkerHref << "dir: '"

											if (lastIndexOfSlash == -1)
											{
												ankerSrc = tmpFileOrDir.toURL().toExternalForm()

												ankerSrc = ankerSrc.substring(sitesDirectory.getParentFile().toURL().toExternalForm().size(), ankerSrc.size())
												lastIndexOfSlash = ankerSrc.lastIndexOf("/")
											}

											if (lastIndexOfSlash != -1)
											{
												int start = 0
												if (ankerSrc.contains('../'))
												{
													start = ankerSrc.lastIndexOf('../') + 3
													if (start > lastIndexOfSlash)
													{
														start = lastIndexOfSlash
													}
												}

												newAnkerHref << ankerSrc.substring(start, lastIndexOfSlash)
											}

											newAnkerHref << "', "
											newAnkerHref << "file: '"

											ankerSrc = tmpChildNode.attributes().get('href').toString()
											lastIndexOfSlash = ankerSrc.lastIndexOf('/')

											String fileName = ankerSrc.substring(lastIndexOfSlash + 1, ankerSrc.size())
											String newFileName = fileName
											if (fileName.contains(".htm"))
											{
												newFileName = fileName.substring(0, fileName.lastIndexOf(".")) + ".gsp"
											}

											newAnkerHref << newFileName
											newAnkerHref << "')}"

											println newAnkerHref.toString()

											tmpChildNode.attributes().put('href', newAnkerHref.toString())
										}
									}
								}

								StringWriter sw = new StringWriter()
								new XmlNodePrinter(new PrintWriter(sw)).print(tmpNode)
								println sw.toString();

								StringBuilder htmlStringBuilder = new StringBuilder()
								htmlStringBuilder << "<html>\n<head>\n<meta name=\"layout\" content=\"sv_leingarten\"/>\n</head>\n"

								htmlStringBuilder << sw.toString()
								htmlStringBuilder << "\n</html>"

								String path = tmpFileOrDir.getAbsolutePath()
								int lastDotInFileName = path.lastIndexOf(".")
								path = path.substring(0, lastDotInFileName)

								InputStreamReader inputStreamReader = new InputStreamReader(new ByteArrayInputStream(htmlStringBuilder.toString().getBytes()))
								BufferedReader bufferedReader = new BufferedReader(inputStreamReader)

								BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path + ".gsp"), "UTF-8"));

								int c;
								while ((c = bufferedReader.read()) != -1)
								{
									bufferedWriter.write(c);
								}

								bufferedReader.close();
								bufferedWriter.flush();
								bufferedWriter.close();

								if (new File(path + ".gsp").exists())
								{
									deleteList.add(tmpFileOrDir)
									println "created new file"
								}
								else
								{
									println "could not create new file"
								}

							}
						}
					}
					//deleteList.add(tmpFileOrDir)
				}
			}

			println deleteList
			for (File deleteFile in deleteList)
			{
				deleteFile.delete()
				if(deleteFile.exists())
				{
					println "something went wrong during deleting"
				}
				else
				{
					println "file deleted!"
				}
			}
		}
	}
} 