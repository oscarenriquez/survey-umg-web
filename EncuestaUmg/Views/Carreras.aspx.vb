
Partial Class Views_Carreras
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If gvCarreras.SelectedIndex > -1 Then
            btnNuevoCurso.Enabled = True
        Else
            btnNuevoCurso.Enabled = False
        End If
    End Sub
    Protected Sub btnGuardarCarrera_Click(sender As Object, e As EventArgs) Handles btnGuardarCarrera.Click
        CarrerasSDS.InsertParameters("NOMBRE").DefaultValue = NombreCarrera.Text
        CarrerasSDS.Insert()
        NombreCarrera.Text = String.Empty
        CarrerasSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
    End Sub
    Protected Sub btnGuardarCurso_Click(sender As Object, e As EventArgs) Handles btnGuardarCurso.Click
        CursosSDS.InsertParameters("NOMBRE").DefaultValue = NombreCurso.Text
        CursosSDS.InsertParameters("ID_CARRERA").DefaultValue = gvCarreras.SelectedValue
        CursosSDS.Insert()
        NombreCarrera.Text = String.Empty
        CursosSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
    End Sub

    Private Sub gvCarreras_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles gvCarreras.SelectedIndexChanging
        If gvCarreras.SelectedIndex > -1 Then
            btnNuevoCurso.Enabled = True
        Else
            btnNuevoCurso.Enabled = False
        End If
    End Sub
End Class
