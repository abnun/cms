import de.webmpuls.cms.people.ShiroRole

/**
 * Generated by the Shiro plugin. This filters class protects all URLs
 * via access control by convention.
 */
class SecurityFilters {
    def filters = {
		adminArea(controller: 'admin', action: 'index') {
            before = {
                // Access control by convention.
                accessControl()
				{
					role(ShiroRole.BENUTZER)
				}
            }
        }
        user(controller: 'anzeigen|news|aktuelles|funktion|person|tabelle|termin', action: 'edit|create|list|update|save|delete') {
            before = {
                // Access control by convention.
                accessControl()
				{
					role(ShiroRole.BENUTZER)
				}
            }
        }

		abteilungUser(controller: 'abteilung', action: 'edit|create|list|update|save|delete') {
            before = {
                // Access control by convention.
                accessControl()
				{
					role(ShiroRole.FUSSBALL_JUGEND)
				}
            }
        }

		berichtUser(controller: 'bericht', action: '*') {
			before = {
                // Access control by convention.
                accessControl()
				{
					role(ShiroRole.BENUTZER)
				}
            }
		}

		/*pictureUser(controller: 'picture', action: '*') {
			before = {

				log.debug("intercepting PictureController")
				// Access control by convention.
                accessControl()
				{
					role(ShiroRole.BENUTZER)
				}
            }
		}*/

		adminAlbum(controller: 'album', action: '*') {
            before = {
                // Access control by convention.
                accessControl()
				{
					role(ShiroRole.ADMINISTRATOR)
				}
            }
        }

		adminSponsor(controller: 'sponsor', action: 'create|edit|save|update|delete') {
            before = {
                // Access control by convention.
                accessControl()
				{
					role(ShiroRole.ADMINISTRATOR)
				}
            }
        }

		adminShiro(controller: 'shiroUser|shiroRole', action: '*') {
			before = {
                // Access control by convention.
                accessControl()
				{
					role(ShiroRole.ADMINISTRATOR)
				}
            }
		}
    }
}
