class UrlMappings
{

	static excludes = ["/images/**", "/css/**", "/js/**"]

	static mappings = {
		name abteilungShow: "/abteilungen/$code" {
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
