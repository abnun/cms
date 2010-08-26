package de.webmpuls.cms.section

class InfoBox
{
	String ueberschrift

	String inhalt

	Integer position

	static mapping = {
		sort("position")
		order("asc")

		position column: '`position`'
	}

    static constraints =
	{
		ueberschrift()
		inhalt(widget: 'textarea')
		position(unique: true)
    }

	def String toString()
	{
		return "$position | $ueberschrift"
	}
}
