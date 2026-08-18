package com.example.electricity;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calculate")
public class CalculateBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String unitsText = request.getParameter("units");

        try {
            double units = Double.parseDouble(unitsText.trim());

            if (units < 0) {
                request.setAttribute("error", "Units cannot be negative.");
                request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
                return;
            }

            double bill = BillCalculator.calculateBill(units);
            request.setAttribute("units", units);
            request.setAttribute("bill", bill);
            request.setAttribute("success", true);
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Please enter a valid numeric value for units.");
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
        }
    }
}
