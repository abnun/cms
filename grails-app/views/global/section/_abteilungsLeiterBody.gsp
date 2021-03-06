<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<g:if test="${head.bild}">
	<a href="mailto:${head.email}"><img style="margin-bottom: 5px;" width="110" border="0" src="${wm_photo_album.pathToImage(picture: head.bild)}"/></a><br/>
</g:if>
<span class="copy">${head.vorname}&nbsp;${head.nachname}</span><br/>
<g:if test="${head.adresseAnzeigen}">
	<g:if test="${head.telefon1}">
		<span class="copy">${head.telefon1}</span><br/>
	</g:if>
	<g:if test="${head.telefon2}">
		<span class="copy">${head.telefon2}</span><br/>
	</g:if>
	<a href="mailto:${head.email}"><span class="copy">E-Mail</span></a>
</g:if>
<shiro:hasRole name="${ShiroRole.BENUTZER}">
	<span>
		<g:link controller="person" action="edit" id="${head.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Mitglied ändern" title="Mitglied ändern" border="0"/></g:link>
	</span>
</shiro:hasRole>