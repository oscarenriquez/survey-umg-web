
Partial Class Views_DatosEstudiante
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        Else
            lbCarnet.Text = Session("Carnet")
        End If
    End Sub

    Protected Sub btnContinuar_Click(sender As Object, e As EventArgs) Handles btnContinuar.Click
        Dim auth As Autentificacion = New Autentificacion
        Dim ID_CARRERA As Int64 = Int64.Parse(listCarreras.SelectedValue)
        Dim NOMBRE As String = txtNombre.Text
        Dim CICLO As Int32 = Int32.Parse(LIstCiclo.SelectedValue)
        Session("ID_CARRERA") = ID_CARRERA

        auth.CrearEstudiante(Session("Carnet"), NOMBRE, CICLO, ID_CARRERA)
        Dim dict As Dictionary(Of String, Object) = auth.ConsultaEstudiante(Session("Carnet"))
        Session("ID_ESTUDIANTE") = dict("ID")
        Session("ID_CARRERA") = dict("ID_CARRERA")
        Session("NOMBRE") = dict("NOMBRE")
        Session("CARRERA") = dict("CARRERA")

        Response.Redirect("/Views/DatosCurso.aspx", True)
    End Sub

End Class
