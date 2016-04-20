<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="GUI.InsertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 49%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
        }
        .auto-style4 {
            height: 23px;
            width: 127px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-size: xx-large; color: #FFFFFF; background-color: #000000; width: 100%; text-align: center; margin-bottom: 50px;">PROFESOR <br />
&nbsp;GESTIÓN DE TAREAS GENÉRICAS</div>
        <div>
            <table align="center" class="auto-style1">
                <tr>
                    <td class="auto-style3">Código</td>
                    <td>
                        <asp:TextBox ID="TextCod" runat="server" Width="167px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Descripción</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextDesc" runat="server" Height="65px" Width="419px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Asignatura</td>
                    <td>
            <asp:DropDownList ID="DropDownListA" runat="server" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig" Width="270px" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [codigo] ,[codigoasig]FROM [GruposClase] INNER JOIN [ProfesoresGrupo] ON [GruposClase].[codigo] = [ProfesoresGrupo].[codigogrupo] WHERE ([email] = @sesionEmail)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="sesionEmail" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Horas Estimadas</td>
                    <td>
                        <asp:TextBox ID="TextHoras" runat="server" Width="47px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Tipo Tarea</td>
                    <td>
                        <asp:DropDownList ID="DropDownListTarea" runat="server" Height="16px" Width="166px">
                            <asp:ListItem Selected="True" Value="Ejercicio"></asp:ListItem>
                            <asp:ListItem>Examen</asp:ListItem>
                            <asp:ListItem>Laboratorio</asp:ListItem>
                            <asp:ListItem>Trabajo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">
                        <br />
                        <asp:Label ID="consola" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
         <div style="text-align: center"> 
                <asp:Button ID="ButtonAT" runat="server" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Height="50px" Text="Añadir Tarea" />
            &nbsp;<br />
             <br />
             <asp:HyperLink ID="HyperLinkVT" runat="server" Font-Bold="True" NavigateUrl="~/Profesor/TareasProfesor.aspx">Ver Tareas</asp:HyperLink> <br />
             <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Profesor/Profesor.aspx" style="text-align: right">Menú Principal</asp:HyperLink>
             <br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Logout.aspx" style="text-align: right">Cerrar Sesión</asp:HyperLink>
        </div>
    </form>
</body>
</html>
