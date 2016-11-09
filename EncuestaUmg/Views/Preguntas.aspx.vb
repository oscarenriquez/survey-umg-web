
Partial Class Views_Preguntas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub dtPregunta_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles dtPregunta.ItemInserted
        gvPreguntas.DataBind()
    End Sub
End Class
