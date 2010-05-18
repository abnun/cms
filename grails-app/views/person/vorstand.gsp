<%@ page import="de.webmpuls.cms.people.Person; de.webmpuls.cms.people.Funktion" %>
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
					<td width="134" align="center" valign="middle">
						<g:if test="${vorsitzender1Person}">
							<g:if test="${vorsitzender1Person.bild}">
								<p>
									<a href="mailto:${vorsitzender1Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: vorsitzender1Person.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${vorsitzender2Person}">
							<g:if test="${vorsitzender2Person.bild}">
								<p>
									<a href="mailto:${vorsitzender2Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: vorsitzender2Person.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${vorsitzender3Person}">
							<g:if test="${vorsitzender3Person.bild}">
								<p>
									<a href="mailto:${vorsitzender3Person.email}">
										<img src="${wm_photo_album.pathToImage(picture: vorsitzender3Person.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${kassiererPerson}">
							<g:if test="${kassiererPerson.bild}">
								<p>
									<a href="mailto:${kassiererPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: kassiererPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
				</tr>
				<tr valign="top">
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
						<g:if test="${schriftfuehrerPerson}">
							<g:if test="${schriftfuehrerPerson.bild}">
								<p>
									<a href="mailto:${schriftfuehrerPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: schriftfuehrerPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${geschaeftsstellePerson1}">
							<g:if test="${geschaeftsstellePerson1.bild}">
								<p>
									<a href="mailto:${geschaeftsstellePerson1.email}">
										<img src="${wm_photo_album.pathToImage(picture: geschaeftsstellePerson1.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${geschaeftsstellePerson2}">
							<g:if test="${geschaeftsstellePerson2.bild}">
								<p>
									<a href="mailto:${geschaeftsstellePerson2.email}">
										<img src="${wm_photo_album.pathToImage(picture: geschaeftsstellePerson2.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${referentPerson}">
							<g:if test="${referentPerson.bild}">
								<p>
									<a href="mailto:${referentPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: referentPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
				</tr>
				<tr valign="top">
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
						<g:if test="${frauenbeauftragterPerson}">
							<g:if test="${frauenbeauftragterPerson.bild}">
								<p>
									<a href="mailto:${frauenbeauftragterPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: frauenbeauftragterPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${jugendleiterPerson}">
							<g:if test="${jugendleiterPerson.bild}">
								<p>
									<a href="mailto:${jugendleiterPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: jugendleiterPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${jugendsprecherPerson}">
							<g:if test="${jugendsprecherPerson.bild}">
								<p>
									<a href="mailto:${jugendsprecherPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: jugendsprecherPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${leiter_tech_wirtPerson}">
							<g:if test="${leiter_tech_wirtPerson.bild}">
								<p>
									<a href="mailto:${leiter_tech_wirtPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: leiter_tech_wirtPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
				</tr>
				<tr valign="top">
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
						<g:if test="${leiter_tech_sportPerson}">
							<g:if test="${leiter_tech_sportPerson.bild}">
								<p>
									<a href="mailto:${leiter_tech_sportPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: leiter_tech_sportPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${beisitzerPerson}">
							<g:if test="${beisitzerPerson.bild}">
								<p>
									<a href="mailto:${beisitzerPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: beisitzerPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
						<g:if test="${webmasterPerson}">
							<g:if test="${webmasterPerson.bild}">
								<p>
									<a href="mailto:${webmasterPerson.email}">
										<img src="${wm_photo_album.pathToImage(picture: webmasterPerson.bild)}" width="110" height="147" border="0"/>
									</a>
								</p>
							</g:if>
							<g:else>
								<p align="center" class="unwichtig">
									Bild folgt
								</p>
							</g:else>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
					</td>
				</tr>
				<tr valign="top">
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
						<g:if test="${beisitzerPerson}">
							<div align="center">
								<span class="titel">
									${beisitzer}
								</span>
								<br/>
								<span class="copy">
									${beisitzerPerson?.vorname} ${beisitzerPerson?.nachname}
								</span>
							</div>
						</g:if>
					</td>
					<td width="134" align="center" valign="middle">
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
					<td width="134" align="center" valign="middle">
						
					</td>
				</tr>

				<tr valign="top">
					<td width="134" align="center" class="copy">
						 
					</td>
					<td width="134" align="center">
						 
					</td>
					<td width="134" align="center">
						 
					</td>
					<td width="134" align="center">
						 
					</td>
				</tr>
				<tr valign="top">
					<td width="134" align="center" class="copy">
						 
					</td>
					<td width="134" align="center">
						 
					</td>
					<td width="134" align="center">
						 
					</td>
					<td width="134" align="center">
						 
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