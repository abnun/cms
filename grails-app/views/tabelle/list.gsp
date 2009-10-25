
<%@ page import="de.webmpuls.cms.result.Tabelle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'tabelle.label', default: 'Tabelle')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            %{--<span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>--}%
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1 class="headline_dunkel"><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'tabelle.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="spieldatum" title="${message(code: 'tabelle.spieldatum.label', default: 'Spieldatum')}" />
                        
                            <g:sortableColumn property="spielkennung" title="${message(code: 'tabelle.spielkennung.label', default: 'Spielkennung')}" />
                        
                            <g:sortableColumn property="heimmannschaft" title="${message(code: 'tabelle.heimmannschaft.label', default: 'Heimmannschaft')}" />
                        
                            <g:sortableColumn property="gastmannschaft" title="${message(code: 'tabelle.gastmannschaft.label', default: 'Gastmannschaft')}" />
                        
                            <g:sortableColumn property="anstoss" title="${message(code: 'tabelle.anstoss.label', default: 'Anstoss')}" />
                        
                            <g:sortableColumn property="tore" title="${message(code: 'tabelle.tore.label', default: 'Tore')}" />
                        
                            <g:sortableColumn property="spielklasse" title="${message(code: 'tabelle.spielklasse.label', default: 'Spielklasse')}" />
                        
                            <g:sortableColumn property="typ" title="${message(code: 'tabelle.typ.label', default: 'Typ')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tabelleInstanceList}" status="i" var="tabelleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tabelleInstance.id}">${fieldValue(bean: tabelleInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${tabelleInstance.spieldatum}" /></td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "spielkennung")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "heimmannschaft")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "gastmannschaft")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "anstoss")}</td>
                        
                            <td>${tabelleInstance?.tore}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "spielklasse")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "typ")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tabelleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
