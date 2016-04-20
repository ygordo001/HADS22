Public Class InsertarTarea
    Inherits System.Web.UI.Page

    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonAT_Click(sender As Object, e As EventArgs) Handles ButtonAT.Click
        If businessLogic.existeCod(TextCod.Text) = False Then
            If businessLogic.insertarTarea(TextCod.Text, TextDesc.Text, DropDownListA.SelectedItem.Text, TextHoras.Text, DropDownListTarea.SelectedItem.Text) = True Then
                consola.Text = "Tarea insertada correctamente."
            Else
                consola.Text = "Error al insertar la tarea"
            End If
        Else
            consola.Text = "Ya existe una Tarea con el codigo indicado."
        End If
    End Sub
End Class