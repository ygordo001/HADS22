Imports System.Data.SqlClient


Public Class ExportarXML
    Inherits System.Web.UI.Page

    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim connection As SqlConnection = businessLogic.getConnection
    Dim dap As New SqlDataAdapter
    Dim dst As New DataSet
    Dim tbl As New DataTable



    Protected Sub DropDownListA_DataBound(sender As Object, e As EventArgs) Handles DropDownListA.DataBound
        Try
            dap = New SqlDataAdapter("SELECT DISTINCT TareasGenericas.Codigo, TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.Explotacion, TareasGenericas.TipoTarea, TareasGenericas.CodAsig FROM TareasGenericas JOIN Asignaturas ON Asignaturas.codigo = TareasGenericas.CodAsig JOIN GruposClase ON Asignaturas.codigo = GruposClase.codigoasig JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE ProfesoresGrupo.email = '" & Session("Email") & "'", connection)
            dap.Fill(dst, "TareasG")
            tbl = dst.Tables("TareasG")
            Session("tabla") = tbl
            GridView1.DataSource = getTablebyCodAsig(tbl)
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub DropDownListA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListA.SelectedIndexChanged
        Try
            tbl = Session("tabla")
            GridView1.DataSource = getTablebyCodAsig(tbl)
            GridView1.DataBind()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub BExportar_Click(sender As Object, e As EventArgs) Handles BExportar.Click
        Try
            dst = Session("datos")
            dst.WriteXml("C:\Users\Guoto\Desktop\" & DropDownListA.SelectedValue & ".xml")
            consolaExito.Text = "Tareas exportadas correctamente en 'C:\Users\Guoto\Desktop' con el nombre '" & DropDownListA.SelectedValue & ".xml'"
        Catch ex As Exception
            consolaError.Text = "*Error al exportar las tablas, por favor inténtelo más tarde. "
        End Try


    End Sub
    Function getTablebyCodAsig(table As DataTable) As DataTable

        Dim matrizRow() As DataRow = table.Select("CodAsig='" & DropDownListA.SelectedValue & "'")
        Dim tblaux As New DataTable

        If matrizRow.Length > 0 Then
            tblaux = matrizRow.CopyToDataTable()
            tblaux.TableName = "tarea"
        End If
        Dim ds As DataSet = New DataSet
        ds.DataSetName = "tareas"
        ds.Namespace = "http://ji.ehu.es/" & DropDownListA.SelectedValue.ToLower()
        ds.Prefix = DropDownListA.SelectedValue.ToLower()
        ds.Tables.Add(tblaux)
        Session("datos") = ds
        Return tblaux
    End Function






End Class