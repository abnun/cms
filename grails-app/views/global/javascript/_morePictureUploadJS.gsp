<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<shiro:hasRole name="${ShiroRole.BENUTZER}">
	<g:render template="/global/javascript/pictureUploadGlobalJS" model="['album': album, 'albumDate': albumDate, 'isMultiUpload': true]" />

	<g:render template="/global/javascript/uploadifyJS" model="['album': album, 'albumDate': albumDate]" />

</shiro:hasRole>