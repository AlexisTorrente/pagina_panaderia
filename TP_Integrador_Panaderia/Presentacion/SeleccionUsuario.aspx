<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionUsuario.aspx.cs" Inherits="Presentacion.SeleccionUsuario" %>

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
        .cuadroSeleccion{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 450px;
            height: 300px;
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
        .btnEmpleado{
           border-style: none;
            border-color: inherit;
            border-width: medium;
            outline: none;
            font-size: 16px;
            font-weight:bold;
            float:left;
            color: goldenrod;
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }
        .btnCliente{
            border-style: none;
            border-color: inherit;
            border-width: medium;
            outline: none;
            font-size: 16px;
            font-weight:bold;
            float:right;
            color: goldenrod;
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }

        .btnEmpleado:hover, .btnCliente:hover {
            background-color: red;
        }

        </style>
</head>
<body class="body">
        <div class="cuadroSeleccion">
            <form id="form1" runat="server">
                <h1 class="h1">¡Bienvenido!</h1>
                <h2 class="h1">&nbsp;</h2>
                <h2 class="h1">Seleccione su tipo de usuario:</h2>
                <p class="h1">&nbsp;</p>               
                <asp:Button ID="btnEmpleado" CssClass="btnEmpleado" runat="server" Text="Empleado" Width="185px" Height="35px" OnClick="btnEmpleado_Click"/>
                <asp:Button ID="btnCliente" CssClass="btnCliente" runat="server" Text="Cliente" Width="185px" Height="35px" OnClick="btnCliente_Click"/>
            </form>
        </div>    
</body>
</html>