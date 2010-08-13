package de.webmpuls.cms.section

class Trainingstag
{
	static belongsTo = [trainingszeit: Trainingszeit]
	
	Tag tag
	String uhrzeiten

	static constraints =
	{
		tag()
		uhrzeiten()
    }

	static mapping =
	{
		sort("tag")
		order("asc")
	}

	def String toString()
	{
		return "$tag | $uhrzeiten"
	}
}
