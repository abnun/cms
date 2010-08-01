package de.webmpuls.cms

import de.webmpuls.cms.people.Person
import de.webmpuls.cms.section.Abteilung
import de.webmpuls.cms.section.Trainingszeit
import de.webmpuls.cms.section.AbteilungHelper

class AbteilungTagLib
{
	static namespace = "abteilungns"

	static returnObjectForTags = ['isUnterAbteilung']

	def abteilungsLeiter =
	{
		attrs ->

		Abteilung section = attrs['section']
		Person headP = attrs['head']

		out << "<div class=\"box\" id=\"identifier\" style=\"width: 130px; margin-top: 20px; margin-left: 10px; float: left;\">"

		String header = message(code: 'section.head.label', args: [section.name])

		out << render(template: '/global/ui/box/boxHeader', model: [header: header])

		String boxBody = render(template: '/global/section/abteilungsLeiterBody', model: [head: headP])
		out << render(template: '/global/ui/box/boxBody', model: [body: boxBody])

		out << render(template: '/global/ui/box/boxFooter')

		out << "</div>"

		if(section?.code.startsWith(AbteilungHelper.CODE_FUSSBALL_HERREN))
		{
			out << "<div class=\"box\" id=\"identifier\" style=\"width: 130px; margin-top: 20px; margin-left: 10px; float: left;\">"

			String linkHeader = message(code: 'section.links.label')

			out << render(template: '/global/ui/box/boxHeader', model: [header: linkHeader])

			StringBuilder builder = new StringBuilder()

			builder << "<span class=\"copy\"><a href=\"http://www.fussball-in-bw.de\">www.fussball-in-bw.de</a></span><br/>"
			builder << "<span class=\"copy\"><a href=\"http://www.fussball.de\">www.fussball.de</a></span><br/>"
			builder << "<span class=\"copy\"><a href=\"http://www.wuerttfv.de\">www.wuerttfv.de</a></span><br/>"
			builder << "<span class=\"copy\"><a href=\"http://www.fuba.net\">www.fuba.net</a></span><br/>"

			out << render(template: '/global/ui/box/boxBody', model: [body: builder.toString()])

			out << render(template: '/global/ui/box/boxFooter')

			out << "</div>"
		}

		return out
	}

	def trainingszeiten =
	{
		attrs ->

		Abteilung section = attrs['section']
		Trainingszeit trainingszeit = attrs['trainingszeit']

		String boxBody = render(template: '/global/section/trainingszeitenBody', model: [trainingszeit: trainingszeit])
		out << render(template: '/global/ui/box/boxBody', model: [body: boxBody])

		return out
	}

	def aktuelleErgebnisse =
	{
		attrs ->

		def ergebnisse = attrs['ergebnisse']
		
		out << "<div class=\"box\" id=\"identifier\" style=\"width: 330px; float: left;\">"

		String header = message(code: "abteilung.aktuelle.ergebnisse.label")
		out << render(template: '/global/ui/box/boxHeader', model: [header: header])

		String boxBody = render(template: '/global/section/ergebnisse', model: [ergebnisse: ergebnisse])
		out << render(template: '/global/ui/box/boxBody', model: [body: boxBody])

		out << render(template: '/global/ui/box/boxFooter')

		out << "</div>"

		return out
	}

	def vorschau =
	{
		attrs ->

		def vorschauSpieltage = attrs['vorschau']

		out << "<div class=\"box\" id=\"identifier\" style=\"width: 330px; float: left;\">"

		String header = message(code: "abteilung.vorschau.label")
		out << render(template: '/global/ui/box/boxHeader', model: [header: header])

		String boxBody = render(template: '/global/section/vorschauSpieltage', model: [vorschauSpieltage: vorschauSpieltage])
		out << render(template: '/global/ui/box/boxBody', model: [body: boxBody])

		out << render(template: '/global/ui/box/boxFooter')

		out << "</div>"

		return out
	}

	def isUnterAbteilung =
	{
		attrs ->

		Abteilung section = attrs['section']

		if(section.hasUnterAbteilungen())
		{
			return true
		}
		else
		{
			return false
		}
	}

}
