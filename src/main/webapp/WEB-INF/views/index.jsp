<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill Calculator</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #fff8e1 0%, #ffffff 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .container {
            max-width: 560px;
        }
        .card {
            width: min(100%, 560px);
            border: none;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(146, 94, 0, 0.15);
            background: #fffdf8;
        }
        h1 {
            font-size: clamp(2rem, 3vw, 2.6rem);
        }
        .footer-text {
            font-size: 0.95rem;
            letter-spacing: 0.02em;
        }
        .tariff-table th, .tariff-table td {
            vertical-align: middle;
        }
        .result-box {
            background: #fff7d6;
            border-left: 6px solid #d4a017;
            border-radius: 12px;
        }
        .btn-primary {
            background-color: #d4a017;
            border-color: #d4a017;
        }
        .btn-primary:hover {
            background-color: #b98600;
            border-color: #b98600;
        }
        .text-primary {
            color: #b98600 !important;
        }
        .text-success {
            color: #8a6500 !important;
        }
        .table-light {
            background-color: #fff3c4 !important;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="card p-4 p-md-5">
        <div class="text-center mb-4">
            <h1 class="fw-bold text-primary">Electricity Bill Calculator</h1>
            <p class="text-muted mb-0">Calculate your monthly electricity bill based on tariff slabs</p>
        </div>

        <form action="${pageContext.request.contextPath}/calculate" method="post" class="row g-3">
            <div class="col-12">
                <label for="units" class="form-label fw-semibold">Enter electricity consumption (units)</label>
                <input type="number" class="form-control form-control-lg" id="units" name="units"
                       min="0" step="0.01" placeholder="e.g. 230" value="${param.units != null ? param.units : ''}" required>
            </div>

            <div class="col-12 d-grid">
                <button type="submit" class="btn btn-primary btn-lg">Calculate Bill</button>
            </div>
        </form>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mt-4 mb-0" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
        <%
            Double units = (Double) request.getAttribute("units");
            Double bill = (Double) request.getAttribute("bill");
            DecimalFormat df = new DecimalFormat("₹ #,##0.00");
        %>
        <div class="result-box p-4 mt-4">
            <h3 class="text-success mb-3">Bill Summary</h3>
            <div class="row g-3">
                <div class="col-md-6">
                    <div class="text-muted small">Consumption</div>
                    <div class="fs-5 fw-bold"><%= String.format("%.2f", units) %> units</div>
                </div>
                <div class="col-md-6">
                    <div class="text-muted small">Calculated Bill</div>
                    <div class="fs-5 fw-bold text-success"><%= df.format(bill) %></div>
                </div>
            </div>
        </div>
        <% } %>

        <div class="mt-4">
            <h4 class="mb-3">Tariff Details</h4>
            <div class="table-responsive">
                <table class="table table-bordered tariff-table mb-0">
                    <thead class="table-light">
                    <tr>
                        <th>Consumption Range</th>
                        <th>Rate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr><td>First 50 units</td><td>₹3.50/unit</td></tr>
                    <tr><td>Next 100 units</td><td>₹4.00/unit</td></tr>
                    <tr><td>Next 100 units</td><td>₹5.20/unit</td></tr>
                    <tr><td>Above 250 units</td><td>₹6.50/unit</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="text-center mt-4 footer-text text-dark fw-semibold">
            Divyanshi Nagrale<br>
            PRN: 12412475
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
