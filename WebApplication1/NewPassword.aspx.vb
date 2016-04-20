Public Class NewPassword
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("email")
        If (businessLogic.obtenerPregunta(email) = "") Then
            consola.Text = "Error al obtener la pregunta de la base de datos, por favor intentelo mas tarde."
            Response.Redirect("Inicio.aspx")
        End If
        Pregunta.Text = businessLogic.obtenerPregunta(email)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnRecuperar.Click

        If businessLogic.comprobarRespuesta(Session("email"), Respuesta.Text) Then
            If businessLogic.comprobarPasswords(TextPassword.Text, PasswordConfirm.Text) Then
                If businessLogic.updatePassword(Session("email"), TextPassword.Text) Then
                    consola.Text = "Su contraseñaha sido modificada correctamente, gracias."
                    Session.Remove("email")
                    '  System.Threading.Thread.Sleep(3000)
                    Response.Redirect("Login.aspx")
                Else
                    consola.Text = "Imposible cambiar la contraseña, por favor intentelo más tarde"
                End If
            Else
                consola.Text = "Las contraseñas no coinciden, introduzcalas de nuevo"
            End If
        Else

            Session.Remove("email")
            Response.Redirect("Inicio.aspx")
        End If
    End Sub

    Protected Sub Respuesta_TextChanged(sender As Object, e As EventArgs) Handles Respuesta.TextChanged

    End Sub
End Class