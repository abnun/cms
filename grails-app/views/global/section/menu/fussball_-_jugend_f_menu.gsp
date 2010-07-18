<%@ page import="de.webmpuls.cms.section.AbteilungHelper" %>
<div class="rubrik" id="jufugirls" style="position:absolute; visibility:hidden; width:90px; height:115px; z-index:15; top: 121px; left: 380px;">
	<table width="130" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
		<g:each var="${abteilung}" status="i" in="${jufugirls}">
			<g:render template="/global/section/menu/fussball_-_jugend_f_menu_entry" model="[i: i, abteilung: abteilung]" /> 
		</g:each>
	</table>
</div>