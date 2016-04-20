Public Class Alumno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Email") IsNot Nothing Then 'Existe la sesión'
            Label1.Text = Session("Email")
        Else
            Response.Redirect("Login.aspx")
        End If
    End Sub

End Class