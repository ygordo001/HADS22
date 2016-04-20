Public Class Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Si no existe la sesión email'
        If Session("Email") Is Nothing Then
            linkLogin.Visible = True
            linkRegister.Visible = True
        Else
            linkLogout.Visible = True
        End If
    End Sub

End Class