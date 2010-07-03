class UrlMappings
{

	static excludes = ["/images/**", "/css/**", "/js/**"]

	static mappings = {

		"/$controller/$action?/$id?" {
			constraints {
				// apply constraints here
			}
		}
		
		name abteilungSpielplan: "/abteilung/spielplan/$code" {
			controller = 'abteilung'
			action = 'spielplan'
		}

		name abteilungPortraits: "/abteilung/portraits/$code" {
			controller = 'abteilung'
			action = 'portraits'
		}

		name abteilungShow: "/abteilung/berichte/$code" {
			controller = 'abteilung'
			action = 'berichte'
		}

		name abteilungTabelle: "/abteilung/tabelle/$code" {
			controller = 'abteilung'
			action = 'tabelle'
		}

		name abteilungTeam: "/abteilung/team/$code" {
			controller = 'abteilung'
			action = 'team'
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

		//"/"(view:"/index")
		"/"(controller: "inhalt", action: 'aktuelles')
		"500"(view: '/error')
	}
}
