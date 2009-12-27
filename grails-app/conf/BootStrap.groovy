import de.webmpuls.cms.people.Funktion
import de.webmpuls.cms.media.MediaUtils
import de.webmpuls.photo_album.Album
import de.webmpuls.photo_album.Picture
import de.webmpuls.cms.people.ShiroRole
import de.webmpuls.cms.people.Person
import org.apache.shiro.crypto.hash.Sha1Hash
import de.webmpuls.cms.people.ShiroUser

class BootStrap
{

	def init =
	{
		servletContext ->

		
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

		def funktionList = Funktion.list()

		funktionList.each
		{
			println it
		}


		// Foto-Alben

		Album personen = Album.findByName(MediaUtils.ALBUM_PERSONEN)
		if(!personen)
		{
			personen =  new Album(name: MediaUtils.ALBUM_PERSONEN, description: "Foto-Album für die Mitglieder des SV-Leingartens")
			personen.save()
		}

		Album verschiedenes = Album.findByName(MediaUtils.ALBUM_VERSCHIEDENES)
		if(!verschiedenes)
		{
			verschiedenes =  new Album(name: MediaUtils.ALBUM_VERSCHIEDENES, description: "Foto-Album für alle anderen Bilder")
			verschiedenes.save()
		}

		Album sponsoren = Album.findByName(MediaUtils.ALBUM_SPONSOREN)
		if(!sponsoren)
		{
			sponsoren =  new Album(name: MediaUtils.ALBUM_SPONSOREN, description: "Foto-Album für die Sponsoren")
			sponsoren.save()
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

	def destroy =
	{
	}
} 