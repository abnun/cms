package de.webmpuls.cms.content

import de.webmpuls.cms.start.Anzeigen

class InhaltController
{

    def index = { }

    def aktuelles =
	{
		def anzeigenList = Anzeigen.list([cache: true])
		return [anzeigenList: anzeigenList]
	}
}
