
Partial Class Views_Administradores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        ElseIf Request("GuardarUsuario") IsNot Nothing Then
            Dim Login As String = Request("Login")
            Dim Password As String = Request("Password")
            If Login IsNot Nothing AndAlso Password IsNot Nothing Then
                GuardarUsuario(Login, Password)
            End If

        End If
    End Sub

    Private Sub GuardarUsuario(Login As String, Password As String)
        UsuariosSDS.InsertParameters("LOGIN").DefaultValue = Login
        UsuariosSDS.InsertParameters("PASSWORD").DefaultValue = Password
        UsuariosSDS.Insert()
        UsuariosSDS.InsertParameters("LOGIN").DefaultValue = String.Empty
        UsuariosSDS.InsertParameters("PASSWORD").DefaultValue = String.Empty
    End Sub

End Class
