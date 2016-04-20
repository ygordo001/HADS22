Imports System.Xml
Imports System.Xml.Schema
Imports System.Data.SqlClient
Imports System
Imports System.Data

Public Class ImportXMLDocument
    Inherits System.Web.UI.Page

    Dim dap As New SqlDataAdapter
    Dim dst As New DataSet
    Dim tbl As New DataTable
    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim connection As SqlConnection = businessLogic.getConnection
    Dim xml As String

    Protected Sub DropDownListA_action(sender As Object, e As EventArgs) Handles DropDownListA.DataBound, DropDownListA.SelectedIndexChanged
        xml = DropDownListA.SelectedValue & ".xml"
        XmlImport.DocumentSource = Server.MapPath(xml)
        XmlImport.TransformSource = Server.MapPath("XSLTFile.xsl")
    End Sub

    Protected Sub BImportar_Click(sender As Object, e As EventArgs) Handles BImportar.Click


        Try
            Dim docxml As New XmlDocument
            docxml.Load(Server.MapPath(DropDownListA.SelectedValue & ".xml"))

            dap = New SqlDataAdapter("SELECT * FROM TareasGenericas ", connection)
            dap.Fill(dst, "TareasGenericas")
            tbl = dst.Tables("TareasGenericas")
            Dim nuevasTareas As XmlNodeList = docxml.GetElementsByTagName("tarea")
            Dim i As Integer
            For i = 0 To nuevasTareas.Count - 1
                Dim codigo As String = nuevasTareas(i).ChildNodes(0).ChildNodes(0).Value
                Dim descripcion As String = nuevasTareas(i).ChildNodes(1).ChildNodes(0).Value
                Dim codasig As String = Nothing
                Dim hestimadas As String = Integer.Parse(nuevasTareas(i).ChildNodes(2).ChildNodes(0).Value)
                Dim explotacion As String = Boolean.Parse(nuevasTareas(i).ChildNodes(3).ChildNodes(0).Value)
                Dim tipotarea As String = nuevasTareas(i).ChildNodes(4).ChildNodes(0).Value
                tbl.Rows.Add(codigo, descripcion, codasig, hestimadas, explotacion, tipotarea)
            Next

            Dim myCmd As SqlCommandBuilder = New SqlCommandBuilder(dap)
            dap.Update(dst, "TareasGenericas")
            dst.AcceptChanges()


            tbl = dst.Tables("TareasGenericas")
            GridView1.DataSource = tbl
            GridView1.DataBind()

            Session("datos") = dst
            Session("adapter") = dap

            consolaExito.Text = "El documento se ha importado correctamente."
        Catch ex As Exception
            'MsgBox(ex.Message)
            consolaError.Text = "* Error al importar, las tareas ya existen en la base de datos."
        End Try


    End Sub


    Protected Sub Codigo_Click(sender As Object, e As EventArgs) Handles Codigo.Click
        xml = DropDownListA.SelectedValue & ".xml"
        XmlImport.DocumentSource = Server.MapPath(xml)
        XmlImport.TransformSource = Server.MapPath("SortByCod.xslt")
    End Sub

    Protected Sub Descripcion_Click(sender As Object, e As EventArgs) Handles Descripcion.Click
        xml = DropDownListA.SelectedValue & ".xml"
        XmlImport.DocumentSource = Server.MapPath(xml)
        XmlImport.TransformSource = Server.MapPath("SortByDesc.xslt")
    End Sub

    Protected Sub HEstimadas_Click(sender As Object, e As EventArgs) Handles HEstimadas.Click
        xml = DropDownListA.SelectedValue & ".xml"
        XmlImport.DocumentSource = Server.MapPath(xml)
        XmlImport.TransformSource = Server.MapPath("SortByHours.xslt")
    End Sub
End Class