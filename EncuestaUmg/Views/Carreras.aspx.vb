
Partial Class Views_Carreras
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        End If
        If gvCarreras.SelectedIndex > -1 Then
            btnNuevoCurso.Enabled = True
        Else
            btnNuevoCurso.Enabled = False
        End If

        If Request("GuardarCarrera") IsNot Nothing AndAlso Request("NombreCarrera") IsNot Nothing Then
            Dim NombreCarrera As String = Request("NombreCarrera")
            CarrerasSDS.InsertParameters("NOMBRE").DefaultValue = NombreCarrera
            CarrerasSDS.Insert()
            CarrerasSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
        End If

        If Request("GuardarCurso") IsNot Nothing AndAlso Request("NombreCurso") IsNot Nothing Then
            Dim NombreCurso As String = Request("NombreCurso")
            CursosSDS.InsertParameters("NOMBRE").DefaultValue = NombreCurso
            CursosSDS.InsertParameters("ID_CARRERA").DefaultValue = gvCarreras.SelectedValue
            CursosSDS.Insert()
            CursosSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
        End If
    End Sub

    Private Sub gvCarreras_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles gvCarreras.SelectedIndexChanging
        If gvCarreras.SelectedIndex > -1 Then
            btnNuevoCurso.Enabled = True
        Else
            btnNuevoCurso.Enabled = False
        End If
    End Sub
End Class
