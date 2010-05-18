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
				</tr>
				<tr valign="top">
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