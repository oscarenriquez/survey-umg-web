
Partial Class Views_DatosEstudiante
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        End If
    End Sub

    Protected Sub btnContinuar_Click(sender As Object, e As EventArgs) Handles btnContinuar.Click
        Session("ID_CARRERA") = Int64.Parse(listCarreras.SelectedValue)
        ID_CARRERA_HIDDEN.Value = Int64.Parse(listCarreras.SelectedValue)
    End Sub

    Protected Sub btnContinuar2_Click(sender As Object, e As EventArgs) Handles btnContinuar2.Click
        Session("ID_CATED_CURSO") = Int64.Parse(ListaCatedraticos.SelectedValue)
    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim pregunta1 = Request("pregunta1")
        Dim pregunta2 = Request("pregunta2")
        Dim pregunta3 = Request("pregunta3")
        Dim pregunta4 = Request("pregunta4")
        Dim pregunta5 = Request("pregunta5")
        Dim pregunta6 = Request("preguntat6")
        Dim observaciones = Request("observaciones")

        If (pregunta1 Is Nothing OrElse pregunta2 Is Nothing OrElse pregunta3 Is Nothing OrElse pregunta4 Is Nothing OrElse pregunta5 Is Nothing) Then
            Response.Write("<script>alert('Seleccione todas las preguntas por favor')</script>")
        Else
            Dim encuesta As Encuesta = New Encuesta
            encuesta.ID_ESTUDIANTE = Session("ID_ESTUDIANTE")
            encuesta.ID_CATED_CURSO = Session("ID_CATED_CURSO")
            encuesta.PREGUNTA1 = pregunta1
            encuesta.PREGUNTA2 = pregunta2
            encuesta.PREGUNTA3 = pregunta3
            encuesta.PREGUNTA4 = pregunta4
            encuesta.PREGUNTA5 = pregunta5
            encuesta.PREGUNTA6 = pregunta6
            encuesta.OBSERVACIONES = observaciones
            encuesta.TOTAL = pregunta1 + pregunta2 + pregunta3 + pregunta4 + pregunta5 + pregunta6
            encuesta.FECHA = New DateTime

            Dim auth As Autentificacion = New Autentificacion
            auth.CrearEncuesta(encuesta)
            MultiView1.SetActiveView(View2)
        End If
    End Sub

End Class
