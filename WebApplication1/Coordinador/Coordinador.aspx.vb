Public Class Coordinador
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim servicios As New ServicioDedicacion

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Saludo.Text = Session("Email")
    End Sub

    Protected Sub Asignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Asignaturas.SelectedIndexChanged
        Media.Text = servicios.MediaDedicacionesReales(Asignaturas.SelectedItem.Value)
    End Sub
End Class