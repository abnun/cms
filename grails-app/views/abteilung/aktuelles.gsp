<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="sv_leingarten"/>
	<g:set var="entityName" value="${message(code: 'abteilung.label', default: 'Abteilung')}"/>
	<g:render template="/global/javascript/accordionJS" model="[accordionID: 'accordion']"/>
	<g:render template="/global/css/accordionCSS"/>
</head>
<body>

<table width="614" border="0" cellpadding="0" cellspacing="0">
	<tr align="left" valign="top">
		<td height="227"><!-- InstanceBeginEditable name="Text" -->
			<table border="0" align="left" cellspacing="10">
				<tr>
					<td valign="top" class="copy">
						<abteilungns:aktuelleErgebnisse model="[ergebnisse: ergebnisse]"/>
						<p>&nbsp;</p>
					<td valign="top" class="copy">
						<abteilungns:vorschau model="[vorschau: vorschau]"/>
						<p>&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top" class="copy">
						<br>
						<g:if test="${abteilungInstance?.berichte}">
							<div id="accordion">
								<g:each status="i" var="bericht" in="${abteilungInstance?.berichte/*.sort{a, b -> a.ueberschrift <=> b.ueberschrift}*/}">
									<g:render template="/abteilung/bericht" model="['bericht': bericht, 'i': i, 'abteilung': abteilungInstance]"/>
								</g:each>
							</div>
						</g:if>
						<shiro:hasRole name="${ShiroRole.BENUTZER}">
							<br/>
							<span>
								<g:link controller="bericht" action="create" params="[abteilungId: abteilungInstance?.id]">
									<img src="${resource(dir: '/images/skin', file: 'database_add.png')}" alt="Neuer Bericht" border="0"/>&nbsp;Neuer Bericht
								</g:link>
							</span>
						</shiro:hasRole>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top" class="copy">
						<p class="headline">&nbsp;</p>
						<p class="headline">&nbsp;</p>
						<p class="headline">&nbsp;</p>
						<p>&nbsp;</p></td>
				</tr>
			</table>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>
				<script>
					<!--
							  function PopupFenster(jahr) {
									  if (jahr == "310709") {
									window.open("jufu_camp_09.htm", "Popup5", "width=590, height=530, scrollbars" );
									}
									if (jahr == "290309") {
									window.open("jufu_pics_290309.htm", "Popup3", "width=590, height=530, scrollbars" );
									}
									  if (jahr == "040409") {
									window.open("jufu_pics_040409.htm", "Popup4", "width=590, height=530, scrollbars" );
									}
									}
							  -->
				</script>
			</p>
			<table width="570" border="0" cellspacing="10">
				<tr valign="top">
					<td colspan="2" class="headline">1. Fu&szlig;ball-Sommercamp 2009
					des SVL</td>
				</tr>
				<tr valign="top">
					<td width="137" class="copy"><p class="copy">Da blieben die Regenw&uuml;rmer
					am letzten Wochenende lieber unter der Erde. Etwa 250 Beine
					trampelten drei Tage auf dem Hauptplatz des Heuchelbergstadions
					herum. <br>
						Zum ersten Mal veranstaltete die Jugendfu&szlig;ballabteilung
						ein Sommercamp f&uuml;r M&auml;dchen und Jungen der Jahrg&auml;nge
						1995 bis 2002...<br>
						<br>
						&gt; mehr dazu <a href="javascript:PopupFenster(310709)">hier</a></p>
						<p>&gt; <a href="../../bilder/abteilungen/fussball_-_jugend/camp_2009/camp09_ergebnisse.pdf" target="_blank">camp09_ergebnisse.pdf</a></p>
						<p>&nbsp;</p></td>
					<td width="270" class="copy"><a href="javascript:PopupFenster(310709)"><img src="../../bilder/abteilungen/fussball_-_jugend/camp_2009/camp_elfer.jpg" width="275" height="206" border="0"></a></td>
				</tr>
				<tr valign="top">
					<td colspan="2" bgcolor="d2dfff" class="copy"><a href="../../bilder/abteilungen/fussball_-_jugend/jufu_trainingszeiten_auftakt_2009.pdf" target="_blank"><br>
						&gt; Neue Trainingszeiten f&uuml;r die Saison 2009/2010</a><br>
					</td>
				</tr>
				<tr valign="top">
					<td colspan="2" class="copy">&nbsp;</td>
				</tr>
				<tr valign="top">
					<td colspan="2" class="copy">20. Juni 2009<br> <span class="headline">Das
					Geheimnis ist Kontinuit&auml;t und Freude</span></td>
				</tr>
				<tr valign="top">
					<td colspan="2" class="copy"><img src="../../bilder/abteilungen/fussball_-_jugend/jufu_ehrennadel.jpg" width="557" height="318"></td>
				</tr>
				<tr valign="top">
					<td class="copy"><p>Am Samstag 20. Juni 2009 wurde
					das Geheimnis der Jugendfu&szlig;ballabteilung des SV Leingarten
					teilweise gel&uuml;ftet. Die Formel f&uuml;r gute Jugendarbeit
					hei&szlig;t: <br>
						ca. 300 Jugendliche X 54 ehrenamtliche Jugendmitarbeiter+
						Know How = Gute Jugendarbeit.<br>
						Wie jedes Jahr feierte die Jugendfu&szlig;ballabteilung mit
						ca. 115 G&auml;sten ihr Sommerfest, doch dieses Sommerfest
						war diesmal etwas anders. Neben den obligatorischen Grillsteaks
						und Pommes, Salate und sonstigen Leckereien, war ab 16:00
						Uhr zum Spa&szlig; und Spiel und miteinander geladen. Fu&szlig;balltennis,
						Ball aus der Luft, Torschu&szlig; und vieles mehr sorgten
						f&uuml;r jede Menge Spa&szlig;.<br>
						Etwa um 19:30 Uhr bat Jugendleiter Gernot Hagen alle anwesenden
						sich zu versammeln. Zum einen um in seiner Rede die letzten
						4 Jahre Revue passieren zu lassen und zum anderen um den n&ouml;tigen
						Rahmen f&uuml;r die anstehenden Ehrungen zu schaffen.<br>
						Gernot Hagen blickte auf &uuml;berwiegend Gute 4 Jahre als
						Jugendleiter zur&uuml;ck und entlockte mit seinen Worten dem
						ein oder anderen auch ein Tr&auml;nchen der R&uuml;hrung.
						R&uuml;hrung auch, weil er sich bei langj&auml;hrigen Mitarbeitern
						wie Tapio Ferdinand, Gerd Hutter, Horst Weinmann und der wichtigsten
						Person einer Abteilung von Kassierin Ursula Mayer, die 11
						Jahre die Jugendkasse f&uuml;hrte mit einem kleinen Geschenk
						bedankte. Zu jedem verlor er ein paar Worte und f&uuml;hrte
						so auf die anstehenden Ehrungen die durch den DFB Ehrenamtsbeauftragten
						Harald Pfeiffer &uuml;bernommen wurden hin.</p>
						<p>Er dankte auch speziell den Partnern mit den Worten: &#8222;Alles
						was wir tun funktioniert nur weil unsere Partner und unsere
						Kinder uns unterst&uuml;tzen, jeder erbringt viel Freizeit
						und das ehrenamtlich. Daf&uuml;r m&ouml;chte ich Euch heute
						Danke sagen.&#8220;<br>
							Ursula Mayer dankte er f&uuml;r 11 Jahre Kassier und verglich
						Sie mit Sprit f&uuml;r ein Auto, mit den Worten: &#8222; F&uuml;r
						die 11 Jahre kann man Ihr eigentlich nicht genug Danken und
						ich wei&szlig;, dass wir mit Ulla N&ouml;ckler ihrer Nachfolgerin,
						die gleiche Sorte Sprit gefunden haben und unser Auto ohne
						Probleme weiterl&auml;uft.&#8220; &Uuml;bergab er das Kassenzepter
						offiziell an Ulla N&ouml;ckler.<br>
							Im Anschlu&szlig; an die Rede des Jugendleiters wurde zun&auml;chst
						Niklas Werner f&uuml;r seine herausragende sportlich faire
						Tat unter viel Beifall geehrt.</p>
						<p>Dann folgten die Ehrungen f&uuml;r langj&auml;hrigen Einsatz
						in der Jugendarbeit mit der Jugendleiterehrennadel in Bronze
						und Silber. Insgesamt ehrte Harald Pfeiffer 17 langj&auml;hrige
						Jugendmitarbeiter f&uuml;r Ihre Verdienste um den Jugendfu&szlig;ball.
						Die Ehrung in Bronze kann ab 5 Jahren ununterbrochene Arbeit
						in der Jugendabteilung, Silber ab 15 Jahren und Gold ab 25
						Jahren verliehen werden, allerdings muss f&uuml;r Gold mindestens
						Silber &uuml;berreicht worden sein. So wurden 265 Jahre Jugendarbeit
						an diesem sch&ouml;nen Sommerabend geehrt.<br>
							Thomas Werner, der mit seinen 25 Jahren Jugendarbeit eigentlich
							Gold h&auml;tte bekommen sollen, erhielt ebenfalls Silber,
						da er diese Auszeichnung bisher noch nicht erhalten hatte.
						Gold wird Jugendleiter Gernot Hagen dann im n&auml;chsten
						Jahr f&uuml;r ihn beantragen.<br>
							<br>
							Der ehemalige Jugendleiter Erich Feeser meldete sich dann
							zu Wort und Danke im Namen aller Jugendmitarbeiter dem Jugendleiter
							Gernot Hagen f&uuml;r seinen Einsatz und &uuml;berreichte
						ihm einen Gutschein f&uuml;r das Restaurant Surprise mit den
						Worten: &#8222; nehmt Euch mal als Familie Zeit und denkt
						nicht an Fu&szlig;ball&#8220;.<br>
							Es wurde noch bis in die Nacht gefeiert.</p>
						<p>&nbsp;</p></td>
					<td class="copy"><p><img src="../../bilder/abteilungen/fussball_-_jugend/jufu_fair_ist_mehr_Niklas.JPG" width="275" height="336"></p>
						<p><img src="../../bilder/abteilungen/fussball_-_jugend/jufu_jugend-ehrungen_1.jpg" width="275" height="274"></p></td>
				</tr>
				<tr valign="top">
					<td class="copy"><p class="headline">So sieht Respekt
					vor dem Sport und dem Gegner aus!</p>
						<p>F&uuml;r eine absolut vorbildliche und faire Einstellung
						zum Fu&szlig;ballsport hat Niklas Werner E-Juniorenspieler
						vom SV Leingarten am 20. Juni 2009 vom DFB Ehrenamtsbeauftragen
						des Bezirk Unterland - Harald Pfeiffer, den Fairness Preis
						f&uuml;r den Monatssieger Juni 2009, der DFB Aktion &#8222;Fair
						ist mehr&#8220; erhalten.</p>
						<p><img src="../../bilder/abteilungen/fussball_-_jugend/jufu_fair_ist_mehr_Niklas.JPG" width="275" height="336"><br>
							<br>
							Dieser Preis wird vom DFB aufgrund einer Schiedsrichtermeldung,
						&uuml;ber besonders faires Verhalten verliehen. Nach Aussage
						von Harald Pfeiffer war die Aktion von Niklas nicht nur fair
						sondern Super!<br>
							Was ist geschehen? <br>
							Wir blicken zur&uuml;ck in den November 2008 Turnier um den
						WFV Junior-Cup Vorrunde in Leingarten. Im Spiel SV Leingarten
						gegen SV Schluchtern, kl&auml;rt Niklas f&uuml;r den Schiedsrichter
						nicht erkennbar zum Ecksto&szlig;. Der Schiedsrichter entscheidet
						Absto&szlig;, jedoch ohne zu z&ouml;gern geht Niklas auf den
						Schiedsrichter zu und sagt: &#8222; Ich habe den Ball raus
						geschossen&#8220; daraufhin entschied der Schiedsrichter auf
						Ecksto&szlig;. Der auszuf&uuml;hrende Ecksto&szlig; wird vom
						SV Schluchtern zum 2:1 Siegtreffer verwandelt. Aufgrund der
						Niederlage konnte sich die E-Junioren Mannschaft des SV Leingarten
						nicht direkt f&uuml;r die Zwischenrunde qualifizieren. Bei
						einem Unentschieden w&auml;re die Teilnahme an der Zwischenrunde
						dieses weiterf&uuml;hrenden Wettbewerbs sichergewesen.</p>
						<p>Diese Entscheidung als Spieler zu treffen und die Fairness
						&uuml;ber den eigenen Erfolg zu stellen ist gro&szlig;artig!
						</p>
						<p>&nbsp;</p></td>
					<td class="copy"><p>&nbsp;</p></td>
				</tr>
			</table>
			<!-- InstanceEndEditable --></td>
		<td width="130"><!-- InstanceBeginEditable name="info" -->
			<g:each var="abteilungsLeiter" in="${abteilungsLeiterCollection}">
				<p>
					<abteilungns:abteilungsLeiter head="${abteilungsLeiter}" section="${abteilungInstance}" />
				</p>
			</g:each>
			<p>&nbsp;</p>
			<!-- InstanceEndEditable --></td>
	</tr>
</table>

</body>
</html>