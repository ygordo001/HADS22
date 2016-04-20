<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RecoverPassword.aspx.vb" Inherits="GUI.RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 76%;
        }
        .auto-style2 {
            width: 189px;
        }
        .auto-style3 {
            width: 317px;
        }
        .auto-style4 {
            width: 174px;
        }
        .auto-style5 {
            height: 24px;
        }
        .auto-style6 {
            width: 174px;
            height: 24px;
        }
        .auto-style7 {
            width: 317px;
            height: 26px;
        }
        .auto-style8 {
            width: 189px;
            height: 26px;
        }
        .auto-style9 {
            width: 174px;
            height: 26px;
        }
    </style>
</head>
<body id="Pregunta">
    <form id="form1" runat="server">
    <div>
    
        <table  border="0" class="auto-style1">
            <tr>
                <th colspan="2" class="auto-style5">Recuperación de la contraseña:</th>
                <th class="auto-style6"></th>
            </tr>
            <tr>
                <td class="auto-style3">Email:</td>
                <td class="auto-style2">
        <asp:TextBox ID="textEmail" runat="server" Width="193px"></asp:TextBox>
                </td>
                <td class="auto-style4">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Email incorrecto" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style2">
                    <asp:Label ID="consola" runat="server" ForeColor="Red"></asp:Label>
    
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
        <asp:Button ID="btnRecuperar" runat="server" Text="Comprobar" />
    
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
