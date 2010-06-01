package de.webmpuls.cms.section

class Trainingstag
{
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
