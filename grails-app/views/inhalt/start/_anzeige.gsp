<%@ page import="de.webmpuls.cms.people.ShiroRole" %>

<shiro:hasRole name="${ShiroRole.BENUTZER}">
	<jq:jquery>
		$("#anzeige_del_${anzeige.id}").click(function () {
			if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
			{
				$.post("${createLink(controller: 'anzeigen', action: 'delete', id: anzeige.id)}");
				location.reload();
			}
		});
	</jq:jquery>
</shiro:hasRole>
<div>
	<h3>
		<a href="javascript: void(0);">
			<span class="copy">${anzeige.ueberschrift1 ?: anzeige.abteilung?.name}</span>
			<span class="wichtig"><br></span>
			<span class="subline">
				${anzeige.ueberschrift2}
			</span>
		</a>
	</h3>
	<div>
		<shiro:hasRole name="${ShiroRole.BENUTZER}">
			<span>
				<g:link controller="anzeigen" action="edit" id="${anzeige.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Anzeige ändern" title="Anzeige ändern" border="0"/></g:link>
				<a href="javascript: void(0);" id="anzeige_del_${anzeige.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Anzeige löschen" title="Anzeige löschen" border="0"/></a>
			</span>
		</shiro:hasRole>
		<span>
			${anzeige.inhalt}
		</span>
	</div>
</div>