<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<div>
	<h3>
		<a href="javascript: void(0);">
			<g:render template="/global/ui/accordionHeaderAbteilung" model="[accordionTabUeberschrift1: accordionTabUeberschrift1, accordionTabUeberschrift2: accordionTabUeberschrift2, datum: datum]"/>
		</a>
	</h3>
	<div>
		<g:if test="${isEditable}">

			<shiro:hasRole name="${ShiroRole.BENUTZER}">
				<span>
					<g:link controller="${itemName}" action="edit" id="${item.id}" params="${params}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="ändern" title="ändern" border="0"/></g:link>
					<a href="javascript: void(0);" id="${itemName}_del_${item.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="löschen" title="löschen" border="0"/></a>
				</span>
				<br/>
			</shiro:hasRole>
		</g:if>
		<span>
			<g:if test="${!bild}">
				<span style="margin-left: 34; width: 130px; min-width: 130px; max-width: 130px; float: right;">
					<table width="130" border="0" cellpadding="3" bordercolor="#93C9FF">
						<tr>
							<td height="130" colspan="2" bgcolor="#999999" class="infohead">${bild}</td>
						</tr>
						<tr>
							<td valign="bottom" bordercolor="#999999" class="copy"><p>Bild
							1 von 2</p></td>
							<td valign="bottom" bordercolor="#999999" class="copy"><div align="right"><img src="${resource(dir: 'bilder/divers', file: 'icon_zoom.jpg')}" width="16" height="16"></div></td>
						</tr>
					</table>
				</span>
			</g:if>
			${text}
		</span>
	</div>
</div>
