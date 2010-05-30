package de.webmpuls.cms.content

import de.webmpuls.cms.start.Anzeigen
import de.webmpuls.cms.start.News
import de.webmpuls.cms.start.Termin
import de.webmpuls.cms.section.Bericht

class InhaltController
{

    def index = { }

    def aktuelles =
	{
		def anzeigenList = Anzeigen.list([cache: true])
		def newsList = News.list(max: 5, cache: true)
		def terminList = Termin.letzteTermine().listOrderByStartDatum([cache: true])
		return [anzeigenList: anzeigenList, newsList: newsList, terminList: terminList]
	}

	def termine =
	{
		def terminList = Termin.letzteTermine().listOrderByStartDatum([cache: true])

		return [terminList:terminList]
	}
}
