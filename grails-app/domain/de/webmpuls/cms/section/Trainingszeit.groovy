package de.webmpuls.cms.section

class Trainingszeit
{
	static hasMany = [trainingstage: Trainingstag]

	String bezeichnung

	String ort

    static constraints =
	{
		bezeichnung(nullable: false, blank: false)
		ort(nullable: true, blank: true)
    }

	def String toString()
	{
		return "${bezeichnung} | ${trainingstage?.iterator()?.next()?.tag ?: ''} | ${trainingstage?.iterator()?.next()?.uhrzeiten ?: ''} | ${ort ?: ''}"
	}
}
