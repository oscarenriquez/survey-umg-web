
Partial Class Views_Carreras
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnGuardarCarrera_Click(sender As Object, e As EventArgs) Handles btnGuardarCarrera.Click
        CarrerasSDS.InsertParameters("NOMBRE").DefaultValue = NombreCarrera.Text
        CarrerasSDS.Insert()
        NombreCarrera.Text = String.Empty
        CarrerasSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
    End Sub
End Class
