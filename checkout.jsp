<%@page import="java.util.ArrayList"%>
<%@page import="classes.Producto"%>
<%@page import="classes.Articulo"%>
<%@page import="controllers.ControladorProducto"%>
<%@page import="controllers.ControladorProducto"%>
<%
     HttpSession sesion = request.getSession(true);
     ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Checkout</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body background="fondos.jpg">
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href=""><i class="fa fa-phone"></i> +52 2281344973</a></li>
								<li><a href=""><i class="fa fa-envelope"></i> inforamcion_salmones@gmail.com</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="shop.jsp"><img src="images/home/logois.png" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									Mexico
									<span class="caret"></span>
								</button>
							</div>
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									MXM
									<span class="caret"></span>
								</button>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								
								<li><a href="checkout.jsp" class="active"><i class="fa fa-crosshairs"></i> Pagar</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Carrito</a></li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
	

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="shop.jsp">Tienda</a></li>
				  <li class="active">Pagar</li>
				</ol>
			</div><!--/breadcrums-->
                        

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>Datos de Tarjeta</p>
							<form>
								<input type="text" placeholder="N° de tarjeta">
								<input type="text" placeholder="Nombre">
								<input type="password" placeholder="cve">
								<input type="text" placeholder="mm/aa">
							</form>
						</div>
					</div>
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>Facturacion</p>
							<div class="form-one">
								<form>
									<input type="text" placeholder="Nombre de Campañia">
									<input type="text" placeholder="Email *">
									<input type="text" placeholder="titulo">
									<input type="text" placeholder="Primer nombre *">
									<input type="text" placeholder="Segundo nombre">
									<input type="text" placeholder="Apellido *">
									<input type="text" placeholder="direccion 1 *">
									<input type="text" placeholder="direccion 2">
								</form>
							</div>
							<div class="form-two">
								<form>
									<input type="text" placeholder="Zip / Codigo Postal *">
									<select>
										<option>-- Pais --</option>
										<option>Mexico</option>
									</select>
									<select>
										<option>--Estado--</option>
										<option>Aguascalientes</option>
										<option>Baja California</option>
										<option>Campeche</option>
										<option>Guanajuato</option>
										<option>Jalisco</option>
										<option>Puebla</option>
										<option>Veracurz</option>
										<option>Zacatecas</option>
									</select>
									<input type="text" placeholder="Telefono *">
									<input type="text" placeholder="Celular">
									<input type="text" placeholder="Fax">
								</form>
							</div>
						</div>
					</div>				
				</div>
			</div>
			<div class="review-payment">
				<h2>Revisar y Pagar</h2>
			</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Producto</td>
							<td class="description">descripcion</td>
							<td class="price">Precio</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<%
                                                    ControladorProducto cp = new ControladorProducto();
                                                    double total = 0;
                                                    if(articulos != null){
                                                    for(Articulo a: articulos){
                                                        Producto producto = cp.getProducto(a.getIdProducto());
                                                        total += a.getCantidad() * producto.getPrecio();
                                                        
                                                                                                            
                                                %>
                                            
						<tr>
							<td class="cart_product">
                                                            <a href=""><img src="<%= producto.getImg()%>" alt="" width="120"></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%= producto.getNombre()%></a></h4>
								<p>Web ID: <%= producto.getId()%></p>
							</td>
							<td class="cart_price">
								<p>$<%= producto.getPrecio()%></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									
                                                                        <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>" autocomplete="off" size="2"disabled="true">
									
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%= Math.round(producto.getPrecio()*a.getCantidad()*100.0) / 100.0%></p>
							</td>
						</tr>
                                                
                                                <%}}%>
						<tr>
							<td colspan="4">&nbsp;</td>
							<td colspan="2">
								<table class="table table-condensed total-result">
									<tr>
										<td>Sub Total</td>
										<td>$<%= Math.round(total*100.0)/100.0%></td>
									</tr>
									<tr>
										<td>Impuesto 15%</td>
										<td>$<%= Math.round(total*15.0)/100.0%></td>
									</tr>
									<tr class="shipping-cost">
										<td>Costo de Envio</td>
										<td>Gratis</td>										
									</tr>
									<tr>
										<td>Total</td>
										<td><span>$<%= Math.round(total*115.0)/100.0%></span> <a class="btn btn-default check_out" href="pagoexitoso.jsp">Pagar</a></td>
									</tr>
                                                                        
                                                                        
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>