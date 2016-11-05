
Partial Class Views_Valida
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim carnet1 As String = Request("txtCarnet1")
        Dim carnet2 As String = Request("txtCarnet2")
        Dim carnet3 As String = Request("txtCarnet3")

        Dim encuesta As String = Request("Encuesta")

        If encuesta IsNot Nothing AndAlso encuesta.Equals("Encuesta") Then
            Dim carnet = carnet1 & "-" & carnet2 & "-" & carnet3
            Dim auth As Autentificacion = New Autentificacion

            Session("Activo") = True
            Session("ExisteEstudiante") = auth.ExisteEstudiante(carnet)
            Session("Carnet") = carnet
            If (Session("ExisteEstudiante")) Then
                Dim dict As Dictionary(Of String, Long) = auth.ConsultaEstudiante(carnet)
                Session("ID_ESTUDIANTE") = dict("ID")
                Session("ID_CARRERA") = dict("ID_CARRERA")
                Response.Redirect("/Views/DatosCurso.aspx", True)
            Else
                Response.Redirect("/Views/DatosEstudiante.aspx", True)
            End If
        Else
            Session("ID_ESTUDIANTE") = Nothing
            Session("ID_CARRERA") = Nothing
            Session("Activo") = False
            Response.Redirect("/", True)
        End If
    End Sub
End Class
