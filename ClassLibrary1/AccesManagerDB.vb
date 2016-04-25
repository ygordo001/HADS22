Imports System.Data.SqlClient
Public Class AccesManagerDB

    Dim conection As New DataAcces.SQLServer_DBManager
    Dim reader As SqlDataReader

    Public Function getConnection() As SqlConnection
        Return conection.newConnection
    End Function

    Public Function esAlumno(email As String) As Boolean
        Dim alumno As Boolean = False
        Try
            conection.connect()
            reader = conection.getQuery("SELECT * FROM Usuarios WHERE email = '" & email & "'")
            While (reader.Read)
                If String.Equals("A", reader("tipo")) Then
                    alumno = True
                End If
            End While
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
        conection.disconnect()
        Return alumno
    End Function

    Public Function existeEmail(email As String) As Boolean
        Dim existe As Boolean = False
        Try
            conection.connect()
            reader = conection.getQuery("SELECT * from Usuarios Where email = '" & email & "'")
            While (reader.Read)
                If String.Equals(email, reader("email")) Then
                    existe = True
                End If
            End While
            reader.Close()
        Catch ex As Exception

        End Try
        conection.disconnect()
        Return existe
    End Function

    Public Function existeCod(cod As String) As Boolean
        Dim existe As Boolean = False
        Try
            conection.connect()
            reader = conection.getQuery("SELECT * from TareasGenericas Where Codigo = '" & cod & "'")
            While (reader.Read)
                If String.Equals(cod, reader("Codigo")) Then
                    existe = True
                End If
            End While
            reader.Close()
        Catch ex As Exception
        End Try
        conection.disconnect()
        Return existe
    End Function

    Public Function existeUsuario(email As String, pass As String) As Boolean
        Dim existe As Boolean = False
        Try
            conection.connect()
            reader = conection.getQuery("SELECT * from Usuarios Where email = '" & email & "'")
            While (reader.Read)
                If String.Equals(email, reader("email")) And String.Equals(pass, reader("pass")) Then
                    existe = True
                End If
            End While
            reader.Close()
        Catch ex As Exception
        End Try
        conection.disconnect()
        Return existe
    End Function

    Function insertarUsuario(nombre As String, emaila As String, pass As String, dni As Integer, pregunta As Integer, respuesta As String, grupo As String) As Boolean
        Dim correcto As Boolean = False
        Dim tipo As String
        Dim preg As String

        If emaila.Contains("ikasle") Then
            tipo = "A"
        Else
            tipo = "P"
        End If

        If pregunta = 0 Then
            preg = "¿Cúal es tu color favorito?"
        ElseIf pregunta = 1 Then
            preg = "¿Cúal es tu color favorito?"
        ElseIf pregunta = 2 Then
            preg = "¿En qué año naciste?"
        ElseIf pregunta = 3 Then
            preg = "¿Cómo se llama tu madre?"
        Else
            preg = "Vacio"


        End If

        Try
            conection.connect()

            conection.setQuery("INSERT INTO Usuarios (email, nombre, pregunta, respuesta, dni, confirmado, grupo, tipo, pass) VALUES ('" & emaila & "', '" & nombre & "', '" & preg & "', '" & respuesta & "', '" & dni & "', '" & True & "', '" & grupo & "', '" & tipo & "', '" & pass & "')")

            correcto = True
        Catch ex As Exception
        End Try
        conection.disconnect()
        Return correcto
    End Function

    Function updatePassword(email As String, password As String) As Boolean
        Dim correcto As Boolean = False

        Try
            conection.connect()
            conection.setQuery("UPDATE Usuarios SET pass = '" & password & "' WHERE email ='" & email & "' ")
            correcto = True
        Catch ex As Exception
        End Try
        conection.disconnect()
        Return correcto
    End Function

    Function comprobarRespuesta(email As String, res As String) As Boolean
        Try
            conection.connect()
            reader = conection.getQuery("SELECT * FROM Usuarios WHERE email = '" & email & "'")
            While (reader.Read)
                If (String.Equals(email, reader("email"))) And (String.Equals(res, reader("respuesta"))) Then
                    Return True
                End If
            End While
            conection.disconnect()
        Catch ex As Exception
        End Try
        Return False
    End Function

    Function obtenerPregunta(email As String) As String
        Dim pregunta As String
        pregunta = ""
        Try
            conection.connect()
            reader = conection.getQuery("SELECT * FROM Usuarios WHERE email = '" & email & "'")
            While (reader.Read)
                If (String.Equals(email, reader("email"))) Then
                    pregunta = reader("pregunta")
                End If
            End While
        Catch ex As Exception
        End Try
        conection.disconnect()
        Return pregunta
    End Function

    Function comprobarPasswords(pass1 As String, pass2 As String) As Boolean
        If String.Equals(pass1, pass2) Then
            Return True
        Else
            Return False
        End If
    End Function

    Function insertarTarea(codigo As String, descripcion As String, codAsig As String, horasEstimadas As Integer, tipoTarea As String) As Boolean
        Dim correcto As Boolean = False

        Try
            conection.connect()
            conection.setQuery("INSERT INTO TareasGenericas (Codigo, Descripcion, CodAsig, HEstimadas, Explotacion, TipoTarea) VALUES ('" & codigo & "', '" & descripcion & "', '" & codAsig & "', '" & horasEstimadas & "', 'True',  '" & tipoTarea & "')")
            correcto = True
        Catch ex As Exception
        End Try
        conection.disconnect()
        Return correcto
    End Function

    Function obtenerMediaDedicacionesReales(asignatura As String) As Double
        Dim media As Double = 0.0
        Try
            conection.connect()
            reader = conection.getQuery("SELECT AVG(EstudiantesTareas.HReales) AS Media FROM Asignaturas JOIN TareasGenericas ON Asignaturas.codigo = TareasGenericas.CodAsig JOIN EstudiantesTareas ON TareasGenericas.Codigo = EstudiantesTareas.CodTarea WHERE Asignaturas.Nombre = '" & asignatura & "'")
            While (reader.Read)
                media = Convert.ToDouble(reader("Media"))
            End While
        Catch ex As Exception
            'PrintLine(0)
        End Try
        conection.disconnect()
        Return media
    End Function

    Function getAlumnosSinTarea(tarea As String) As DataTable
        Dim table As New DataTable("Excluidos")
        table.Columns.AddRange(New DataColumn() {New DataColumn("Email", GetType(String))})

        Try
            conection.connect()
            reader = conection.getQuery("SELECT  email FROM usuarios Where tipo = 'A' EXCEPT SELECT Email FROM EstudiantesTareas WHERE EstudiantesTareas.CodTarea='" & tarea & "' ")
            While (reader.Read)
                Dim workRow As DataRow = table.NewRow()
                workRow("Email") = reader("Email")
                table.Rows.Add(workRow)
            End While
            reader.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        conection.disconnect()
        Return table
    End Function

End Class

