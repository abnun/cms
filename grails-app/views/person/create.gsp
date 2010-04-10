
<%@ page import="de.webmpuls.cms.people.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="body">
            <h1 class="headline"><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
				<div class="ui-widget">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							${flash.message}
						</p>
					</div>
				</div>
			</g:if>
			<g:if test="${flash.error}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error" />:</strong>&nbsp;${flash.error}
						</p>
					</div>
				</div>
            </g:if>
            <g:hasErrors bean="${personInstance}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error"/>:</strong>
							<br/>
							<g:renderErrors bean="${personInstance}" as="list" />
					</div>
				</div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vorname"><g:message code="person.vorname.label" default="Vorname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'vorname', 'errors')}">
                                    <g:textField name="vorname" value="${personInstance?.vorname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nachname"><g:message code="person.nachname.label" default="Nachname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'nachname', 'errors')}">
                                    <g:textField name="nachname" value="${personInstance?.nachname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="strasse"><g:message code="person.strasse.label" default="Strasse" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'strasse', 'errors')}">
                                    <g:textField name="strasse" value="${personInstance?.strasse}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="plz"><g:message code="person.plz.label" default="Plz" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'plz', 'errors')}">
                                    <g:textField name="plz" maxlength="5" value="${personInstance?.plz}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ort"><g:message code="person.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" value="${personInstance?.ort}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefon1"><g:message code="person.telefon1.label" default="Telefon1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'telefon1', 'errors')}">
                                    <g:textField name="telefon1" value="${personInstance?.telefon1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefon2"><g:message code="person.telefon2.label" default="Telefon2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'telefon2', 'errors')}">
                                    <g:textField name="telefon2" value="${personInstance?.telefon2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="person.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${personInstance?.email}" />
                                </td>
                            </tr>
                        
                            %{--<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bild"><g:message code="person.bild.label" default="Bild" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'bild', 'errors')}">
                                    <g:select name="bild.id" from="${de.webmpuls.photo_album.Picture.list()}" optionKey="id" value="${personInstance?.bild?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="steckbrief"><g:message code="person.steckbrief.label" default="Steckbrief" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'steckbrief', 'errors')}">
                                    <g:select name="steckbrief.id" from="${de.webmpuls.cms.people.Steckbrief.list()}" optionKey="id" value="${personInstance?.steckbrief?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>--}%
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="adresseAnzeigen"><g:message code="person.adresseAnzeigen.label" default="Adresse Anzeigen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'adresseAnzeigen', 'errors')}">
                                    <g:checkBox name="adresseAnzeigen" value="${personInstance?.adresseAnzeigen}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
