<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="GUI.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <div style="color: #FFFFFF; font-size: xx-large; width: 100%; height: 20%; text-align: center; float: left; background-color: #000000;">
    
        <br />
    
        <asp:HyperLink ID="linkLogin" runat="server" NavigateUrl="~/Login.aspx" Visible="False" ForeColor="White">Login</asp:HyperLink>
        <br />
        <asp:HyperLink ID="linkRegister" runat="server" NavigateUrl="~/Register.aspx" Visible="False" ForeColor="White">Registro</asp:HyperLink>
    
        <br />
        <asp:HyperLink ID="linkLogout" runat="server" NavigateUrl="~/Logout.aspx" EnableTheming="True" Visible="False" ForeColor="White">Logout</asp:HyperLink>
    
        <br />
    
        <br />
    
    </div>
    </form>
</body>
</html>
