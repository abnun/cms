package de.webmpuls.cms.content

import de.webmpuls.cms.start.Anzeigen
import de.webmpuls.cms.start.News

class InhaltController
{

    def index = { }

    def aktuelles =
	{
		def anzeigenList = Anzeigen.list([cache: true])
		def newsList = News.list([cache: true])
		return [anzeigenList: anzeigenList, newsList: newsList]
	}
}
