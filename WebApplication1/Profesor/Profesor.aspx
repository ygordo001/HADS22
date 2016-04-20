<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="GUI.Frofesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <div style="color: #000000; font-size: x-large; float: right; width: 100%; height: 20%; background-color: #FFFFFF; text-align: center;">
        <br />
        <br />
        Gestión Web de Tareas-Dedicación<br />
        <br />
        <br />
        Hola
        <asp:Label ID="email" runat="server"></asp:Label>
        <br />
        <br />
        </div>

          <div style="color: #FFFFFF; font-size: xx-large; width: 100%; height: 20%; text-align: center; float: left; background-color: #000000;">
           
            <br />
            <br />
            <asp:HyperLink ID="tareas" runat="server" NavigateUrl="~/Profesor/TareasProfesor.aspx" ForeColor="White">Tareas</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="dedicacionTareasG" runat="server" NavigateUrl="~/Profesor/DedicacionTareasG.aspx" ForeColor="White">Dedicaciones</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Profesor/ImportarXMLDocument.aspx" ForeColor="White">ImportarXML v. XMLDocument</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Profesor/ExportarXML.aspx" ForeColor="White">Exportar XML</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Profesor/ImportarXMLDataSet.aspx" ForeColor="White">Importar XML v. DataSet</asp:HyperLink>
            <br />
            <br />
    


        </div>        
    </form>
    <div>
                    <br />
          <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Logout.aspx" style="text-align: center">Cerrar Sesión</asp:HyperLink>
   
        </div>
</body>
</html>
