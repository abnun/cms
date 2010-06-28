
<%@ page import="de.webmpuls.cms.section.Spielplan" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'spielplan.label', default: 'Spielplan')}" />
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
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${spielplanInstance}">
            <div class="errors">
                <g:renderErrors bean="${spielplanInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abteilungKuerzel"><g:message code="spielplan.abteilungKuerzel.label" default="Abteilung Kuerzel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'abteilungKuerzel', 'errors')}">
                                    <g:textField name="abteilungKuerzel" value="${spielplanInstance?.abteilungKuerzel}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="spieldatum"><g:message code="spielplan.spieldatum.label" default="Spieldatum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'spieldatum', 'errors')}">
                                    <g:datePicker name="spieldatum" precision="day" value="${spielplanInstance?.spieldatum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="heimmannschaft"><g:message code="spielplan.heimmannschaft.label" default="Heimmannschaft" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'heimmannschaft', 'errors')}">
                                    <g:textField name="heimmannschaft" value="${spielplanInstance?.heimmannschaft}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gastmannschaft"><g:message code="spielplan.gastmannschaft.label" default="Gastmannschaft" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'gastmannschaft', 'errors')}">
                                    <g:textField name="gastmannschaft" value="${spielplanInstance?.gastmannschaft}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="anstoss"><g:message code="spielplan.anstoss.label" default="Anstoss" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: spielplanInstance, field: 'anstoss', 'errors')}">
                                    <g:textField name="anstoss" value="${spielplanInstance?.anstoss}" />
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
