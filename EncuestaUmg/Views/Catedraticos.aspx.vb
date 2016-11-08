
Partial Class Views_Catedraticos
    Inherits System.Web.UI.Page

    Private auth As Autentificacion

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        Else
            auth = New Autentificacion
            If Request("GuardarCatedratico") IsNot Nothing Then
                Dim Nombre As String = Request("Nombre")
                Dim Codigo As String = Request("Codigo")
                If Nombre IsNot Nothing AndAlso Codigo IsNot Nothing Then
                    CatedraticosSDS.InsertParameters("NOMBRE").DefaultValue = Nombre
                    CatedraticosSDS.InsertParameters("CODIGO").DefaultValue = Codigo
                    CatedraticosSDS.Insert()
                    CatedraticosSDS.InsertParameters("NOMBRE").DefaultValue = String.Empty
                    CatedraticosSDS.InsertParameters("CODIGO").DefaultValue = String.Empty
                    gvCatedraticos.DataBind()
                End If
            End If

            If Request("GuardarAsignacion") IsNot Nothing AndAlso Request("Carrera") IsNot Nothing AndAlso Request("Curso") IsNot Nothing AndAlso Request("Seccion") IsNot Nothing Then
                Dim Carrera As String = Request("Carrera")
                Dim Curso As String = Request("Curso")
                Dim Seccion As String = Request("Seccion")
                AsignacionSDS.InsertParameters("ID_CURSO").DefaultValue = Curso
                AsignacionSDS.InsertParameters("ID_CATEDRATICO").DefaultValue = gvCatedraticos.SelectedValue
                AsignacionSDS.InsertParameters("SECCION").DefaultValue = Seccion
                AsignacionSDS.Insert()
                gvAsignacion.DataBind()
            End If

            If Request("GetCarreras") IsNot Nothing Then
                GetListaCarreras()
            End If

            If Request("GetCursos") IsNot Nothing AndAlso Request("ID_CARRERA") IsNot Nothing Then
                GetListaCursosByCarrera()
            End If
        End If
        If gvCatedraticos.SelectedIndex > -1 Then
            btnNuevaAsignacion.Enabled = True
        Else
            btnNuevaAsignacion.Enabled = False
        End If
    End Sub

    Private Sub GetListaCarreras()
        Dim listaCarreras As List(Of Dictionary(Of String, String)) = auth.GetListaCarreras()
        Dim jsonResult As String = "["
        If listaCarreras.Count > 0 Then
            listaCarreras.ForEach(Sub(Value)
                                      jsonResult &= "{""ID"":" & Value.Item("ID") & ", ""DESCRIPCION"": """ & Value.Item("DESC") & """},"
                                  End Sub)
            jsonResult = jsonResult.Substring(0, jsonResult.Length - 1)
        End If
        jsonResult &= "]"
        Response.Clear()
        Response.ContentType = "application/json"
        Response.Write(jsonResult)
        Response.End()
    End Sub

    Private Sub GetListaCursosByCarrera()
        Dim listaCursos As List(Of Dictionary(Of String, String)) = auth.GetListaCursosByCarrera(Long.Parse(Request("ID_CARRERA")))
        Dim jsonResult As String = "["
        If listaCursos.Count > 0 Then
            listaCursos.ForEach(Sub(Value)
                                    jsonResult &= "{""ID"":" & Value.Item("ID") & ", ""DESCRIPCION"": """ & Value.Item("DESC") & """},"
                                End Sub)
            jsonResult = jsonResult.Substring(0, jsonResult.Length - 1)
        End If
        jsonResult &= "]"
        Response.Clear()
        Response.ContentType = "application/json"
        Response.Write(jsonResult)
        Response.End()
    End Sub


    Protected Sub gvCatedraticos_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles gvCatedraticos.SelectedIndexChanging
        If gvCatedraticos.SelectedIndex > -1 Then
            btnNuevaAsignacion.Enabled = True
        Else
            btnNuevaAsignacion.Enabled = False
        End If
    End Sub
End Class
