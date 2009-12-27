package de.webmpuls.cms.admin

class AdminController
{

    def index =
	{
		params.targetUri = '/'
		redirect(controller: 'auth', action: 'login', params: params)
	}

	def menu =
	{
		
	}
}
