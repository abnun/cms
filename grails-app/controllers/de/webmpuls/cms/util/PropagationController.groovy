package de.webmpuls.cms.util

class PropagationController {

    def route =
	{
//		println params
		String name = params.name
		if(name)
		{
			response.sendRedirect("${request.getContextPath()}/sites/${name}.gsp")
			return false
		}
		else
		{
			redirect(uri: "/")
			return false
		}
	}
}
