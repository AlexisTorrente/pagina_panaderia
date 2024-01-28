<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaveMaestra.aspx.cs" Inherits="Presentacion.ClaveMaestra" %>

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
        .cuadroClaveMaestra{
                position:absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 350px;
                height: 320px;
                padding: 80px 40px;
                box-sizing: border-box;
                background: rgba(0,0,0,0.6);            
        }
        .labels, .rfvClaveMaestra{
            font-weight:bold;
            color: #fff;
        }
        .txtClaveMaestra{
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


        .auto-style1 {
            position: absolute;
            top: 0%;
            left: 1%;
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
    <div class="cuadroClaveMaestra">
        <asp:HyperLink ID="hlkIniciarSesion" CssClass="auto-style1" runat="server" NavigateUrl="~/LoginEmpleado.aspx">Volver</asp:HyperLink>
        <form id="form1" runat="server">

                        <asp:Label ID="lblClaveMaestra" CssClass="labels" runat="server" Text="Ingrese la clave maestra:"></asp:Label>
                    
                        <asp:TextBox ID="txtClaveMaestra" CssClass="txtClaveMaestra" placeholder="*********" runat="server" TextMode="Password"></asp:TextBox>
                                           
                        <asp:Button ID="btnConfirmarCM" CssClass="btnConfirmar" runat="server" Text="Confirmar" Height="29px" Width="276px" OnClick="btnConfirmarCM_Click"/>

                        <br />
                        <br />
                        <br />

                         <asp:Label ID="lblMensajeCM" CssClass="labels" runat="server"></asp:Label>

                        <br />
                        <br />
                        <br />

                        <asp:RequiredFieldValidator ID="rfvClaveMaestra" CssClass="rfvClaveMaestra" runat="server" ErrorMessage="*Este campo es obligatorio" ControlToValidate="txtClaveMaestra"></asp:RequiredFieldValidator>
                    
            </form>    
        </div>
      
</body>
</html>
