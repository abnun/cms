package de.webmpuls.cms.util

import org.cyberneko.html.parsers.SAXParser
import java.text.SimpleDateFormat
import de.webmpuls.cms.result.Tabelle
import org.springframework.web.multipart.MultipartRequest

class ImportController
{

	def importService

	def index =
	{
		
	}

    def tableHTMLImport =
	{
		String vereinId = "35000777"
		String datumVon = "10.10.2009"
		String datumBis = "20.10.2009"
		String tmpLink = "http://www.fussball.de/api/fbed/fbedVereinsspielplan.php?edVereinId=$vereinId&edDatumVon=$datumVon&edDatumBis=$datumBis&edMannschaftChk0=0&edMannschaftChk1=&edMannschaften=%7B%223500077701501301%22%3A%200%2C%20%223500077701501302%22%3A%200%2C%20%223500077701501401%22%3A%200%2C%20%223500077701501501%22%3A%200%2C%20%223500077701501601%22%3A%200%2C%20%223500077701501602%22%3A%200%2C%20%223500077701501701%22%3A%200%2C%20%223500077701501702%22%3A%200%2C%20%223500077701501703%22%3A%200%2C%20%223500077701501801%22%3A%200%2C%20%223500077701501802%22%3A%200%2C%20%223500077701502001%22%3A%200%2C%20%223500077701502201%22%3A%200%2C%20%223500077701502301%22%3A%200%2C%20%223500077701502401%22%3A%200%2C%20%223500077701503001%22%3A%200%2C%20%223500077701504301%22%3A%200%2C%20%223500077701401205%22%3A%200%2C%20%223500077701401301%22%3A%200%2C%20%223500077701401302%22%3A%200%2C%20%223500077701401401%22%3A%200%2C%20%223500077701401501%22%3A%200%2C%20%223500077701401601%22%3A%200%2C%20%223500077701401701%22%3A%200%2C%20%223500077701401702%22%3A%200%2C%20%223500077701401703%22%3A%200%2C%20%223500077701401801%22%3A%200%2C%20%223500077701401802%22%3A%200%2C%20%223500077701401803%22%3A%200%2C%20%223500077701402003%22%3A%200%2C%20%223500077701402301%22%3A%200%2C%20%223500077701402401%22%3A%200%2C%20%223500077701401602%22%3A%200%2C%20%223500077701402201%22%3A%200%2C%20%223500077701401201%22%3A%200%2C%20%223500077701401101%22%3A%200%7D&edAustragungsort0=0&edAustragungsort1=&edAustragungsort2=&edSpielstaette=1"

		println tmpLink

		importService.importHTMLTable(tmpLink)

		render ("Tabelle von <a href=\"${tmpLink}\">hier</a> eingelesen -> ${Tabelle.list().size()}")
	}

	def excelImport =
	{
		if(request instanceof MultipartRequest)
		{
			log.debug("params -> $params")
			def file = request.getFile('file')
			if (file)
			{
				importService.importExcel(file)
			}

			redirect(uri: '/')
			return false
		}
		redirect(uri: '/')
		return false
	}

	def uploadExcel =
	{
		
	}
}
