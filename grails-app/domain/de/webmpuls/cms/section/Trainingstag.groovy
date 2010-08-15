package de.webmpuls.cms.section

class Trainingstag
{
	static belongsTo = [trainingszeit: Trainingszeit]
	
	Tag tag
	String uhrzeiten

	String ort

	static constraints =
	{
		tag()
		uhrzeiten()
		ort(nullable: true, blank: true)
    }

	static mapping =
	{
		sort("tag")
		order("asc")
	}

	def String toString()
	{
		return "$tag | $uhrzeiten | $ort"
	}
}
