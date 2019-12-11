<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="errors" class="Beans.ErrorBean" scope="request"/>
<html>
<head>
    <title>Hello</title>
</head>
<body>
<table>
    <%
        StringBuilder builder = new StringBuilder();
        builder.append("<tr><th>Errors</th></tr>");
        for (String error : errors.getErrors()) {
            builder.append("<tr>").append("<td>").append(error).append("</td>").append("</tr>");
        }
        out.write(builder.toString());
        errors.cleanErrors();
    %>
</table>
</body>
</html>
