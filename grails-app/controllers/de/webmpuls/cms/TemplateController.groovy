package de.webmpuls.cms

class TemplateController
{

    def index =
	{
	}

	def convertTemplate =
	{
		log.debug("params -> $params")
		String templateString = params.template

		if(templateString)
		{
			if(templateString.contains("../../bilder"))
			{
				templateString = templateString.replaceAll("../../bilder", "${request.getContextPath()}/WeceemFiles/sv-leingarten/bilder")
			}
			else if(templateString.contains("../bilder"))
			{
				templateString = templateString.replaceAll("../bilder", "${request.getContextPath()}/WeceemFiles/sv-leingarten/bilder")
			}

			if(templateString.contains("../../css"))
			{
				templateString = templateString.replaceAll("../../css", "${request.getContextPath()}/WeceemFiles/sv-leingarten/css")
			}
			else if(templateString.contains("../css"))
			{
				templateString = templateString.replaceAll("../css", "${request.getContextPath()}/WeceemFiles/sv-leingarten/css")
			}
		}
		if(params.html)
		{
			render(text: templateString, contentType:"text/html")
		}
		else
		{
			render(text: templateString, contentType:"text/plain")
		}
	}

	def templateText =
	{
		
	}
}
