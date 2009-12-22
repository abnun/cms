<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<jq:jquery>
	$("#sponsor_del_${sponsor?.id}").click(function () {
		if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
		{
			$.post("${createLink(controller: 'sponsor', action: 'delete', id: sponsor?.id)}");
			location.reload();
		}
	});
</jq:jquery>
<table cellspacing="0">
	<tr>
		<td>
			<g:if test="${sponsor?.bild}">
				<img height="80" width="170" border="1" src="${wm_photo_album.pathToImage(picture: sponsor?.bild)}"/>
			</g:if>
			<g:else>
				&nbsp;
			</g:else>
		</td>
	</tr>
	<tr>
		<td>
			<div align="center" class="copy" id="sponsor">
				<g:if test="${sponsor.name}">
					${sponsor?.name}
				</g:if>
				<g:if test="${sponsor?.beschreibung}">
					${sponsor?.beschreibung}
				</g:if>
				<g:if test="${sponsor?.verlinkung}">
					<a target="_blank" href="http://${sponsor?.verlinkung}">${sponsor?.verlinkung}</a><br/>
				</g:if>
				<shiro:hasRole name="${ShiroRole.BENUTZER}">
					<span>
						<g:link controller="sponsor" action="edit" id="${sponsor.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Sponsor ändern" title="Sponsor ändern" border="0"/></g:link>
						<a href="javascript: void(0);" id="sponsor_del_${sponsor.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Sponsor löschen" title="Sponsor löschen" border="0"/></a>
					</span>
				</shiro:hasRole>
				<br/>
				<br/>
				<br/>
			</div>
		</td>
	</tr>
</table>