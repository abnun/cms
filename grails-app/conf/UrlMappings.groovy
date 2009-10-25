class UrlMappings {

	static excludes = ["/images/**", "/css/**", "/js/**"]	

    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      //"/"(view:"/index")
      "/"(controller:"person")
	  "500"(view:'/error')
	}
}
