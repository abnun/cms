package de.webmpuls.cms

import de.webmpuls.cms.section.AbteilungHelper

class MenuTagLib
{
	static namespace = "menu"

	def header_menu =
	{
		attrs, body ->

		String contextPath = request.getContextPath()
		String requestURI = request.getRequestURI()

		if(log.debugEnabled)
		{
			log.debug("menu.header_menu requestURI -> $requestURI")
		}

		String abteilungFile = params.code ? params.code : (params.id ?: "")
		if(abteilungFile)
		{
			if(abteilungFile == AbteilungHelper.CODE_FUSSBALL_DAMEN || abteilungFile.contains(AbteilungHelper.CODE_FUSSBALL_DAMEN))
			{
				if(abteilungFile != "fussball_-_damen_team.gsp")
				{
					out << "<td class=\"rubrikactiv\">Berichte</td>"
					out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
					out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/fussball_-_damen_team.gsp\">Das Team</a></td>"
				}
				else
				{
					out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'abteilung', action: 'show', params: [code: AbteilungHelper.CODE_FUSSBALL_DAMEN], mapping: 'abteilungShow')}\">Berichte</a></td>"
					out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
					out << "<td class=\"rubrikactiv\">Das Team</td>"
				}
			}
		}
		else
		{
			out << ""
		}
	}
}
