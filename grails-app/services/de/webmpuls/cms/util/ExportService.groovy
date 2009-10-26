package de.webmpuls.cms.util

import de.webmpuls.cms.people.Funktion
import de.webmpuls.cms.section.Abteilung
import java.text.SimpleDateFormat
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.hssf.usermodel.HSSFSheet
import org.apache.poi.hssf.usermodel.HSSFFont
import org.apache.poi.hssf.usermodel.HSSFCellStyle
import org.apache.poi.hssf.usermodel.HSSFRow
import org.apache.poi.hssf.usermodel.HSSFCell
import de.webmpuls.cms.people.Person
import org.springframework.context.ApplicationContextAware
import org.springframework.context.ApplicationContext

class ExportService implements ApplicationContextAware
{
    boolean transactional = true

	ApplicationContext applicationContext

    public File exportExcel(String fileName, boolean isVorstand)
	{
		Abteilung abteilung

        Date date = new Date()

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")

		if(!fileName)
		{
			fileName = "Mitgliederliste_${simpleDateFormat.format(date)}"
		}

		File exportFile = null

        def personen = Person.list()
		log.debug("personen.size -> " + personen.size())

        if ( personen.size > 0 )
        {
            fileName += ".xls"
            exportFile = applicationContext.getResource(File.separator + "temp" + File.separator + "excel" + File.separator + fileName).getFile()

            FileOutputStream out = new FileOutputStream(exportFile);
            final HSSFWorkbook wb = new HSSFWorkbook();
            final HSSFSheet sheet = wb.createSheet("Kurs Liste");
			sheet.autoSizeColumn(2) 
			sheet.autoSizeColumn(7)
			sheet.autoSizeColumn(8)

            final HSSFFont bigbold = wb.createFont();
            bigbold.setFontHeightInPoints((short) 12);
            bigbold.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            final HSSFFont normal = wb.createFont();
            bigbold.setFontHeightInPoints((short) 10);
            final HSSFCellStyle bigboldStyle = wb.createCellStyle();
            bigboldStyle.setFont(bigbold);
            final HSSFFont smallbold = wb.createFont();
            smallbold.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            final HSSFCellStyle smallboldStyle = wb.createCellStyle();
            smallboldStyle.setFont(smallbold);
            final HSSFCellStyle rightAlignedStyle = wb.createCellStyle();
            rightAlignedStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
            final HSSFCellStyle normalStyle = wb.createCellStyle();
            normalStyle.setFont(normal);
            normalStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT)

            final short columnWidth = 15;

            sheet.setDefaultColumnWidth(columnWidth);

            HSSFRow row;
            HSSFCell cell;

            short rowIt = 0;
            row = sheet.createRow(rowIt++);

            cell = row.createCell((short) 0);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);

            cell.setCellValue("Name");
            cell.setCellStyle(bigboldStyle);

            cell = row.createCell((short) 1);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);

            cell.setCellValue("Vorname");
            cell.setCellStyle(bigboldStyle);

            cell = row.createCell((short) 2);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);

            cell.setCellValue("Strasse");
            cell.setCellStyle(bigboldStyle);

            cell = row.createCell((short) 3);
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);

            cell.setCellValue("PLZ");
            cell.setCellStyle(bigboldStyle);

            cell = row.createCell((short) 4);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);

            cell.setCellValue("Ort");
            cell.setCellStyle(bigboldStyle);

            cell = row.createCell((short) 5);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);

            cell.setCellValue("Telefon");
            cell.setCellStyle(bigboldStyle);

            cell = row.createCell((short) 6);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);

            cell.setCellValue("Handy");
            cell.setCellStyle(bigboldStyle);

            cell = row.createCell((short) 7);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);

            cell.setCellValue("E-Mail");
            cell.setCellStyle(bigboldStyle);

			cell = row.createCell((short) 8);
			cell.setCellType(HSSFCell.CELL_TYPE_STRING);

			cell.setCellValue("");
			cell.setCellStyle(bigboldStyle);

            for (Person p in personen)
            {
                log.debug("Person -> " + p)
                row = sheet.createRow(rowIt++);

				cell = row.createCell((short)0);
                cell.setCellStyle(normalStyle);
                cell.setCellValue(p.nachname);

                cell = row.createCell((short)1);
                cell.setCellStyle(normalStyle);
                cell.setCellValue(p.vorname);

                cell = row.createCell((short)2);
                cell.setCellStyle(normalStyle);
                cell.setCellValue(p.strasse);

                cell = row.createCell((short)3);
                cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC) 
				cell.setCellStyle(normalStyle);
                cell.setCellValue(p.plz);

                cell = row.createCell((short)4);
                cell.setCellStyle(normalStyle);
                cell.setCellValue(p.ort);

                cell = row.createCell((short)5);
                cell.setCellStyle(normalStyle);
                cell.setCellValue(p.telefon1);

                cell = row.createCell((short)6);
                cell.setCellStyle(normalStyle);
                cell.setCellValue(p.telefon2);

                cell = row.createCell((short)7);
                cell.setCellStyle(normalStyle);
                cell.setCellValue(p.email);

				cell = row.createCell((short)8);
				cell.setCellStyle(normalStyle);

				if(isVorstand)
				{
					Collection funktionen = Funktion.findAllByVorstand(true, [sort: 'name', order: 'asc'])
					Funktion tmpFunktion = funktionen.find
					{
						Funktion funktion ->
						funktion.personen.contains(p)
					}
					if(tmpFunktion)
					{
						cell.setCellValue(tmpFunktion.toString());
					}
					else
					{
						Funktion abteilungsLeiterFunktion = Funktion.findNotVorstandByCode(Funktion.ABTEILUNGSLEITER)

						if(p.funktionen.contains(abteilungsLeiterFunktion))
						{
							Abteilung pAbteilung = p.abteilungen.find
							{
								Abteilung tmpAbteilung ->
								tmpAbteilung.personen.contains(p)
							}

							if(pAbteilung)
							{
								cell.setCellValue(pAbteilung.toString());
							}
						}
					}
				}
				else
				{
					String funktionenString = ""
					Collection pFunktionen = p.funktionen
					if (pFunktionen)
					{
						for (Funktion tmpFunktion: pFunktionen)
						{
							if (!funktionenString && pFunktionen.size() > 1)
							{
								funktionenString += "${tmpFunktion}, "
							}
							else
							{
								funktionenString += "${tmpFunktion}"
							}
						}
					}
					cell.setCellValue(funktionenString);
				}
            }
            wb.write(out);
            out.close()

            exportFile.deleteOnExit()
        }
		return exportFile
	}
}
