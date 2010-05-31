<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<%@ page import="de.webmpuls.cms.section.AbteilungHelper" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/svlmaster.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
	<!-- TemplateBeginEditable name="doctitle" -->
	<title><g:layoutTitle default="(( (  Sportverein Leingarten  ) ))" /></title>
	<!-- TemplateEndEditable -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Cache-control" content="no-store, no-cache, must-revalidate, post-check=0, pre-check=0">
	<meta http-equiv="Pragma" content="no-cache"/>
	<meta http-equiv="Expires" content="-1"/>
	<link rel="SHORTCUT ICON" href="${resource(dir: 'bilder', file: 'svl.ico')}">
	<link rel="shortcut icon" type="image/x-icon" href="${resource(dir: 'bilder', file: 'svl.ico')}"/>
<!-- InstanceParam name="oben" type="boolean" value="true" --> <!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<!-- InstanceParam name="OptionalRegion1" type="boolean" value="true" -->
	<link href="${resource(dir: 'css', file: 'navi.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'rubrik.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'text.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'sparte.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'tabelle.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'message.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'menu.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'buttons.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'dialog.css')}" rel="stylesheet" type="text/css">
	<link href="${resource(dir: 'css', file: 'boxes.css')}" rel="stylesheet" type="text/css"/>

	<style type="text/css">
	.fadein {
		position: relative;
		width: 110px;
		height: 51px;
	}

	.fadein img {
		position: absolute;
		left: 0;
		top: 0;
	}
	</style>

	<shiro:hasRole name="${ShiroRole.BENUTZER}">
		<ckeditor:resources />
	</shiro:hasRole>

	%{--<g:javascript library="jquery" />--}%

	<script type="text/javascript" src="${resource(dir: 'js/jquery/', file: 'jquery-1.4.2.min.js')}"></script>

	<g:render template="/global/javascript/jQueryUIJS" />

	<g:layoutHead />
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table height="100%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF">
  <tr>
    <td width="110" height="87" align="center" valign="middle" bgcolor="#D2DFFF"><a name="oben"></a><a href="${createLink(controller: 'inhalt', action: 'aktuelles')}" alt="Startseite"><img src="${resource(dir: 'bilder/divers', file: 'logo.jpg')}" name="svllogo" width="110" height="87" id="svllogo" border="0" /></a></td>
    <td width="10" height="87" bgcolor="#97C0EA">&nbsp;</td>
	  <td width="100%" height="87" align="left" valign="top" bgcolor="#D2DFFF"><!-- InstanceBeginEditable name="kopf" -->
		  <p>
		  	<layout:header_image />
		  </p>
		  <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td width="110" height="20" align="right" bgcolor="#1760A8"> <span class="svl"><font color="#FFFFFF">Sportverein
      Leingarten 1895 e.V</font>.</span></td>
    <td width="10" height="20" bgcolor="#1760A8">&nbsp;</td>
    <td height="20" bgcolor="#1760A8"><!-- InstanceBeginEditable name="rubriken" -->

      <table border="0" cellpadding="0" cellspacing="3" class="rubrik">
        <tr>
			<td></td>
			<td class="rubrikactiv">
				<menu:header_menu />
			</td>
		</tr>
      </table>
		<shiro:isLoggedIn>
			<table border="0" cellspacing="0" class="copy" style="float: right; color: white;">
				<tbody>
				<tr class="copy">
					<td class="copy">
						Eingeloggter User: <shiro:principal/>&nbsp;
					</td>
					<td>
						<img src="${resource(dir: 'bilder/divers', file: 'trenn.gif')}" width="1" height="20"/>
					</td>
					<td class="copy">
						&nbsp;<g:link controller="admin" style="color: white;"><g:message code="admin.home.link.lable" default="Dashboard" /></g:link>&nbsp;
					</td>
					<td>
						<img src="${resource(dir: 'bilder/divers', file: 'trenn.gif')}" width="1" height="20"/>
					</td>
					<td class="copy">
						&nbsp;<g:link controller="auth" action="signOut" style="color: white;" onclick="return confirm('${message(code: 'logout.confirm')}');"><g:message code="admin.logout.link.lable" default="ausloggen" /></g:link>&nbsp;
					</td>
				</tr>
				</tbody>
			</table>
		</shiro:isLoggedIn>

    <!-- InstanceEndEditable -->
	  </td>
  </tr>
  <tr>
    <td width="110" height="100%" align="left" valign="top" bgcolor="#D2DFFF">
      <table width="110" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td height="10" valign="middle" class="sparte1">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="middle" class="sparte1">SVL aktiv</td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"> <span class="navi"><a href="${createLink(controller: 'inhalt', action: 'aktuelles')}" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','hide','impressum','','hide','aktuell','','show')">Aktuelles</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"> <span class="navi"><a href="${resource(dir: 'sites/veranstaltungen', file: 'veranstaltungen.gsp')}" onMouseOver="MM_showHideLayers('veranstaltungen','','show','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','hide','impressum','','hide','aktuell','','hide')">Veranstaltungen</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"> <span class="navi"><a href="${resource(dir: 'sites/abteilungen', file: 'abteilungen.gsp')}" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','show','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','hide','impressum','','hide','aktuell','','hide')">Abteilungen</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"><span class="navi"><a href="#" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','show','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','hide','impressum','','hide','aktuell','','hide')">Sportanlagen</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"> <span class="navi"><a href="${resource(dir: 'sites', file: 'mitglied.gsp')}" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','show','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','hide','impressum','','hide','aktuell','','hide')">Mitgliedschaft</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"> <span class="navi"><a href="${createLink(controller: 'sponsor', action: 'list')}" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','show','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','hide','impressum','','hide','aktuell','','hide')">Sponsoren</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle">&nbsp;</td>
        </tr>
        <tr>
          <td valign="middle" class="sparte2">
			  <div class="fadein">
				  <g:include controller="sponsor" action="images" />
			  </div>
          </td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="middle" bordercolor="0" class="sparte1">SVL
            intern</td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"><span class="navi"><a href="#" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','show','themen','','hide','sitzungen','','hide','impressum','','hide','aktuell','','hide')">Organe</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle"> <span class="navi"><a href="${createLink(controller: 'inhalt', action: 'termine')}" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','show','impressum','','hide','aktuell','','hide')">Termine</a></span></td>
        </tr>
        %{--<tr>
          <td width="110" height="21" valign="middle"> <span class="navi"><a href="#" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','show','sitzungen','','hide','impressum','','hide','aktuell','','hide')">Themen</a></span></td>
        </tr>--}%
        <tr>
          <td width="110" height="20" valign="middle"> <span class="navi"><a href="${resource(dir: 'sites', file: 'impressum.gsp')}" onMouseOver="MM_showHideLayers('veranstaltungen','','hide','abteilungen','','hide','wegrollen','','show','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','themen','','hide','sitzungen','','hide','impressum','','show','aktuell','','hide')">Impressum</a></span></td>
        </tr>
        <tr>
          <td width="110" height="20" valign="middle">&nbsp;</td>
        </tr>
		<tr>
          <td width="110" height="20" valign="middle">&nbsp;</td>
        </tr>
		<tr>
          <td width="110" height="100%" valign="middle"><font color="#000033" size="-1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
        </tr>
      </table>
    </td>
    <td width="10" height="100%" bgcolor="#97C0EA">&nbsp;</td>
    <td width="100%" height="100%" align="left" valign="top" bgcolor="#FFFFFF">
      <table width="100%" height="20" border="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <g:layoutBody />
      <p>&nbsp;</p></td>
  </tr>
</table>

<div id="veranstaltungen" class="navi" style="position:absolute; width:114px; height:131px; z-index:12; left: 112px; top: 178px; visibility: hidden;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td height="20" bgcolor="#1760A8" class="marker">&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/veranstaltungen', file: 'veranstaltung_08.gsp')}">2008</a></td>
    </tr>
    <tr>
      <td width="4" height="20" class="marker">&nbsp; </td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"> <a href="${resource(dir: 'sites/veranstaltungen', file: 'veranstaltung_07.gsp')}">2007</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/veranstaltungen', file: 'veranstaltung_06.gsp')}">2006</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/veranstaltungen', file: 'veranstaltung_05.gsp')}">2005</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>

<div id="abteilungen" style="position:absolute; visibility:hidden; left:112px; top:199px; width:114px; z-index:11">
  <g:include controller="abteilung" action="menu" />
</div>

<div id="wegrollen" style="position:absolute; visibility:hidden; left:111px; top:135px; width:200px; height:526px; z-index:1">
  <a href="#" onMouseOver="MM_showHideLayers('aktuelles','','hide','abteilungen','','hide','wegrollen','','hide','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','termine','','hide','anliegen','','hide','beschluss','','hide','impressum','','hide')">
  <img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="140" height="20" border="0" align="top">
  <img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="27" height="438" border="0"> </a><a href="#" onMouseOver="MM_showHideLayers('aktuelles','','hide','abteilungen','','hide','wegrollen','','hide','anlagen','','hide','mitglied','','hide','sponsoren','','hide','gaestebuch','','hide','organe','','hide','termine','','hide','anliegen','','hide','beschluss','','hide','impressum','','hide')"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="140" height="20" border="0" align="top"></a>
</div>

<div id="anlagen" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:10; left: 112px; top: 220px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"> <a href="${resource(dir: 'sites/anlagen', file: 'uebersicht.gsp')}">&Uuml;bersichtsplan</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"> <a href="${resource(dir: 'sites/anlagen', file: 'eichbott_beachfeld.gsp')}" >Beachfeld</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"> <a href="${resource(dir: 'sites/anlagen', file: 'eichbott_halle.gsp')}" >Eichbotthalle</a></td>
    </tr>
    <tr>
      <td rowspan="9">&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'festgelaende.gsp')}">Festhalle/Festplatz</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'eichbott_freibad.gsp')}">Freibad</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'heuchelberg_sportheim.gsp')}">Gymnastikraum</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'eichbott_hallenbad.gsp')}">Hallenbad</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'heuchelberg_stadion.gsp')}">Heuchelbergstadion</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'heuchelberg_sportheim.gsp')}">SVL-Sportheim</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'heuchelberg_tennis.gsp')}">Tennisanlage</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'heuchelberg_trimm.gsp')}">Trimm-Dich-Pfad</a></td>
    </tr>
    <tr>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/anlagen', file: 'heuchelberg_reiten.gsp')}">Reitanlage</a></td>
    </tr>
  </table>
</div>
<div id="mitglied" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:9; left: 112px; top: 241px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" class="unavi"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="1" height="21"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>
<div id="sponsoren" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:8; left: 112px; top: 262px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" class="unavi"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="1" height="21"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>
<div id="gaestebuch" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:7; left: 112px; top: 283px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" class="unavi"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="1" height="21"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>
<div id="organe" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:6; left: 112px; top: 393px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${createLink(controller: 'person', action: 'vorstand')}">Vorstand</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${createLink(controller: 'person', action: 'jugend_vorstand')}">Jugendvorstand</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${createLink(controller: 'person', action: 'delegierte')}">Delegierte</a></td>
    </tr>
  </table>
</div>
<div id="themen" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:3; left: 112px; top: 435px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"> <a href="${resource(dir: 'sites/themen', file: 'th_zkw.gsp')}">Zukunftswerkstatt</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" bgcolor="#D2DFFF" class="unavi"><a href="${resource(dir: 'sites/themen', file: 'th_streik_05.gsp')}">Streik
        2005</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>
<div id="sitzungen" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:4; left: 112px; top: 414px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" class="unavi"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="1" height="21"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>
<div id="impressum" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:2; left: 112px; top: 435px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" class="unavi"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="1" height="21"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>
<div id="aktuell" style="position:absolute; visibility:hidden; width:114px; height:115px; z-index:13; left: 112px; top: 157px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
    <tr>
      <td width="4" height="20" bgcolor="#1760A8" class="marker">&nbsp; </td>
      <td height="20" class="unavi"><img src="${resource(dir: 'bilder/divers', file: 'spacer.gif')}" width="10" height="21"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20" class="unavi">&nbsp;</td>
    </tr>
  </table>
</div>

	<g:render template="/global/javascript/globalJS" />
</body>
<!-- InstanceEnd -->
</html>