<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Coordinador.aspx.vb" Inherits="GUI.Coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        Hola
    
        <asp:Label ID="Saludo" runat="server" Font-Bold="True" Font-Size="20px" ForeColor="#0066FF"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="Asignaturas" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Nombre">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [Nombre] FROM [Asignaturas]"></asp:SqlDataSource>
        <br />
        <strong>Media de dedicaciones (en horas):</strong>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Media" runat="server" Font-Bold="True" Font-Size="22px" ForeColor="#339933"></asp:Label>
        <br />
        <br />
          <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Logout.aspx" style="text-align: center">Cerrar Sesión</asp:HyperLink>
   
        <br />
    
    </div>
    </form>
</body>
</html>
