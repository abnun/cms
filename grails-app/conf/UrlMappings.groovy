class UrlMappings
{

	static excludes = ["/images/**", "/css/**", "/js/**"]

	static mappings = {
		name abteilungShow: "/abteilungen/$code" {
				controller = 'abteilung'
				action = 'show'
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
