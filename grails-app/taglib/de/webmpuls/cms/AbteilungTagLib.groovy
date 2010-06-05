package de.webmpuls.cms

import de.webmpuls.cms.people.Person
import de.webmpuls.cms.section.Abteilung
import de.webmpuls.cms.section.Trainingszeit

class AbteilungTagLib
{
	static namespace = "abteilungns"

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

		return out
	}

	def trainingszeiten =
	{
		attrs ->

		Abteilung section = attrs['section']
		Trainingszeit trainingszeit = attrs['trainingszeit']

		out << "<div class=\"box\" id=\"identifier\" style=\"width: 130px; margin-top: 20px; margin-left: 10px; float: left;\">"

		String header = trainingszeit.name

		out << render(template: '/global/ui/box/boxHeader', model: [header: header])

		String boxBody = render(template: '/global/section/trainingszeitenBody', model: [trainingszeit: trainingszeit])
		out << render(template: '/global/ui/box/boxBody', model: [body: boxBody])

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
}
