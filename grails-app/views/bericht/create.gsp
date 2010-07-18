
<%@ page import="de.webmpuls.cms.section.Bericht" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'bericht.label', default: 'Bericht')}" />
        %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
		%{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
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
							<strong><g:message code="default.error"/>:</strong>&nbsp;${flash.error}
						</p>
					</div>
				</div>
			</g:if>
			<g:hasErrors bean="${berichtInstance}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error"/>:</strong>
							<br/>
							<g:renderErrors bean="${berichtInstance}" as="list"/>
					</div>
				</div>
			</g:hasErrors>

			<g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift"><g:message code="bericht.ueberschrift.label" default="Ueberschrift" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: berichtInstance, field: 'ueberschrift', 'errors')}">
                                    <g:textField name="ueberschrift" value="${berichtInstance?.ueberschrift}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="bericht.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: berichtInstance, field: 'inhalt', 'errors')}">
                                    %{--<g:textField name="inhalt" value="${berichtInstance?.inhalt}" />--}%
									<g:render template="/global/ckeditor/editor" model="['inhalt': berichtInstance?.inhalt, width: '614']" />
                                </td>
                            </tr>

                            %{--<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="album"><g:message code="bericht.album.label" default="Album" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: berichtInstance, field: 'album', 'errors')}">
                                    <g:select name="album.id" from="${de.webmpuls.photo_album.Album.list()}" optionKey="id" value="${berichtInstance?.album?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>--}%
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
				<g:hiddenField name="abteilungId" value="${params.abteilungId}" />
            </g:form>
        </div>
    </body>
</html>
