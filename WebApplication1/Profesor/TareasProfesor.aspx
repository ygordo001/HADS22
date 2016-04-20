<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="GUI.TareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body class="nuevoEstilo1">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        <div style="font-size: xx-large; background-color: #000000; width: 100%; text-align: center; margin-bottom: 50px; color: #FFFFFF;">PROFESOR<br />
&nbsp;GESTIÓN DE TAREAS GENÉRICAS
        </div>
        
        <div style="margin-bottom:50px; height: 117px;">
            <div style="float:left; height:109px; width: 500px">
                Profesores online:&nbsp;&nbsp;&nbsp; <asp:Label ID="cantidadP" runat="server" Font-Size="20px" ForeColor="#009933"></asp:Label>
                &nbsp;<asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="5000">
                </asp:Timer>
                    </ContentTemplate>
        </asp:UpdatePanel>
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>
                <asp:ListBox ID="ProfesoresO" runat="server" AutoPostBack="True"></asp:ListBox>   
                <asp:Timer ID="Timer2" runat="server" Interval="5000">
                </asp:Timer>
                </ContentTemplate>
        </asp:UpdatePanel>           
                <br />
            </div>
            <div style="float:right; height:111px; width: 500px">

                Alumnos online:&nbsp;&nbsp;&nbsp; <asp:Label ID="cantidadA" runat="server" ForeColor="#009933" Font-Size="20px"></asp:Label>
                &nbsp;<asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer3" runat="server" Interval="5000">
                </asp:Timer>
                    </ContentTemplate>
        </asp:UpdatePanel>
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:ListBox ID="AlumnosO" runat="server"></asp:ListBox>
                <asp:Timer ID="Timer4" runat="server" Interval="5000">
                </asp:Timer>
                </ContentTemplate>
        </asp:UpdatePanel>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Hola:
            <asp:Label ID="email" runat="server"></asp:Label>
        </div>
                
        <div>
        </div>
        <div style="width: 50%; float: left; position: relative; text-align: center; padding-bottom: 20px; height: 49px; top: 0px; left: 0px;">Seleccionar Asignatura:<br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:DropDownList ID="DropDownListA" runat="server" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig" Width="270px" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [codigo] ,[codigoasig]FROM [GruposClase] INNER JOIN [ProfesoresGrupo] ON [GruposClase].[codigo] = [ProfesoresGrupo].[codigogrupo] WHERE ([email] = @sesionEmail)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="sesionEmail" SessionField="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
                    </ContentTemplate>
            </asp:UpdatePanel>
            </div><div style="width: 49%; bottom: 0px; float: right; position: relative; text-align: center; padding-bottom: 20px; height: 20%;">
                <asp:Button ID="Button1" runat="server" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Height="50px" Text="INSERTAR NUEVA TAREA" />
            </div>
    <div style="text-align: center; color: #6600CC; width: 100%; left: 25%; position: relative; top: 50px; right: 0px; margin-bottom: 0px;">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Codigo" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" Width="924px" style="margin-top: 0px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS22ConnectionString %>" SelectCommand="SELECT [Descripcion], [Codigo], [Explotacion], [HEstimadas] FROM [TareasGenericas] WHERE ([CodAsig] = @DropDownListValue)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListA" Name="DropDownListValue" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
        
    
        <br />
             <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Profesor/Profesor.aspx" style="text-align: right">Menú Principal</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="True" NavigateUrl="~/Logout.aspx">Cerrar Sesión</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
