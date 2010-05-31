package de.webmpuls.cms

import de.webmpuls.cms.people.Person
import de.webmpuls.cms.section.Abteilung

class AbteilungTagLib
{
	static namespace = "abteilungns"

	def abteilungsLeiter =
	{
		attrs ->

		Abteilung section = attrs['section']
		Person headP = attrs['head']

		out << "<div class=\"box\" id=\"identifier\" style=\"width: 130px; float: left;\">"

		String header = message(code: 'section.head.label', args: [section.name])

		out << render(template: '/global/ui/box/boxHeader', model: [header: header])

		String body = render(template: '/global/section/abteilungsLeiterBody', model: [head: headP])
		out << render(template: '/global/ui/box/boxBody', model: [body: body])

		out << render(template: '/global/ui/box/boxFooter')

		out << "</div>"

		return out
	}

	def aktuelleErgebnisse =
	{
		attrs ->

		def ergebnisse = attrs['ergebnisse']
		
		out << "<div class=\"box\" id=\"identifier\" style=\"width: 330px; float: left;\">"

		String header = message(code: "abteilung.aktuelle.ergebnisse.label")
		out << render(template: '/global/ui/box/boxHeader', model: [header: header])

		out << render(template: '/global/ui/box/boxBody', model: [body: ergebnisse])

		out << render(template: '/global/ui/box/boxFooter')

		out << "</div>"

		return out
	}

	def vorschau =
	{
		attrs ->

		def vorschau = attrs['vorschau']

		out << "<div class=\"box\" id=\"identifier\" style=\"width: 330px; float: left;\">"

		String header = message(code: "abteilung.vorschau.label")
		out << render(template: '/global/ui/box/boxHeader', model: [header: header])

		out << render(template: '/global/ui/box/boxBody', model: [body: vorschau])

		out << render(template: '/global/ui/box/boxFooter')

		out << "</div>"

		return out
	}
}
