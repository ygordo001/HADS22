Imports System.IO
Imports System.Data.SqlClient
Public Class TareasProfesor
    Inherits System.Web.UI.Page




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        email.Text = Session("Email")
        If Application("cantidadP") Is Nothing Then
            cantidadP.Text = 0
        Else
            cantidadP.Text = Application("cantidadP")
            Me.ProfesoresO.DataSource = Application("ProfesoresO")
            Me.ProfesoresO.DataBind()
        End If

        If Application("cantidadA") Is Nothing Then
            cantidadA.Text = 0
        Else
            cantidadA.Text = Application("cantidadA")
            Me.AlumnosO.DataSource = Application("AlumnosO")
            Me.AlumnosO.DataBind()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("InsertarTarea.aspx")
    End Sub


    Protected Sub DropDownListA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListA.SelectedIndexChanged

    End Sub

    Protected Sub SqlDataSource2_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource2.Selecting

    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

End Class