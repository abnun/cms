<%@ page import="de.webmpuls.photo_album.util.MediaUtils; de.webmpuls.cms.people.ShiroRole; de.webmpuls.cms.people.Person; de.webmpuls.cms.people.Funktion" %>
<html>
<head>
	<meta name="layout" content="sv_leingarten"/>
</head>
<table width="614" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr align="left" valign="top">
		<td width="520" height="227">
			<table width="570" border="0" cellspacing="5">
				<tbody>
				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${vorsitzender1Person}">
							<g:if test="${vorsitzender1Person.bild}">
								<p>
									<a href="mailto:${vorsitzender1Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: vorsitzender1Person.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${vorsitzender1Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${vorsitzender1Person.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${vorsitzender1Person.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${vorsitzender1Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${vorsitzender1Person.id}" name="PersonDeleteForm_${vorsitzender1Person.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${vorsitzender2Person}">
							<g:if test="${vorsitzender2Person.bild}">
								<p>
									<a href="mailto:${vorsitzender2Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: vorsitzender2Person.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${vorsitzender2Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${vorsitzender2Person.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${vorsitzender2Person.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${vorsitzender2Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${vorsitzender2Person.id}" name="PersonDeleteForm_${vorsitzender2Person.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${vorsitzender3Person}">
							<g:if test="${vorsitzender3Person.bild}">
								<p>
									<a href="mailto:${vorsitzender3Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: vorsitzender3Person.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${vorsitzender3Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${vorsitzender3Person.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${vorsitzender3Person.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${vorsitzender3Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${vorsitzender3Person.id}" name="PersonDeleteForm_${vorsitzender3Person.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${kassiererPerson}">
							<g:if test="${kassiererPerson.bild}">
								<p>
									<a href="mailto:${kassiererPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: kassiererPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${kassiererPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${kassiererPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${kassiererPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${kassiererPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${kassiererPerson.id}" name="PersonDeleteForm_${kassiererPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
				</tr>
				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${vorsitzender1Person}">
							<div align="center">
								<span class="titel">
									1. Vorsitzender
								</span>
								<br/>
								<span class="copy">
									${vorsitzender1Person?.vorname} ${vorsitzender1Person?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${vorsitzender2Person}">
							<div align="center">
								<span class="titel">
									2. Vorsitzender
								</span>
								<br/>
								<span class="copy">
									${vorsitzender2Person?.vorname} ${vorsitzender2Person?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${vorsitzender3Person}">
							<div align="center">
								<span class="titel">
									3. Vorsitzender
								</span>
								<br/>
								<span class="copy">
									${vorsitzender3Person?.vorname} ${vorsitzender3Person?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${kassiererPerson}">
							<div align="center">
								<span class="titel">
									Hauptkassierer
								</span>
								<br/>
								<span class="copy">
									${kassiererPerson?.vorname} ${kassiererPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
				</tr>

				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${schriftfuehrerPerson}">
							<g:if test="${schriftfuehrerPerson.bild}">
								<p>
									<a href="mailto:${schriftfuehrerPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: schriftfuehrerPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${schriftfuehrerPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${schriftfuehrerPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${schriftfuehrerPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${schriftfuehrerPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${schriftfuehrerPerson.id}" name="PersonDeleteForm_${schriftfuehrerPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${geschaeftsstellePerson1}">
							<g:if test="${geschaeftsstellePerson1.bild}">
								<p>
									<a href="mailto:${geschaeftsstellePerson1.email}">
										<img src="${wm_photo_album.pathToImage(picture: geschaeftsstellePerson1.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${geschaeftsstellePerson1.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${geschaeftsstellePerson1.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${geschaeftsstellePerson1.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${geschaeftsstellePerson1.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${geschaeftsstellePerson1.id}" name="PersonDeleteForm_${geschaeftsstellePerson1.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${geschaeftsstellePerson2}">
							<g:if test="${geschaeftsstellePerson2.bild}">
								<p>
									<a href="mailto:${geschaeftsstellePerson2.email}">
										<img src="${wm_photo_album.pathToImage(picture: geschaeftsstellePerson2.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${geschaeftsstellePerson2.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${geschaeftsstellePerson2.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${geschaeftsstellePerson2.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${geschaeftsstellePerson2.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${geschaeftsstellePerson2.id}" name="PersonDeleteForm_${geschaeftsstellePerson2.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${referentPerson}">
							<g:if test="${referentPerson.bild}">
								<p>
									<a href="mailto:${referentPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: referentPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${referentPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${referentPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${referentPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${referentPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${referentPerson.id}" name="PersonDeleteForm_${referentPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
				</tr>
				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${schriftfuehrerPerson}">
							<div align="center">
								<span class="titel">
									${schriftfuehrer}
								</span>
								<br/>
								<span class="copy">
									${schriftfuehrerPerson?.vorname} ${schriftfuehrerPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${geschaeftsstellePerson1}">
							<div align="center">
								<span class="titel">
									${geschaeftsstelle}
								</span>
								<br/>
								<span class="copy">
									${geschaeftsstellePerson1?.vorname} ${geschaeftsstellePerson1?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${geschaeftsstellePerson2}">
							<div align="center">
								<span class="titel">
									${geschaeftsstelle}
								</span>
								<br/>
								<span class="copy">
									${geschaeftsstellePerson2?.vorname} ${geschaeftsstellePerson2?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${referentPerson}">
							<div align="center">
								<span class="titel">
									${referent}
								</span>
								<br/>
								<span class="copy">
									${referentPerson?.vorname} ${referentPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
				</tr>

				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${frauenbeauftragterPerson}">
							<g:if test="${frauenbeauftragterPerson.bild}">
								<p>
									<a href="mailto:${frauenbeauftragterPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: frauenbeauftragterPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${frauenbeauftragterPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${frauenbeauftragterPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${frauenbeauftragterPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${frauenbeauftragterPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${frauenbeauftragterPerson.id}" name="PersonDeleteForm_${frauenbeauftragterPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${jugendleiterPerson}">
							<g:if test="${jugendleiterPerson.bild}">
								<p>
									<a href="mailto:${jugendleiterPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: jugendleiterPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${jugendleiterPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${jugendleiterPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${jugendleiterPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${jugendleiterPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${jugendleiterPerson.id}" name="PersonDeleteForm_${jugendleiterPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${jugendsprecherPerson}">
							<g:if test="${jugendsprecherPerson.bild}">
								<p>
									<a href="mailto:${jugendsprecherPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: jugendsprecherPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${jugendsprecherPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${jugendsprecherPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${jugendsprecherPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${jugendsprecherPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${jugendsprecherPerson.id}" name="PersonDeleteForm_${jugendsprecherPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${leiter_tech_wirtPerson}">
							<g:if test="${leiter_tech_wirtPerson.bild}">
								<p>
									<a href="mailto:${leiter_tech_wirtPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: leiter_tech_wirtPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${leiter_tech_wirtPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${leiter_tech_wirtPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${leiter_tech_wirtPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${leiter_tech_wirtPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${leiter_tech_wirtPerson.id}" name="PersonDeleteForm_${leiter_tech_wirtPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
				</tr>
				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${frauenbeauftragterPerson}">
							<div align="center">
								<span class="titel">
									${frauenbeauftragter}
								</span>
								<br/>
								<span class="copy">
									${frauenbeauftragterPerson?.vorname} ${frauenbeauftragterPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${jugendleiterPerson}">
							<div align="center">
								<span class="titel">
									${jugendleiter}
								</span>
								<br/>
								<span class="copy">
									${jugendleiterPerson?.vorname} ${jugendleiterPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${jugendsprecherPerson}">
							<div align="center">
								<span class="titel">
									${jugendsprecher}
								</span>
								<br/>
								<span class="copy">
									${jugendsprecherPerson?.vorname} ${jugendsprecherPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${leiter_tech_wirtPerson}">
							<div align="center">
								<span class="titel">
									${leiter_tech_wirt}
								</span>
								<br/>
								<span class="copy">
									${leiter_tech_wirtPerson?.vorname} ${leiter_tech_wirtPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
				</tr>

				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${leiter_tech_sportPerson}">
							<g:if test="${leiter_tech_sportPerson.bild}">
								<p>
									<a href="mailto:${leiter_tech_sportPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: leiter_tech_sportPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${leiter_tech_sportPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${leiter_tech_sportPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${leiter_tech_sportPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${leiter_tech_sportPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${leiter_tech_sportPerson.id}" name="PersonDeleteForm_${leiter_tech_sportPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${beisitzer1Person}">
							<g:if test="${beisitzer1Person.bild}">
								<p>
									<a href="mailto:${beisitzer1Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: beisitzer1Person.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${beisitzer1Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${beisitzer1Person.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${beisitzer1Person.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${beisitzer1Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${beisitzer1Person.id}" name="PersonDeleteForm_${beisitzer1Person.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${beisitzer2Person}">
							<g:if test="${beisitzer2Person.bild}">
								<p>
									<a href="mailto:${beisitzer2Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: beisitzer2Person.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">

									<g:link controller="person" action="edit" id="${beisitzer2Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${beisitzer2Person.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${beisitzer2Person.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${beisitzer2Person.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${beisitzer2Person.id}" name="PersonDeleteForm_${beisitzer2Person.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${webmasterPerson}">
							<g:if test="${webmasterPerson.bild}">
								<p>
									<a href="mailto:${webmasterPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: webmasterPerson.bild, size: MediaUtils.THUMBNAIL)}" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
							<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
								
									<g:link controller="person" action="edit" id="${webmasterPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Person ändern" title="Person ändern" border="0"/></g:link>
									<jq:jquery>
										$("#person_del_${webmasterPerson.id}").click(function () {
											if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
											{
												document.forms.PersonDeleteForm_${webmasterPerson.id}.submit();
											}
										});
									</jq:jquery>
									<a href="javascript: void(0);" id="person_del_${webmasterPerson.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Person löschen" title="Person löschen" border="0"/></a>
									<g:form action="delete" controller="person" id="${webmasterPerson.id}" name="PersonDeleteForm_${webmasterPerson.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
							</shiro:hasRole>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
					</td>
				</tr>
				<tr valign="top">
					<td width="140" align="center" valign="middle">
						<g:if test="${leiter_tech_sportPerson}">
							<div align="center">
								<span class="titel">
									${leiter_tech_sport}
								</span>
								<br/>
								<span class="copy">
									${leiter_tech_sportPerson?.vorname} ${leiter_tech_sportPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${beisitzer1Person}">
							<div align="center">
								<span class="titel">
									${beisitzer}
								</span>
								<br/>
								<span class="copy">
									${beisitzer1Person?.vorname} ${beisitzer1Person?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${beisitzer2Person}">
							<div align="center">
								<span class="titel">
									${beisitzer}
								</span>
								<br/>
								<span class="copy">
									${beisitzer2Person?.vorname} ${beisitzer2Person?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						<g:if test="${webmasterPerson}">
							<div align="center">
								<span class="titel">
									${webmaster}
								</span>
								<br/>
								<span class="copy">
									${webmasterPerson?.vorname} ${webmasterPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="140" align="center" valign="middle">
						
					</td>
				</tr>

				<tr valign="top">
					<td width="140" align="center" class="copy">
						 
					</td>
					<td width="140" align="center">
						 
					</td>
					<td width="140" align="center">
						 
					</td>
					<td width="140" align="center">
						 
					</td>
				</tr>
				<tr valign="top">
					<td width="140" align="center" class="copy">
						 
					</td>
					<td width="140" align="center">
						 
					</td>
					<td width="140" align="center">
						 
					</td>
					<td width="140" align="center">
						 
					</td>
				</tr>
				</tbody>
			</table>
		</td>
		<td width="120">
			<table width="120" border="0" cellpadding="3" bordercolor="#93C9FF">
				<tbody>
				<tr>
					<td height="20" bgcolor="#93BEEE" class="infohead">
						PDFs
					</td>
				</tr>
				<tr>
					<td valign="bottom" bgcolor="#D2DFFF" class="copy">
						<p>
							<a href="${resource(dir: 'downloads', file: 'Gesch%E4ftsordnung%202004.PDF')}" target="_blank">
								Geschäftsordnung
							</a>
							<br/>
							<a href="${resource(dir: 'downloads', file: 'SVL%20Satzung.pdf')}" target="_blank">
								SVL
								Satzung
							</a>
							<br/>
							<a href="${resource(dir: 'downloads', file: 'Finanzordnung%202004.PDF')}" target="_blank">
								Finanzordnung
							</a>
							<br/>
							<a href="${resource(dir: 'downloads', file: 'Ehrungsordnung%202004.PDF')}" target="_blank">
								Ehrungsordnung
							</a>
							<br/>
						</p>
					</td>
				</tr>
				</tbody>
			</table>
			<table width="120" border="0" cellpadding="3" bordercolor="#93C9FF">
				<tbody>
				<tr>
					<td height="20" bgcolor="#93BEEE" class="infohead">
						sonstiges
					</td>
				</tr>
				<tr>
					<td valign="bottom" bgcolor="#D2DFFF" class="copy">
						<p>
							<a href="${resource(dir: 'downloads', file: 'SVL_Adressliste.xls')}">
								Adressliste
								Vorstand + Abteilungsleiter
							</a>
							(Excel-Datei)
							<br/>
						</p>
					</td>
				</tr>
				</tbody>
			</table>
		</td>
	</tr>
	</tbody>
</table>

</html>