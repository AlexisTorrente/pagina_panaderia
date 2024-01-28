<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgradecimientoCompra.aspx.cs" Inherits="Presentacion.AgradecimientoCompra" %>

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
            top: 52%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 480PX;
            height: 730px;
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
        
        .auto-style1 {
             padding: 0;
            margin: 0;
            text-align: center;
            color: #fff;
            font-size: 26pt;
        }
        
        .auto-style2 {
            top: 100%;
            left:55px;
            height: 247px;
            width: 480px;
        }
        
        .auto-style3 {
            padding: 0;
            margin: 0;
            text-align: center;
            color: #fff;
            font-size: 29pt;
        }
        
        </style>
</head>
<body class="body"> 
    <form id="form1" runat="server">
        <div class="cuadroUsuario">
            <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label> <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
        </div>
        <div class="cuadroReportes">            
            <h1 class="auto-style3">¡Gracias por tu compra!</h1>
            <p class="h1">&nbsp;</p>
            <p class="h1">&nbsp;</p>
            <h1 class="auto-style1">La transacción se completó con éxito y su pedido está en preparación. Pronto será redirigido automáticamente hacia la página de productos.</h1>
            <p class="h1">&nbsp;</p>
            <div class="auto-style2">
&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/Imagenes/PreparacionGif.gif" Width="360px" BorderColor="#663300" BorderStyle="Solid" />
            </div>
            <p class="h1">&nbsp;</p>
            <br />
            &nbsp;&nbsp;
            <br />
            <br />
            <br />
            <br />
            <br />            
            <br />
            <br />
            <br />
            <br />            
            <br />
            <br />
            <br />
            <br />            
            <br />
            <br />            
            <br />
            <br />
            <br />
        </div>
     </form>
</body>
</html>
