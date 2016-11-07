
Partial Class Views_DatosEncuesta
    Inherits System.Web.UI.Page

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim pregunta1 = Request("pregunta1")
        Dim pregunta2 = Request("pregunta2")
        Dim pregunta3 = Request("pregunta3")
        Dim pregunta4 = Request("pregunta4")
        Dim pregunta5 = Request("pregunta5")
        Dim pregunta6 = Request("pregunta6")
        Dim observaciones = Request("observaciones")

        If (pregunta1 Is Nothing OrElse pregunta2 Is Nothing OrElse pregunta3 Is Nothing OrElse pregunta4 Is Nothing OrElse pregunta5 Is Nothing) Then
            Response.Write("<script>alert('Seleccione todas las preguntas por favor')</script>")
        Else
            Dim encuesta As Encuesta = New Encuesta
            encuesta.ID_ESTUDIANTE = Session("ID_ESTUDIANTE")
            encuesta.ID_CATED_CURSO = Session("ID_CATED_CURSO")
            encuesta.PREGUNTA1 = Int32.Parse(pregunta1)
            encuesta.PREGUNTA2 = Int32.Parse(pregunta2)
            encuesta.PREGUNTA3 = Int32.Parse(pregunta3)
            encuesta.PREGUNTA4 = Int32.Parse(pregunta4)
            encuesta.PREGUNTA5 = Int32.Parse(pregunta5)
            encuesta.PREGUNTA6 = Int32.Parse(pregunta6)
            encuesta.OBSERVACIONES = observaciones
            encuesta.TOTAL = encuesta.PREGUNTA1 + encuesta.PREGUNTA2 + encuesta.PREGUNTA3 + encuesta.PREGUNTA4 + encuesta.PREGUNTA5 + encuesta.PREGUNTA6
            encuesta.FECHA = New DateTime
            Dim auth As Autentificacion = New Autentificacion
            auth.CrearEncuesta(encuesta)
            Response.Redirect("/Views/DatosCurso.aspx", True)
        End If
    End Sub
End Class
