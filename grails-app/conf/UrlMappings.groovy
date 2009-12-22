class UrlMappings
{

	static excludes = ["/images/**", "/css/**", "/js/**"]

	static mappings = {
		name abteilungShow: "/abteilungen/$code" {
				controller = 'abteilung'
				action = 'show'
			}

		"/admin" {
			controller = "auth"
			action = "login"
			targetUri = "/"
		}

		"/sponsoren"
		{
			controller = "sponsor"
			action = "list"
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
