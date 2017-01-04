<%@page import="HelperClasses.Member"%>
<%@page import="HelperClasses.Furniture"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="checkCountry.jsp" />
<%
    Boolean isMemberLoggedIn = false;
    String memberEmail = (String) (session.getAttribute("memberEmail"));
    if (memberEmail == null) {
        isMemberLoggedIn = false;
    } else {
        isMemberLoggedIn = true;
    }
    String category = URLDecoder.decode(request.getParameter("cat"));
    if (category == null) {
        pageContext.forward("/ECommerce_SelectCountry");
    }
%>
<html> <!--<![endif]-->
    <jsp:include page="header.html" />
    <body>
        <%
            List<Furniture> furnitures = (List<Furniture>) (session.getAttribute("furnitures"));
            System.out.println("furniture size:" + furnitures.size());
        %>
        <div class="body">
            <jsp:include page="menu2.jsp" />
            <div class="body">
                <div role="main" class="main">
                    <section class="page-top">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2>Furnitures</h2>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="container">

                        <div class="row">
                            <div class="col-md-6">
                                <h2 class="shorter"><strong><%=category%></strong></h2>
                            </div>
                        </div>
                        <div class="row">
                            <ul class="products product-thumb-info-list" data-plugin-masonry>
                                <%
                                    try {
                                        /**
                                         * *insert code here**
                                         */
                                %>
                                <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(0).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(0).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(0).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(0).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(0).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(0).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="name" value="<%=furnitures.get(0).getName()%>"/>
                                                <input type="hidden" name="id" value="<%=furnitures.get(0).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(0).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(0).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(0).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(0).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(0).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(0).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(0).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(0).getSKU()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(0).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(0).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(0).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(0).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(0).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>
                                <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(1).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(1).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(1).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(1).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(1).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(1).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(1).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(1).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(1).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(1).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(1).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(1).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(1).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(1).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(1).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(1).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(1).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(1).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(1).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(1).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(1).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>
                               <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(2).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(1).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(2).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(2).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(2).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(2).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(2).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(2).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(2).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(2).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(2).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(2).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(2).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(2).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(2).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(2).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(2).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(2).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(2).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(2).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(2).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>  
                                <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(3).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                           <h4><%=furnitures.get(3).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(3).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(3).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(3).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(3).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(3).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(3).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(3).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(3).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(3).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(3).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(3).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(3).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(3).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(3).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(3).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(3).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(3).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(3).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(3).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>                              
                               <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(4).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(1).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(4).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(4).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(4).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(4).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(4).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(4).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(4).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(4).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(4).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(4).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(4).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(4).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(4).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(4).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(4).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(4).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(4).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(4).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(4).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>                               
                                <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(5).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(5).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(5).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(5).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(5).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(5).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(5).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(5).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(5).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(5).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(5).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(5).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(5).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(5).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(5).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(5).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(5).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(5).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(5).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(5).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(5).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>
                                <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(6).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(6).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(6).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(6).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(6).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(6).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(6).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(6).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(6).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(6).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(6).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(6).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(6).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(6).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(6).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(6).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(6).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(6).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(6).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(6).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(6).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>
                              <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(7).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(7).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(7).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(7).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(7).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(7).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(7).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(7).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(7).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(7).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(7).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(7).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(7).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(7).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(7).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(7).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(7).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(7).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(7).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(7).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(7).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>
                              <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(8).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(8).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(8).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(8).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(8).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(8).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(8).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(8).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(8).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(8).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(8).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(8).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(8).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(8).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(8).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(8).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(8).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(8).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(8).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(8).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(8).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>
                                <li class="col-md-3 col-sm-6 col-xs-12 product">
                                    <span class="product-thumb-info">
                                        <span class="product-thumb-info-image">
                                            <img alt="" class="img-responsive" src="../../..<%=furnitures.get(9).getImageUrl()%>">
                                        </span>

                                        <span class="product-thumb-info-content">
                                            <h4><%=furnitures.get(9).getName()%></h4>
                                            <span class="product-thumb-info-act-left"><em>Height: <%=furnitures.get(9).getHeight()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Length: <%=furnitures.get(9).getLength()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Width: <%=furnitures.get(9).getWidth()%></em></span><br/>
                                            <span class="product-thumb-info-act-left"><em>Price: $<%=furnitures.get(9).getPrice()%>0</em></span>
                                            <br/>
                                            <form action="furnitureProductDetails.jsp">
                                                <input type="hidden" name="id" value="<%=furnitures.get(9).getId()%>"/>
                                                <input type="hidden" name="category" value="<%=furnitures.get(9).getCategory()%>"/>
                                                <input type="hidden" name="description" value="<%=furnitures.get(9).getDescription()%>"/>
                                                <input type="hidden" name="height" value="<%=furnitures.get(9).getHeight()%>"/>
                                                <input type="hidden" name="length" value="<%=furnitures.get(9).getLength()%>"/>
                                                <input type="hidden" name="width" value="<%=furnitures.get(9).getWidth()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(9).getPrice()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(9).getImageUrl()%>"/>
                                                <input type="hidden" name="sku" value="<%=furnitures.get(9).getSKU()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(9).getName()%>"/>
                                                <input type="submit" class="btn btn-primary btn-block" value="More Details"/>
                                            </form>
                                            
                                            <%
                                                if (isMemberLoggedIn == true) {
                                            %>
                                            <form action="../../ECommerce_AddFurnitureToListServlet">
                                                <input type="hidden" name="id" value="<%=furnitures.get(9).getId()%>"/>
                                                <input type="hidden" name="SKU" value="<%=furnitures.get(9).getSKU()%>"/>
                                                <input type="hidden" name="price" value="<%=furnitures.get(9).getPrice()%>"/>
                                                <input type="hidden" name="name" value="<%=furnitures.get(9).getName()%>"/>
                                                <input type="hidden" name="imageURL" value="<%=furnitures.get(9).getImageUrl()%>"/>
                                                <input type="submit" name="btnEdit" class="btn btn-primary btn-block" value="Add To Cart"/>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </span>
                                    </span>
                                </li>
                                <%
                                    } catch (Exception ex) {
                                        System.out.println(ex);
                                        ex.printStackTrace();
                                    }
                                %>
                            </ul>
                        </div>
                        <hr class="tall">
                    </div>
                </div>
            </div>
            <jsp:include page="footer.html" />
        </div>
    </body>
</html>
