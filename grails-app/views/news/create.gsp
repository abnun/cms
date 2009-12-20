
<%@ page import="de.webmpuls.cms.start.News" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'news.label', default: 'News')}" />
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
            <g:hasErrors bean="${newsInstance}">
            <div class="errors">
                <g:renderErrors bean="${newsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ueberschrift"><g:message code="news.ueberschrift.label" default="Ueberschrift" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: newsInstance, field: 'ueberschrift', 'errors')}">
                                    <g:textField name="ueberschrift" value="${newsInstance?.ueberschrift}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abteilung"><g:message code="news.abteilung.label" default="Abteilung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: newsInstance, field: 'abteilung', 'errors')}">
                                    <g:select name="abteilung.id" from="${de.webmpuls.cms.section.Abteilung.list()}" optionKey="id" value="${newsInstance?.abteilung?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inhalt"><g:message code="news.inhalt.label" default="Inhalt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: newsInstance, field: 'inhalt', 'errors')}">
                                    <ckeditor:editor name="inhalt" width="100%" height="500" toolbar="Basic" enterMode="CKEDITOR.ENTER_BR">${newsInstance?.inhalt}</ckeditor:editor>
									%{--<g:textArea name="inhalt" cols="40" rows="5" value="${newsInstance?.inhalt}" />--}%
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
