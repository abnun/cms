
<%@ page import="de.webmpuls.cms.people.Person; de.webmpuls.cms.people.Funktion; de.webmpuls.cms.section.Abteilung" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}" />
        %{--<title><g:message code="default.show.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			<g:render template="/global/admin/menu" />
        </div>
        <div class="body">
            %{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="abteilung.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: abteilungInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="abteilung.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: abteilungInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="abteilung.code.label" default="Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: abteilungInstance, field: "code")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="abteilung.personen.label" default="Personen" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${abteilungInstance.personen}" var="p">
                                    <li><g:link controller="person" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="abteilung.unterabteilungen.label" default="Unterabteilungen" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${abteilungInstance.unterabteilungen}" var="u">
                                    <li><g:link controller="abteilung" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="abteilung.mitarbeiterfunktionen.label" default="Mitarbeiterfunktionen" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${abteilungInstance.mitarbeiterfunktionen}" var="m">
                                    <li><g:link controller="funktion" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${abteilungInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
			<div>
			<h1 class="headline_dunkel">Abteilungsleiter</h1>
			<%
			    Funktion abteilungsLeiterFunktion = abteilungInstance.mitarbeiterfunktionen.find
				{
					Funktion funktion ->

					if(funktion.code == Funktion.ABTEILUNGSLEITER)
					{
						return funktion
					}
				}

				Collection abteilungsLeiterCollection = null

				if(abteilungsLeiterFunktion)
				{
					abteilungsLeiterCollection = abteilungInstance.personen.findAll
					{
						Person tmpPerson ->
						abteilungsLeiterFunktion.personen.contains(tmpPerson)
					}
				}
			%>
			<g:each var="abteilungsLeiter" in="${abteilungsLeiterCollection}">
			<h3>${abteilungsLeiter.vorname} ${abteilungsLeiter.nachname}</h3>
			</g:each>
		</div>
        </div>
    </body>
</html>
