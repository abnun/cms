<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${infoBoxen}">

	<g:each var="infoBox" in="${infoBoxen}">
		<div class="box" id="identifier" style="width: 130px; margin-top: 20px; margin-left: 10px; float: left;">

			<g:render template="/global/ui/box/boxHeader" model="[header: infoBox.ueberschrift]"/>

			<g:render template="/global/ui/box/boxBody" model="[body: infoBox.inhalt]"/>

			<g:render template="/global/ui/box/boxFooter"/>
		</div>
	</g:each>

</g:if>