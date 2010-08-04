package de.webmpuls.cms.people
class ShiroRole {
    String name

	static final String ADMINISTRATOR = "administrator"
	static final String BENUTZER = "benutzer"
	static final String FUSSBALL_JUGEND = "fussball_jugend"

    static hasMany = [ users: ShiroUser, permissions: String ]
    static belongsTo = ShiroUser

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
