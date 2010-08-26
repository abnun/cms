<%@ page import="de.webmpuls.cms.section.AbteilungHelper" %>
<div class="rubrik" id="jufujungs" style="position:absolute; visibility:hidden; width:120px; height:115px; z-index:14; left: 330px; top: 121px;">
	<table width="120" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
		<g:each var="${abteilung}" status="i" in="${jufujungs}">
			<g:render template="/global/section/menu/fussball_-_jugend_m_menu_entry" model="[i: i, abteilung: abteilung]" />
		</g:each>
	</table>
</div>