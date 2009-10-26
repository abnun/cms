package de.webmpuls.cms.util

import de.webmpuls.cms.people.Person
import java.text.SimpleDateFormat

class ExportController
{

	static defaultAction = "pdfExportVorstand"

	def exportService

    def pdfExportVorstand =
	{
		
	}

	def pdfExportMitglieder =
	{
		return [mitgliederList: Person.list()]
	}

	def excelExportVorstand =
	{
		log.debug("params -> $params")

		String fileName = params.fileName

		if(!fileName)
		{
			Date date = new Date()

        	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")

			fileName = "AdressenlisteVorstand_${simpleDateFormat.format(date)}"
		}

		File exportFile = exportService.exportExcel(fileName, true)

		if(exportFile)
		{
			response.contentType = "application/msexcel"

			response.setHeader("Content-disposition", "attachment; filename=" +
					exportFile.name);
			FileInputStream inputStream = new FileInputStream(exportFile);
			byte[] buf = new byte[4 * 1024]; // 4K buffer
			int bytesRead;
			while ((bytesRead = inputStream.read(buf)) != -1)
			{
				response.outputStream << buf
			}
			inputStream.close()
			response.outputStream.flush()
		}
		else
        {
            flash.message = "Excel-File fuer Vorstände und Abteilungsleiter konnte nicht erstellt werden!"
            redirect(controller: 'person', action: 'list')
			return false
        }
	}

	def excelExportMitglieder =
	{
		log.debug("params -> $params")

		String fileName = params.fileName

		if(!fileName)
		{
			Date date = new Date()

        	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")

			fileName = "Mitgliederliste_${simpleDateFormat.format(date)}"
		}

		File exportFile = exportService.exportExcel(fileName, false)

		if(exportFile)
		{
			response.contentType = "application/msexcel"

			response.setHeader("Content-disposition", "attachment; filename=" +
					exportFile.name);
			FileInputStream inputStream = new FileInputStream(exportFile);
			byte[] buf = new byte[4 * 1024]; // 4K buffer
			int bytesRead;
			while ((bytesRead = inputStream.read(buf)) != -1)
			{
				response.outputStream << buf
			}
			inputStream.close()
			response.outputStream.flush()
		}
		else
        {
            flash.message = "Excel-File fuer Mitglieder konnte nicht erstellt werden!"
            redirect(controller: 'person', action: 'list')
			return false
        }
	}
}
