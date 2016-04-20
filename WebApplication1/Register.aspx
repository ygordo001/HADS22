<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="GUI.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 87%;
            height: 369px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style12 {
            height: 23px;
            width: 184px;
        }
        .auto-style14 {
        }
        .auto-style15 {
            width: 107px;
        }
        .auto-style17 {
            height: 32px;
        }
        .auto-style19 {
            width: 120px;
        }
        .auto-style20 {
            width: 180px;
        }
        .auto-style21 {
            width: 184px;
        }
        .auto-style24 {
            width: 180px;
            height: 139px;
        }
        .auto-style25 {
            width: 120px;
            height: 139px;
        }
        .auto-style26 {
            width: 107px;
            height: 139px;
        }
        .auto-style27 {
            width: 184px;
            height: 139px;
        }
        .auto-style28 {
            width: 128px;
        }
        .auto-style29 {
            width: 128px;
            height: 139px;
        }
        .auto-style30 {
            width: 205px;
        }
        .auto-style31 {
            width: 205px;
            height: 139px;
        }
        .auto-style32 {
            width: 205px;
            height: 35px;
        }
        .auto-style33 {
            width: 128px;
            height: 35px;
        }
        .auto-style34 {
            width: 180px;
            height: 35px;
        }
        .auto-style35 {
            width: 120px;
            height: 35px;
        }
        .auto-style36 {
            width: 107px;
            height: 35px;
        }
        .auto-style37 {
            width: 184px;
            height: 35px;
        }
        .auto-style38 {
            width: 205px;
            height: 32px;
        }
        .auto-style39 {
            width: 128px;
            height: 32px;
        }
        .auto-style40 {
            width: 107px;
            height: 32px;
        }
        .auto-style41 {
            width: 184px;
            height: 32px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <th colspan="5" class="auto-style2"> <div style="font-size: xx-large; color: #FFFFFF; background-color: #000000; text-align: center;">Registro</div></th>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style32">Nombre:</td>
                <td class="auto-style33">
                    <asp:TextBox ID="textNombre" runat="server" Width="165px"></asp:TextBox>
                </td>
                <td class="auto-style34">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textNombre" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style35">DNI:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="TextDNI" runat="server" Width="160px"></asp:TextBox>
                </td>
                <td class="auto-style37">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextDNI" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style30">Email:</td>
                <td class="auto-style28">
                    <asp:TextBox ID="textEmail" runat="server" Width="160px"></asp:TextBox>
                </td>
                <td class="auto-style20">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textEmail" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Email incorrecto" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style19">Grupo:</td>
                <td class="auto-style15">
                    <asp:TextBox ID="textGrupo" runat="server" Width="160px"></asp:TextBox>
                </td>
                <td class="auto-style21">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="textGrupo" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style31">Password:</td>
                <td class="auto-style29">
                    <asp:TextBox ID="textPassword" runat="server" Width="160px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style24">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textPassword" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style25">Repetir Password:</td>
                <td class="auto-style26">
                    <asp:TextBox ID="textRepeatPassword" runat="server" Width="160px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style27">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="textRepeatPassword" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="textPassword" ControlToValidate="textRepeatPassword" ErrorMessage="Las contraseñas no coinciden" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style38">Pregunta secreta:</td>
                <td class="auto-style39">
                    <asp:DropDownList ID="preguntas" runat="server" Width="242px" Height="16px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">
                    </td>
                <td class="auto-style17">
                    Respuesta:</td>
                <td class="auto-style40">
                    <asp:TextBox ID="respuesta" runat="server" Width="158px"></asp:TextBox>
                </td>
                <td class="auto-style41">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="respuesta" ErrorMessage="No puede estar vacio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style14" colspan="2">
                    <asp:Label ID="consola" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style21">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style14" colspan="2">
                    <asp:Button ID="btnRegistrarse" runat="server" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Text="Registrarse" Width="184px" style="height: 26px" />
                </td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style21">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
