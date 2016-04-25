Public Class WebForm2
    Inherits System.Web.UI.Page
    Dim businessLogic As New BusinessLogic.AccesManagerDB
    Dim matricula As New ServicioMatricula.Matriculas


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            preguntas.Items.Add("¿Cúal es tu color favorito?")
            preguntas.Items.Add("¿Cúal es el nombre de tu mascota?")
            preguntas.Items.Add("¿En qué año naciste?")
            preguntas.Items.Add("¿Cómo se llama tu madre?")

            preguntas.SelectedIndex = 0
        End If
        If Session("Email") IsNot Nothing Then
            Response.Redirect("Inicio.aspx")
        End If
    End Sub


    Protected Sub btnRegistrarse_Click(sender As Object, e As EventArgs) Handles btnRegistrarse.Click
        If Page.IsValid Then
            If Not businessLogic.existeEmail(textEmail.Text) Then

                If businessLogic.insertarUsuario(textNombre.Text, textEmail.Text, textPassword.Text, TextDNI.Text, preguntas.SelectedIndex, respuesta.Text, textGrupo.Text) Then
                    consola.Text = "Cuenta creada correctamente."
                Else
                    consola.Text = "Imposible registrar el usuario indicado, fallo con la base de datos, por favor intentelo más tarde."
                End If
            Else
                consola.Text = "El email introducido ya existe"
            End If
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles preguntas.SelectedIndexChanged

    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles ValidacionMatriculado.ServerValidate
        If (matricula.comprobar(textEmail.Text) = "SI") Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub
End Class