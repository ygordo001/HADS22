Public Class Logout
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Email") Is Nothing Then
            Response.Redirect("Login.aspx")
        Else
            If businessLogic.esAlumno(Session("Email")) = False Then
                Application("cantidadP") = Application("cantidadP") - 1
                Application("ProfesoresO").Remove(Session("Email"))
            ElseIf businessLogic.esAlumno(Session("Email")) = True Then
                Application("cantidadA") = Application("cantidadA") - 1
                Application("AlumnosO").Remove(Session("Email"))
            End If
            Session.Remove("Email")
            Response.Redirect("Login.aspx")
        End If
    End Sub

End Class