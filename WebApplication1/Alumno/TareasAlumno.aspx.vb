Imports System.Data.SqlClient

Public Class TareasAlumno
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim connection As SqlConnection = businessLogic.getConnection
    Dim dataAdapter As New SqlDataAdapter
    Dim dataSet As New DataSet
    Dim dataTable As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Email") IsNot Nothing Then 'Existe la sesión'

            If Page.IsPostBack Then
            Else
                Try
                    dataAdapter = New SqlDataAdapter("SELECT DISTINCT TareasGenericas.CodAsig, TareasGenericas.Codigo, TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea FROM TareasGenericas JOIN Asignaturas ON Asignaturas.codigo = TareasGenericas.CodAsig JOIN GruposClase ON Asignaturas.codigo = GruposClase.codigoasig JOIN EstudiantesGrupo ON EstudiantesGrupo.Grupo = GruposClase.codigo WHERE TareasGenericas.Explotacion = 'True'", connection)
                    dataAdapter.Fill(dataSet, "TareasAsignatura")
                Catch ex As Exception
                    MsgBox(ex.Message)
                End Try
                Session("dataSet") = dataSet
                Session("dataAdapter") = dataAdapter
            End If

        Else
            Response.Redirect("Login.aspx")
        End If

    End Sub

    Protected Sub CheckBoxList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CheckBoxList1.SelectedIndexChanged


        If CheckBoxList1.Items.Item(1).Selected Then
            GridView2.Columns(3).Visible = True
        Else
            GridView2.Columns(3).Visible = False
        End If

        If CheckBoxList1.Items.Item(2).Selected Then
            GridView2.Columns(4).Visible = True
        Else
            GridView2.Columns(4).Visible = False
        End If

        If CheckBoxList1.Items.Item(3).Selected Then
            GridView2.Columns(5).Visible = True
        Else
            GridView2.Columns(5).Visible = False
        End If


    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        dataAdapter = New SqlDataAdapter("SELECT * FROM EstudiantesTareas WHERE Email = '" & Session("Email") & "'", connection)
        Dim builder As New SqlCommandBuilder(dataAdapter)
        dataAdapter.Fill(dataSet, "TareasEstudiante")
        dataTable = dataSet.Tables("TareasEstudiante")
        For Each row In dataTable.Rows
            If row("CodTarea") = GridView2.SelectedRow.Cells(1).Text Then
                Label4.Visible = True
                Response.Redirect("TareasAlumno.aspx")
            End If
        Next
        Response.Redirect("InstanciarTarea.aspx?codigo=" & GridView2.SelectedRow.Cells(1).Text)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            dataSet = Session("dataSet")
            dataTable = dataSet.Tables("TareasAsignatura")
            dataTable.Select("CodAsig = '" & Asignaturas.SelectedValue & "'")

            GridView2.DataSource = dataTable
            GridView2.DataBind()
            GridView2.Columns(1).Visible = False
            GridView2.Columns(3).Visible = False
            GridView2.Columns(4).Visible = False
            GridView2.Columns(5).Visible = False
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub


    Protected Sub SortRecords(ByVal sender As Object, ByVal e As GridViewSortEventArgs)
        Dim sortExpression As String = e.SortExpression
        Dim direction As String = String.Empty
        If SortDirection = SortDirection.Ascending Then
            SortDirection = SortDirection.Descending
            direction = " DESC"
        Else
            SortDirection = SortDirection.Ascending
            direction = " ASC"
        End If
        dataSet = Session("dataSet")
        dataTable = dataSet.Tables("TareasAsignatura")
        dataTable.DefaultView.Sort = sortExpression & direction
        GridView2.DataSource = dataTable
        GridView2.DataBind()
    End Sub

    Public Property SortDirection() As SortDirection
        Get
            If ViewState("SortDirection") Is Nothing Then
                ViewState("SortDirection") = SortDirection.Ascending
            End If
            Return DirectCast(ViewState("SortDirection"), SortDirection)
        End Get
        Set(ByVal value As SortDirection)
            ViewState("SortDirection") = value
        End Set
    End Property

End Class