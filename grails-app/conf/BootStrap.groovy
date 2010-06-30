import de.webmpuls.cms.people.Funktion
import de.webmpuls.cms.media.MediaHelper
import de.webmpuls.photo_album.Album
import de.webmpuls.cms.people.ShiroRole
import org.apache.shiro.crypto.hash.Sha1Hash
import de.webmpuls.cms.people.ShiroUser
import org.apache.catalina.core.ApplicationContextFacade
import org.codehaus.groovy.grails.commons.ApplicationAttributes
import org.springframework.context.ApplicationContext
import org.cyberneko.html.parsers.SAXParser

import de.webmpuls.cms.xml.XMLParserHandler
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import de.webmpuls.cms.section.*
import grails.util.Environment

class BootStrap
{

	def init =
	{
		servletContext ->

		initContext()

		environments
		{
			development
			{
				
				if(Boolean.valueOf((String)ConfigurationHolder.getConfig().alter.static.files))
				{
					alterStaticFiles(servletContext)
				}
			}
		}
	}

	def destroy =
	{
	}

	private void initContext()
	{
		// Funktionen

		Funktion vorsitzender1 = Funktion.findByCode(Funktion.VORSITZENDER1)
		Funktion vorsitzender2 = Funktion.findByCode(Funktion.VORSITZENDER2)
		Funktion vorsitzender3 = Funktion.findByCode(Funktion.VORSITZENDER3)
		Funktion beisitzer = Funktion.findByCode(Funktion.BEISITZER)
		Funktion webmaster = Funktion.findByCode(Funktion.WEBMASTER)
		Funktion referentin = Funktion.findByCode(Funktion.REFERENT)
		Funktion abteilungsleiter = Funktion.findByCode(Funktion.ABTEILUNGSLEITER)
		Funktion geschaeftsstelle = Funktion.findByCode(Funktion.GESCHAEFTSSTELLE)
		Funktion jugendleiter = Funktion.findByCode(Funktion.JUGENDLEITER)
		Funktion jugendsprecher = Funktion.findByCode(Funktion.JUGENDSPRECHER)
		Funktion kassierer = Funktion.findByCode(Funktion.KASSIERER)
		Funktion leiter_tech_sport = Funktion.findByCode(Funktion.LEITER_TECH_SPORT)
		Funktion leiter_tech_wirt = Funktion.findByCode(Funktion.LEITER_TECH_WIRT)
		Funktion schriftfuehrer = Funktion.findByCode(Funktion.SCHRIFTFUEHRER)
		Funktion seniorenbeauftrager = Funktion.findByCode(Funktion.SENIONERBEAUFTRAGTER)
		Funktion frauenbeauftragter = Funktion.findByCode(Funktion.FRAUENBEAUFTRAGTER)

		if (!vorsitzender1)
		{
			vorsitzender1 = new Funktion(name: '1. Vorsitzende(r)', code: Funktion.VORSITZENDER1, vorstand: true).save(flush: true)
		}

		if (!vorsitzender2)
		{
			vorsitzender2 = new Funktion(name: '2. Vorsitzende(r)', code: Funktion.VORSITZENDER2, vorstand: true).save(flush: true)
		}

		if (!vorsitzender3)
		{
			vorsitzender3 = new Funktion(name: '3. Vorsitzende(r)', code: Funktion.VORSITZENDER3, vorstand: true).save(flush: true)
		}

		if (!beisitzer)
		{
			beisitzer = new Funktion(name: 'Beisitzer(in)', code: Funktion.BEISITZER, vorstand: true).save(flush: true)
		}

		if (!referentin)
		{
			referentin = new Funktion(name: 'Referent(in) für Öffentlichkeitsarbeit', code: Funktion.REFERENT, vorstand: true).save(flush: true)
		}

		if (!webmaster)
		{
			webmaster = new Funktion(name: 'Beisitzer(in) / Webmaster(in)', code: Funktion.WEBMASTER, vorstand: true).save(flush: true)
		}

		if (!abteilungsleiter)
		{
			abteilungsleiter = new Funktion(name: 'Abteilungsleiter(in)', code: Funktion.ABTEILUNGSLEITER, vorstand: false).save(flush: true)
		}

		if (!geschaeftsstelle)
		{
			geschaeftsstelle = new Funktion(name: 'Geschäftsstelle', code: Funktion.GESCHAEFTSSTELLE, vorstand: true).save(flush: true)
		}

		if (!jugendleiter)
		{
			jugendleiter = new Funktion(name: 'Jugendleiter(in)', code: Funktion.JUGENDLEITER, vorstand: true).save(flush: true)
		}

		if (!jugendsprecher)
		{
			jugendsprecher = new Funktion(name: 'Jugendsprecher(in)', code: Funktion.JUGENDSPRECHER, vorstand: true).save(flush: true)
		}

		if (!kassierer)
		{
			kassierer = new Funktion(name: 'Kassierer(in)', code: Funktion.KASSIERER, vorstand: true).save(flush: true)
		}

		if (!leiter_tech_sport)
		{
			leiter_tech_sport = new Funktion(name: 'Sportl. techn. Leiter(in)', code: Funktion.LEITER_TECH_SPORT, vorstand: true).save(flush: true)
		}

		if (!leiter_tech_wirt)
		{
			leiter_tech_wirt = new Funktion(name: 'Wirtsch. techn. Leiter(in)', code: Funktion.LEITER_TECH_WIRT, vorstand: true).save(flush: true)
		}

		if (!schriftfuehrer)
		{
			schriftfuehrer = new Funktion(name: 'Schriftführer(in)', code: Funktion.SCHRIFTFUEHRER, vorstand: true).save(flush: true)
		}

		if (!seniorenbeauftrager)
		{
			seniorenbeauftrager = new Funktion(name: 'Seniorenbeauftragte(r)', code: Funktion.SENIONERBEAUFTRAGTER, vorstand: true).save(flush: true)
		}

		if (!frauenbeauftragter)
		{
			frauenbeauftragter = new Funktion(name: 'Frauenbeauftragte(r)', code: Funktion.FRAUENBEAUFTRAGTER, vorstand: true).save(flush: true)
		}

		def funktionList = Funktion.list()

		funktionList.each
		{
			println it
		}

		
		// Foto-Alben

		Album personen = Album.findByName(MediaHelper.ALBUM_PERSONEN)
		if(!personen)
		{
			personen =  new Album(name: MediaHelper.ALBUM_PERSONEN, description: "Foto-Album für die Mitglieder des SV-Leingartens")
			personen.save()
		}

		Album verschiedenes = Album.findByName(MediaHelper.ALBUM_VERSCHIEDENES)
		if(!verschiedenes)
		{
			verschiedenes =  new Album(name: MediaHelper.ALBUM_VERSCHIEDENES, description: "Foto-Album für alle anderen Bilder")
			verschiedenes.save()
		}

		Album sponsoren = Album.findByName(MediaHelper.ALBUM_SPONSOREN)
		if(!sponsoren)
		{
			sponsoren =  new Album(name: MediaHelper.ALBUM_SPONSOREN, description: "Foto-Album für die Sponsoren")
			sponsoren.save()
		}


		// Abteilungen
		Abteilung badminton = Abteilung.findByCode(AbteilungHelper.CODE_BADMINTON)
		if(!badminton)
		{
			badminton =  new Abteilung(name: AbteilungHelper.NAME_BADMINTON, code: AbteilungHelper.CODE_BADMINTON)
			badminton.save()
		}

		Abteilung basketball = Abteilung.findByCode(AbteilungHelper.CODE_BASKETBALL)
		if(!basketball)
		{
			basketball =  new Abteilung(name: AbteilungHelper.NAME_BASKETBALL, code: AbteilungHelper.CODE_BASKETBALL)
			basketball.save()
		}

		Abteilung fussball_ah = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_AH)
		if(!fussball_ah)
		{
			fussball_ah =  new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_AH, code: AbteilungHelper.CODE_FUSSBALL_AH)
			fussball_ah.save()
		}

		Abteilung fussball_damen = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_DAMEN)
		if(!fussball_damen)
		{
			fussball_damen =  new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_DAMEN, anzeigeName: 'Frauen (ab 1992)', code: AbteilungHelper.CODE_FUSSBALL_DAMEN)

			// TODO: entfernen!
			String tmpInhalt = """Wir waren am 31.10.09 beim Eppinger Spielfest zu Gast und spielten zum ersten
			 Mal in dieser Saison in der Halle. Rings herum waren kleine Veranstaltungen mit
			 Geschicklichkeitsspielen. Die Spiele fanden auf einem halben Spielfeld, mit kleinem Tor, ohne Torwart
			 und mit 4 Spielern statt. Dies war für uns eine Umstellung, aber unsere Spieler kamen damit klar.
			 Wir trafen zuerst auf den TSV Waldangelloch. Der TSV Waldangelloch hatte einen Spieler knapp vor
			 dem Tor platziert, während wir offen gespielt hatten. Obwohl wir gut spielten, verloren wir mit
			 2:0. Im 2. Spiel war unser Spielgegner der 1. FC Stebbach. Da auch der 1. FC Stebbach offen
			 spielte war es eine interessante Partie. Luna schoß für uns den Führungstreffer und Malte machte
			 mit dem 2. Treffer das Spiel für uns klar. In der nächsten Partie gegen den 1899 Hoffenheim gingen
			 wir zuerst in den Rückstand, aber Yannik erzielte den Ausgleich für uns und Yakup setzte noch
			 einen d’rauf. Das Spiel endete schließlich mit 2:1 für uns. Zu guter Letzt standen wir gegen den
			 VfB Eppingen auf dem Spielfeld. Yakup und Yannik erzielten durch schöne Treffer den Spielendstand
			 2:0."""

			Bericht tmpBericht = new Bericht(ueberschrift: 'Spieltag in Stetten', inhalt: tmpInhalt, abteilung: fussball_damen)
			//tmpBericht.save()
			fussball_damen.addToBerichte(tmpBericht)

			String tmpInhalt2 = """Auch dieses Jahr war die Fußballabteilung auf dem Gassenfest vertreten.
			Bei typischen Gassenfest-Wetter wurden unsere Nerven beim Aufbauen einmal mehr strapaziert,
			danach wurde dann bei bester Stimmung ausgelassen bis in den frühen Morgen gefeiert! Wir bedanken
			uns bei allen Helfern die das Fest wieder zu einem Erfolg gemacht haben."""
			Bericht tmpBericht2 = new Bericht(ueberschrift: 'Rückblick Gassenfest 2009', inhalt: tmpInhalt2, abteilung: fussball_damen)
			//tmpBericht2.save()
			fussball_damen.addToBerichte(tmpBericht2)

			if(Environment.isDevelopmentMode())
			{
				fussball_damen.save()
			}
		}


		// Herren
		Abteilung fussball_herren = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_HERREN)
		if (!fussball_herren)
		{
			fussball_herren = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_HERREN, code: AbteilungHelper.CODE_FUSSBALL_HERREN)
			fussball_herren.save()

			Abteilung fussball_herren_1_mannschaft = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_HERREN_1_MANNSCHAFT)
			if (!fussball_herren_1_mannschaft)
			{
				fussball_herren_1_mannschaft = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_HERREN_1_MANNSCHAFT, code: AbteilungHelper.CODE_FUSSBALL_HERREN_1_MANNSCHAFT, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_HERREN_1_MANNSCHAFT, oberAbteilung: fussball_herren, anzeigeImMenu: false)

				// TODO: entfernen!
				String tmpInhalt = """Riesenfete und Autokorso
				Im letzten Saisonspiel bei den Sportfreunden aus Stockheim stand der SVL bereits als Meister und frischgebackener Pokalsieger fest. Dennoch wollten die Schellmann-Jungs die letzte Partie gewinnen, und so eine einzigartige Saison vollends krönen. Nach dem Führungstor von Hörtling sah der Stockheimer Torhüter wegen Meckerns die gelb-rote Karte, sodass der Meister im Anschluss noch klarer dominierte und sich eine Chance nach der anderen erspielte. Vor allem Andreas Hörtling wurde immer wieder hervorragend von seinen Mannschaftskollegen bedient und in Szene gesetzt, sodass es für ihn am Ende zu fünf Toren reichen sollte und der SVL sogar noch die Torjägerkanone der Kreisliga A3 nach Leingarten holt.
				Nach dieser nahezu perfekten Saison zog die Mannschaft bei strahlendem Sonnenschein mit einem Autokorso hupend durch Leingarten und feierte noch lange in die Nacht hinein.

				Der SV Leingarten bedankt sich hiermit für die tolle Unterstützung seiner treuen Fans und Anhänger in der vergangenen Saison. Herzlichen Glückwunsch auch an unsere Nachbarn aus Schluchtern zum Erreichen der Relegationsspiele zur Landesliga.

				Es spielten:
				H. Mayer, T. Czok, S. Zimmer, J. Reiner, T. Zimmermann (M. Baumann), M. Frank, M. Vogt (P. Henger), J. Heubach, R. Heubach, A. Hörtling, S. Ostfalk (P. Schietinger)"""

				Bericht tmpBericht = new Bericht(ueberschrift: 'Spfr. Stockheim – SV Leingarten > 2:5 (0:2)', inhalt: tmpInhalt, abteilung: fussball_herren_1_mannschaft)
				//tmpBericht.save()
				fussball_herren_1_mannschaft.addToBerichte(tmpBericht)

				String tmpInhalt2 = """Der SV Leingarten ist Meister der Kreisliga A3 und seit Donnerstag, 03.06.2010, auch noch Bezirkspokalsieger 2010. Im Finale gegen die starke Spvgg Möckmühl gewann der SVL vor knapp 1000 Zuschauern in einer packenden und spannenden Partie mit 2:1. Dabei dominierten die spielstarken Möckmühler die erste Halbzeit und hatten die besseren Torchancen. Doch Holger Mayer schaffte es an jenem Spätnachmittag durch zahlreiche Paraden, seine Mannschaft im Spiel zu halten. Der SVL kam in den ersten 45 Minuten lediglich einmal gefährlich vor das Möckmühler Tor, doch Hörtlings Schuss aus spitzem Winkel konnte der Möckmühler Torhüter parieren.
				Nach dem Seitenwechsel kam der SVL besser ins Spiel und konnte durch Heubachs Foulelfmeter etwas glücklich in Führung gehen. Die Spvgg Möckmühl erhöhte den Druck und kam zu weiteren Tormöglichkeiten. Doch die Leingartener Defensive hielt. Auf der anderen Seite machte es Hörtling besser, als er zum 2:0 traf. Doch der vermeintlich sichere Vorsprung von zwei Toren wurde im Gegenzug vom Möckmühler Torjäger Dedovic wieder verkürzt. Aus halbrechter Position ließ er Mayer keine Abwehrchance. Fortan drängte Möckmühl mit aller Kraft auf den Ausgleich, doch der SVL schaffte den Riesenerfolg und gewinnt beide Titel in der Saison 2009/2010.
				An dieser Stelle möchte sich der SV Leingarten bei seinen tollen und einzigartigen Fans und Zuschauern bedanken, die die Mannschaft einmal mehr großartig und lautstark unterstützten und gewiss einen großen Anteil an diesem Erfolg haben. DANKE"""

				Bericht tmpBericht2 = new Bericht(ueberschrift: 'Pokal: SV Leingarten – Spvgg Möckmühl > 2:1 (0:0)', inhalt: tmpInhalt2, abteilung: fussball_herren_1_mannschaft)
				//tmpBericht2.save()
				fussball_herren_1_mannschaft.addToBerichte(tmpBericht2)

				String tmpInhalt3 = """SVL ist Meister und steigt in die Bezirksliga auf
				Nach zweijähriger Abstinenz kehrt der SV Leingarten wieder in die Bezirksliga zurück. Auf Grund des besseren Torverhältnisses und einem Dreipunktevorsprung ist dem Tabellenführer der Titel nicht mehr zu nehmen.
				Dabei sah es zu Beginn der Partie sehr gut aus für den SVL. Nach einer halben Stunde führten die Hausherren durch Tore von Schietinger und Hörtling bereits mit 2:0. Doch durch eine Unaufmerksamkeit in der Defensive kam Nordheim noch vor der Pause durch Weber in die Partie zurück.
				Nach dem Seitenwechsel musste Czok nach wiederholtem Foulspiel mit Gelb-Rot vom Platz, sodass Nordheim auf den Ausgleich drängte. David Benitez schaffte in Minute 60 nach einem Alleingang den nicht unverdienten 2:2 Ausgleich. Der SVL wollte das Remis halten, geriet jedoch nach einem Kopfball von Mario Benitez sogar mit 2:3 in Rückstand. Postwendend kam der SVL im Gegenzug durch Hörtling noch zum 3:3, das die Meisterschaft bedeutete.
				
				Es spielten:
				H. Mayer, T. Czok, S. Zimmer, M. Baumann, J. Reiner, M. Frank, M. Vogt (E. Heidelberger), P. Schietinger (Y. Buchwald), R. Heubach, A. Hörtling, S. Ostfalk"""

				Bericht tmpBericht3 = new Bericht(ueberschrift: 'SV Leingarten - TSV Nordheim > 3:3 (2:1)', inhalt: tmpInhalt3, abteilung: fussball_herren_1_mannschaft)
				//tmpBericht3.save()
				fussball_herren_1_mannschaft.addToBerichte(tmpBericht3)

				fussball_herren_1_mannschaft.save()
			}

			Abteilung fussball_herren_2_mannschaft = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_HERREN_2_MANNSCHAFT)
			if (!fussball_herren_2_mannschaft)
			{
				fussball_herren_2_mannschaft = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_HERREN_2_MANNSCHAFT, code: AbteilungHelper.CODE_FUSSBALL_HERREN_2_MANNSCHAFT, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_HERREN_2_MANNSCHAFT, oberAbteilung: fussball_herren, anzeigeImMenu: false)
				fussball_herren_2_mannschaft.save()
			}

			fussball_herren.addToUnterabteilungen(fussball_herren_1_mannschaft)
			fussball_herren.addToUnterabteilungen(fussball_herren_2_mannschaft)
			fussball_herren.save()
		}


		// Jugend
		Abteilung fussball_jugend = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND)
		if (!fussball_jugend)
		{
			fussball_jugend = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND, code: AbteilungHelper.CODE_FUSSBALL_JUGEND)

			// Bambini
			Abteilung fussball_jugend_bambini = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_BAMBINI)
			if (!fussball_jugend_bambini)
			{
				fussball_jugend_bambini = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_BAMBINI, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_BAMBINI, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_BAMBINI, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_bambini.save()
			}

			// Jugend Jungs

			// F
			Abteilung fussball_jugend_m_f = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_F)
			if (!fussball_jugend_m_f)
			{
				fussball_jugend_m_f = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_F, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_F, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_F, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_f.save()
			}

			// E
			Abteilung fussball_jugend_m_e_1 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_E_1)
			if (!fussball_jugend_m_e_1)
			{
				fussball_jugend_m_e_1 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_E_1, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_E_1, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_E_1, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_e_1.save()
			}

			Abteilung fussball_jugend_m_e_2 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_E_2)
			if (!fussball_jugend_m_e_2)
			{
				fussball_jugend_m_e_2 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_E_2, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_E_2, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_E_2, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_e_2.save()
			}

			// D
			Abteilung fussball_jugend_m_d_1 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_D_1)
			if (!fussball_jugend_m_d_1)
			{
				fussball_jugend_m_d_1 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_D_1, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_D_1, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_D_1, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_d_1.save()
			}

			Abteilung fussball_jugend_m_d_2 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_D_2)
			if (!fussball_jugend_m_d_2)
			{
				fussball_jugend_m_d_2 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_D_2, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_D_2, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_D_2, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_d_2.save()
			}

			Abteilung fussball_jugend_m_d_3 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_D_3)
			if (!fussball_jugend_m_d_3)
			{
				fussball_jugend_m_d_3 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_D_3, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_D_3, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_D_3, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_d_3.save()
			}

			// C
			Abteilung fussball_jugend_m_c_1 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_C_1)
			if (!fussball_jugend_m_c_1)
			{
				fussball_jugend_m_c_1 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_C_1, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_C_1, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_C_1, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_c_1.save()
			}

			Abteilung fussball_jugend_m_c_2 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_C_2)
			if (!fussball_jugend_m_c_2)
			{
				fussball_jugend_m_c_2 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_C_2, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_C_2, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_C_2, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_c_2.save()
			}

			// B
			Abteilung fussball_jugend_m_b = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_B)
			if (!fussball_jugend_m_b)
			{
				fussball_jugend_m_b = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_B, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_B, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_B, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_b.save()
			}

			// A
			Abteilung fussball_jugend_m_a = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_M_A)
			if (!fussball_jugend_m_a)
			{
				fussball_jugend_m_a = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_M_A, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_M_A, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_M_A, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_m_a.save()
			}


			// Jugend Maedchen



			// D
			Abteilung fussball_jugend_f_d_1 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_F_D_1)
			if (!fussball_jugend_f_d_1)
			{
				fussball_jugend_f_d_1 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_F_D_1, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_F_D_1, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_F_D_1, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_f_d_1.save()
			}

			Abteilung fussball_jugend_f_d_2 = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_F_D_2)
			if (!fussball_jugend_f_d_2)
			{
				fussball_jugend_f_d_2 = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_F_D_2, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_F_D_2, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_F_D_2, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_f_d_2.save()
			}

			// C
			Abteilung fussball_jugend_f_c = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_F_C)
			if (!fussball_jugend_f_c)
			{
				fussball_jugend_f_c = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_F_C, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_F_C, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_F_C, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_f_c.save()
			}

			// B
			Abteilung fussball_jugend_f_b = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_F_B)
			if (!fussball_jugend_f_b)
			{
				fussball_jugend_f_b = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_F_B, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_F_B, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_F_B, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_f_b.save()
			}

			// A
			Abteilung fussball_jugend_f_a = Abteilung.findByCode(AbteilungHelper.CODE_FUSSBALL_JUGEND_F_A)
			if (!fussball_jugend_f_a)
			{
				fussball_jugend_f_a = new Abteilung(name: AbteilungHelper.NAME_FUSSBALL_JUGEND_F_A, code: AbteilungHelper.CODE_FUSSBALL_JUGEND_F_A, kuerzel: AbteilungHelper.TOKEN_FUSSBALL_JUGEND_F_A, oberAbteilung: fussball_jugend, anzeigeImMenu: false)
				fussball_jugend_f_a.save()
			}

			fussball_jugend.addToUnterabteilungen(fussball_jugend_bambini)

			fussball_jugend.addToUnterabteilungen(fussball_jugend_f_a)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_f_b)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_f_c)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_f_d_1)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_f_d_2)

			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_a)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_b)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_c_1)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_c_2)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_d_1)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_d_2)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_d_3)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_e_1)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_e_2)
			fussball_jugend.addToUnterabteilungen(fussball_jugend_m_f)

			fussball_jugend.save()
		}


		// Handball
		Abteilung handball = Abteilung.findByCode(AbteilungHelper.CODE_HANDBALL)
		if(!handball)
		{
			handball =  new Abteilung(name: AbteilungHelper.NAME_HANDBALL, code: AbteilungHelper.CODE_HANDBALL)
			handball.save()
		}

		Abteilung karate = Abteilung.findByCode(AbteilungHelper.CODE_KARATE)
		if(!karate)
		{
			karate =  new Abteilung(name: AbteilungHelper.NAME_KARATE, code: AbteilungHelper.CODE_KARATE, )
			karate.save()
		}

		Abteilung leichtathletik = Abteilung.findByCode(AbteilungHelper.CODE_LEICHTATHLETIK)
		if(!leichtathletik)
		{
			leichtathletik =  new Abteilung(name: AbteilungHelper.NAME_LEICHTATHLETIK, code: AbteilungHelper.CODE_LEICHTATHLETIK)
			leichtathletik.save()
		}

		Abteilung radsport = Abteilung.findByCode(AbteilungHelper.CODE_RADSPORT)
		if(!radsport)
		{
			radsport =  new Abteilung(name: AbteilungHelper.NAME_RADSPORT, code: AbteilungHelper.CODE_RADSPORT)
			radsport.save()
		}

		Abteilung reiten = Abteilung.findByCode(AbteilungHelper.CODE_REITEN)
		if(!reiten)
		{
			reiten =  new Abteilung(name: AbteilungHelper.NAME_REITEN, code: AbteilungHelper.CODE_REITEN)
			reiten.save()
		}

		Abteilung schach = Abteilung.findByCode(AbteilungHelper.CODE_SCHACH)
		if(!schach)
		{
			schach =  new Abteilung(name: AbteilungHelper.NAME_SCHACH, code: AbteilungHelper.CODE_SCHACH)
			schach.save()
		}

		Abteilung ski = Abteilung.findByCode(AbteilungHelper.CODE_SKI)
		if(!ski)
		{
			ski =  new Abteilung(name: AbteilungHelper.NAME_SKI, code: AbteilungHelper.CODE_SKI)
			ski.save()
		}

		Abteilung tanzen = Abteilung.findByCode(AbteilungHelper.CODE_TANZEN)
		if(!tanzen)
		{
			tanzen =  new Abteilung(name: AbteilungHelper.NAME_TANZEN, code: AbteilungHelper.CODE_TANZEN)
			tanzen.save()
		}

		Abteilung tennis = Abteilung.findByCode(AbteilungHelper.CODE_TENNIS)
		if(!tennis)
		{
			tennis =  new Abteilung(name: AbteilungHelper.NAME_TENNIS, code: AbteilungHelper.CODE_TENNIS)
			tennis.save()
		}

		Abteilung tischtennis = Abteilung.findByCode(AbteilungHelper.CODE_TISCHTENNIS)
		if(!tischtennis)
		{
			tischtennis =  new Abteilung(name: AbteilungHelper.NAME_TISCHTENNIS, code: AbteilungHelper.CODE_TISCHTENNIS)
			tischtennis.save()
		}

		Abteilung turnen = Abteilung.findByCode(AbteilungHelper.CODE_TURNEN)
		if(!turnen)
		{
			turnen =  new Abteilung(name: AbteilungHelper.NAME_TURNEN, code: AbteilungHelper.CODE_TURNEN)
			turnen.save()
		}

		Abteilung volleyball = Abteilung.findByCode(AbteilungHelper.CODE_VOLLEYBALL)
		if(!volleyball)
		{
			volleyball =  new Abteilung(name: AbteilungHelper.NAME_VOLLEYBALL, code: AbteilungHelper.CODE_VOLLEYBALL)
			volleyball.save()
		}


		// System-Rollen

		ShiroRole adminRole = ShiroRole.findByName(ShiroRole.ADMINISTRATOR)
		if(!adminRole)
		{
			adminRole = new ShiroRole(name: ShiroRole.ADMINISTRATOR)
			adminRole.addToPermissions("*:*:*")
			adminRole.save(flush: true)
		}

		ShiroRole userRole = ShiroRole.findByName(ShiroRole.BENUTZER)
		if(!userRole)
		{
			userRole = new ShiroRole(name: ShiroRole.BENUTZER)
			userRole.addToPermissions("*:*:*")
			userRole.save(flush: true)
		}


		// Benutzer

		ShiroUser adminstrator  = ShiroUser.findByUsername(ShiroUser.ADMINISTRATOR)
		if(!adminstrator)
		{
			adminstrator = new ShiroUser(username: ShiroUser.ADMINISTRATOR, passwordHash: new Sha1Hash("xkermitS").toHex())
			adminstrator.addToRoles(adminRole)
			adminstrator.addToRoles(userRole)

			if(!adminstrator.save())
			{
				adminstrator.errors.allErrors.each
				{
					println it
				}
			}
		}

		ShiroUser webmasterUser  = ShiroUser.findByUsername(ShiroUser.WEBMASTER)
		if(!webmasterUser)
		{
			webmasterUser = new ShiroUser(username: ShiroUser.WEBMASTER, passwordHash: new Sha1Hash("test").toHex())
			webmasterUser.addToRoles(userRole)

			if(!webmasterUser.save())
			{
				webmasterUser.errors.allErrors.each
				{
					println it
				}
			}
		}
	}

	private void alterStaticFiles(ApplicationContextFacade servletContext)
	{
		// do those ugly things with the static HTML-files
		ApplicationContext applicationContext = (ApplicationContext) servletContext.getAttribute(ApplicationAttributes.APPLICATION_CONTEXT)

		File sitesDirectory = applicationContext.getResource(File.separator + "sites").getFile()
		if (sitesDirectory.exists())
		{
			ArrayList deleteList = [] as ArrayList

			sitesDirectory.eachFileRecurse
			{
				File tmpFileOrDir ->

				if (!tmpFileOrDir.isDirectory() && !tmpFileOrDir.getName().contains(".gsp"))
				{
					// only take content without menu etc.
					println "Current file -> ${tmpFileOrDir.getParent()}/${tmpFileOrDir.getName()}"

					SAXParser parser = new SAXParser()

					// features
					parser.setFeature('http://xml.org/sax/features/namespaces', false)
					//						parser.setFeature('http://xml.org/sax/features/external-general-entities', false)
					//						parser.setFeature('http://xml.org/sax/features/external-parameter-entities', false)
					//						parser.setFeature("http://apache.org/xml/features/scanner/notify-char-refs", true);
					//						parser.setFeature("http://apache.org/xml/features/scanner/notify-builtin-refs", true);
					//						parser.setFeature("http://cyberneko.org/html/features/scanner/notify-builtin-refs", true);
					parser.setFeature("http://cyberneko.org/html/features/scanner/fix-mswindows-refs", true);
					parser.setFeature("http://cyberneko.org/html/features/scanner/script/strip-comment-delims", true);

					// properties
					parser.setProperty("http://cyberneko.org/html/properties/default-encoding", "UTF-8");
					parser.setProperty("http://cyberneko.org/html/properties/names/elems", "lower");
					parser.setProperty("http://cyberneko.org/html/properties/names/attrs", "lower");
					parser.setProperty("http://xml.org/sax/properties/lexical-handler", new XMLParserHandler())

					Node page = new XmlParser(parser).parse(tmpFileOrDir)

					boolean isOuterTable = false

					for (Node tmpNode in page.depthFirst())
					{
						if (tmpNode.attributes().containsKey('width'))
						{
							String width = tmpNode.attributes().get('width').toString()

							if (width == "614" || (!isOuterTable && width == "570"))
							{
								isOuterTable = true
								for (Node tmpChildNode in tmpNode.depthFirst())
								{
									if (tmpChildNode.attributes().containsKey('src'))
									{
										String imageSrc = tmpChildNode.attributes().get('src').toString()

										if (!imageSrc.contains("\${resource"))
										{
											StringBuilder newImageSrc = new StringBuilder()
											println imageSrc

											int lastIndexOfSlash = imageSrc.lastIndexOf('/')

											newImageSrc << "\${resource("
											newImageSrc << "dir: '"

											if (lastIndexOfSlash == -1)
											{
												imageSrc = tmpFileOrDir.getAbsolutePath()
												lastIndexOfSlash = imageSrc.lastIndexOf('/')
											}

											if (lastIndexOfSlash != -1)
											{
												int start = 0
												if (imageSrc.contains('../'))
												{
													start = imageSrc.lastIndexOf('../') + 3
													if (start > lastIndexOfSlash)
													{
														start = lastIndexOfSlash
													}
												}

												newImageSrc << imageSrc.substring(start, lastIndexOfSlash)
											}

											newImageSrc << "', "
											newImageSrc << "file: '"

											imageSrc = tmpChildNode.attributes().get('src').toString()
											lastIndexOfSlash = imageSrc.lastIndexOf('/')

											newImageSrc << imageSrc.substring(lastIndexOfSlash + 1, imageSrc.size())
											newImageSrc << "')}"

											println newImageSrc.toString()

											tmpChildNode.attributes().put('src', newImageSrc.toString())
										}
									}
									else if (tmpChildNode.attributes().containsKey('href'))
									{
										String ankerSrc = tmpChildNode.attributes().get('href').toString()

										StringBuilder newAnkerHref = new StringBuilder()
										println ankerSrc

										int lastIndexOfSlash = ankerSrc.lastIndexOf('/')

										if (!ankerSrc.contains('http://')
												&& !ankerSrc.contains('mailto:')
												&& !ankerSrc.contains("\${resource")
												&& !ankerSrc.contains("javascript"))
										{
											newAnkerHref << "\${resource("
											newAnkerHref << "dir: '"

											if (lastIndexOfSlash == -1)
											{
												ankerSrc = tmpFileOrDir.toURL().toExternalForm()

												ankerSrc = ankerSrc.substring(sitesDirectory.getParentFile().toURL().toExternalForm().size(), ankerSrc.size())
												lastIndexOfSlash = ankerSrc.lastIndexOf("/")
											}

											if (lastIndexOfSlash != -1)
											{
												int start = 0
												if (ankerSrc.contains('../'))
												{
													start = ankerSrc.lastIndexOf('../') + 3
													if (start > lastIndexOfSlash)
													{
														start = lastIndexOfSlash
													}
												}

												newAnkerHref << ankerSrc.substring(start, lastIndexOfSlash)
											}

											newAnkerHref << "', "
											newAnkerHref << "file: '"

											ankerSrc = tmpChildNode.attributes().get('href').toString()
											lastIndexOfSlash = ankerSrc.lastIndexOf('/')

											String fileName = ankerSrc.substring(lastIndexOfSlash + 1, ankerSrc.size())
											String newFileName = fileName
											if (fileName.contains(".htm"))
											{
												newFileName = fileName.substring(0, fileName.lastIndexOf(".")) + ".gsp"
											}

											newAnkerHref << newFileName
											newAnkerHref << "')}"

											println newAnkerHref.toString()

											tmpChildNode.attributes().put('href', newAnkerHref.toString())
										}
									}
								}

								StringWriter sw = new StringWriter()
								new XmlNodePrinter(new PrintWriter(sw)).print(tmpNode)
								println sw.toString();

								StringBuilder htmlStringBuilder = new StringBuilder()
								htmlStringBuilder << "<html>\n<head>\n<meta name=\"layout\" content=\"sv_leingarten\"/>\n</head>\n"

								htmlStringBuilder << sw.toString()
								htmlStringBuilder << "\n</html>"

								String path = tmpFileOrDir.getAbsolutePath()
								int lastDotInFileName = path.lastIndexOf(".")
								path = path.substring(0, lastDotInFileName)

								InputStreamReader inputStreamReader = new InputStreamReader(new ByteArrayInputStream(htmlStringBuilder.toString().getBytes()))
								BufferedReader bufferedReader = new BufferedReader(inputStreamReader)

								BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path + ".gsp"), "UTF-8"));

								int c;
								while ((c = bufferedReader.read()) != -1)
								{
									bufferedWriter.write(c);
								}

								bufferedReader.close();
								bufferedWriter.flush();
								bufferedWriter.close();

								if (new File(path + ".gsp").exists())
								{
									deleteList.add(tmpFileOrDir)
									println "created new file"
								}
								else
								{
									println "could not create new file"
								}

							}
						}
					}
					//deleteList.add(tmpFileOrDir)
				}
			}

			println "deleteList.size() -> ${deleteList.size()}"
			for (File deleteFile in deleteList)
			{
				if(!deleteFile.delete() && deleteFile.exists())
				{
					println "something went wrong during deleting of $deleteFile"
				}
				else
				{
					println "file deleted!"
				}
			}
		}
	}
} 