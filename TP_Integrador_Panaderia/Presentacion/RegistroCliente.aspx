<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroCliente.aspx.cs" Inherits="Presentacion.RegistroCliente" %>

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
            vertical-align: top;

        }
        .cuadroRegistro{
            position: absolute;
            top: 85%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 420px;
            height: 1100px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.6);            
        }
        .encabezadoVolver {
            position:absolute;
            top: 2%;
            left: 1%;
            box-sizing: border-box;
            width: 251px;
            height: 34px;
            text-align: left;
            box-sizing: border-box;
            font-weight: bold;
            color: goldenrod;
        }
        .h1{
            padding: 0;
            margin: 0;
            text-align: center;
            color: #fff;

        }
        .labels, .validadores, .lblUsuario, .lblMsjUsuario {
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
       .btnConfirmar{
            border-style: none;
            border-color: inherit;
            border-width: medium;
            outline: none;
            font-size: 16px;
            font-weight:bold;
            color: goldenrod;
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }
        .btnConfirmar:hover {
            background-color: red;
        }
        
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="cuadroRegistro">

            <asp:HyperLink ID="hlkIniciarSesion2" CssClass="encabezadoVolver" runat="server" NavigateUrl="~/LoginCliente.aspx">Volver</asp:HyperLink>
            
            <h1 class="h1">Registrarse</h1>
       
            <asp:Label ID="lblDni" CssClass="labels"  runat="server" Text="DNI:" ></asp:Label>
            <asp:TextBox ID="txtDni" CssClass="textbox" runat="server"></asp:TextBox>

            
            <asp:Label ID="lblNombre" CssClass="labels" runat="server" Text="Nombre:" ></asp:Label>
               
            <asp:TextBox ID="txtNombre" CssClass="textbox" runat="server"></asp:TextBox>

            
             <asp:Label ID="lblApellido" CssClass="labels" runat="server" Text="Apellido:" ></asp:Label>
            <asp:TextBox ID="txtApellido" CssClass="textbox" runat="server" ></asp:TextBox>

            
            <asp:Label ID="lblTelefono" CssClass="labels" runat="server" Text="Número de teléfono:"></asp:Label>
            <asp:TextBox ID="txtNumeroTelefono" CssClass="textbox" runat="server"></asp:TextBox>

            
             <asp:Label ID="lblDireccion" CssClass="labels" runat="server" Text="Dirección:" ></asp:Label>
            <asp:TextBox ID="txtDireccion" CssClass="textbox" runat="server"></asp:TextBox>

            
           <asp:Label ID="lblCorreo" CssClass="labels" runat="server" Text="Correo Electrónico:" ></asp:Label>
            <asp:TextBox ID="txtCorreo" CssClass="textbox" runat="server" TextMode="Email"></asp:TextBox>

           
            <asp:Label ID="lblClave" CssClass="labels" runat="server" Text="Clave:" ></asp:Label>
            <asp:TextBox ID="txtClave" CssClass="textbox" runat="server" TextMode="Password"></asp:TextBox>

            
            <asp:Label ID="lblClaveRep" CssClass="labels" runat="server" Text="Repetir Clave:" ></asp:Label>
            <asp:TextBox ID="txtRepetirClave" CssClass="textbox" runat="server" TextMode="Password"></asp:TextBox>

            
          
            <asp:Button ID="btnConfirmar" CssClass="btnConfirmar" runat="server" Text="Confirmar" Width="346px" Height="35px" OnClick="btnConfirmar_Click" />
         
            <br />
         
            <asp:Label ID="lblMensaje" CssClass="labels" runat="server"></asp:Label>

            <br />
            <br />

            <asp:RequiredFieldValidator ID="rfvDni" CssClass="validadores" runat="server" ControlToValidate="txtDni">*Ingrese un dni</asp:RequiredFieldValidator>
            <br />
            <asp:RangeValidator ID="rvDni" CssClass="validadores" runat="server" ControlToValidate="txtDni" MaximumValue="99999999" MinimumValue="1000000" Type="Double">*Dni inválido.</asp:RangeValidator>    
            <br />
           <asp:RequiredFieldValidator ID="rfvNombre" CssClass="validadores" runat="server" ControlToValidate="txtNombre">*Ingrese un nombre</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvApellido" CssClass="validadores" runat="server" ControlToValidate="txtApellido" >*Ingrese un apellido</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvNumeroTelefono" CssClass="validadores" runat="server" ControlToValidate="txtNumeroTelefono">*Ingrese un teléfono</asp:RequiredFieldValidator>
            <br />
            <asp:RangeValidator ID="rvTelefono" runat="server" CssClass="validadores" ControlToValidate="txtNumeroTelefono" MaximumValue="9999999999" MinimumValue="0000000000" Type="Double">*Telefono inválido.</asp:RangeValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvDireccion" CssClass="validadores" runat="server" ControlToValidate="txtDireccion">*Ingrese una direeción</asp:RequiredFieldValidator>
             <br />
             <asp:RequiredFieldValidator ID="rfvCorreo" CssClass="validadores" runat="server" ControlToValidate="txtCorreo">*Ingrese un email</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvClave" CssClass="validadores" runat="server" ControlToValidate="txtClave">*Ingrese una clave</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvRepetirClave" runat="server" ControlToValidate="txtRepetirClave" CssClass="validadores">*Repetir clave.</asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="cvClave" CssClass="validadores" runat="server" ControlToCompare="txtClave" ControlToValidate="txtRepetirClave">*Las claves no coinciden.</asp:CompareValidator>
         </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
