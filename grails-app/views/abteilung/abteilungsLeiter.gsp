<%@ page contentType="text/html;charset=UTF-8" %>
<g:each var="abteilungsLeiter" in="${abteilungsLeiterCollection}">
	<p>
		<abteilungns:abteilungsLeiter head="${abteilungsLeiter}" section="${abteilungInstance}"/>
	</p>
</g:each>