
Partial Class Views_Catedraticos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        End If
        If gvCatedraticos.SelectedIndex > -1 Then
            btnNuevaAsignacion.Enabled = True
        Else
            btnNuevaAsignacion.Enabled = False
        End If
    End Sub

    Protected Sub btnGuardarCatedratico_Click(sender As Object, e As EventArgs) Handles btnGuardarCatedratico.Click
        CatedraticosSDS.InsertParameters("NOMBRE").DefaultValue = Nombre.Text
        CatedraticosSDS.InsertParameters("CODIGO").DefaultValue = Codigo.Text
        CatedraticosSDS.Insert()
        Nombre.Text = String.Empty
        Codigo.Text = String.Empty
        CatedraticosSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
        CatedraticosSDS.InsertParameters("CODIGO").DefaultValue = String.Empty
    End Sub
    Protected Sub btnGuardarAsignacion_Click(sender As Object, e As EventArgs) Handles btnGuardarAsignacion.Click
        AsignacionSDS.InsertParameters("ID_CURSO").DefaultValue = Curso.SelectedValue
        AsignacionSDS.InsertParameters("ID_CATEDRATICO").DefaultValue = gvCatedraticos.SelectedValue
        AsignacionSDS.InsertParameters("SECCION").DefaultValue = Seccion.Text
        AsignacionSDS.Insert()

    End Sub

    Protected Sub gvCatedraticos_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles gvCatedraticos.SelectedIndexChanging
        If gvCatedraticos.SelectedIndex > -1 Then
            btnNuevaAsignacion.Enabled = True
        Else
            btnNuevaAsignacion.Enabled = False
        End If
    End Sub
End Class
