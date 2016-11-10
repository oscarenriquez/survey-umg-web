
Partial Class Mantenimientos
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Activo") Is Nothing OrElse Not Session("Activo") OrElse Not Session("Admin") Then
            Response.Redirect("/", True)
        End If
    End Sub
End Class

