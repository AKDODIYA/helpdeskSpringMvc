<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Helpdesk</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body class="body">
    <jsp:include page="inc/navbar.jsp"></jsp:include>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center w-100">
                <div class="w-100 text-center">
                    <div class="card bg-dark text-white" style="border-radius: 1rem;">
                        <div class="card-body p-5 text-center">
                            <h2 class="fw-bold mb-2 text-uppercase">About Us - Helpdesk System</h2>
                            <p class="text-white-50 mb-5">Learn more about our helpdesk system and the team behind it.</p>
                            <div class="text-start">
                                <h3>Who We Are</h3>
                                <p>We are a dedicated team behind the Helpdesk System, committed to providing efficient and reliable support services to our clients.</p>
                                <h3>Our Mission</h3>
                                <p>Our mission is to streamline the process of issue resolution and customer support by offering user-friendly tools and exceptional service.</p>
                                <h3>Our Vision</h3>
                                <p>We envision a future where technology seamlessly integrates with customer service to deliver unparalleled assistance and satisfaction.</p>
                                <h3>Our Values</h3>
                                <ul>
                                    <li><strong>Customer-Centric:</strong> We prioritize the needs and satisfaction of our customers above all else.</li>
                                    <li><strong>Integrity:</strong> We operate with honesty, transparency, and respect in all our interactions.</li>
                                    <li><strong>Innovation:</strong> We continuously seek new and improved ways to deliver exceptional support services.</li>
                                    <li><strong>Collaboration:</strong> We foster a culture of teamwork and collaboration to achieve our goals.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <jsp:include page="inc/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</body>
</html>
