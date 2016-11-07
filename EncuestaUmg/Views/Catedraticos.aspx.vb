
Partial Class Views_Catedraticos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        Else
            If Session("GuardarCatedratico") IsNot Nothing Then
                Dim Nombre As String = Session("NombreCatedratico")
                Dim Codigo As String = Session("Codigo")
                If Nombre IsNot Nothing AndAlso Codigo IsNot Nothing Then
                    CatedraticosSDS.InsertParameters("NOMBRE").DefaultValue = Nombre
                    CatedraticosSDS.InsertParameters("CODIGO").DefaultValue = Codigo
                    CatedraticosSDS.Insert()
                    CatedraticosSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
                    CatedraticosSDS.InsertParameters("CODIGO").DefaultValue = String.Empty
                End If
            End If

            If Session("GuardarAsignacion") IsNot Nothing Then
                Dim Carrera As String = Session("Carrera")
                Dim Curso As String = Session("Curso")
                Dim Seccion As String = Session("Seccion")
                AsignacionSDS.InsertParameters("ID_CURSO").DefaultValue = Curso
                AsignacionSDS.InsertParameters("ID_CATEDRATICO").DefaultValue = gvCatedraticos.SelectedValue
                AsignacionSDS.InsertParameters("SECCION").DefaultValue = Seccion
                AsignacionSDS.Insert()
            End If
        End If
        If gvCatedraticos.SelectedIndex > -1 Then
            btnNuevaAsignacion.Enabled = True
        Else
            btnNuevaAsignacion.Enabled = False
        End If
    End Sub

    Protected Sub gvCatedraticos_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles gvCatedraticos.SelectedIndexChanging
        If gvCatedraticos.SelectedIndex > -1 Then
            btnNuevaAsignacion.Enabled = True
        Else
            btnNuevaAsignacion.Enabled = False
        End If
    End Sub
End Class
