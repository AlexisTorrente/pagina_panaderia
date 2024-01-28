<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginEmpleado.aspx.cs" Inherits="Presentacion.LoginEmpleado" %>

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
        .cuadroLogIn{
            position:absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 370px;
            height: 480px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.6);            
        }
        .labels, .mensajeRegistro, .validadores{
            font-weight:bold;
            color: #fff;
        }
        .txtUsuario, .txtClave, .btnConfirmar{
            width: 100%;
            margin-bottom: 20px;
        }
        .txtClave, .txtUsuario{
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
            height: 40px;
            color: #fff;
            font-size:16px;
            background-color:transparent;
        }
        .btnConfirmar{
            border: none;
            outline: none;
            height: 40px;
            font-size: 16px;
            font-weight:bold;
            color: goldenrod;
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }
        .btnConfirmar:hover{
            background-color: red;
        }
        .h1{
            padding: 0;
            margin: 0;
            text-align: center;
            color: #fff;
        }
        .hlkNuevoUsuario{
            font-weight:bold;
            color: goldenrod;
        }
        
        .encabezadoVolver {
            position: absolute;
            top: 0%;
            left: 0%;
            box-sizing: border-box;
            width: 251px;
            height: 34px;
            text-align: left;
            box-sizing: border-box;
            font-weight: bold;
            color: goldenrod;
        }
        
    </style>    
</head>
<body class="body">
    <div class="cuadroLogIn">
        <asp:HyperLink ID="hlkSeleccionUsuario" CssClass="encabezadoVolver" runat="server" NavigateUrl="~/SeleccionUsuario.aspx">Selección de usuario</asp:HyperLink>
        <h1 class="h1">Iniciar sesión</h1>
        <br />
        <form id="form2" runat="server">
                <asp:Label ID="lblUsuario" CssClass="labels" runat="server">Email</asp:Label>               
                <asp:TextBox ID="txtUsuario" CssClass="txtUsuario" placeholder="Email" runat="server" TextMode="Email"></asp:TextBox>                     
                <br />
                <br />                
                <asp:Label ID="lblClave" CssClass="labels"  runat="server">Contraseña</asp:Label>
                <asp:TextBox ID="txtClave" CssClass="txtClave" placeholder="*********" runat="server" TextMode="Password"></asp:TextBox>               
                <br />
                <asp:Button ID="btnConfirmar" CssClass="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
                <span class="mensajeRegistro">Registre un nuevo usuario
                </span>
                <asp:HyperLink ID="hlkNuevoUsuario" CssClass="hlkNuevoUsuario" runat="server" NavigateUrl="~/ClaveMaestra.aspx" Font-Underline="True"> aquí</asp:HyperLink> 
                <br />
                <br />
                <asp:Label ID="lblMensaje" CssClass="labels" runat="server"></asp:Label>

                <br />

                 
                <br />
                <asp:RequiredFieldValidator ID="rfvCorreo" CssClass="validadores" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*Ingrese un email"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="rfvClave" CssClass="validadores" runat="server" ControlToValidate="txtClave" ErrorMessage="*Ingrese una contraseña"></asp:RequiredFieldValidator>
        </form>
    </div>
</body>
</html>