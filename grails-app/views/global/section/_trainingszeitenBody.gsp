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
	</span>
</shiro:hasRole>
<p class="copy"></p>