
<%@ page import="de.webmpuls.cms.start.Anzeigen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'anzeigen.label', default: 'Anzeigen')}" />
        %{--<title><g:message code="default.edit.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${anzeigenInstance}">
            <div class="errors">
                <g:renderErrors bean="${anzeigenInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${anzeigenInstance?.id}" />
                <g:hiddenField name="version" value="${anzeigenInstance?.version}" />
                <div class="dialog">
                    <table>
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
									<g:render template="/global/ckeditor/editor" model="['inhalt': anzeigenInstance?.inhalt]" />
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="takeEndDate"><g:message code="anzeigen.takeEndDate.label" default="Take End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'takeEndDate', 'errors')}">
                                    <g:checkBox name="takeEndDate" value="${anzeigenInstance?.takeEndDate}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endDatum"><g:message code="anzeigen.endDatum.label" default="End Datum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anzeigenInstance, field: 'endDatum', 'errors')}">
                                    <g:datePicker name="endDatum" precision="day" value="${anzeigenInstance?.endDatum}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
