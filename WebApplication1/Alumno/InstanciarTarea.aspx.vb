Imports System.Data.SqlClient
Public Class InstanciarTarea
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim connection As SqlConnection = businessLogic.getConnection
    Dim dataAdapter As New SqlDataAdapter
    Dim dataSet As New DataSet
    Dim dataTable As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox2.Text = Session("Email")
        TextBox3.Text = Request.QueryString("codigo")

        dataAdapter = New SqlDataAdapter("SELECT * FROM EstudiantesTareas WHERE Email = '" & Session("Email") & "'", connection)
        Dim builder As New SqlCommandBuilder(dataAdapter)
        dataAdapter.Fill(dataSet, "EstudiantesTareas")
        dataTable = dataSet.Tables("EstudiantesTareas")

        GridView1.DataSource = dataTable
        GridView1.DataBind()

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        dataTable = dataSet.Tables("EstudiantesTareas")
        Dim dataRow As DataRow = dataTable.NewRow()
        dataRow("Email") = TextBox2.Text
        dataRow("CodTarea") = TextBox3.Text
        dataRow("HEstimadas") = TextBox4.Text
        dataRow("HReales") = TextBox5.Text
        dataTable.Rows.Add(dataRow)

        dataAdapter.Update(dataSet, "EstudiantesTareas")
        dataSet.AcceptChanges()

        GridView1.DataSource = dataTable
        GridView1.DataBind()
    End Sub
End Class