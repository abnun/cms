package de.webmpuls.cms.content

import de.webmpuls.cms.start.Anzeigen
import de.webmpuls.cms.start.News
import de.webmpuls.cms.start.Termin

class InhaltController
{

    def index = { }

    def aktuelles =
	{
		def anzeigenList = Anzeigen.list([cache: true])
		def newsList = News.list(max: 5, cache: true)
		def terminList = Termin.letzteTermine().listOrderByDatum()
		return [anzeigenList: anzeigenList, newsList: newsList, terminList: terminList]
	}

	def sitzungen =
	{
		def terminList = Termin.letzteTermine().listOrderByDatum()

		return [terminList:terminList]
	}
}
