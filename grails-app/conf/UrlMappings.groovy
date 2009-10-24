class UrlMappings {

	static excludes = ["/images/**", "/css/**", "/js/**"]	

    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      "/"(view:"/index")
	  "500"(view:'/error')
	}
}
