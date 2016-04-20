<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarXMLDocument.aspx.vb" Inherits="GUI.ImportXMLDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div style="font-size: xx-large; background-color: #000000; width: 100%; text-align: center; margin-bottom: 50px; color: #FFFFFF;">PROFESOR<br />
&nbsp;IMPORTAR TAREAS GENÉRICAS</div>
    
    </div>
        <div style="width: 50%; float: left; position: relative; text-align: center; padding-bottom: 20px; height: 49px; top: 0px; left: 0px;">Seleccionar Asignatura:<br />
            <br />
            <asp:DropDownList ID="DropDownListA" runat="server" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig" Width="270px" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [codigoasig]FROM [GruposClase] INNER JOIN [ProfesoresGrupo] ON [GruposClase].[codigo] = [ProfesoresGrupo].[codigogrupo] WHERE ([email] = @sesionEmail)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="sesionEmail" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:Button ID="BImportar" runat="server" Text="IMPORTAR (XMLD)" />
            </div>&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="consolaExito" runat="server" ForeColor="Green" Text=""></asp:Label>
        <br />
        <asp:Label ID="consolaError" runat="server" ForeColor="Red" Text=""></asp:Label>
        <br />
        <asp:Xml ID="XmlImport" runat="server"></asp:Xml>
        Lista de Tareas de la asignatura seleccionada:<br />
        <div>
            <div style="float: right; width: 49%; height: 199px; margin-left: 2px; position: absolute; top: 198px; left: 762px;">
                <h4>Seleccionar la ordenación:</h4>
                <br />
                <div>
                <asp:Button ID="Codigo" runat="server" Text="Código" Width="146px" style="height: 26px" />
                </div>
                <br />
                <div>
                <asp:Button ID="Descripcion" runat="server" Text="Descripción" Width="146px" />
                </div>
                <br />
                <div>
                <asp:Button ID="HEstimadas" runat="server" Text="Horas Estimadas" Width="147px" />
                </div>
            </div>
            <div style="float: left; width: 49%">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
            
        </div>
        <br />
        <br />
    
        <p>
            &nbsp;</p>
        <p>
        <asp:HyperLink ID="volver" runat="server" NavigateUrl="~/Profesor/Profesor.aspx">Menú principal</asp:HyperLink>
        </p>
    
    </form>
</body>
</html>
