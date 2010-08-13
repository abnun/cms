<% import grails.persistence.Event %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="\${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            <g:if test="\${flash.message}">
            <div class="message">\${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        <%  excludedProps = Event.allEvents.toList() << 'version'
                            props = domainClass.properties.findAll { !excludedProps.contains(it.name) && it.type != Set.class }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.eachWithIndex { p, i ->
//                                if (i < 6) {
                                    if (p.isAssociation()) { %>
                            <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
                   	    <%      } else { %>
                            <g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
                        <%  }
//						}
						} %>
							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                        <tr class="\${(i % 2) == 0 ? 'odd' : 'even'}">
                        <%  props.eachWithIndex { p, i ->
                                cp = domainClass.constrainedProperties[p.name]
                                if (i == 0) { %>
                            <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
                        <%      } else if (i > 0) {//(i < 6) {
                                    if (p.type == Boolean.class || p.type == boolean.class) { %>
                            <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                        <%          } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
                            <td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                        <%          } else { %>
                            <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                        <%  }   }   } %>
							<td>
								<g:link action="edit" id="\${${propertyName}.id}"><g:message code="${domainClass.propertyName}.edit" default="Bearbeiten" /></g:link>
								&nbsp;|&nbsp;
								<g:link action="delete" id="\${${propertyName}.id}"><g:message code="${domainClass.propertyName}.delete" default="Löschen" /></g:link>
								<jq:jquery>
										\$("#del_\${fieldValue(bean: ${propertyName}, field: "id")}").click(function () {
											if(confirm("><g:message code="default.button.delete.confirm.message" default="Are you sure?" />'))
											{
												document.forms.DeleteForm_\${fieldValue(bean: ${propertyName}, field: "id")}.submit();
											}
										});
								</jq:jquery>
								<a href="javascript: void(0);" id="del_\${fieldValue(bean: ${propertyName}, field: 'id')}"><g:message code="${domainClass.propertyName}.delete" default="Löschen" /></a>
								<g:form name="DeleteForm_\${fieldValue(bean: ${propertyName}, field: 'id')}" method="post" url="\${createLink(action: 'delete', id: fieldValue(bean: ${propertyName}, field: 'id'))}"></g:form>
						</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="\${${propertyName}Total}" />
            </div>--}%
        </div>
    </body>
</html>
