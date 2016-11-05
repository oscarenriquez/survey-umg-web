
Partial Class Views_Administradores
    Inherits System.Web.UI.Page

    Protected Sub btnGuardarUsuario_Click(sender As Object, e As EventArgs) Handles btnGuardarUsuario.Click
        UsuariosSDS.InsertParameters("LOGIN").DefaultValue = Login.Text
        UsuariosSDS.InsertParameters("PASSWORD").DefaultValue = Password.Text
        UsuariosSDS.InsertParameters("FECHA").DefaultValue = New DateTime
        UsuariosSDS.Insert()
        Login.Text = String.Empty
        Password.Text = String.Empty
        UsuariosSDS.InsertParameters("LOGIN").DefaultValue = String.Empty
        UsuariosSDS.InsertParameters("PASSWORD").DefaultValue = String.Empty
        UsuariosSDS.InsertParameters("FECHA").DefaultValue = Nothing
    End Sub
End Class
