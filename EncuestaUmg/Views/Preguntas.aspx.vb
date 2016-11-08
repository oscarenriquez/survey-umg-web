
Partial Class Views_Preguntas
    Inherits System.Web.UI.Page

    Protected Sub gvPreguntas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvPreguntas.SelectedIndexChanged

    End Sub
    Protected Sub ListaCarreras_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListaCarreras.SelectedIndexChanged
        gvPreguntas.DataBind()
    End Sub
End Class
