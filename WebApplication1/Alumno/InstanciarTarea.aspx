<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="GUI.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-size: xx-large; color: #FFFFFF; background-color: #000000; width: 100%; text-align: center; margin-bottom: 50px;">ALUMNOS 
            <br /> &nbsp;INSTANCIAR TAREA GENÉRICA</div>
       <div style="height: 123px; margin-top:5%">
        <table style="float:left; width: 539px;">
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Usuario: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Enabled="False" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Tarea: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Horas Est.: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Introduce las horas estimadas" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Horas Reales: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="Introduce las horas reales" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div style="float:right; width: 414px;">
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
        
    </div>
    <div style="height: 106px">
        <div style="float:left">
            <asp:Button ID="Button1" runat="server" Text="Crear Tarea" Width="127px" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Height="50px" />
        </div>
    </div>
    <div>
        <div style="float:left">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Alumno/Alumno.aspx">Volver</asp:HyperLink>
        </div>
    </div>
    </form>
</body>
</html>