<%@ page import="de.webmpuls.cms.section.AbteilungHelper" %>
<div class="rubrik" id="jufukids" style="position:absolute; visibility:hidden; width:90px; height:115px; z-index:14; left: 225px; top: 121px;">
	<table width="90" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
		<g:each var="${abteilung}" status="i" in="${jufukids}">
			<g:render template="/global/section/menu/fussball_-_jugend_m_w_menu_entry" model="[i: i, abteilung: abteilung]" /> 
		</g:each>
	</table>
</div>