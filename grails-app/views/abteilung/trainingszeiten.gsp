<%@ page contentType="text/html;charset=UTF-8" %>
<div class="box" id="identifier" style="width: 130px; margin-top: 20px; margin-left: 10px; float: left;">
<g:render template="/global/ui/box/boxHeader" model="[header: 'Trainingszeiten']" />
<g:each var="trainingszeit" in="${trainingszeiten}">
	<abteilungns:trainingszeiten trainingszeit="${trainingszeit}" section="${abteilungInstance}"/>
</g:each>

<g:render template="/global/ui/box/boxFooter" />
</div>