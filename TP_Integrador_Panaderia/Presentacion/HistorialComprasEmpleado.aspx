<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistorialComprasEmpleado.aspx.cs" Inherits="Presentacion.HistorialComprasEmpleado" %>

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
        .encabezado{
            position: absolute;
            top: 15%;
            left: 50%;
            transform: translate(-50.5%, -30%);
            width: 1217px;
            height: 390px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .fondoGrilla{
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50.5%, 0%);
            width: 1217px;
            height: 300px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .grdVentas{
            position: fixed;
            top: 0%;
            left: 50%;
            transform: translate(-50%, 0%);
            width: 1217px;
            box-sizing: border-box;
            background-color:transparent;
            text-align: center;
            color: #fff;
            font-weight:bold;
        }
        .hlkProductos, .hlkReportes, .hlkCerrarSesion{
            position: absolute;
            top: 10%;  
            left:1%;
            box-sizing: border-box;
            width: 100px;
            height: 34px;
            text-align: left;
            box-sizing: border-box;
            font-weight: bold;
            color: goldenrod;
        }
        .hlkProductos{
            left:100px;
        }
        .hlkCerrarSesion{
            left:195px;
            width:112px;
        }
        .lblMsjUsuario, .lblUsuario, .labels{
            font-weight:bold;
            color: #fff;
        }
        .lblUsuario{
            position:absolute;
            top:10%;
            left:1070px;
        }
        .lblMsjUsuario{
            position:absolute;
            top:10%;
            left:1000px;
        }
        .h1{
            padding: 0;
            margin: 0;
            text-align:center;
            position:absolute;
            top:20%;
            left:35%;
            color: #fff;
        }
        .btnAceptarFecha, .btnAceptarDNI, .btnAceptarNroFac, .btnQuitarFiltros{  
            box-sizing: border-box;
            width: 105px;
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
            position:absolute;
            left: 587px;
            top:160px;
        }
        .btnAceptarDNI{
            position:absolute;
            top: 215px;
            left: 390px;
        }
        .btnAceptarNroFac{
            position:absolute;
            left: 425px;
            top: 274px;
        }
        .btnQuitarFiltros{
            width:120px;
            height:37px;
            position: absolute;
            left: 41px;
            top: 325px;
        }
        .btnAceptarDNI:hover, .btnAceptarFecha:hover, .btnAceptarNroFac:hover, .btnQuitarFiltros:hover{
            background-color:red;
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
     
        .auto-style1 {
            box-sizing: border-box;
            width: 105px;
            height: 30px;
            text-align: center;
            outline-width: medium;
            outline-style: none;
            outline-color: invert;
            font-size: 12px;
            font-weight: bold;
            float: left;
            color: goldenrod;
            cursor: pointer;
            border-radius: 15px;
            transition: .3s ease-in-out;
            position: absolute;
            left: 587px;
            top: 160px;
            bottom: 360px;
            border-style: none;
            border-color: inherit;
            border-width: medium;
        }
     
        </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="encabezado">
                <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label>
                <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
                <asp:HyperLink ID="hlkReportes" CssClass="hlkReportes" runat="server" NavigateUrl="~/Reportes.aspx">Reportes</asp:HyperLink>
                <asp:HyperLink ID="hlkProductos" CssClass="hlkProductos" runat="server" NavigateUrl="~/ABML_Productos.aspx">Productos</asp:HyperLink>
                <asp:HyperLink ID="hlkCerrarSesion" CssClass="hlkCerrarSesion" runat="server" NavigateUrl="~/SeleccionUsuario.aspx">Cerrar Sesión</asp:HyperLink>
                <h1 class="h1">HISTORIAL DE COMPRAS</h1>
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="lblFiltroFecha" CssClass="labels"  runat="server" Text="Filtrar por Fecha:" ></asp:Label>              
                &nbsp;<asp:Label ID="lblDesde" CssClass="labels"  runat="server" Text="Desde:" ></asp:Label>                 
                &nbsp;<asp:TextBox ID="txtDesdeFecha" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                &nbsp;
                <asp:Label ID="lblHasta" CssClass="labels"  runat="server" Text="Hasta:" ></asp:Label>
                &nbsp;<asp:TextBox ID="txtHastaFecha" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnFiltrarFecha" CssClass="auto-style1" runat="server" Text="Aceptar" OnClick="btnFiltrarFecha_Click"/>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="lblMensaje1" CssClass="labels" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="lblFiltroDNI" CssClass="labels"  runat="server" Text="Filtrar por DNI del cliente:" ></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtDNICliente" CssClass="textbox" runat="server" MaxLength="8"></asp:TextBox>             
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             
                &nbsp;             
                <asp:Button ID="btnFiltrarDNICliente" CssClass="btnAceptarDNI" runat="server" Text="Aceptar" OnClick="btnFiltrarDNICliente_Click"/>

                &nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="lblmensaje" CssClass="labels" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="lblFiltroNfactura" CssClass="labels"  runat="server" Text="Filtrar por Numero de factura:" ></asp:Label>               
                &nbsp;               
                <asp:TextBox ID="txtIdVenta" CssClass="textbox" runat="server" MaxLength="3"></asp:TextBox>
                &nbsp;
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnFiltrarIdVenta" CssClass="btnAceptarNroFac" runat="server"  Text="Aceptar" OnClick="btnFiltrarIdVenta_Click" />
                <asp:Button ID="btnQuitarFiltros" CssClass="btnQuitarFiltros" runat="server"  Text="Quitar filtros" OnClick="btnQuitarFiltros_Click" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="lblmensaje2" CssClass="labels" runat="server"></asp:Label>
            </div>
        <div class="fondoGrilla" >
                <asp:GridView ID="grdHistorialComprasEmpleado" CssClass="grdVentas" runat="server" OnRowCommand="grdHistorialComprasEmpleado_RowCommand" AllowPaging="True" OnPageIndexChanging="grdHistorialComprasEmpleado_PageIndexChanging">
                <Columns>
                    <asp:ButtonField CommandName="Select" HeaderText="Detalles de Compra" ShowHeader="True" Text="Ver detalles de la compra" />
                </Columns>
            </asp:GridView>
                
        </div>
    </form>
</body>
</html>
