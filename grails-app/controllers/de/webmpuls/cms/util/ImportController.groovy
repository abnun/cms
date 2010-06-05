package de.webmpuls.cms.util

import org.cyberneko.html.parsers.SAXParser
import java.text.SimpleDateFormat
import de.webmpuls.cms.result.Tabelle
import org.springframework.web.multipart.MultipartRequest
import de.webmpuls.cms.result.TabelleHelper
import java.text.MessageFormat

class ImportController
{

	def importService

	def index =
	{
		
	}

    def tableHTMLImport =
	{
		log.debug("params -> $params")

		GregorianCalendar gregorianCalendar = new GregorianCalendar()
		gregorianCalendar.add(GregorianCalendar.DAY_OF_WEEK, -7)

		Date dateSevenDaysAgo = gregorianCalendar.getTime()

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")

		String datumVon = simpleDateFormat.format(dateSevenDaysAgo)

		String datumBis = simpleDateFormat.format(new Date())

		String tmpDatumVon = params.datepickerFrom
		String tmpDatumBis = params.datepickerTo

		// Hier "Von" - "Bis" bestimmen
		if(tmpDatumVon && tmpDatumBis)
		{
			datumVon = tmpDatumVon
			datumBis = tmpDatumBis
		}

		String tmpLink = MessageFormat.format(TabelleHelper.FETCH_RESULTS_URL, [datumVon, datumBis] as String[]) 

		log.debug("tmpLink -> $tmpLink")

		importService.importHTMLTable(tmpLink)

		flash.message = "Tabelle von <a href=\"${tmpLink}\">hier</a> eingelesen."
		redirect(controller: 'tabelle', action: 'list')
	}

	def excelImport =
	{
		if(request instanceof MultipartRequest)
		{
			log.debug("params -> $params")
			def file = request.getFile('file')
			if (file && !file.isEmpty())
			{
				importService.importExcel(file)
				flash.message = "${message(code: 'excel.succesful.import.message')}"
			}
			else
			{
				flash.error = "${message(code: 'excel.unsuccesful.import.message')}"
			}

			redirect(controller: 'person', action: 'list')
			return false
		}
		redirect(uri: '/')
		return false
	}

	def uploadExcel =
	{
		
	}
}
