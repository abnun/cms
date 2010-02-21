
<%@ page import="de.webmpuls.cms.result.Tabelle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'tabelle.label', default: 'Tabelle')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1 class="headline_dunkel"><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.spieldatum.label" default="Spieldatum" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${tabelleInstance?.spieldatum}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.spielkennung.label" default="Spielkennung" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "spielkennung")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.heimmannschaft.label" default="Heimmannschaft" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "heimmannschaft")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.gastmannschaft.label" default="Gastmannschaft" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "gastmannschaft")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.anstoss.label" default="Anstoss" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "anstoss")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.tore.label" default="Tore" /></td>
                            
                            <td valign="top" class="value">${tabelleInstance.tore}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.spielklasse.label" default="Spielklasse" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "spielklasse")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.typ.label" default="Typ" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "typ")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tabelle.spielbericht.label" default="Spielbericht" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tabelleInstance, field: "spielbericht")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${tabelleInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
