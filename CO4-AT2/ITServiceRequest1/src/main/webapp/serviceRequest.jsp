<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>IT Service Request</title>

    <!-- CSS -->
    <link rel="stylesheet"
          href="/ITServiceRequest1/css/style.css">

</head>

<body>

<div class="container">

    <h1>IT Service Request Management System</h1>

    <p>
        Submit your technical complaint to the IT Support Team.
    </p>

    <%
        String errorMessage =
                (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <div class="error-message">
            <%= errorMessage %>
        </div>

    <%
        }
    %>


    <form method="post"
          action="/ITServiceRequest1/submitServiceRequest">


        <!-- Employee Details -->

        <div class="form-row">

            <div class="form-group">

                <label for="employeeId">
                    Employee ID
                </label>

                <input type="text"
                       id="employeeId"
                       name="employeeId"
                       placeholder="Enter Employee ID"
                       required>

            </div>


            <div class="form-group">

                <label for="employeeName">
                    Employee Name
                </label>

                <input type="text"
                       id="employeeName"
                       name="employeeName"
                       placeholder="Enter Employee Name"
                       required>

            </div>

        </div>


        <!-- Department and Category -->

        <div class="form-row">

            <div class="form-group">

                <label for="department">
                    Department
                </label>

                <select id="department"
                        name="department"
                        required>

                    <option value="">
                        Select Department
                    </option>

                    <option value="IT">
                        IT
                    </option>

                    <option value="Human Resources">
                        Human Resources
                    </option>

                    <option value="Finance">
                        Finance
                    </option>

                    <option value="Marketing">
                        Marketing
                    </option>

                    <option value="Operations">
                        Operations
                    </option>

                </select>

            </div>


            <div class="form-group">

                <label for="problemCategory">
                    Problem Category
                </label>

                <select id="problemCategory"
                        name="problemCategory"
                        required>

                    <option value="">
                        Select Problem Category
                    </option>

                    <option value="Network">
                        Network
                    </option>

                    <option value="Software">
                        Software
                    </option>

                    <option value="Hardware">
                        Hardware
                    </option>

                    <option value="Account">
                        Account
                    </option>

                    <option value="Other">
                        Other
                    </option>

                </select>

            </div>

        </div>


        <!-- Problem Description -->

        <div class="form-group">

            <label for="problemDescription">
                Problem Description
            </label>

            <textarea
                id="problemDescription"
                name="problemDescription"
                placeholder="Describe your technical issue in detail..."
                required></textarea>

        </div>


        <!-- Priority -->

        <div class="form-group">

            <label>
                Priority
            </label>

            <div class="radio-group">

                <label class="radio-option">

                    <input type="radio"
                           name="priority"
                           value="Low"
                           required>

                    Low

                </label>


                <label class="radio-option">

                    <input type="radio"
                           name="priority"
                           value="Medium">

                    Medium

                </label>


                <label class="radio-option">

                    <input type="radio"
                           name="priority"
                           value="High">

                    High

                </label>

            </div>

        </div>


        <!-- Submit -->

        <div class="form-group">

            <button type="submit">
                Submit Service Request
            </button>

        </div>

    </form>

</div>

</body>

</html>