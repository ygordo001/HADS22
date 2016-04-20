Public Class RecoverPassword
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Email") IsNot Nothing Then 'Si la sesión existe'
            Response.Redirect("Inicio.aspx")
        End If
    End Sub

    Protected Sub btnRecuperar_Click(sender As Object, e As EventArgs) Handles btnRecuperar.Click

        If businessLogic.existeEmail(textEmail.Text) = True Then
            Session("email") = textEmail.Text
            Response.Redirect("NewPassword.aspx")
        Else
            consola.Text = "Email inexistente."
        End If
    End Sub
End Class