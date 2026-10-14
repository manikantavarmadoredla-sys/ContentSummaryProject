<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String escapeJson(String value) {
        StringBuilder escaped = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char character = value.charAt(i);
            switch (character) {
                case '"': escaped.append("\\\""); break;
                case '\\': escaped.append("\\\\"); break;
                case '\b': escaped.append("\\b"); break;
                case '\f': escaped.append("\\f"); break;
                case '\n': escaped.append("\\n"); break;
                case '\r': escaped.append("\\r"); break;
                case '\t': escaped.append("\\t"); break;
                default:
                    if (character < 0x20) {
                        escaped.append(String.format("\\u%04x", (int) character));
                    } else {
                        escaped.append(character);
                    }
            }
        }
        return escaped.toString();
    }
%>
<%
    response.setHeader("Cache-Control", "no-store");
    String name = (String) session.getAttribute("verifiedName");
    String email = (String) session.getAttribute("verifiedEmail");
    String summary = (String) session.getAttribute("verifiedSummary");

    if (name == null || email == null || summary == null) {
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    } else {
%>
{"name":"<%= escapeJson(name) %>","email":"<%= escapeJson(email) %>","summary":"<%= escapeJson(summary) %>"}
<%
    }
%>
