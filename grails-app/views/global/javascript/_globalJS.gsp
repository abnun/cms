<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
%{--<link href="${resource(dir: 'css', file: 'superfish.css')}" rel="stylesheet" type="text/css">
<link href="${resource(dir: 'css', file: 'superfish-vertical.css')}" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'superfish.js')}"></script>--}%
<script type="text/javascript">
	<!--
	function MM_reloadPage(init) {  //reloads the window if Nav4 resized
	  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
		document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
	  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
	}
	MM_reloadPage(true);

	function MM_findObj(n, d) { //v4.01
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && d.getElementById) x=d.getElementById(n); return x;
	}

	function MM_showHideLayers() { //v6.0
	  var i,p,v,obj,args=MM_showHideLayers.arguments;
	  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
		if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
		obj.visibility=v; }
	}
	//-->

	function confirmTargetLink(link)
	{
		link = 'http://' + link;
		//if (confirm('${message(code: 'confirm.jump.to.target.page1')}\n\n\"' + link + '\"\n\n${message(code: 'confirm.jump.to.target.page2')}'))
		//{
			window.open(link, "Neues_Fenster", "dependent=no,hotkeys=yes,location=yes,menubar=yes,resizable=yes,scrollbars=yes,status=yes,toolbar=yes");
		//}
	}
</script>
<jq:jquery>
  $(function() {
	   $('.fadein').cycle({
		fx: 'fade'
		});
	});

  $(".fadein img[rel!='']").mouseover(function () {
		  $(this).css("cursor","pointer");
	});
  $(".fadein img[rel!='']").click(function () {
		var link = $('.fadein img:visible').attr('rel');
		confirmTargetLink(link);
	});
</jq:jquery>