Public Class Frofesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Email") Is Nothing Then 'Si la sesión no existe'
            Response.Redirect("Inicio.aspx")
        End If
        email.Text = Session("Email")
    End Sub

End Class