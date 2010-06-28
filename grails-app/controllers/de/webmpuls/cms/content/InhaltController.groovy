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
		def newsList = News.listOrderByLastModified(max: 5, cache: true)

		HashMap newsMap = new HashMap()

		for(News tmpNews in newsList)
		{
			String abteilungId = tmpNews.abteilung.id
			ArrayList tmpList = newsMap.get(abteilungId)
			if(!tmpList)
			{
				tmpList = new ArrayList()
				tmpList.add(tmpNews)
			}
			else
			{
				tmpList.add(tmpNews)
			}
			newsMap.put(abteilungId, tmpList)
		}

		def terminList = Termin.letzteTermine().listOrderByStartDatum([cache: true])
		return [anzeigenList: anzeigenList, newsMap: newsMap, terminList: terminList]
	}

	def termine =
	{
		def terminList = Termin.letzteTermine().listOrderByStartDatum([cache: true])

		return [terminList:terminList]
	}
}
