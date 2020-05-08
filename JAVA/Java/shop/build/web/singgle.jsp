

<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Apple Store</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <%
            ProductDao pr = new ProductDao();
            Product p = new Product();
            String productID = "";
            if (request.getParameter("productID") != null) {
                productID = request.getParameter("productID");
                p = pr.getProduct(Integer.parseInt(productID));
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section"></div>      
            <!-- /BREADCRUMB -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!--Product main img--> 
                        <div class="col-md-5 col-md-push-2">    
                            <div id="product-main-img">
                                <div class="product-preview">
                                    <img src="./img/products/<%=p.getImage()%>" alt="">
                            </div>                        
                        </div>
                    </div>
                    <!--Product main img--> 

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5"></div>                    
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name"><%=p.getName()%></h2>
                            <div>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <a class="review-link" href="#">10 Review(s) | Add your review</a>
                            </div>
                            <div>
                                <%if (p.getPromotion_price() != 0) {%>
                                <h3 class="product-price">$<%=p.getPromotion_price()%><del class="product-old-price">$<%=p.getValue()%></del></h3>
                                <%}%>
                                <%if (p.getPromotion_price() == 0) {%>

                                <h3 class="product-price">$<%=p.getValue()%></h3>

                                <%}%>

                            </div>
                            <p><%=p.getDetail()%></p>

                            <ul class="product-btns">
                                <li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                                <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>
                            </ul>

                            <ul class="product-links">
                                <li>Category:</li>
                                <li><a href="#">Headphones</a></li>
                                <li><a href="#">Accessories</a></li>
                            </ul>

                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">SẢN PHẨM LIÊN QUAN</h3>
                        </div>
                    </div>
                    <%
                        for (Product product : pr.getListProductByRelated(p.getId_type())) {


                    %>
                    <!-- product -->
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="./img/products/<%=product.getImage()%>" alt="">
                                <div class="product-label">
                                    <%if (product.isNew_product() == true) {%>
                                    <span class="new">NEW</span>
                                    <%}%>
                                    <%if (product.getPromotion_price() != 0) {%>
                                    <span class="new">SALE</span>
                                    <%}%>
                                </div>
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="singgle.jsp?productID=<%=product.getId()%>"><%=product.getName()%></a></h3>
                                    <%if (product.getPromotion_price() != 0) {%>
                                <h4 class="product-price">$<%=product.getPromotion_price()%><del class="product-old-price">$<%=product.getValue()%></del></h4>
                                <%}%>
                                <%if (product.getPromotion_price() == 0) {%>
                                <h4 class="product-price">$<%=product.getValue()%></h4>
                                <%}%>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product-btns">
                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                </div>
                            </div>
                            <div class="add-to-cart">
                                <a href="CartServlet?command=plus&productID=<%=p.getId()%>"><i class="fa fa-shopping-cart"></i> add to cart</a>

                            </div>
                        </div>
                    </div>
                    <%}%>
                    <!-- /product -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /Section -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

