<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.Model.Candidate" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidate Result</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <h1>Candidate Result</h1>
    <table>
        <thead>
            <tr>
                <th>Candidate Name</th>
                <th>Photo</th>
                <th>Voter Count</th>
            </tr>
        </thead>
        <tbody>
            <% for (Candidate candidate : (List<Candidate>) request.getAttribute("candidates1")) { %>
                <tr>
                    <td><%= candidate.getCandidateName() %></td>
                    <td><img src="<%= candidate.getCandidatePhoto() %>" alt="Candidate Photo" height="100" width="100"></td>
                    <td><%= candidate.getVoterCount() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
