Imports System.Data.SqlClient

Public Class SQLServer_DBManager

    Public dbconn As New SqlConnection
    Public dbread As SqlDataReader

    Public Function newConnection() As SqlConnection
        Dim connection As SqlConnection
        connection = New SqlConnection("Server=tcp:hads22server.database.windows.net,1433;Database=HADS22;User ID=ygordo001@hads22server;Password=Leopardo22;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;")

        Return connection
    End Function

    Public Function connect() As SqlConnection
        dbconn = New SqlConnection("Server=tcp:hads22server.database.windows.net,1433;Database=HADS22;User ID=ygordo001@hads22server;Password=Leopardo22;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;")
        Try
            dbconn.Open()
        Catch ex As Exception
        End Try
        Return dbconn
    End Function

    Public Sub disconnect()
        Try
            dbconn.Close()
        Catch ex As Exception
        End Try
    End Sub


    Public Function getQuery(ByVal _query As String) As SqlDataReader
        Try
            Dim command As New SqlCommand(_query, dbconn)
            dbread = command.ExecuteReader()
        Catch ex As Exception
            dbread.Close()
        End Try
        Return dbread
    End Function


    Public Sub setQuery(ByVal _query As String)
        Try
            Dim command As New SqlCommand(_query, dbconn)
            dbread = command.ExecuteReader()
            dbread.Close()
        Catch ex As Exception
            dbread.Close()
            Exit Sub
        End Try
    End Sub
End Class

