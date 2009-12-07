
<%@ page import="de.webmpuls.cms.start.Anzeigen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'anzeigen.label', default: 'Anzeigen')}" />
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
            <g:hasErrors bean="${anzeigenInstance}">
            <div class="errors">
                <g:renderErrors bean="${anzeigenInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog" style="width: 100%;">
                    <table style="width: 100%;">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift1"><g:message code="anzeigen.ueberschrift1.label" default="Ueberschrift1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'ueberschrift1', 'errors')}">
                                    <g:textField name="ueberschrift1" value="${anzeigenInstance?.ueberschrift1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift2"><g:message code="anzeigen.ueberschrift2.label" default="Ueberschrift2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'ueberschrift2', 'errors')}">
                                    <g:textField name="ueberschrift2" value="${anzeigenInstance?.ueberschrift2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abteilung"><g:message code="anzeigen.abteilung.label" default="Abteilung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'abteilung', 'errors')}">
                                    <g:select name="abteilung.id" from="${de.webmpuls.cms.section.Abteilung.list()}" optionKey="id" value="${anzeigenInstance?.abteilung?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="anzeigen.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'inhalt', 'errors')}">
                                    %{--<g:textField name="inhalt" value="${anzeigenInstance?.inhalt}" />--}%
									<ckeditor:editor name="inhalt" width="100%" height="500" toolbar="Basic">${anzeigenInstance?.inhalt}</ckeditor:editor>
									<!--fileBrowser="default">-->
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
