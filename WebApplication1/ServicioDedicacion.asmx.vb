Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class ServicioDedicacion
    Inherits System.Web.Services.WebService
    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim acces As New BusinessLogic.AccesManagerDB

    <WebMethod()>
    Public Function MediaDedicacionesReales(asignatura As String) As Double
        Return BusinessLogic.obtenerMediaDedicacionesReales(asignatura)
    End Function

    <WebMethod()>
    Public Function getDedicaciónTarea(ByVal tarea As String) As DataTable
        Return acces.getAlumnosSinTarea(tarea)
    End Function

End Class