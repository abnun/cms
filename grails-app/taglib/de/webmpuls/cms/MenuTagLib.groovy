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
		String id = params.id

		if(log.debugEnabled)
		{
			log.debug("menu.header_menu requestURI -> $requestURI")
			log.debug("menu.header_menu controllerName -> $controllerName")
			log.debug("menu.header_menu actionName -> $actionName")
			log.debug("menu.header_menu params -> $params")
		}

		if(requestURI.contains(AbteilungHelper.CODE_ABTEILUNGEN))
		{
			String abteilungFile = params.code ? params.code : (id ?: "")
			if(abteilungFile)
			{
				if(abteilungFile == AbteilungHelper.CODE_BADMINTON || abteilungFile.contains(AbteilungHelper.CODE_BADMINTON))
				{
					out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
				}
				else if(abteilungFile == AbteilungHelper.CODE_BASKETBALL || abteilungFile.contains(AbteilungHelper.CODE_BASKETBALL))
				{
					out << ""
				}
				else if(abteilungFile == AbteilungHelper.CODE_FUSSBALL_AH || abteilungFile.contains(AbteilungHelper.CODE_FUSSBALL_AH))
				{
					out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
				}
				else if(abteilungFile == AbteilungHelper.CODE_FUSSBALL_DAMEN || abteilungFile.contains(AbteilungHelper.CODE_FUSSBALL_DAMEN))
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
				else if(abteilungFile == AbteilungHelper.CODE_FUSSBALL_HERREN || abteilungFile.contains(AbteilungHelper.CODE_FUSSBALL_HERREN))
				{
					out << ""
				}
				else if(abteilungFile == AbteilungHelper.CODE_HANDBALL || abteilungFile.contains(AbteilungHelper.CODE_HANDBALL))
				{
					if(abteilungFile == "handball.gsp")
					{
						out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_spg.gsp\">Spielgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_ej.gsp\">Mini/E-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_cj.gsp\">C-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_bj.gsp\">B-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_herren.gsp\">Herren</a></td>"
					}
					else if(abteilungFile == "handball_spg.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Spielgruppe</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_ej.gsp\">Mini/E-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_cj.gsp\">C-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_bj.gsp\">B-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_herren.gsp\">Herren</a></td>"
					}
					else if(abteilungFile == "handball_ej.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_spg.gsp\">Spielgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Mini/E-Jugend</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_cj.gsp\">C-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_bj.gsp\">B-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_herren.gsp\">Herren</a></td>"
					}
					else if(abteilungFile == "handball_cj.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_spg.gsp\">Spielgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_ej.gsp\">Mini/E-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">C-Jugend</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_bj.gsp\">B-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_herren.gsp\">Herren</a></td>"
					}
					else if(abteilungFile == "handball_bj.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_spg.gsp\">Spielgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_ej.gsp\">Mini/E-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_cj.gsp\">C-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">B-Jugend</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_herren.gsp\">Herren</a></td>"
					}
					else if(abteilungFile == "handball_damen.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_spg.gsp\">Spielgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_ej.gsp\">Mini/E-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_cj.gsp\">C-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_bj.gsp\">B-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Damen</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_herren.gsp\">Herren</a></td>"
					}
					else if(abteilungFile == "handball_herren.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_spg.gsp\">Spielgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_ej.gsp\">Mini/E-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_cj.gsp\">C-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_bj.gsp\">B-Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/handball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Herren</td>"
					}
				}
				else if(abteilungFile == AbteilungHelper.CODE_KARATE || abteilungFile.contains(AbteilungHelper.CODE_KARATE))
				{
					out << ""
				}
				else if(abteilungFile == AbteilungHelper.CODE_LEICHTATHLETIK || abteilungFile.contains(AbteilungHelper.CODE_LEICHTATHLETIK))
				{
					if(abteilungFile == "leichtathletik.gsp")
					{
						out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkaempfe.gsp\">Wettk&auml;mpfe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkbilder.gsp\">Wettkampf-Bilder</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_laeufe.gsp\">Wettl&auml;ufe f&uuml;r alle</a></td>"
					}
					else if(abteilungFile == "leichtathletik_training.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Training</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkaempfe.gsp\">Wettk&auml;mpfe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkbilder.gsp\">Wettkampf-Bilder</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_laeufe.gsp\">Wettl&auml;ufe f&uuml;r alle</a></td>"
					}
					else if(abteilungFile == "leichtathletik_wkaempfe.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Wettk&auml;mpfe</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkbilder.gsp\">Wettkampf-Bilder</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_laeufe.gsp\">Wettl&auml;ufe f&uuml;r alle</a></td>"
					}
					else if(abteilungFile == "leichtathletik_wkbilder.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkaempfe.gsp\">Wettk&auml;mpfe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Wettkampf-Bilder</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_laeufe.gsp\">Wettl&auml;ufe f&uuml;r alle</a></td>"
					}
					else if(abteilungFile == "leichtathletik_laeufe.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkaempfe.gsp\">Wettk&auml;mpfe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/leichtathletik_wkbilder.gsp\">Wettkampf-Bilder</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Wettl&auml;ufe f&uuml;r alle</td>"
					}
				}
				else if(abteilungFile == AbteilungHelper.CODE_RADSPORT || abteilungFile.contains(AbteilungHelper.CODE_RADSPORT))
				{
					if(abteilungFile == "radsport.gsp")
					{
						out << "<td class=\"rubrikactiv\">Aktuelles</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_termine.gsp\">Termine</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_ausfahrten.gsp\">Radausfahrten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_jugend.gsp\">Jugendgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a target=\"_blank\" href=\"http://www.ipernity.com/doc/radsport-leingarten/album\">Bildergalerie</a></td>"
					}
					else if(abteilungFile == "radsport_wir.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_termine.gsp\">Termine</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_ausfahrten.gsp\">Radausfahrten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_jugend.gsp\">Jugendgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a target=\"_blank\" href=\"http://www.ipernity.com/doc/radsport-leingarten/album\">Bildergalerie</a></td>"
					}
					else if(abteilungFile == "radsport_termine.gsp")
					{
						out << "<td class=\"rubrikactiv\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Termine</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_ausfahrten.gsp\">Radausfahrten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_jugend.gsp\">Jugendgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a target=\"_blank\" href=\"http://www.ipernity.com/doc/radsport-leingarten/album\">Bildergalerie</a></td>"
					}
					else if(abteilungFile == "radsport_training.gsp")
					{
						out << "<td class=\"rubrikactiv\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_termine.gsp\">Termine</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Training</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_ausfahrten.gsp\">Radausfahrten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_jugend.gsp\">Jugendgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a target=\"_blank\" href=\"http://www.ipernity.com/doc/radsport-leingarten/album\">Bildergalerie</a></td>"
					}
					else if(abteilungFile == "radsport_ausfahrten.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_termine.gsp\">Termine</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Radausfahrten</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_jugend.gsp\">Jugendgruppe</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a target=\"_blank\" href=\"http://www.ipernity.com/doc/radsport-leingarten/album\">Bildergalerie</a></td>"
					}
					else if(abteilungFile == "radsport_jugend.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_wir.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_termine.gsp\">Termine</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_training.gsp\">Training</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/radsport_ausfahrten.gsp\">Radausfahrten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Jugendgruppe</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a target=\"_blank\" href=\"http://www.ipernity.com/doc/radsport-leingarten/album\">Bildergalerie</a></td>"
					}
				}
				else if(abteilungFile == AbteilungHelper.CODE_REITEN || abteilungFile.contains(AbteilungHelper.CODE_REITEN))
				{
					out << ""
				}
				else if(abteilungFile == AbteilungHelper.CODE_SCHACH || abteilungFile.contains(AbteilungHelper.CODE_SCHACH))
				{
					if(abteilungFile == "schach.gsp")
					{
						out << "<td class=\"rubrikactiv\">Aktuelles</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_jugend.gsp\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_aktiv.gsp\">Aktive und Hobbyspieler</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_termine.gsp\">Ansprechpartner und Termine</a></td>"
					}
					else if(abteilungFile == "schach_jugend.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Jugend</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_aktiv.gsp\">Aktive und Hobbyspieler</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_termine.gsp\">Ansprechpartner und Termine</a></td>"
					}
					else if(abteilungFile == "schach_aktiv.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_jugend.gsp\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Aktive und Hobbyspieler</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_termine.gsp\">Ansprechpartner und Termine</a></td>"
					}
					else if(abteilungFile == "schach_termine.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach.gsp\">Aktuelles</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_jugend.gsp\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/schach_aktiv.gsp\">Aktive und Hobbyspieler</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Ansprechpartner und Termine</td>"
					}
				}
				else if(abteilungFile == AbteilungHelper.CODE_SKI || abteilungFile.contains(AbteilungHelper.CODE_SKI))
				{
					if(abteilungFile != "ski_neues.gsp")
					{
						out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/ski_neues.gsp\">Neuigkeiten + Termine</a></td>"
					}
					else
					{
						out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'abteilung', action: 'show', params: [code: AbteilungHelper.CODE_SKI], mapping: 'abteilungShow')}\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Neuigkeiten + Termine</td>"
					}
				}
				else if(abteilungFile == AbteilungHelper.CODE_TANZEN || abteilungFile.contains(AbteilungHelper.CODE_TANZEN))
				{
					out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
				}
				else if(abteilungFile == AbteilungHelper.CODE_TISCHTENNIS || abteilungFile.contains(AbteilungHelper.CODE_TISCHTENNIS))
				{
					out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
				}
				else if(abteilungFile == AbteilungHelper.CODE_TENNIS || abteilungFile.contains(AbteilungHelper.CODE_TENNIS))
				{
					if(abteilungFile == "tennis.gsp")
					{
						out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_neuigkeiten.gsp\">Neuigkeiten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Vorschau</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Mannschaften</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_anfahrt.gsp\">Anfahrt</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_mitglied.gsp\">Mitglied werden</a></td>"
					}
					else if(abteilungFile == "tennis_neuigkeiten.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Neuigkeiten</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Vorschau</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Mannschaften</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_anfahrt.gsp\">Anfahrt</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_mitglied.gsp\">Mitglied werden</a></td>"
					}
					else if(abteilungFile == "volleyball_damen.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_neuigkeiten.gsp\">Neuigkeiten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\"><a href=\"javascript: void(0);\">Vorschau</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Mannschaften</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_anfahrt.gsp\">Anfahrt</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_mitglied.gsp\">Mitglied werden</a></td>"
					}
					else if(abteilungFile == "leichtathletik_wkbilder.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_neuigkeiten.gsp\">Neuigkeiten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Vorschau</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\"><a href=\"javascript: void(0);\">Mannschaften</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_anfahrt.gsp\">Anfahrt</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_mitglied.gsp\">Mitglied werden</a></td>"
					}
					else if(abteilungFile == "tennis_anfahrt.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_neuigkeiten.gsp\">Neuigkeiten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Vorschau</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Mannschaften</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Anfahrt</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_mitglied.gsp\">Mitglied werden</a></td>"
					}
					else if(abteilungFile == "tennis_mitglied.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_neuigkeiten.gsp\">Neuigkeiten</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Vorschau</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Mannschaften</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/tennis_anfahrt.gsp\">Anfahrt</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Mitglied werden</td>"
					}
				}
				else if(abteilungFile == AbteilungHelper.CODE_TURNEN || abteilungFile.contains(AbteilungHelper.CODE_TURNEN))
				{
					out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
				}
				else if(abteilungFile == AbteilungHelper.CODE_VOLLEYBALL || abteilungFile.contains(AbteilungHelper.CODE_VOLLEYBALL))
				{
					if(abteilungFile == "volleyball.gsp")
					{
						out << "<td class=\"rubrikactiv\">&Uuml;ber uns</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Freizeit, mixed</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_beach.gsp\">Beachturnier</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_lc.gsp\">LeintalCup</a></td>"
					}
					else if(abteilungFile == "leichtathletik_training.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Jugend</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Freizeit, mixed</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_beach.gsp\">Beachturnier</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_lc.gsp\">LeintalCup</a></td>"
					}
					else if(abteilungFile == "volleyball_damen.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Damen</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Freizeit, mixed</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_beach.gsp\">Beachturnier</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_lc.gsp\">LeintalCup</a></td>"
					}
					else if(abteilungFile == "leichtathletik_wkbilder.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Freizeit, mixed</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_beach.gsp\">Beachturnier</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_lc.gsp\">LeintalCup</a></td>"
					}
					else if(abteilungFile == "volleyball_beach.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Freizeit, mixed</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">Beachturnier</td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_lc.gsp\">LeintalCup</a></td>"
					}
					else if(abteilungFile == "volleyball_lc.gsp")
					{
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball.gsp\">&Uuml;ber uns</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Jugend</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_damen.gsp\">Damen</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"javascript: void(0);\">Freizeit, mixed</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/abteilungen/volleyball_beach.gsp\">Beachturnier</a></td>"
						out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
						out << "<td class=\"rubrikactiv\">LeintalCup</td>"
					}
				}

			}
		}
		else if(requestURI.contains("themen"))
		{
			if (id != "th_streik_05.gsp")
			{
				out << "<td class=\"rubrikactiv\">Zukunftswerkstatt</td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/themen/th_streik_05.gsp\">Streik 2005</a></td>"
			}
			else
			{
				out << "<td class=\"rubrik\"><a href=\"${contextPath}/sites/themen/th_zkw.gsp\">Zukunftswerkstatt</a></td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrikactiv\">Streik 2005</td>"
			}
		}
		else if (controllerName == "person")
		{
			if (log.debugEnabled)
			{
				log.debug("menu.header_menu controller 'person' called.")
			}

			if (actionName == "vorstand")
			{
				out << "<td class=\"rubrikactiv\">Vorstand</td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'person', action: 'jugend_vorstand')}\">Jugendvorstand</a></td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'person', action: 'delegierte')}\">Delegierte</a></td>"
			}
			else if (actionName == "jugend_vorstand")
			{
				out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'person', action: 'vorstand')}\">Vorstand</a></td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrikactiv\">Jugendvorstand</td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'person', action: 'delegierte')}\">Delegierte</a></td>"
			}
			else if (actionName == "delegierte")
			{
				out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'person', action: 'vorstand')}\">Vorstand</a></td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrik\"><a href=\"${createLink(controller: 'person', action: 'jugend_vorstand')}\">Jugendvorstand</a></td>"
				out << "<td><img width=\"1\" height=\"20\" src=\"${resource(dir: 'bilder/divers', file: 'trenn.gif')}\"></td>"
				out << "<td class=\"rubrikactiv\">Delegierte</td>"
			}
		}
		else
		{
			out << "<img src=\"${resource(dir: 'bilder/divers', file: 'spacer.gif')}\" width=\"1\" height=\"1\">"
		}
	}
}
