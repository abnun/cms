package de.webmpuls.cms

import de.webmpuls.cms.section.AbteilungHelper
import de.webmpuls.cms.section.Abteilung

class LayoutTagLib
{
	static namespace = "layout"

	def header_image =
	{
		attrs, body ->

		String contextPath = request.getContextPath()
		String requestURI = request.getRequestURI()

		if(log.debugEnabled)
		{
			log.debug("layout.header_images requestURI -> $requestURI")
		}

		String dir = "bilder/koepfe"

		if(requestURI == contextPath + '/')
		{
			out << "<img src=\"${resource(dir: dir, file: 'aktuelles.jpg')}\" width=\"690\" height=\"88\">"
			return out
		}
		else if(requestURI.contains(AbteilungHelper.CODE_ABTEILUNGEN))
		{
			String abteilungFile = params.code ? params.code : (params.id ?: "")

			String abteilungCode = ""

			if (abteilungFile)
			{
				def abteilungCodes = Abteilung.list([cache: true])*.code
				for (String aCode in abteilungCodes)
				{
					if (abteilungFile.contains(aCode))
					{
						abteilungCode = aCode
					}
				}

				if (abteilungCode == AbteilungHelper.CODE_RADSPORT)
				{
					out << "<a target=\"_blank\" href=\"http://gaestebuch.gbserver.de/radsportleingarten,1.html\">"
				}

				if (abteilungCode)
				{
					out << "<img src=\"${resource(dir: dir, file: abteilungCode + '.jpg')}\" width=\"690\" height=\"88\" border=\"0\">"
				}

				if (abteilungCode == AbteilungHelper.CODE_RADSPORT)
				{
					out << "</a>"
				}

			}
			else
			{
				out << ""
			}
		}
		else if(controllerName == 'person' && (actionName == 'vorstand' || actionName == "jugend_vorstand" || actionName == "delegierte"))
		{
			out << "<img src=\"${resource(dir: dir, file: 'organe.jpg')}\" width=\"690\" height=\"88\">"
		}
		else
		{
			out << "<img src=\"${resource(dir: 'bilder/divers', file: 'allgkopf.jpg')}\" width=\"690\" height=\"88\">"
		}
		
		return out
	}
}
