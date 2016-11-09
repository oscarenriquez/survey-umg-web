
Partial Class Views_DatosEncuesta2
    Inherits System.Web.UI.Page
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim encuesta As Encuesta = New Encuesta
        encuesta.ID_ESTUDIANTE = Session("ID_ESTUDIANTE")
        encuesta.ID_CATED_CURSO = Session("ID_CATED_CURSO")
        encuesta.OBSERVACIONES = Observaciones.Text
        encuesta.TOTAL = 0

        For Each row As GridViewRow In gvPreguntas.Rows
            Dim listRespuestas As DropDownList = row.FindControl("listaRespuesta")
            If listRespuestas IsNot Nothing Then
                Dim value As Integer = listRespuestas.SelectedValue
                encuesta.TOTAL = encuesta.TOTAL + value
            End If
        Next

        encuesta.FECHA = New DateTime
        Dim auth As Autentificacion = New Autentificacion
        Dim encuestaId = auth.CrearEncuesta(encuesta)

        For Each row As GridViewRow In gvPreguntas.Rows
            Dim listRespuestas As DropDownList = row.FindControl("listaRespuesta")
            Dim texto As TableCell = row.Cells.Item(0)
            Dim preguntaId As Long = Long.Parse(row.Cells.Item(0).Text)
            If listRespuestas IsNot Nothing Then
                Dim value As Integer = listRespuestas.SelectedValue
                auth.CrearEncuestaDetalle(encuestaId, preguntaId, value)
            End If
        Next

        Response.Redirect("/Views/Resultado.aspx", True)
    End Sub
End Class
