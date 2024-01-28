<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarProducto.aspx.cs" Inherits="Presentacion.EditarProducto" %>

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
        .cuadroEditar{
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
        .labels, .validadores, .lblMsjUsuario, .lblUsuario {
            font-weight:bold;
            color: #fff;
        }
        .textbox{
            width: 100%;
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
         .btnConfirmar, .btnCancelar{
            border: none;
            outline: none;
            height: 40px;
            width:140px;
            font-size: 16px;
            font-weight:bold;
            color: goldenrod;
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }
         .btnCancelar{
             position:absolute;
             left:58%
         }
         .btnConfirmar:hover, .btnCancelar:hover {
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
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="cuadroUsuario">
            <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label> <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
        </div>
        <div class="cuadroEditar">
           <asp:HyperLink ID="hlkVolver" CssClass="encabezadoVolver" runat="server" NavigateUrl="~/ABML_Productos.aspx">Volver</asp:HyperLink>
           <h1 class="h1">EDITAR PRODUCTO</h1>        
                <br />
                <br />
                <asp:Label ID="lblProd" CssClass="labels" runat="server" Text="Producto: "></asp:Label>
                <asp:Label ID="lblNombreProducto" CssClass="labels" runat="server" Text="Pan casero"></asp:Label>
                <br />         
                <br />
                <br />
                <asp:Label ID="lblCantidadUnitaria" CssClass="labels" runat="server" Text="Cantidad unitaria"></asp:Label>
                <br />
                <asp:TextBox ID="txtCantidadUnitaria" CssClass="textbox" runat="server" ValidationGroup="gEditar"></asp:TextBox>            
                <br />
                <br />              
                <asp:Label ID="lblPrecioUnitario" CssClass="labels" runat="server" Text="Precio unitario"></asp:Label>
                <br />            
                <asp:TextBox ID="txtPrecioUnitario" CssClass="textbox" runat="server" ValidationGroup="gEditar"></asp:TextBox>
                <br />         
                <br />         
                <asp:Label ID="lblStock" CssClass="labels" runat="server" Text="Stock"></asp:Label>
                <br />
                <asp:TextBox ID="txtStock" CssClass="textbox" runat="server" ValidationGroup="gEditar"></asp:TextBox>                
                <br />
                <br />
                <asp:Button ID="btnConfirmar" CssClass="btnConfirmar" runat="server"  Text="Confirmar" ValidationGroup="gEditar" OnClick="btnConfirmar_Click" />                
                <asp:Button ID="btnCancelar" CssClass="btnCancelar" runat="server"  Text="Cancelar" OnClick="btnCancelar_Click" />            
                <br />
                <br />
                <br />
                <asp:Label ID="lblMensaje" CssClass="labels" runat="server"></asp:Label>
                <br />
                <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" CssClass="validadores" ValidationGroup="gEditar">*Ingresar stock.</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecioUnitario" CssClass="validadores" ValidationGroup="gEditar">*Ingresar precio.</asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="rfvCantidad" runat="server" ControlToValidate="txtCantidadUnitaria" CssClass="validadores" ValidationGroup="gEditar">*Ingresar cantidad.</asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="cvStock" runat="server" CssClass="validadores" ControlToValidate="txtStock" Operator="GreaterThan" Type="Integer" ValidationGroup="gEditar" ValueToCompare="0">*Stock inválido.</asp:CompareValidator>
                <br />
                <asp:CompareValidator ID="cvPrecioUnitario" CssClass="validadores" runat="server" ControlToValidate="txtPrecioUnitario" Operator="GreaterThan" Type="Integer" ValidationGroup="gEditar" ValueToCompare="0">*Precio inválido.</asp:CompareValidator>
                <br />
         </div>
    </form>
</body>
</html>
