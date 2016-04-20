<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="GUI.TareasAlumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: xx-large; color: #FFFFFF; background-color: #000000; width: 100%; text-align: center; margin-bottom: 50px;">ALUMNOS<br />
&nbsp;GESTIÓN DE TAREAS GENÉRICAS</div>
    <div style="margin-bottom:20px">
        <asp:Label ID="Label1" runat="server" Text="Seleccionar asignatura:" Font-Bold="True"></asp:Label>
    </div>
    <div style="height:1056px; width: 100%">
        <div style="float:right; height: 200px; width: 905px;">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True">
                <asp:ListItem Enabled="False" Selected="True">Código</asp:ListItem>
                <asp:ListItem>Descripción</asp:ListItem>
                <asp:ListItem>Horas Estimadas</asp:ListItem>
                <asp:ListItem>Tipo Tarea</asp:ListItem>
            </asp:CheckBoxList>
        </div>
        <div style="float:left; height: 200px; width: 331px;">

            <asp:DropDownList ID="Asignaturas" runat="server" Width="250px" DataTextField="CodAsig" DataValueField="CodAsig" DataSourceID="SqlDataSource1">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT DISTINCT TareasGenericas.CodAsig FROM EstudiantesGrupo INNER JOIN GruposClase ON EstudiantesGrupo.Grupo = GruposClase.codigo INNER JOIN TareasGenericas ON GruposClase.codigoasig = TareasGenericas.CodAsig WHERE EstudiantesGrupo.Email = @Email">
                <SelectParameters>
                    <asp:SessionParameter Name="Email" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div style="margin-top:50px">
                <asp:Button ID="Button1" runat="server" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Text="Ver Tareas" Width="35%" Height="20%" />
            </div>
        </div>
        
        <div style="float:left; height: 216px; width: 100%;">
            <asp:GridView ID="GridView2" runat="server" OnSorting="SortRecords" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Instanciar" />
                    <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" SortExpression="Descripcion" />
                    <asp:BoundField DataField="HEstimadas" HeaderText="Horas Estimadas" ReadOnly="True" SortExpression="HEstimadas" />
                    <asp:BoundField DataField="TipoTarea" HeaderText="Tipo Tarea" ReadOnly="True" SortExpression="TipoTarea" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="Black" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#CCCCCC" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </div>  
        <br />
        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="* Tarea ya instanciada" Visible="False"></asp:Label>
                <br />
        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Alumno/Alumno.aspx" style="text-align: right">Menú Principal</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Logout.aspx" style="text-align: right">Cerrar Sesión</asp:HyperLink>
        </div>
    </form>
</body>
</html>

