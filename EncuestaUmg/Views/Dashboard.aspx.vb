
Partial Class Views_Dashboard
    Inherits System.Web.UI.Page
    Private auth As Autentificacion

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Session("Activo") IsNot Nothing AndAlso Session("Activo")) Then
            Response.Redirect("/", True)
        Else
            auth = New Autentificacion

            If Request("GetCarreras") IsNot Nothing Then
                GetListaCarreras()
            End If

            If Request("GetCursos") IsNot Nothing AndAlso Request("ID_CARRERA") IsNot Nothing Then
                GetListaCursosByCarrera()
            End If

            If Request("GetCatedraticos") IsNot Nothing AndAlso Request("ID_CURSO") IsNot Nothing Then
                GetListaCatedraticosByCurso()
            End If

            If Request("GetGrafica") IsNot Nothing AndAlso Request("ID_CURSO") IsNot Nothing AndAlso Request("ID_CATEDRATICO") IsNot Nothing Then
                GetDataGrafica()
            End If
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

    Private Sub GetListaCatedraticosByCurso()
        Dim lista As List(Of Dictionary(Of String, String)) = auth.GetListaCatedraticosByCurso(Long.Parse(Request("ID_CURSO")))
        Dim jsonResult As String = "["
        If lista.Count > 0 Then
            lista.ForEach(Sub(Value)
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

    Private Sub GetDataGrafica()
        Dim ID_CURSO As String = Request("ID_CURSO")
        Dim ID_CATEDRATICO As String = Request("ID_CATEDRATICO")
        Dim IGNORAR As String = Request("IGNORAR")
        Dim FECHA As String = Request("FECHA")
        Dim lista As List(Of Dictionary(Of String, String)) = auth.GetDataEncuestaByCurso(Long.Parse(ID_CURSO), Long.Parse(ID_CATEDRATICO), Boolean.Parse(IGNORAR), FECHA)
        Dim jsonResult As String = "["
        If lista.Count > 0 Then
            lista.ForEach(Sub(Value)
                              jsonResult &= "{""seccion"":""Seccion: " & Value.Item("SECCION") & """, ""promedio"": " & Value.Item("PROMEDIO") & "},"
                          End Sub)
            jsonResult = jsonResult.Substring(0, jsonResult.Length - 1)
        End If
        jsonResult &= "]"
        Response.Clear()
        Response.ContentType = "application/json"
        Response.Write(jsonResult)
        Response.End()
    End Sub
End Class
