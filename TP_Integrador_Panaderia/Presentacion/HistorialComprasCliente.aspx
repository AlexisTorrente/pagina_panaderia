<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistorialComprasCliente.aspx.cs" Inherits="Presentacion.HistorialComprasCliente" %>

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
            height: 310px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .fondoGrilla{
            position: absolute;
            top: 50%;
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
        .hlkProductos, .hlkCerrarSesion{
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
        .hlkCerrarSesion{
            left:105px;
            width:130px
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
        .btnAceptarFecha, .btnQuitarFiltros{  
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
            position:absolute;
            top: 196px;
            left: 600px;
        }
        .btnQuitarFiltros{
            width:120px;
            height:37px;
            position: absolute;
            left: 41px;
            top: 240px;
        }
        .btnAceptarFecha:hover, .btnQuitarFiltros:hover{
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
 
        </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="encabezado">
                <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label>
                <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="" ></asp:Label>
                <asp:HyperLink ID="hlProductos" CssClass="hlkProductos" runat="server" NavigateUrl="~/SeleccionProductos.aspx">Productos</asp:HyperLink> 
                <asp:HyperLink ID="hlkCerrarSesion" CssClass="hlkCerrarSesion" runat="server" NavigateUrl="~/SeleccionUsuario.aspx">Cerrar Sesión</asp:HyperLink>
                <h1 class="h1">HISTORIAL DE COMPRAS</h1>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
             
                <asp:Label ID="lblFiltroFecha" CssClass="labels"  runat="server" Text="Filtrar por Fecha:" ></asp:Label>              
                &nbsp;&nbsp; <asp:Label ID="lblDesde" CssClass="labels"  runat="server" Text="Desde:" ></asp:Label>                 
                &nbsp;                 
                &nbsp;<asp:TextBox ID="txtDesdeFecha" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                &nbsp;
                &nbsp;
                <asp:Label ID="lblHasta" CssClass="labels"  runat="server" Text="Hasta:" ></asp:Label>
                &nbsp;
                &nbsp;<asp:TextBox ID="txtHastaFecha" CssClass="textbox" runat="server" TextMode="Date" ></asp:TextBox>
                
                &nbsp;
                
                <asp:Button ID="btnFiltrarFecha" CssClass="btnAceptarFecha" runat="server" OnClick="btnFiltrarFecha_Click" Text="Aceptar" />
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:Label ID="lblMensaje1" CssClass="labels" runat="server"></asp:Label>
                <br />
                <asp:Button ID="btnMostrarTodasCompras" CssClass="btnQuitarFiltros" runat="server" OnClick="btnMostrarTodasCompras_Click" Text="Quitar filtros" />
                <br />
              
                <br />
            </div>
            <div class="fondoGrilla">
            <asp:GridView ID="grdHistorialComprasCliente" CssClass="grdVentas" runat="server" OnRowCommand="grdHistorialComprasCliente_RowCommand" OnPageIndexChanging="grdHistorialComprasCliente_PageIndexChanging">
                <Columns>
                    <asp:ButtonField CommandName="Select" HeaderText="Detalles de Compra" ShowHeader="True" Text="Ver detalles de la compra" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
