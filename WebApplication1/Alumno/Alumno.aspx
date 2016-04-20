<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="GUI.Alumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            width: 865px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div style="color: #000000; font-size: x-large; float: right; width: 100%; height: 20%; background-color: #FFFFFF; text-align: center;">
        <br />
        <br />
        Gestión Web de Tareas-Dedicación<br />
        <br />
        <br />
        Bienvenido:
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
        </div>

          <div style="color: #FFFFFF; font-size: xx-large; width: 100%; height: 20%; text-align: center; float: left; background-color: #000000;">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Alumno/TareasAlumno.aspx" ForeColor="White">Tareas</asp:HyperLink>
      

        </div>  
    </form>
</body>
</html>
