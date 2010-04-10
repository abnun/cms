<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<div>
	<h3>
		<a href="javascript: void(0);">
			<span class="copy">${accordionTabUeberschrift1}</span>
			<span class="wichtig"><br></span>
			<span class="subline">
				${accordionTabUeberschrift2}
			</span>
		</a>
	</h3>
	<div>
		<g:if test="${isEditable}">

			<shiro:hasRole name="${ShiroRole.BENUTZER}">
				<span>
					<g:link controller="${itemName}" action="edit" id="${item.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="ändern" title="ändern" border="0"/></g:link>
					<a href="javascript: void(0);" id="anzeige_del_${item.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="löschen" title="löschen" border="0"/></a>
				</span>
			</shiro:hasRole>
		</g:if>
		<span>
			${text}
		</span>
	</div>
</div>