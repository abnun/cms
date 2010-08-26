<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<b class="copy">${trainingszeit.bezeichnung}</b>
<g:each status="i" in="${trainingszeit.trainingstage.sort{a, b -> a.tag <=> b.tag}}" var="trainingstag">
	<p class="copy"></p>
	<span class="copy">${trainingstag.tag}</span><br/>
	<span class="copy">${trainingstag.uhrzeiten}</span><br/>
	<span class="copy">${trainingstag.ort}</span>
</g:each>
<shiro:hasRole name="${ShiroRole.BENUTZER}">
	<span>
		<g:link controller="trainingszeit" action="edit" id="${trainingszeit.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Trainingszeiten ändern" title="Trainingszeiten ändern" border="0"/></g:link>
		<jq:jquery>
			$("#trainingszeit_del_${trainingszeit?.id}").click(function () {
				if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
				{
					document.forms.TrainingszeitDeleteForm_${trainingszeit?.id}.submit();
				}
			});
		</jq:jquery>
		<a href="javascript: void(0);" id="trainingszeit_del_${trainingszeit?.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Trainingszeiten löschen" title="Trainingszeiten löschen" border="0"/></a>
		<g:form action="delete" controller="trainingszeit" id="${trainingszeit?.id}" name="TrainingszeitDeleteForm_${trainingszeit?.id}" method="post" style="height: 0px; line-height: 0px;">
			<g:hiddenField name="abteilung.id" value="${abteilungInstance.id}" />
		</g:form>
	</span>
</shiro:hasRole>
<p class="copy"></p>