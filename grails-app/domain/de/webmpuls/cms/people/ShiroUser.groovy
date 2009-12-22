package de.webmpuls.cms.people
class ShiroUser {
    String username
    String passwordHash

	static final String ADMINISTRATOR = "administrator"
	static final String TEST = "test"
	static final String WEBMASTER = "webmaster"

    static hasMany = [ roles: ShiroRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false)
    }
}
