<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${ergebnisse}">
	<g:each in="${ergebnisse.sort{a, b -> a.spieldatum <=> b.spieldatum}}" var="ergebnis" status="i">
		<g:if test="${i > 0}">
			<br/>
		</g:if>
		<g:if test="${ergebnis?.tore?.contains('png')}">
			<span style="position: relative; display: block; float: right; margin: 0; border: none; width: 35px; height: 14px; overflow: hidden;">
				<img style="position: absolute; ${ergebnis.toreImageStyle ?: ''}" src="${resource(dir: 'bilder/tabellen/tore', file: ergebnis?.tore)}" alt="" border="0"/>
			</span>
		</g:if>
		<g:else>
			<span style="position: relative; display: block; float: right; margin: 0; border: none; overflow: hidden; font-size: 12px;">
				${(ergebnis?.tore?.indexOf(' *') != -1) ? ergebnis?.tore?.substring(0, ergebnis?.tore?.indexOf(' *')) : ergebnis?.tore}&nbsp;
			</span>
		</g:else>
		<b><g:formatDate date="${ergebnis.spieldatum}" format="dd.MM.yyyy"/></b>: ${ergebnis.heimmannschaft} - ${ergebnis.gastmannschaft}
	</g:each>
</g:if>
<g:else>
	<g:message code="abteilung.no.match.results" />
</g:else>