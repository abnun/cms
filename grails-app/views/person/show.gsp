
<%@ page import="de.webmpuls.cms.people.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        %{--<title><g:message code="default.show.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <g:render template="/global/javascript/createButtonJS" />
		<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]" /></button>
		<hr />
        <div class="body">
            %{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.vorname.label" default="Vorname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "vorname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.nachname.label" default="Nachname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "nachname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.strasse.label" default="Strasse" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "strasse")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.plz.label" default="Plz" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "plz")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.ort.label" default="Ort" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "ort")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.telefon1.label" default="Telefon1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "telefon1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.telefon2.label" default="Telefon2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "telefon2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.bild.label" default="Bild" /></td>
                            
                            <td valign="top" class="value"><g:link controller="picture" action="show" id="${personInstance?.bild?.id}">${personInstance?.bild?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.steckbrief.label" default="Steckbrief" /></td>
                            
                            <td valign="top" class="value"><g:link controller="steckbrief" action="show" id="${personInstance?.steckbrief?.id}">${personInstance?.steckbrief?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.abteilungen.label" default="Abteilungen" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personInstance.abteilungen}" var="a">
                                    <li><g:link controller="abteilung" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.adresseAnzeigen.label" default="Adresse Anzeigen" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.adresseAnzeigen}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.funktionen.label" default="Funktionen" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personInstance.funktionen}" var="f">
                                    <li><g:link controller="funktion" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
