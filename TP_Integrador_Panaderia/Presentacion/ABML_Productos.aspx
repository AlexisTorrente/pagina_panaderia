<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABML_Productos.aspx.cs" Inherits="Presentacion.ABML_Productos" %>

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
            height: 280px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .fondoGrilla{
            position: absolute;
            top: 39%;
            left: 50%;
            transform: translate(-50.5%, -3%);
            width: 1217px;
            height: 300px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .grdProductos{
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
        .btnAgregarProducto, .btnFiltroCategoria, .btnFiltroNombre, .btnQuitarFiltro, .btnAceptar, .btnCancelar, .btnEditar, .btnEliminar{
            position: absolute;           
            box-sizing: border-box;
            width: 105px;
            height: 34px;
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
        }
        .btnFiltroNombre{
            top:75%;
            left:260px;
        }
        .btnFiltroCategoria{
            top:75%;
            left:685px;
        }
        .btnQuitarFiltro{
            top:75%;
            left:850px;
            width:115px;
        }
        .btnAgregarProducto{
            top:75%;
            left:1020px;
            width:180px;
        }
        .btnAceptar{
            top:55%;
            left:475px;
        }
        .btnCancelar{
            top:55%;
            left:600px;
        }
       .btnFiltroCategoria:hover, .btnFiltroNombre:hover, .btnAgregarProducto:hover, .btnQuitarFiltro:hover, .btnAceptar:hover, .btnCancelar:hover{
            background-color: red;
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
        .lblNombre, .lblCategoria, .lblMsjUsuario, .lblUsuario, .lblMensaje, .lblProducto{
            font-weight:bold;
            color: #fff;
            position:absolute;
            top:78%;
        }
        .lblNombre{
            left:0%;
        }
        .lblCategoria{
            left:400px;
        }
        .lblMensaje{
            top:58%;
            left:0%;
        }
        .lblProducto{
            top:70%;
            left:97px;
        }
        .ddlCategorias{
            position:absolute;
            top:78%;
            left:550px;
            width:125px;
        }
        .txtFiltroNombre{
            position:absolute;
            top:78%;
            left:145px;
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
            height: 20px;
            width:100px;
            color: #fff;
            font-size:14px;
            background-color:transparent;
        }    
        .hlkHistorial, .hlkReportes, .hlkCerrarSesion{
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
        .hlkHistorial{
            left:100px;
        }
        .hlkCerrarSesion{
            left:180px;
            width:112px;
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
    <form  id="form1" runat="server">                         
        <div class="encabezado">
            <asp:Label ID="lblMensajeUsuario" CssClass="lblMsjUsuario" runat="server" Text="Usuario: " ></asp:Label>
            <asp:Label ID="lblUsuario" CssClass="lblUsuario" runat="server" Text="Francisco Madoery" ></asp:Label>
            <asp:HyperLink ID="hlkReportes" CssClass="hlkReportes" runat="server" NavigateUrl="~/Reportes.aspx">Reportes</asp:HyperLink>
            <asp:HyperLink ID="hlkHistorial" CssClass="hlkHistorial" runat="server" NavigateUrl="~/HistorialComprasEmpleado.aspx">Historial</asp:HyperLink>
            <asp:HyperLink ID="hlkCerrarSesion" CssClass="hlkCerrarSesion" runat="server" NavigateUrl="~/SeleccionUsuario.aspx">Cerrar Sesión</asp:HyperLink>               
            <h1 class="h1">LISTADO DE PRODUCTOS</h1>                    
            <asp:Label ID="lblFiltroNombreProducto" CssClass="lblNombre" runat="server">Filtrar por nombre:</asp:Label>
            <asp:TextBox ID="txtFiltroNombreProducto" CssClass="txtFiltroNombre" placeholder="Nombre" runat="server"></asp:TextBox>
            <asp:Button ID="btnFiltrarNombreProducto" CssClass="btnFiltroNombre" runat="server" Text="Aceptar" OnClick="btnFiltrarNombreProducto_Click" />            
            <asp:Label ID="lblFiltroCategoria" CssClass="lblCategoria" runat="server">Filtrar por categoria:</asp:Label>
            <asp:DropDownList ID="ddlCategoriasProductos" CssClass="ddlCategorias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoriasProductos_SelectedIndexChanged1"></asp:DropDownList>
            <asp:Button ID="btnFiltrarCategoriaProducto" CssClass="btnFiltroCategoria" runat="server" Text="Aceptar" OnClick="btnFiltrarCategoriaProducto_Click"/>
            <asp:Button ID="btnQuitarFiltro" CssClass="btnQuitarFiltro" runat="server" Text="Quitar Filtros" OnClick="btnQuitarFiltro_Click"/>
            <asp:Button ID="btnAgregarProductos" CssClass="btnAgregarProducto" runat="server" Text="Agregar nuevos productos" OnClick="btnAgregarProductos_Click"/>
            <asp:Label ID="lblMensaje" CssClass="lblMensaje" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblProducto" CssClass="lblProducto" runat="server" Visible="false"></asp:Label>
            <asp:Button ID="btnConfirmar" CssClass="btnAceptar" runat="server"  Text="Confirmar" Visible="False" OnClick="btnConfirmar_Click" />
&nbsp;      <asp:Button ID="btnCancelar" CssClass="btnCancelar" runat="server"  Text="Cancelar" Visible="False" OnClick="btnCancelar_Click" />
        </div>
        <div class="fondoGrilla">
                    <asp:GridView ID="grdProductos" CssClass="grdProductos" runat="server" AllowPaging="True" OnPageIndexChanging="grdProductos_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandArgument='<%# Eval("id")+"-"+Eval("producto")+"-"+Eval("cantidad por unidad")+"-"+Eval("precio unitario")+"-"+Eval("stock") %>' CommandName="eventoEditar" OnCommand="btnEditar_Command1" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEliminarProducto" runat="server" Text="Eliminar" CommandArgument='<%# Eval("id")+"-"+Eval("producto") %>' CommandName="eventoEliminar" OnCommand="btnEliminarProducto_Command" />                 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnHabilitarProducto" runat="server" Text="Habilitar" CommandArgument='<%# Eval("id") %>' CommandName="eventoHabilitar" OnCommand="btnHabilitarProducto_Command" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
    </form>
</body>
</html>