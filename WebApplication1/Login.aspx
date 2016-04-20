<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="GUI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 37%;
        }
        .auto-style2 {
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 
        <br />
        <br />
        <table  border="0" class="auto-style1">
            <tr>
                <th colspan="2">LOGIN:</th>
                <th></th>
            </tr>
            <tr>
                <td>Email:</td>
                <td class="auto-style2">
        <asp:TextBox ID="textEmail" runat="server" Width="193px"></asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Email incorrecto" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Password:
        </td>
                <td class="auto-style2">
        <asp:TextBox ID="TextPassword" runat="server" Width="196px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextPassword" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="consola" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RecoverPassword.aspx">¿Has olvidado la contraseña?</asp:HyperLink>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style2">
        <asp:Button ID="btnLogin" runat="server" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Text="Iniciar" />
    
                </td>
                <td></td>
            </tr>
        </table>
        <br />
        <br />
        &nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
