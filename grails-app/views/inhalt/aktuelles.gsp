<%@ page import="de.webmpuls.cms.section.Abteilung" %>
<html>
<head>
	<meta name="layout" content="sv_leingarten"/>
</head>
<body>
<table width="614" border="0" cellpadding="0" cellspacing="0">
        <tr align="left" valign="top">
          <td height="227"><!-- InstanceBeginEditable name="Text" -->
          <table width="570" border="0" align="left" cellspacing="10">
			<tr>
				<td width="270" valign="top" class="copy">
					<!--<p class="headline"><a href="../bilder/aktuell/Plakat_Winterfeier_2009_web.pdf" target="_blank"><img src="../bilder/aktuell/Winterfeier_09.jpg" width="270" height="399" border="0"></a></p>
					<p class="headline">&nbsp;</p>-->
					<p class="headline">Vorbildlich in Sachen gesunder Sport</p>
					<p align="left" class="copy"><a href="../sites/abteilungen/turnen_pg.htm"><img src="${resource(dir: 'bilder/aktuell', file: 'ppg_logo.gif')}" width="75" height="69" border="0"></a>Der
					Sportverein Leingarten wurde zum wiederholten Male mit dem
						<span class="wichtig">Pr&auml;dikat &#8222;Pluspunkt Gesundheit&#8220;</span>
						f&uuml;r hervorragende Leistungen im Gesundheitssport vom
					Deutschen Turnerbund ausgezeichnet. Gleichzeitig wurde dem
					Verein das G&uuml;tesiegel<span class="wichtig">&#8222;Sport
					pro Gesundheit&#8220;</span> verliehen, das der Deutsche Sportbund
					in Zusammenarbeit mit der Bundes&auml;rztekammer f&uuml;r
					gesundheitsorientierte Sportangebote vergibt.<br>
					</p>
					<p align="left" class="copy"><a href="../sites/abteilungen/turnen.htm">&gt;
					Mehr Infos dazu hier</a></p>
					<p><br>
					</p>
					<table width="270" border="0" cellspacing="0" cellpadding="2">
						<tr>
							<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_hblau.jpg')}" class="headline_dunkel">SVL
							Anzeigenmarkt</td>
						</tr>
					</table>
					<g:if test="${anzeigenList}">
						<table width="27" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFCC">
							<tr>
								<td class="copy"><br>
									<g:each status="i" var="anzeige" in="${anzeigenList}">
										<jq:jquery>
											$("#anzeige_open_${i}").click(function () {
												$("#anzeige_inhalt_${i}").slideToggle("normal");
												$("#anzeige_open_${i}").toggle();
												$("#anzeige_close_${i}").toggle();
											  });
											$("#anzeige_close_${i}").click(function () {
												$("#anzeige_inhalt_${i}").slideToggle("normal");
												$("#anzeige_close_${i}").toggle();
												$("#anzeige_open_${i}").toggle();
											  });
										</jq:jquery>
										<table width="270" height="40" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td width="26" valign="top"><a id="anzeige_open_${i}" href="javascript: void(0);"><img id="anzeige_arrow_right_${i}" src="${resource(dir: 'bilder/divers', file: 'arrow_right.jpg')}" width="18" height="14" border="0" /></a><a id="anzeige_close_${i}" href="javascript: void(0);" style="display: none;"><img id="anzeige_arrow_down_${i}" src="${resource(dir: 'bilder/divers', file: 'arrow_down.jpg')}" width="18" height="14" border="0" /></a></td>
												<td valign="top"><p><span class="copy">${anzeige.ueberschrift1 ?: anzeige.abteilung?.name}</span><span class="wichtig"><br>
												</span><span class="subline">${anzeige.ueberschrift2}</span><span class="headline_dunkel"><br>
												</span></p></td>
											</tr>
											<!--<tr>
												<td valign="top">&nbsp;</td>
												<td valign="top" class="copy">&nbsp;</td>
											</tr>-->
											<tr>
												<td valign="top" style="line-height: 0;">&nbsp;</td>
												<td width="294" valign="top" class="copy">
													<span id="anzeige_inhalt_${i}" style="display: none;">${anzeige.inhalt}</span>
												</td>
											</tr>
											<tr>
												<td height="5" colspan="2"><div align="left"><img src="${resource(dir: 'bilder/divers', file: 'linie_grau.png')}" width="270" height="3"></div></td>
											</tr>
										</table>
									</g:each>
								</td>
							</tr>
						</table>
					</g:if>
					<g:else>
						Derzeit sind keine Anzeigen vorhanden.
					</g:else>
					<p>&nbsp;</p>
				</td>
				<td width="270" valign="top" class="headline_dunkel">
					<table width="270" border="0" cellspacing="0" cellpadding="2">
						<tr>
							<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_dblau.jpg')}" class="headline_dunkel"><font color="#FFFFFF">Newsticker</font></td>
						</tr>
					</table>
						<table border="0" cellspacing="0" class="copy">
							<tr valign="middle">
								<td height="10" colspan="3"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="270" height="3"></td>
							</tr>
							<g:if test="${newsList}">
								<g:each status="i" var="news" in="${newsList}">
									<tr>
										<td valign="top"><link:abteilungShow name="${news.abteilung?.name}"><img src="${resource(dir: 'bilder/aktuell', file: 'p_' + news.abteilung.code + '.gif')}" width="32" height="32" border="0"></link:abteilungShow></td>
										<td valign="top">&nbsp;</td>
										<td height="25" valign="top"><link:abteilungShow name="${news.abteilung?.name}">${news.ueberschrift ?: news.abteilung?.name}</link:abteilungShow><br><span class="copy">${news.inhalt}</span></td>
									</tr>
									<tr valign="middle">
										<td height="10" colspan="3"><img src="${resource(dir: 'bilder/divers', file: 'linie_grau.png')}" width="270" height="3"></td>
									</tr>
								</g:each>
							</g:if>
							<g:else>
								<tr>
									<td valign="top">
										Derzeit sind keine News vorhanden.
									</td>
								</tr>
							</g:else>
							<tr>
								<td height="25" colspan="3" valign="top"><p>&nbsp;</p>
									<table width="270" border="0" cellspacing="0" cellpadding="2">
										<tr>
											<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_hblau.jpg')}" class="headline_dunkel">SVL
											Terminvorschau</td>
										</tr>
									</table></td>
							</tr>
						</table>

					<table width="270" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="90" class="headline_dunkel">&nbsp;</td>
							<td class="headline_dunkel"><span class="wichtig"></span></td>
						</tr>
						<tr valign="top" class="copy">
							<td colspan="2" bgcolor="d2dfff" class="wichtig">November</td>
						</tr>
						<tr valign="top" class="copy">
							<td height="30" class="copy">21. November</td>
							<td height="30"><span class="wichtig">SVL-Winterfeier</span><span class="copy">
							</span></td>
						</tr>
						<tr valign="top" class="copy">
							<td colspan="2" bgcolor="d2dfff" class="wichtig">Dezember</td>
						</tr>
						<tr valign="top" class="copy">
							<td width="90" height="30" class="copy"><s>13. Dezember</s></td>
							<td height="30"><span class="wichtig"><s>SVL-Jugendwinterfeier</s><br>
							</span><span class="copy">(f&auml;llt aus)</span></td>
						</tr>
						<tr valign="top" class="copy">
							<td width="90" height="20">&nbsp;</td>
							<td height="20">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td valign="top" class="copy"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="270" height="10"></td>
				<td valign="top"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="270" height="10"></td>
			</tr>
		</table>
            <!-- InstanceEndEditable --></td>
          <td width="130"><!-- InstanceBeginEditable name="info" -->
			  <table width="270" border="0" cellspacing="10">
				  <tr>
					  <td><a href="../sites/abteilungen/turnen_pg.htm"><img src="${resource(dir: 'bilder/aktuell', file: 'ppg_logo.gif')}" width="75" height="69" border="0"></a></td>
					  <td><p><span class="subline">Unser Pluspunkt!</span><span class="headline"><br>
					  </span><span class="copy">Wir bieten regelm&auml;&szlig;ig
					  zertifizierte Kurse an. Schauen Sie doch mal rein.</span></p>
						  <p class="copy"><a href="../sites/abteilungen/turnen_pg.htm">&gt;
						  Kurse Pluspunkt Gesundheit</a></p></td>
				  </tr>
				  <tr>
					  <td colspan="2">&nbsp;</td>
				  </tr>
				  <tr>
					  <td><img src="${resource(dir: 'bilder/aktuell', file: 'Titel-2009.jpg')}" width="75" height="106"></td>
					  <td class="copy"><p><span class="subline">SVL Aktuell 2009</span><br>
						  Holt Euch das kostenlose Vereinsheft mit Infos zu allen Abteilungen
						  und vergangenen Veranstaltungen in der<br>
						  SVL-Gesch&auml;ftsstelle ab!</p>
						  <p><a href="../sites/impressum.htm">&gt; Adresse Gesch&auml;ftsstelle</a></p></td>
				  </tr>
				  <tr>
					  <td colspan="2"><span class="headline"></span></td>
				  </tr>
				  <tr>
					  <td><a href="../bilder/aktuell/auf_einen_blick.pdf" target="_blank"><img src="${resource(dir: 'bilder/aktuell', file: 'auf_einen_blick.jpg')}" width="75" height="105" border="1"></a></td>
					  <td><p><span class="subline">SVL Adressliste</span><span class="headline"><br>
					  </span><span class="copy">Alle Adressen und Telefonnummern
					  der Abteilungsleiter und Vorst&auml;nde auf einen Blick.</span></p>
						  <p class="copy"><a href="../downloads/SVL_Adressliste.xls">&gt;
						  SVL_Adressliste.xls (100 KB)</a><br>
							  <font color="#999999"><em>(Stand 05/2009)</em></font></p></td>
				  </tr>
				  <tr>
					  <td colspan="2"><span class="headline"></span></td>
				  </tr>
				  <tr>
					  <td colspan="2"><table width="275" cellpadding="0" cellspacing="0">
						  <tr>
							  <td colspan="3" class="headline_dunkel"><span class="subline">&Ouml;ffnunszeiten
							  der Eichbotthalle <br>
								  in den Ferien</span><span class="headline_dunkel"><br>
							  </span></td>
						  </tr>
						  <tr valign="top" class="copy">
							  <td width="73">Osterferien</td>
							  <td width="22">&gt;<br></td>
							  <td width="180" class="copy">geschlossen</td>
						  </tr>
						  <tr valign="top" class="copy">
							  <td bgcolor="d2dfff">Pfingsferien</td>
							  <td bgcolor="d2dfff">&gt;<br></td>
							  <td bgcolor="d2dfff" class="copy">geschlossen</td>
						  </tr>
						  <tr valign="top" class="copy">
							  <td>Sommerferien</td>
							  <td>&gt;<br></td>
							  <td class="copy">geschlossen <br>
								  (ab letzte 2 Wochen offen)</td>
						  </tr>
						  <tr valign="top" class="copy">
							  <td bgcolor="d2dfff">Herbsferien</td>
							  <td bgcolor="d2dfff">&gt;<br></td>
							  <td bgcolor="d2dfff" class="copy">offen</td>
						  </tr>
						  <tr valign="top" class="copy">
							  <td>Winterferien</td>
							  <td>&gt;<br></td>
							  <td class="copy">geschlossen</td>
						  </tr>
						  <tr>
							  <td colspan="3" class="wichtig">&nbsp;</td>
						  </tr>
					  </table>
						  <p>&nbsp;</p></td>
				  </tr>
			  </table>
			  <p>&nbsp;</p>
            <!-- InstanceEndEditable --></td>
        </tr>
      </table>

 </body>
</html>