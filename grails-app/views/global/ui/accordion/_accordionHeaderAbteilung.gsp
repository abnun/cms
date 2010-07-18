<%@ page contentType="text/html;charset=UTF-8" %>
<span class="copy" style="float: right;"><g:formatDate date="${datum}" format="dd.MM.yyyy" /></span>
<g:if test="${abteilung.kuerzel}">
	<span class="headline_dunkel">${abteilung.kuerzel}:</span>
</g:if>
<span class="headline">${accordionTabUeberschrift1}</span>
