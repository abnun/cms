<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<div style="${Boolean.valueOf(isAbteilung) ? '' : 'border-bottom: 1px solid #1760a8'}">
	<h3>
		<a href="javascript: void(0);">
			<g:render template="/global/ui/accordionHeader" model="[isAbteilung: isAbteilung, accordionTabUeberschrift1: accordionTabUeberschrift1, accordionTabUeberschrift2: accordionTabUeberschrift2]" />
		</a>
	</h3>

	<g:if test="${Boolean.valueOf(isAbteilung)}">
		<div style="margin-left: 30px;">
	</g:if>
	<g:else>
		<div style="width: 270px;">	
	</g:else>
		<g:if test="${isEditable}">

			<shiro:hasRole name="${ShiroRole.BENUTZER}">
				<span>
					<g:link controller="${itemName}" action="edit" id="${item.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="ändern" title="ändern" border="0"/></g:link>
					<a href="javascript: void(0);" id="${itemName}_del_${item.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="löschen" title="löschen" border="0"/></a>
				</span>
				<br />
			</shiro:hasRole>
		</g:if>
		<span>
			${text}
		</span>
	</div>
</div>