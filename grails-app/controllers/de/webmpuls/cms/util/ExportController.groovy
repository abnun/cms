package de.webmpuls.cms.util

class ExportController
{

	static defaultAction = "pdfExport"

    def pdfExport =
	{
		
	}

	def excelExport =
	{
		log.debug("params -> $params")

		String fileName = params.fileName
		if(!fileName)
		{
			fileName = "Adressenliste.xls"
		}
		exportService.exportExcel(fileName)
	}
}
