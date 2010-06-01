<%@ page contentType="text/html;charset=UTF-8" %>
<g:each var="trainingszeit" in="${trainingszeiten}">
	<p>
		<abteilungns:trainingszeiten trainingszeit="${trainingszeit}" section="${abteilungInstance}"/>
	</p>
</g:each>