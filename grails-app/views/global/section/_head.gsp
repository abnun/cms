<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<div class="box" id="identifier" style="width: 130px; float: left;">
	<div class="hd">
		<div class="c">
			<g:message code="section.head.label" args="[section]" default="Abteilunsleiter" />
		</div>
	</div>
	<div class="bd">
		<div class="c">
			<g:if test="${head.bild}">
				<a href="mailto:${head.email}"><img  style="margin-bottom: 5px;" width="110" border="0" src="${wm_photo_album.pathToImage(picture: head.bild)}"/></a><br/>
			</g:if>
				<span class="copy">${head.vorname}&nbsp;${head.nachname}</span>
			<g:if test="${head.adresseAnzeigen}">
				<g:if test="${head.telefon1}">
					${head.telefon1}<br/>
				</g:if>
				<g:if test="${head.telefon2}">
					${head.telefon2}<br/>
				</g:if>
				<a href="mailto:${head.email}">E-Mail</a>
			</g:if>
			<shiro:hasRole name="${ShiroRole.BENUTZER}">
				<span>
					<g:link controller="person" action="edit" id="${head.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Mitglied ändern" title="Mitglied ändern" border="0"/></g:link>
				</span>
			</shiro:hasRole>
		</div>
	</div>
	<!--<div class="sp">
		<div class="c">
			&nbsp;
		</div>
	</div>-->
	<div class="ft">
		<div class="c">
			&nbsp;
		</div>
	</div>
</div>