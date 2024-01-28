<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Presentacion.Reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link rel="icon" type="image/png" href="Imagenes/panicon.png" />

    <style type="text/css">
        .body{
            margin:0;
            padding:0;
            background-image: url('Imagenes/Cursos-de-panaderia.jpg'); 
            background-size:cover;
            font-family:sans-serif;

        }
        .cuadroReportes{
            position:absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 580PX;
            height: 850px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.6);            
        }
        .h1{
            padding: 0;
            margin: 0;
            text-align: center;
            color: #fff;
        }
        .hlkHistorial, .hlkProductos, .hlkCerrarSesion{
            position: absolute;
            top: 0%;  
            left:1%;
            box-sizing: border-box;
            width: 100px;
            height: 34px;
            text-align: left;
            box-sizing: border-box;
            font-weight: bold;
            color: goldenrod;
        }
        .hlkHistorial{
            left:100px;
        }
        .hlkCerrarSesion{
            left:375px;
            width:112px;
        }
        .labels, .lblMsjUsuario, .lblUsuario{
            font-weight:bold;
            color: #fff;
        }
        .cuadroUsuario{
            position: absolute;
            top: -1.5%;
            left: 90%;
            transform: translate(-100px, 25%);
            width: 220px;
            height: 40px;            
            box-sizing: border-box;
            background: rgba(0,0,0,0.6); 
            text-align:center;
        }
        .lblUsuario{
            position:absolute;
            top:25%;
            left:70px;
        }
        .lblMsjUsuario{
            position:absolute;
            top:25%;
            left:2%;
        }
        
        .textbox{
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
            height: 20px;
            width:130px;
            color: #fff;
            font-size:14px;
            background-color:transparent;
        }    

        .btnAceptarFecha, .btnAceptarCliente, .btnAceptarProducto{  
            box-sizing: border-box;
            width: 80px;
            height: 30px;
            text-align: center;
            box-sizing: border-box;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            outline: none;
            font-size: 12px;
            font-weight:bold;
            float:left;
            color: goldenrod;
            cursor: pointer;
            border-radius: 15px;
            transition: .3s ease-in-out;
        }
        .btnAceptarFecha{
            position: absolute;
            left: 460px;
            top:328px;
        }
        .btnAceptarCliente{
            position: absolute;
            top: 555px;
            left: 325px;
        }
        .btnAceptarProducto{
            position: absolute;
            top: 725px;
            left: 340px;
        }
     
        </style>
</head>
<body class="body"> 
    <form id="form1" runat="server">
        <div class="cuadroUsuario">
            <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label> <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
        </div>
        <div class="cuadroReportes">            
            <asp:HyperLink ID="hlkProductos" CssClass="hlkProductos" runat="server" NavigateUrl="~/ABML_Productos.aspx">Productos</asp:HyperLink>
            <asp:HyperLink ID="hlkHistorial" CssClass="hlkHistorial" runat="server" NavigateUrl="~/HistorialComprasEmpleado.aspx">Historial</asp:HyperLink>
            <asp:HyperLink ID="hlkCerrarSesion" CssClass="hlkCerrarSesion" runat="server" NavigateUrl="~/SeleccionUsuario.aspx">Cerrar Sesión</asp:HyperLink>            
            <h1 class="h1">REPORTES</h1>            
            <br />
            <br />
            <asp:Label ID="lblMensaje" CssClass="labels" runat="server">Nº de factura de la venta máxima:</asp:Label> <asp:Label ID="lblVentaMax" CssClass="labels" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje1" CssClass="labels" runat="server">Monto de la venta máxima:</asp:Label> <asp:Label ID="lblMontoMax" CssClass="labels" runat="server"></asp:Label>
            <br />
            <br />            
            <asp:Label ID="lblMensaje2" CssClass="labels" runat="server">Nombre del cliente de la venta máxima:</asp:Label> <asp:Label ID="lblClienteVentaMax" CssClass="labels" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje3" CssClass="labels" runat="server">Fecha de la venta máxima:</asp:Label> <asp:Label ID="lblFechaVentaMax" CssClass="labels" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje8" runat="server" Text="Datos de ventas entre fechas particulares: " CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblDesde" CssClass="labels"  runat="server" Text="Desde:" ></asp:Label>                 
                &nbsp;<asp:TextBox ID="txtDesdeFecha" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                &nbsp;
                <asp:Label ID="lblHasta" CssClass="labels"  runat="server" Text="Hasta:" ></asp:Label>
                &nbsp;<asp:TextBox ID="txtHastaFecha" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                &nbsp;<asp:Button ID="btnAceptarFecha" runat="server" OnClick="btnAceptarFecha_Click" Text="Aceptar" CssClass="btnAceptarFecha" />
            <br />
            <asp:Label ID="lblErrorFechas" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje9" runat="server" Text="Monto acumulado:" CssClass="labels"></asp:Label>
&nbsp;<asp:Label ID="lblMontoFechas" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje10" runat="server" Text="Cantidad de ventas:" CssClass="labels"></asp:Label>
&nbsp;<asp:Label ID="lblCantFechas" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje11" runat="server" Text="Datos de ventas de un cliente:" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblDesdeCliente" CssClass="labels"  runat="server" Text="Desde:" ></asp:Label>                 
                &nbsp;<asp:TextBox ID="txtDesdeFechaCliente" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                &nbsp;
                <asp:Label ID="lblHastaCliente" CssClass="labels"  runat="server" Text="Hasta:" ></asp:Label>
                &nbsp;<asp:TextBox ID="txtHastaFechaCliente" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                &nbsp;<br />
            <asp:Label ID="lblErrorFechasCliente" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje12" runat="server" Text="DNI del cliente:" CssClass="labels"></asp:Label>
&nbsp;<asp:TextBox ID="txtDNICliente" runat="server"></asp:TextBox>
&nbsp;&nbsp;<br />
            <asp:Label ID="lblErrorDNI" runat="server" CssClass="labels"></asp:Label>
            <asp:Button ID="btnAceptarCliente" runat="server" OnClick="btnAceptarCliente_Click" Text="Aceptar" CssClass="btnAceptarCliente" />
            <br />
            <br />
            <asp:Label ID="lblMensaje13" runat="server" Text="Monto acumulado:" CssClass="labels"></asp:Label>
&nbsp;<asp:Label ID="lblMontoFechasCliente" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje14" runat="server" Text="Cantidad de ventas:" CssClass="labels"></asp:Label>
&nbsp;<asp:Label ID="lblCantFechasCliente" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje19" runat="server" CssClass="labels" Text="Productos vendidos históricamente:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="labels" Text="ID del producto:"></asp:Label>
&nbsp;<asp:TextBox ID="txtIDProducto" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnAceptarProducto" runat="server" OnClick="btnAceptarProducto_Click" Text="Aceptar" CssClass="btnAceptarProducto" />
            <br />
            <asp:Label ID="lblErrorProducto" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMensaje15" runat="server" Text="Unidades vendidas:" CssClass="labels"></asp:Label>
&nbsp;<asp:Label ID="lblUnidadesVendidasProducto" runat="server" CssClass="labels"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="labels" Text="Acumulado por unidades vendidas:"></asp:Label>
&nbsp;<asp:Label ID="lblAcumUnidadesVendidasProducto" runat="server" CssClass="labels"></asp:Label>
        </div>
     </form>
</body>
</html>
