<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${vorschauSpieltage}">
	<g:each in="${vorschauSpieltage.sort{a, b -> a.spieldatum <=> b.spieldatum}}" var="vorschau" status="i">
		<span style="position: relative; display: block; float: right; margin: 0; border: none; width: 35px; height: 14px; overflow: hidden;">
			${vorschau.anstoss}
		</span>
		<g:if test="${i > 0}">
			<br/>
		</g:if>
		<b><g:formatDate date="${vorschau.spieldatum}" format="dd.MM.yyyy"/></b>:&nbsp;${vorschau.heimmannschaft}&nbsp;-&nbsp;${vorschau.gastmannschaft}&nbsp;&gt;&nbsp;${vorschau?.anstoss}
	</g:each>
</g:if>
<g:else>
	<g:message code="abteilung.no.upcoming.matches"/>
</g:else>