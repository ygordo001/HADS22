<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DedicacionTareasG.aspx.vb" Inherits="GUI.DediacionAlumno" %><%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Seleccionar asignatura:<br />
            <asp:DropDownList ID="DropDownListA" runat="server" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig" Width="270px" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [codigo] ,[codigoasig]FROM [GruposClase] INNER JOIN [ProfesoresGrupo] ON [GruposClase].[codigo] = [ProfesoresGrupo].[codigogrupo] WHERE ([email] = @sesionEmail)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="sesionEmail" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
        <br />
        <asp:Chart ID="Chart1" runat="server" DataSourceID="EstudianteTareas" Width="1062px" BackImageTransparentColor="Transparent" BackSecondaryColor="Black" Palette="Bright">
            <series>
                <asp:Series Name="Series1" XValueMember="Codigo" YValueMembers="HEstimadas" YValuesPerPoint="2">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
            <BorderSkin BackColor="Red" BackSecondaryColor="Black" BorderColor="White" />
        </asp:Chart>
        <asp:SqlDataSource ID="EstudianteTareas" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [HEstimadas], [Codigo] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListA" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Profesor/Profesor.aspx" style="text-align: right">Menú Principal</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Logout.aspx" style="text-align: right">Cerrar Sesión</asp:HyperLink>
    </form>
</body>
</html>
