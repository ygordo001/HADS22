Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Email") IsNot Nothing Then 'Existe la sesión'
            Response.Redirect("Inicio.aspx")
        End If
    End Sub


    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If businessLogic.existeUsuario(textEmail.Text, TextPassword.Text) = True Then
            If textEmail.Text.Contains("ikasle") = False Then 'ES profesor
                consola.Text = "Usuario logeado correctamente"
                Session("Email") = textEmail.Text
                Application("cantidadP") = Application("cantidadP") + 1
                Application("ProfesoresO").Add(Session("Email"), Session("Email"))
                FormsAuthentication.SetAuthCookie("Profesor", False)
                Response.Redirect("~/Profesor/Profesor.aspx")
            ElseIf textEmail.Text.Contains("ikasle") = True Then
                consola.Text = "Usuario logeado correctamente"
                Session("Email") = textEmail.Text
                Application("cantidadA") = Application("cantidadA") + 1
                Application("AlumnosO").Add(Session("Email"), Session("Email"))
                FormsAuthentication.SetAuthCookie("Alumno", False)
                Response.Redirect("~/Alumno/Alumno.aspx")
            Else
                consola.Text = "No existe la cuenta"
            End If
        Else
            consola.Text = "Email y/o Password incorrecto/s"
        End If
    End Sub


End Class