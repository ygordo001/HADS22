Imports System.Xml
Imports System.Xml.Schema
Imports System.Data.SqlClient
Imports System
Imports System.Data

Public Class ImportXML
    Inherits System.Web.UI.Page

    Dim dap As New SqlDataAdapter
    Dim dst As New DataSet
    Dim tbl As New DataTable
    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim connection As SqlConnection = businessLogic.getConnection
    Dim xtr As XmlReader
    Dim xml As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DropDownListA_action(sender As Object, e As EventArgs) Handles DropDownListA.DataBound, DropDownListA.SelectedIndexChanged
        xml = DropDownListA.SelectedValue & ".xml"
        XmlImport.DocumentSource = Server.MapPath(xml)
        XmlImport.TransformSource = Server.MapPath("XSLTFile.xsl")
    End Sub

    Protected Sub BImportar_Click(sender As Object, e As EventArgs) Handles BImportar.Click


        Try
            xtr = XmlReader.Create(Server.MapPath(DropDownListA.SelectedValue & ".xml"))
            actualizar_data_set(xtr)
            dst = Session("datos")
            dap = Session("adapter")

            Dim myCmd As SqlCommandBuilder = New SqlCommandBuilder(dap)
            dap.Update(dst, "TareasG")
            dst.AcceptChanges()


            tbl = dst.Tables("TareasG")
            GridView1.DataSource = tbl
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

    Sub actualizar_data_set(xtr As XmlReader)
        Dim tbl As New DataTable
        dap = New SqlDataAdapter("SELECT * FROM TareasGenericas ", connection)
        dap.Fill(dst, "TareasG")
        Session("adapter") = dap
        tbl = dst.Tables("TareasG")
        Session("datos") = dst
        While xtr.Read
            If xtr.NodeType = XmlNodeType.Element Then
                If xtr.Name = "codigo" Then
                    xtr.Read()
                    Dim rowselect() As DataRow
                    rowselect = tbl.Select("Codigo='" + xtr.Value + "'")
                    If rowselect.Length < 1 Then
                        Dim rowMbrs As DataRow = tbl.NewRow()
                        rowMbrs("Codigo") = xtr.Value
                        While xtr.Name <> "descripcion"
                            xtr.Read()
                        End While
                        xtr.Read()
                        rowMbrs("Descripcion") = xtr.Value
                        While xtr.Name <> "hestimadas"
                            xtr.Read()
                        End While
                        xtr.Read()
                        rowMbrs("HEstimadas") = xtr.Value
                        While xtr.Name <> "explotacion"
                            xtr.Read()
                        End While
                        xtr.Read()
                        rowMbrs("Explotacion") = xtr.Value
                        While xtr.Name <> "tipotarea"
                            xtr.Read()
                        End While
                        xtr.Read()
                        rowMbrs("TipoTarea") = xtr.Value
                        tbl.Rows.Add(rowMbrs)
                    End If
                End If
            End If
        End While
    End Sub


End Class