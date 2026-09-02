package com.itservice.controller;

import com.itservice.model.ServiceRequest;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

public class ServiceRequestServlet extends HttpServlet {

    private static final AtomicInteger REQUEST_COUNTER =
            new AtomicInteger(1000);

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String employeeId =
                clean(request.getParameter("employeeId"));

        String employeeName =
                clean(request.getParameter("employeeName"));

        String department =
                clean(request.getParameter("department"));

        String problemCategory =
                clean(request.getParameter("problemCategory"));

        String problemDescription =
                clean(request.getParameter("problemDescription"));

        String priority =
                clean(request.getParameter("priority"));

        String validationMessage = validate(
                employeeId,
                employeeName,
                department,
                problemCategory,
                problemDescription,
                priority
        );

        if (validationMessage != null) {

            request.setAttribute(
                    "errorMessage",
                    validationMessage
            );

            request.setAttribute("employeeId", employeeId);
            request.setAttribute("employeeName", employeeName);
            request.setAttribute("department", department);
            request.setAttribute(
                    "problemCategory",
                    problemCategory
            );
            request.setAttribute(
                    "problemDescription",
                    problemDescription
            );
            request.setAttribute("priority", priority);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher(
                            "/serviceRequest.jsp"
                    );

            dispatcher.forward(request, response);
            return;
        }

        ServiceRequest serviceRequest =
                new ServiceRequest(
                        employeeId,
                        employeeName,
                        department,
                        problemCategory,
                        problemDescription,
                        priority
                );

        String requestNumber =
                "SR-" + REQUEST_COUNTER.incrementAndGet();

        request.setAttribute(
                "serviceRequest",
                serviceRequest
        );

        request.setAttribute(
                "requestNumber",
                requestNumber
        );

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/acknowledgement.jsp"
                );

        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        response.sendRedirect(
                request.getContextPath()
                        + "/serviceRequest.jsp"
        );
    }

    private String clean(String value) {

        if (value == null) {
            return "";
        }

        return value.trim();
    }

    private String validate(
            String employeeId,
            String employeeName,
            String department,
            String problemCategory,
            String problemDescription,
            String priority) {

        if (employeeId.isEmpty()) {
            return "Employee ID is required.";
        }

        if (employeeName.isEmpty()) {
            return "Employee Name is required.";
        }

        if (department.isEmpty()) {
            return "Please select a department.";
        }

        if (problemCategory.isEmpty()) {
            return "Please select a problem category.";
        }

        if (problemDescription.isEmpty()) {
            return "Problem Description is required.";
        }

        if (priority.isEmpty()) {
            return "Please select a priority.";
        }

        return null;
    }
}