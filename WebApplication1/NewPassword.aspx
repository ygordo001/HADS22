<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewPassword.aspx.vb" Inherits="GUI.NewPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
            width: 27%;
        }
        .auto-style4 {
            height: 23px;
            width: 232px;
        }
        .auto-style5 {
            width: 27%;
        }
        .auto-style6 {
            width: 232px;
        }
        .auto-style7 {
            width: 51%;
        }
        .auto-style8 {
            height: 23px;
            width: 51%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1" style="width:100%;">
            <tr>
                <td class="auto-style1" colspan="2">Modificar contraseña actual:</td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style3">Nueva Password:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextPassword" runat="server" TextMode="Password" Width="273px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextPassword" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    Repetir Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="PasswordConfirm" runat="server" TextMode="Password" Width="273px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordConfirm" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Pregunta" runat="server"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="Respuesta" runat="server" Width="273px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Respuesta" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="consola" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnRecuperar" runat="server" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Text="Recuperar" />
                </td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>