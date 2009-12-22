
<%@ page import="de.webmpuls.cms.section.Sponsor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
        %{--<title><g:message code="default.create.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sponsorInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="sponsor.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${sponsorInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="beschreibung"><g:message code="sponsor.beschreibung.label" default="Beschreibung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'beschreibung', 'errors')}">
                                    %{--<g:textArea name="beschreibung" cols="40" rows="5" value="${sponsorInstance?.beschreibung}" />--}%
									<g:render template="/ckeditor/editor" model="['inhalt': sponsorInstance?.beschreibung, 'name': 'beschreibung']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="verlinkung"><g:message code="sponsor.verlinkung.label" default="Verlinkung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'verlinkung', 'errors')}">
                                    <g:textField name="verlinkung" value="${sponsorInstance?.verlinkung}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bild"><g:message code="sponsor.bild.label" default="Bild" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sponsorInstance, field: 'bild', 'errors')}">
                                    <g:select name="bild.id" from="${de.webmpuls.photo_album.Picture.listOrderByBaseName()}" optionKey="id" value="${sponsorInstance?.bild?.id}"  />
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
