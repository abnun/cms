<g:set var="personName" value="${message(code: 'person.label', default: 'Person')}"/>
<span class="menuButton"><g:link class="list" controller="person" action="list"><g:message code="default.list.label" args="[personName]"/></g:link></span>
<g:set var="funktionName" value="${message(code: 'funktion.label', default: 'Funktion')}"/>
<span class="menuButton"><g:link class="list" controller="funktion" action="list"><g:message code="default.list.label" args="[funktionName]"/></g:link></span>
<g:set var="abteilungName" value="${message(code: 'abteilung.label', default: 'Abteilung')}"/>
<span class="menuButton"><g:link class="list" controller="abteilung" action="list"><g:message code="default.list.label" args="[abteilungName]"/></g:link></span>