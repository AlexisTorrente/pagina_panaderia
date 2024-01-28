<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionProductos.aspx.cs" Inherits="Presentacion.SeleccionProductos" %>

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
            width: 1218px;
            height: 160px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .fondoGrilla{
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50.5%, -3%);
            width: 1217px;
            height: 815px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.62);            
        }
        .DataList{
            position: absolute;
            top: 38%;
            left: 90%;
        }
        .lvProductos{
            position: fixed;
            top: 30%;
            left: 50%;
            transform: translate(-50%, 0%);
            width: 1217px;
            box-sizing: border-box;
            background-color:transparent;
            text-align: center;
            color: #fff;
            font-weight:bold;
        }
       .btnFiltroNombre, .btnQuitarFiltro{
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
            left:30%;
        }
        .btnQuitarFiltro{
            top:75%;
            left:58%;
            width:155px;
        }
        .imgbtnCarrito{
            position: absolute;           
            box-sizing: border-box;
            width: 52px;
            height: 50px;
            box-sizing: border-box;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            outline: none;
            float:left;
            cursor: pointer;
            border-radius: 10px;
            transition: .3s ease-in-out;
            top:71%;
            left:85%;
            background-color:ghostwhite;
        }
  
       .btnFiltroNombre:hover, .btnQuitarFiltro:hover, .imgbtnCarrito:hover{
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
        .lblNombre, .lblMsjUsuario, .lblUsuario, .lblMensaje{
            font-weight:bold;
            color: #fff;
            position:absolute;
            top:78%;
            left:5%;
        }
        .lblMensaje{
            top:78%;
            left:39%;
        }
        .txtFiltroNombre{
            position:absolute;
            top:78%;
            left:17%;
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
            height: 20px;
            width:145px;
            color: #fff;
            font-size:14px;
            background-color:transparent;
        }    
        .hlkHistorial, .hlkCerrarSesion{
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
        .hlkCerrarSesion:hover, .hlkHistorial:hover{
            color:orangered;
        }
        .hlkCerrarSesion{
            left:110px;
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
       
        .auto-style10 {
            margin-left: 1327px;
            margin-top: 0px;
        }
       
        .auto-style11 {
            position: absolute;
            top: 11%;
            left: 84%;
            width: 169px;
            height: 650px;
        }
               
        .auto-style9 {
            margin-top: 0px;
        }
               
        .auto-style12 {
            text-decoration: underline;
        }
               
        .auto-style13 {
            padding: 0;
            margin: 0;
            text-align: center;
            position: absolute;
            top: 20%;
            left: 32%;
            color: #fff;
        }
        .auto-style14 {
            position: absolute;
            box-sizing: border-box;
            width: 105px;
            height: 34px;
            text-align: center;
            outline-width: medium;
            outline-style: none;
            outline-color: invert;
            font-size: 12px;
            font-weight: bold;
            float: left;
            color: goldenrod;
            cursor: pointer;
            border-radius: 15px;
            transition: .3s ease-in-out;
            top: 58%;
            left: 31%;
            border-style: none;
            border-color: inherit;
            border-width: medium;
        }
        .auto-style14:hover{
            color:wheat;
            background-color:goldenrod;
              
        }
        .auto-style15 {
            position: absolute;
            box-sizing: border-box;
            width: 155px;
            height: 34px;
            text-align: center;
            outline-width: medium;
            outline-style: none;
            outline-color: invert;
            font-size: 12px;
            font-weight: bold;
            float: left;
            color: goldenrod;
            cursor: pointer;
            border-radius: 15px;
            transition: .3s ease-in-out;
            top: 60%;
            left: 61%;
            border-style: none;
            border-color: inherit;
            border-width: medium;
        }
        .auto-style15:hover{
             color:wheat;
            background-color:goldenrod;
        }
      
        .auto-style16 {
            position: absolute;
            top: 59%;
            left: 18%;
            border-bottom: 2px solid #fff;
            outline: none;
            height: 20px;
            width: 145px;
            color: #fff;
            font-size: 14px;
            background-color: transparent;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
        }
        .auto-style18 {
            font-weight: bold;
            color: #fff;
            position: absolute;
            top: 63%;
            left: 5%;
        }
               
        .auto-style19 {
            font-weight: bold;
            color: #fff;
            position: absolute;
            top: 10%;
            left: 987px;
        }
        .auto-style20 {
            font-weight: bold;
            color: #fff;
            position: absolute;
            top: 10%;
            left: 1056px;
        }
       
        .auto-style21 {
            margin-left: 1018px;
            margin-right: 0px;
            box-sizing: border-box;
            border-radius: 10px;
            background-color:white;
            cursor: pointer;

        }
        .auto-style21:hover{
            background-color:goldenrod;

        }
       
        .botonCategoria{
            color:#663300;
            background-color:#996633;
            cursor: pointer;

        }
        .botonCategoria:hover{
            color:orange;
            background-color:saddlebrown;
        }
       .btnListView{
           color:white;
           background-color:#8C5E2F;
           cursor: pointer;
           font:bold;

       }
       .btnListView:hover{
           background-color:saddlebrown;
       }

        .auto-style22 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
            font-weight: bold;
        }
        .auto-style23 {
            font-size: x-large;
        }
        .auto-style24 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: large;
        }
        .auto-style25 {
            font-size: large;
        }
        .auto-style26 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }

        </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="encabezado">
            <asp:Label ID="lblMensajeUsuario" CssClass="auto-style19" runat="server" Text="Usuario: " ></asp:Label>
            <asp:Label ID="lblUsuario" CssClass="auto-style20" runat="server" Text="Francisco Madoery" ></asp:Label>
            <asp:HyperLink ID="hlkHistorial" CssClass="hlkHistorial" runat="server" NavigateUrl="~/HistorialComprasCliente.aspx">Historial</asp:HyperLink>
            <asp:HyperLink ID="hlkCerrarSesion" CssClass="hlkCerrarSesion" runat="server" NavigateUrl="~/SeleccionUsuario.aspx">Cerrar Sesión</asp:HyperLink>         
            <h1 class="auto-style13">LISTADO DE PRODUCTOS</h1>
            <asp:Label ID="lblFiltroNombreProducto" CssClass="auto-style18" runat="server">Buscar producto:</asp:Label>
            <asp:TextBox ID="txtBuscarProducto" CssClass="auto-style16" runat="server"></asp:TextBox>
           <asp:Button ID="btnbuscar" CssClass="auto-style14" runat="server" Text="Buscar" OnClick="btnbuscar_Click" />
            <asp:Button ID="btnTodosLosProductos" CssClass="auto-style15" runat="server" OnClick="btnTodosLosProductos_Click" Text="Ver todos los productos" />
            
            <asp:ImageButton ID="imgbtnCarrito" runat="server" CssClass="auto-style21" Height="60px" ImageUrl="~/Imagenes/carritoicon.png" PostBackUrl="~/Carrito.aspx" Width="66px" />
            
            </div>
            <div class="fondoGrilla" aria-pressed="undefined">
                <div class="auto-style11" style="border-style: solid; border-color: #663300; background-color: #FFCC66">
                    <br class="auto-style12" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style12"><strong>Categorías</strong></span>:<br class="auto-style12" />
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" CssClass="auto-style9" Height="267px" Width="216px">
                <ItemTemplate>
                    &nbsp;
                    <asp:Button ID="btnCategoria" runat="server" CommandArgument='<%# Eval("nombre") %>' CommandName="Evento Categoria" OnCommand="btnCategoria_Command" Text='<%# Eval("nombre") %>' Height="25px" Width="150px" Font-Bold="True" ForeColor="White" CssClass="botonCategoria" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
                    <br />
                    <br />
                &nbsp;&nbsp;
                    <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                </div>
                <asp:ListView ID="lvProductos" runat="server" DataKeyNames="id" GroupItemCount="4" >
           <%--         <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FFF8DC;">id:
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            <br />nombre:
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <br />idCategoria:
                            <asp:Label ID="idCategoriaLabel" runat="server" Text='<%# Eval("idCategoria") %>' />
                            <br />cantidadUnitaria:
                            <asp:Label ID="cantidadUnitariaLabel" runat="server" Text='<%# Eval("cantidadUnitaria") %>' />
                            <br />precioUnitario:
                            <asp:Label ID="precioUnitarioLabel" runat="server" Text='<%# Eval("precioUnitario") %>' />
                            <br />stock:
                            <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                            <br />
                            <asp:CheckBox ID="habilitadoCheckBox" runat="server" Checked='<%# Eval("habilitado") %>' Enabled="false" Text="habilitado" />
                            <br />imagenURL:
                            <asp:Label ID="imagenURLLabel" runat="server" Text='<%# Eval("imagenURL") %>' />
                            <br /></td>
                    </AlternatingItemTemplate>--%>
                    <EditItemTemplate>
                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">id:
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            <br />nombre:
                            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            <br />idCategoria:
                            <asp:TextBox ID="idCategoriaTextBox" runat="server" Text='<%# Bind("idCategoria") %>' />
                            <br />cantidadUnitaria:
                            <asp:TextBox ID="cantidadUnitariaTextBox" runat="server" Text='<%# Bind("cantidadUnitaria") %>' />
                            <br />precioUnitario:
                            <asp:TextBox ID="precioUnitarioTextBox" runat="server" Text='<%# Bind("precioUnitario") %>' />
                            <br />stock:
                            <asp:TextBox ID="stockTextBox" runat="server" Text='<%# Bind("stock") %>' />
                            <br />
                            <asp:CheckBox ID="habilitadoCheckBox" runat="server" Checked='<%# Bind("habilitado") %>' Text="habilitado" />
                            <br />imagenURL:
                            <asp:TextBox ID="imagenURLTextBox" runat="server" Text='<%# Bind("imagenURL") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            <br /></td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No se han devuelto datos.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
<td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">nombre:
                            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            <br />idCategoria:
                            <asp:TextBox ID="idCategoriaTextBox" runat="server" Text='<%# Bind("idCategoria") %>' />
                            <br />cantidadUnitaria:
                            <asp:TextBox ID="cantidadUnitariaTextBox" runat="server" Text='<%# Bind("cantidadUnitaria") %>' />
                            <br />precioUnitario:
                            <asp:TextBox ID="precioUnitarioTextBox" runat="server" Text='<%# Bind("precioUnitario") %>' />
                            <br />stock:
                            <asp:TextBox ID="stockTextBox" runat="server" Text='<%# Bind("stock") %>' />
                            <br />
                            <asp:CheckBox ID="habilitadoCheckBox" runat="server" Checked='<%# Bind("habilitado") %>' Text="habilitado" />
                            <br />imagenURL:
                            <asp:TextBox ID="imagenURLTextBox" runat="server" Text='<%# Bind("imagenURL") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br /></td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="border: medium solid #663300; background-color:#FFCC66; color: #000000;">
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="135px" ImageUrl='<%# Eval("imagenURL") %>' Width="220px" BorderColor="#663300" BorderStyle="Solid" />
                            <br />
                            <span class="auto-style24"><b>&nbsp;&nbsp;
                            <asp:Label ID="nombreLabel" runat="server" CssClass="auto-style25" Text='<%# Eval("nombre") %>'></asp:Label>
                            </b>&nbsp;<b><asp:Label ID="cantidadUnitariaLabel" runat="server" CssClass="auto-style25" Text='<%# Eval("cantidadUnitaria") %>'></asp:Label>
                            </b></span>
                            <br class="auto-style26" />&nbsp;<span class="auto-style22"> &nbsp;&nbsp;&nbsp; $<asp:Label ID="precioUnitarioLabel" runat="server" CssClass="auto-style23" Text='<%# Eval("precioUnitario") %>'></asp:Label>
                            </span>
                            <br />&nbsp;Stock disponible: <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                            <br />
                            &nbsp;Cantidad:&nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="18px" Width="75px"></asp:TextBox>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" CssClass="btnListView" Text="Agregar al carrito" Height="30px" Width="150px" CommandArgument='<%# Eval("id")+"-"+Eval("nombre")+"-"+Eval("idCategoria")+"-"+Eval("cantidadUnitaria")+"-"+Eval("precioUnitario")+"-"+Eval("stock")+"-"+Eval("habilitado")+"-"+Eval("imagenURL") %>' CommandName="Evento AgregarAlCarrito" OnCommand="Button2_Command" />
                            <br />
                            <br /></td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">id:
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            <br />nombre:
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <br />idCategoria:
                            <asp:Label ID="idCategoriaLabel" runat="server" Text='<%# Eval("idCategoria") %>' />
                            <br />cantidadUnitaria:
                            <asp:Label ID="cantidadUnitariaLabel" runat="server" Text='<%# Eval("cantidadUnitaria") %>' />
                            <br />precioUnitario:
                            <asp:Label ID="precioUnitarioLabel" runat="server" Text='<%# Eval("precioUnitario") %>' />
                            <br />stock:
                            <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                            <br />
                            <asp:CheckBox ID="habilitadoCheckBox" runat="server" Checked='<%# Eval("habilitado") %>' Enabled="false" Text="habilitado" />
                            <br />imagenURL:
                            <asp:Label ID="imagenURLLabel" runat="server" Text='<%# Eval("imagenURL") %>' />
                            <br /></td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPanaderiaConnectionString %>" SelectCommand="SELECT * FROM [tblProductos] WHERE ([habilitado] = @habilitado)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="habilitado" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DataPager ID="DataPager1" runat="server" OnPreRender="DataPager1_PreRender" PagedControlID="lvProductos" PageSize="8">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
                <br />
                <br />
                <br />
&nbsp;
        </div>
    <p>
&nbsp;
    </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDPanaderiaConnectionString %>" SelectCommand="SELECT [nombre] FROM [tblCategorias]"></asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <div class="auto-style10">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </form>
    </body>
</html>

