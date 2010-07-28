package de.webmpuls.cms

import java.text.SimpleDateFormat
import grails.util.Environment
import java.text.MessageFormat
import de.webmpuls.cms.result.TabelleHelper
import de.webmpuls.cms.util.ImportService


class FetchResultsJob
{
	// Services
	ImportService importService

	static triggers =
	{
		if(Environment.isDevelopmentMode())
		{
			simple(name: 'simpleTrigger', startDelay: 20000, repeatInterval: 30000, repeatCount: 0)
		}
		else
		{
			cron(name: 'fetchResultsTrigger', startDelay: 200000, cronExpression: '0 0 4 ? * MON *')
		}
	}

    def execute()
	{
        GregorianCalendar gregorianCalendarNow = new GregorianCalendar()

		GregorianCalendar gregorianCalendarInSomeDays = new GregorianCalendar()
		gregorianCalendarInSomeDays.add(GregorianCalendar.DAY_OF_WEEK, TabelleHelper.FETCH_DAYS_OF_PLAY_FORWARD)

		GregorianCalendar gregorianCalendarSomeDaysAgo = new GregorianCalendar()
		gregorianCalendarSomeDaysAgo.add(GregorianCalendar.DAY_OF_WEEK, -TabelleHelper.FETCH_RESULTS_DAYS_AGO)

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")

		String datumVon = simpleDateFormat.format(gregorianCalendarSomeDaysAgo.getTime())
		String datumBis = simpleDateFormat.format(gregorianCalendarNow.getTime())

		println("Datum vor 7 Tagen -> ${datumVon}")
		println("Aktuelles Datum -> ${datumBis}")

		String tmpLink = MessageFormat.format(TabelleHelper.FETCH_RESULTS_URL, [datumVon, datumBis] as String[])

		importService.importHTMLTable(tmpLink)
    }
}
