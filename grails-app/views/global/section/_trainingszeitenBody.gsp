<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<g:each status="i" in="${trainingszeit.trainingstage.sort{a, b -> a.tag <=> b.tag}}" var="trainingstag">
	<g:if test="${i > 0}">
		<p class="copy"></p>
	</g:if>
	<span class="copy">${trainingstag.tag}</span><br/>
	<span class="copy">${trainingstag.uhrzeiten}</span>
	<shiro:hasRole name="${ShiroRole.BENUTZER}">
		<span>
			<g:link controller="trainingstag" action="edit" id="${trainingstag.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Trainingszeiten ändern" title="Trainingszeiten ändern" border="0"/></g:link>
		</span>
	</shiro:hasRole>
</g:each>
<span class="copy">${trainingszeit.ort}</span>