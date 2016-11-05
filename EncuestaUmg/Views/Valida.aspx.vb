
Partial Class Views_Valida
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim carnet1 As String = Request("txtCarnet1")
        Dim carnet2 As String = Request("txtCarnet1")
        Dim carnet3 As String = Request("txtCarnet1")

        Dim encuesta As String = Request("Encuesta")

        If encuesta IsNot Nothing AndAlso encuesta.Equals("Encuesta") Then
            Session("Activo") = True
            Response.Redirect("/Views/DatosEstudiante.aspx", True)
        Else
            Response.Redirect("/", True)
        End If
    End Sub
End Class
