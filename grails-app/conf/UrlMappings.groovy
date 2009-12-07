class UrlMappings {

	static excludes = ["/images/**", "/css/**", "/js/**"]	

    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      //"/"(view:"/index")
      "/"(controller: "inhalt", action: 'aktuelles')
	  "500"(view:'/error')
	}
}
