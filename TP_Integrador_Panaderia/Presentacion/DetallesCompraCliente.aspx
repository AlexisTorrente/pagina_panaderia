<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallesCompraCliente.aspx.cs" Inherits="Presentacion.DetallesCompraCliente" %>

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
            top: 10%;
            left: 50%;
            transform: translate(-50.5%, -32%);
            width: 1217px;
            height: 70px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .fondoGrilla{
            position: absolute;
            top: 28.5%;
            left: 50%;
            transform: translate(-50.5%, -3%);
            width: 1217px;
            height: 300px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .grdDetalle{
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
        .hlkVolver{
            position: absolute;
            top: 10%;  
            left:1%;
            box-sizing: border-box;
            width: 150px;
            height: 34px;
            text-align: left;
            box-sizing: border-box;
            font-weight: bold;
            color: goldenrod;
        }
        .h1{
            padding: 0;
            margin: 0;
            text-align:center;
            position:absolute;
            top:20%;
            left:32.5%;
            color: #fff;
        }
        .lblMsjUsuario, .lblUsuario{
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
        </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="encabezado">
                <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label>
                <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
                <asp:HyperLink ID="hlHistorial" CssClass="hlkVolver" runat="server" NavigateUrl="~/HistorialComprasCliente.aspx">Volver al historial</asp:HyperLink>
                <h1 class="h1">DETALLES DE LA COMPRA</h1>
            </div>
        <div class="fondoGrilla">
            <asp:GridView ID="grdDetallesDeCompras" CssClass="grdDetalle" runat="server" OnPageIndexChanging="grdDetallesDeCompras_PageIndexChanging">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
