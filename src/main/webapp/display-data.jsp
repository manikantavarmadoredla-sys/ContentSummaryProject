
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%
    response.setHeader("Cache-Control", "no-store");

    String name = (String) session.getAttribute("verifiedName");
    String email = (String) session.getAttribute("verifiedEmail");
    String summary = (String) session.getAttribute("verifiedSummary");
    Integer score = (Integer) session.getAttribute("score");

    if (name == null || email == null || summary == null || score == null) {
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    } else {
%>
{
    "name": "<%= name.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") %>",
    "email": "<%= email.replace("\\", "\\\\").replace("\"", "\\\"") %>",
    "summary": "<%= summary.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") %>",
    "score": <%= score %>,
    "totalScore": 4
}
<%
    }
%>
