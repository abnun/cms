<div class="box" id="identifier" style="width: 100px; float: left;">
	<div class="hd">
		<div class="c">
			<g:message code="section.head.label" args="[section]" default="Abteilunsleiter" />
		</div>
	</div>
	<div class="bd">
		<div class="c">
			<a href="mailto:${head.email}"><img width="110" height="155" border="0" src="${head.bild}"/></a><br/>
				${head.vorname}&nbsp;${head.nachname}<br/>
			<g:if test="${head.adresseAnzeigen}">
				<g:if test="${head.telefon1}">
					${head.telefon1}<br/>
				</g:if>
				<g:if test="${head.telefon2}">
					${head.telefon2}<br/>
				</g:if>
				<a href="mailto:${head.email}">E-Mail</a>
			</g:if>
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