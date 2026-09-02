<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.itservice.model.ServiceRequest" %>

<%
    ServiceRequest serviceRequest =
            (ServiceRequest) request.getAttribute(
                    "serviceRequest"
            );

    String requestNumber =
            (String) request.getAttribute(
                    "requestNumber"
            );
%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Service Request Acknowledgement</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<div class="container">

    <div class="success-message">

        <h1>
            ✓ Service Request Submitted Successfully!
        </h1>

        <p>
            Your technical complaint has been successfully
            submitted to the IT Support Team.
        </p>

    </div>


    <div class="request-number">

        <h2>
            Service Request Number
        </h2>

        <div>
            <%= requestNumber %>
        </div>

        <p>
            Please keep this number for future reference.
        </p>

    </div>


    <h2>
        Request Details
    </h2>

    <table>

        <tr>
            <th>Employee ID</th>

            <td>
                <%= serviceRequest.getEmployeeId() %>
            </td>
        </tr>

        <tr>
            <th>Employee Name</th>

            <td>
                <%= serviceRequest.getEmployeeName() %>
            </td>
        </tr>

        <tr>
            <th>Department</th>

            <td>
                <%= serviceRequest.getDepartment() %>
            </td>
        </tr>

        <tr>
            <th>Problem Category</th>

            <td>
                <%= serviceRequest.getProblemCategory() %>
            </td>
        </tr>

        <tr>
            <th>Priority</th>

            <td>
                <%= serviceRequest.getPriority() %>
            </td>
        </tr>

        <tr>
            <th>Problem Description</th>

            <td>
                <%= serviceRequest.getProblemDescription() %>
            </td>
        </tr>

    </table>


    <div class="mvc-section">

        <h2>
            MVC Architecture
        </h2>

        <p>
            <strong>Model:</strong>
            ServiceRequest.java
        </p>

        <p>
            <strong>View:</strong>
            serviceRequest.jsp and acknowledgement.jsp
        </p>

        <p>
            <strong>Controller:</strong>
            ServiceRequestServlet.java
        </p>

    </div>


    <div class="flow-section">

        <h2>
            Request Processing Flow
        </h2>

        <p>
            Employee → serviceRequest.jsp → POST Request
            → ServiceRequestServlet → Validate Input
            → Create ServiceRequest Object
            → Generate Request Number
            → acknowledgement.jsp
        </p>

    </div>


    <a
        href="${pageContext.request.contextPath}/serviceRequest.jsp"
        class="button">

        Submit Another Request

    </a>

</div>

</body>

</html>