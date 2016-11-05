
Partial Class view_Login
    Inherits System.Web.UI.Page

    Protected Sub Login1_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles Login1.Authenticate
        Dim auth As Autentificacion = New Autentificacion
        If auth.Autenticar(Login1.UserName, Login1.Password) Then
            Session("Activo") = True
            Response.Redirect("/Views/Home.aspx", True)
        End If
    End Sub
End Class
