<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarXML.aspx.vb" Inherits="GUI.ExportarXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div style="font-size: xx-large; background-color: #000000; width: 100%; text-align: center; margin-bottom: 50px; color: #FFFFFF;">PROFESOR<br />
&nbsp;EXPORTAR TAREAS GENÉRICAS</div>
    
    </div>
        <div style="width: 50%; float: left; position: relative; text-align: center; padding-bottom: 20px; height: 49px; top: 0px; left: 0px;">Seleccionar Asignatura:<br />
            <br />
            <asp:DropDownList ID="DropDownListA" runat="server" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig" Width="270px" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [codigo] ,[codigoasig]FROM [GruposClase] INNER JOIN [ProfesoresGrupo] ON [GruposClase].[codigo] = [ProfesoresGrupo].[codigogrupo] WHERE ([email] = @sesionEmail)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="sesionEmail" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:Button ID="BExportar" runat="server" Text="Exportar" style="height: 26px" />
            </div>
        <p>
            &nbsp;</p>
        <br />
        <br />
        <asp:Label ID="consolaError" runat="server" ForeColor="red" Text=""></asp:Label>
        <br />
        <asp:Label ID="consolaExito" runat="server" ForeColor="green"></asp:Label>
        <br />
        <br />
        Lista de Tareas de la asignatura seleccionada:<br />
    
        <asp:Xml ID="Xml1" runat="server"></asp:Xml>
    
        <br />
            <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" SortExpression="Descripcion" />
                    <asp:BoundField DataField="CodigoAsig" Visible="False" HeaderText="CodigoAsig" />
                    <asp:BoundField DataField="HEstimadas" HeaderText="Horas Estimadas" ReadOnly="True" SortExpression="HEstimadas" />
                    <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                    <asp:BoundField DataField="TipoTarea" HeaderText="Tipo Tarea" ReadOnly="True" SortExpression="TipoTarea" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
    
        <br />
        <br />
        <br />


        <asp:HyperLink ID="volver" runat="server" NavigateUrl="~/Profesor/Profesor.aspx">Menú pincipal</asp:HyperLink>
    
    </form>
</body>
</html>