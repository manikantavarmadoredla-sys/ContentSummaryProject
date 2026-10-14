
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String summary = request.getParameter("summary");

    boolean validName = name != null
            && !name.isEmpty()
            && name.codePointCount(0, name.length()) < 10
            && Character.isUpperCase(name.codePointAt(0));

    boolean validEmail = "abc@gmail.com".equals(email);

    boolean validSummary = summary != null
            && !summary.trim().isEmpty();

    // Calculate score out of 4
    int score = 0;

    if (summary != null) {
        String text = summary.toLowerCase();

        if (text.contains("privacy")) {
            score++;
        }

        if (text.contains("password")) {
            score++;
        }

        if (text.contains("check information")) {
            score++;
        }

        if (text.contains("respect")) {
            score++;
        }
    }

    boolean validSubmission = validName
            && validEmail
            && validSummary;

    if (validSubmission) {
        session.setAttribute("verifiedName", name);
        session.setAttribute("verifiedEmail", email);
        session.setAttribute("verifiedSummary", summary);
        session.setAttribute("score", score);

       response.sendRedirect("display.html");
        return;
    } else {
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Verification | Choices Summary</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<main class="card">
    <h1>We couldn't verify your submission</h1>

    <ul class="errors">
        <% if (!validName) { %>
            <li>Name must start with a capital letter and contain fewer than 10 characters.</li>
        <% } %>

        <% if (!validEmail) { %>
            <li>Email must be abc@gmail.com.</li>
        <% } %>

        <% if (!validSummary) { %>
            <li>Please enter a summary.</li>
        <% } %>
    </ul>

    <p>Return to the form and correct the requirements.</p>
    <a class="button" href="test.html">Back to the test</a>
</main>
</body>
</html>
<%
    }
%>
