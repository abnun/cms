class UrlMappings
{

	static excludes = ["/images/**", "/css/**", "/js/**"]

	static mappings = {

		name abteilungSpielplan: "/abteilung/spielplan/$code" {
			controller = 'abteilung'
			action = 'spielplan'
		}

		name abteilungPortraits: "/abteilung/portraits/$code" {
			controller = 'abteilung'
			action = 'portraits'
		}

		name abteilungShow: "/abteilung/$code" {
			controller = 'abteilung'
			action = 'berichte'
		}

		name abteilungAktuelles: "/abteilungen/aktuelles/$code" {
			controller = 'abteilung'
			action = 'aktuelles'
		}

		"/aktuelles"
		{
			controller = "inhalt"
			action = "aktuelles"
		}

		"/sponsoren"
		{
			controller = "sponsor"
			action = "list"
		}

		"/news"
		{
			controller = "news"
			action = "all"
		}

		"/anzeigen"
		{
			controller = "anzeigen"
			action = "all"
		}

		"/sites/$name**.htm"
		{
			controller = "propagation"
			action = "route"
		}

		"/$controller/$action?/$id?" {
			constraints {
				// apply constraints here
			}
		}
		//"/"(view:"/index")
		"/"(controller: "inhalt", action: 'aktuelles')
		"500"(view: '/error')
	}
}
