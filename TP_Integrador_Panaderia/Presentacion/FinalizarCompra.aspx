<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinalizarCompra.aspx.cs" Inherits="Presentacion.FinalizarCompra" %>

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
        .cuadroFinalizar{
            position: absolute;
            top: 75%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 420px;
            height: 800px;
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
        .labels, .titulos, .lblMsjUsuario, .lblUsuario {
            font-weight:bold;
            color: #fff;
        }
        .titulos{
            font-size:large;
        }
        .textbox{
            width: 50%;
            margin-bottom: 20px;
            border: none;
            border-bottom:2px solid #fff;
            outline: none;
            height: 40px;
            color: #fff;
            font-size:16px;
            background-color:transparent;

        }
         .encabezadoVolver {
            position: absolute;
            top: 0.5%;
            left: 1%;
            box-sizing: border-box;
            width: 251px;
            height: 34px;
            text-align: left;
            box-sizing: border-box;
            font-weight: bold;
            color: goldenrod;
        }
        .btnConfirmar, .btnSi, .btnNo, .btnCancelar{
            border-style: none;
            border-color: inherit;
            border-width: medium;
            width:140px;         
            height:40px;
            outline: none;
            font-size: 16px;
            font-weight:bold;
            color: goldenrod;
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }
        .btnCancelar{
            left:58%;
        }
        .btnSi, .btnNo{
            width:30px;
            height:30px;
            border-radius:12px;
        }
        .btnConfirmar:hover, .btnNo:hover, .btnSi:hover, .btnCancelar:hover{
            background-color: red;
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
        .ddlMetodoPago{
            font-weight:bold;
            background-color:#fff;
            color:black;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="cuadroUsuario">
            <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label> <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
        </div>
        <div class="cuadroFinalizar">           
            <asp:HyperLink ID="hlkCarrito" CssClass="encabezadoVolver" runat="server" NavigateUrl="~/Carrito.aspx">Volver al carrito</asp:HyperLink>
            <h1 class="h1">FINALIZAR COMPRA</h1> 
            <br />
            <br />
            <br />
            <asp:Label ID="lblMetodoPago" CssClass="titulos" runat="server">Seleccione su método de pago:</asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="ddlMetodoPago" CssClass="ddlMetodoPago" Width="125px" runat="server" Font-Bold="False"></asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:Label ID="lblDireccion" CssClass="titulos"  runat="server">Dirección de entrega:</asp:Label>                                     
            <br />                                     
            <br />                                    
            <asp:RadioButtonList ID="rblEntrega" CssClass="labels" runat="server" OnSelectedIndexChanged="rblEntrega_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Selected="True">Retiro en el local</asp:ListItem>
                <asp:ListItem>Domicilio del cliente</asp:ListItem>
                <asp:ListItem>Otra</asp:ListItem>
            </asp:RadioButtonList>                    
            &nbsp;&nbsp;<asp:TextBox ID="txtDireccionEntrega" CssClass="textbox" runat="server" placeholder="Dirección" Visible="False"></asp:TextBox>                     
            <br />
            <br />
            <br />                       
            <asp:Label ID="Label1" CssClass="titulos" runat="server">TOTAL:</asp:Label>
            &nbsp;<asp:Label ID="lblTotal" CssClass="titulos" runat="server"></asp:Label>                  
            <br />
            <br />                   
            <br />
            <br />                   
            <asp:Button ID="btnConfirmarCompra" CssClass="btnConfirmar" runat="server" OnClick="btnConfirmarCompra_Click" Text="Confirmar" />  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
            <asp:Button ID="btnCancelarCompra" CssClass="btnCancelar" runat="server" OnClick="btnCancelarCompra_Click" Text="Cancelar" />
            <br />
            <br />                        
            <br />                        
            <asp:Label ID="lblMensaje" CssClass="labels" runat="server"></asp:Label> 
            &nbsp; 
            <asp:Button ID="btnSi" CssClass="btnSi" runat="server" OnClick="btnSi_Click" Text="Si" Visible="False" />
            &nbsp;&nbsp;
            <asp:Button ID="btnNo" CssClass="btnNo" runat="server" OnClick="btnNo_Click" Text="No" Visible="False" />
            <br />
            <asp:Label ID="lblError" CssClass="labels" runat="server"></asp:Label>
            &nbsp;&nbsp;
            
        </div>
    </form>
</body>
</html>