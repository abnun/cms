import de.webmpuls.cms.people.Funktion

class BootStrap
{

	def init =
	{
		servletContext ->

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
			webmaster = new Funktion(name: 'Beisitzer(in)/Webmaster', code: Funktion.WEBMASTER, vorstand: true).save(flush: true)
		}

		if (!abteilungsleiter)
		{
			abteilungsleiter = new Funktion(name: 'Abteilungsleiter(in)', code: Funktion.ABTEILUNGSLEITER, vorstand: true).save(flush: true)
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

		def funktionList = Funktion.list()

		funktionList.each
		{
			println it
		}
	}

	def destroy =
	{
	}
} 