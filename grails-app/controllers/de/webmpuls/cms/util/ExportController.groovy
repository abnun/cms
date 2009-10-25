package de.webmpuls.cms.util

class ExportController
{

	static defaultAction = "pdfExportVorstand"

    def pdfExportVorstand =
	{
		
	}

	def pdfExportMitglieder =
	{

	}

	def excelExportVorstand =
	{
		log.debug("params -> $params")

		render "Noch nicht implementiert -> <a href=\"${resource(dir: '')}\">Zur&uuml;ck</a>"
		return false

		String fileName = params.fileName
		if(!fileName)
		{
			fileName = "Adressenliste.xls"
		}
		exportService.exportExcel(fileName)
	}

	def excelExportMitglieder =
	{
		log.debug("params -> $params")

		render "Noch nicht implementiert -> <a href=\"${resource(dir: '')}\">Zur&uuml;ck</a>"
		return false

		String fileName = params.fileName
		if(!fileName)
		{
			fileName = "Adressenliste.xls"
		}
		exportService.exportExcel(fileName)
	}
}
