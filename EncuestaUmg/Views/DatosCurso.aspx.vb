
Partial Class Views_DatosCurso
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        Else
            ID_CARRERA_HIDDEN.Value = Session("ID_CARRERA")
        End If
    End Sub
    Protected Sub btnContinuar2_Click(sender As Object, e As EventArgs) Handles btnContinuar2.Click
        Dim ID_CAT_CURSO = Int64.Parse(ListaCatedraticos.SelectedValue)
        Session("ID_CATED_CURSO") = ID_CAT_CURSO
        Dim auth As Autentificacion = New Autentificacion
        Dim dict As Dictionary(Of String, Object) = auth.GetCatedraticoCurso(ID_CAT_CURSO)
        Session("CATEDRATICO") = dict("CATEDRATICO")
        Session("CURSO") = dict("CURSO")
        Response.Redirect("/Views/DatosEncuesta2.aspx", True)
    End Sub
End Class
