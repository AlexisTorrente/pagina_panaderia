<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agregar_Producto.aspx.cs" Inherits="Presentacion.Agregar_Producto" %>

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
        .cuadroAgregar{
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
        .ddlCategorias{
            width:150px;
        }
        .btnAgregar{
            border: none;
            outline: none;
            height: 40px;
            width:100%;
            font-size: 16px;
            font-weight:bold;
            color: goldenrod;
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }
        .btnAgregar:hover{
            background-color: red;
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
    </style>
</head>
<body class="body">   
    <form id="form1" runat="server">
     <div class="cuadroUsuario">
       <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label> <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
    </div>
        <div class="cuadroAgregar">            
            <asp:HyperLink ID="HyperLink1" CssClass="encabezadoVolver" runat="server" NavigateUrl="~/ABML_Productos.aspx">Volver al listado de productos</asp:HyperLink>
            <h1 class="h1">AGREGAR NUEVO PRODUCTO</h1>                                                  
            <br />
            <br />  
            <asp:Label ID="lblNombre" CssClass="labels" runat="server">Nombre:</asp:Label>                  
            <asp:TextBox ID="txtNombre" CssClass="textbox" runat="server" ValidationGroup="grupoAlta"></asp:TextBox>                
            <br />
            <br />                
            <asp:Label ID="lblCategoria" CssClass="labels" runat="server">Categoria:</asp:Label>                
            &nbsp;
            <asp:DropDownList ID="ddlCategorias" CssClass="ddlCategorias" runat="server" AutoPostBack="True" ValidationGroup="grupoAlta"></asp:DropDownList>                  
            <br />
            <br />             
            <br />               
            <asp:Label ID="lblCantidadUnidad" CssClass="labels" runat="server">Cantidad por unidad:</asp:Label>                 
            <asp:TextBox ID="txtCantidad" CssClass="textbox" runat="server" ValidationGroup="grupoAlta"></asp:TextBox>                                     
            <asp:Label ID="lblPrecioUnitario" CssClass="labels" runat="server">Precio unitario:</asp:Label>                    
            <asp:TextBox ID="txtPrecio" CssClass="textbox" runat="server" ValidationGroup="grupoAlta"></asp:TextBox>                                   
            <asp:Label ID="lblStock" CssClass="labels" runat="server">Stock disponible:</asp:Label>                   
            <asp:TextBox ID="txtStock" CssClass="textbox" runat="server" ValidationGroup="grupoAlta"></asp:TextBox>                                      
            <asp:Button ID="btnAgregarProducto" CssClass="btnAgregar" runat="server"  Text="Agregar producto" ValidationGroup="grupoAlta" OnClick="btnAgregarProducto_Click" />                   
            <br />
            <br />                    
            <br />
            <asp:Label ID="lblMensaje" CssClass="labels" runat="server"></asp:Label>                   
            <br />
            <br />                   
            <asp:RequiredFieldValidator ID="rfvNOmbre" CssClass="validadores" runat="server" ControlToValidate="txtNombre" ValidationGroup="grupoAlta">*Ingrese un nombre</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvCategorias" CssClass="validadores" runat="server" ControlToValidate="ddlCategorias" ValidationGroup="grupoAlta">*Seleccione una categoría</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvCantidad" CssClass="validadores" runat="server" ControlToValidate="txtCantidad" ValidationGroup="grupoAlta">*Ingrese una cantidad</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvPrecio" CssClass="validadores" runat="server" ControlToValidate="txtPrecio" ValidationGroup="grupoAlta">*Ingrese un precio</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvStock" CssClass="validadores" runat="server" ControlToValidate="txtStock" ValidationGroup="grupoAlta">*Ingrese stock</asp:RequiredFieldValidator>               
            
            <br />
            <asp:CompareValidator ID="cvPrecio" runat="server" ControlToValidate="txtPrecio" CssClass="validadores" Operator="GreaterThan" Type="Integer" ValidationGroup="grupoAlta" ValueToCompare="0">*Precio inválido.</asp:CompareValidator>
            <br />
            <asp:CompareValidator ID="cvStock" runat="server" ControlToValidate="txtStock" CssClass="validadores" Operator="GreaterThan" Type="Integer" ValidationGroup="grupoAlta" ValueToCompare="0">*Stock inválido.</asp:CompareValidator>
            
                </div>
   </form>
</body>
</html>