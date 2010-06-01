package de.webmpuls.cms.section

class Trainingszeit
{
	static hasMany = [trainingstage: Trainingstag]

	String name = "Trainingszeiten"

	String ort

    static constraints =
	{
		name(blank: false)
		ort(nullable: true, blank: true)
    }

	def String toString()
	{
		return "${name} | ${trainingstage?.iterator()?.next()?.tag ?: ''} | ${trainingstage?.iterator()?.next()?.uhrzeiten ?: ''} | ${ort ?: ''}"
	}
}
