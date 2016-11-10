Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class Autentificacion

    Public Function Autenticar(usuario As String, password As String) As Boolean
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 = New SqlParameter("@login", usuario.Trim.ToLower)
        Dim param2 = New SqlParameter("@password", password.Trim.ToLower)

        parameters.Add(param1)
        parameters.Add(param2)
        Dim result As Integer = 0
        Try
            conn.Open()

            result = ConexionUtil.CreateCommandCount("SELECT COUNT(*) FROM [USUARIOS] WHERE LOWER(LOGIN) = @login AND LOWER(PASSWORD) = @password", conn, parameters)
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try

        Return result > 0
    End Function

    Public Function ExisteEstudiante(carnet As String) As Boolean
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 = New SqlParameter("@carnet", carnet)

        parameters.Add(param1)

        Dim result As Integer = 0
        Try
            conn.Open()

            result = ConexionUtil.CreateCommandCount("SELECT COUNT(*) FROM [ESTUDIANTE] WHERE LOWER(CARNET) = @carnet ", conn, parameters)
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try

        Return result > 0
    End Function

    Public Function ConsultaEstudiante(carnet As String) As Dictionary(Of String, Object)
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 = New SqlParameter("@carnet", carnet)

        parameters.Add(param1)
        Dim result As Dictionary(Of String, Object) = New Dictionary(Of String, Object)
        Try
            conn.Open()

            Dim reader As SqlDataReader = ConexionUtil.CreateCommandRead("SELECT A.ID, A.ID_CARRERA, A.NOMBRE, B.NOMBRE FROM [ESTUDIANTE] AS A INNER JOIN [CARRERA] AS B ON (A.ID_CARRERA = B.ID) WHERE LOWER(A.CARNET) = @carnet ", conn, parameters)
            Do While reader.Read()
                result.Add("ID", reader.GetInt64(0))
                result.Add("ID_CARRERA", reader.GetInt64(1))
                result.Add("NOMBRE", reader.GetString(2))
                result.Add("CARRERA", reader.GetString(3))
            Loop
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try

        Return result
    End Function

    Public Function CrearEncuesta(encuesta As Encuesta) As Long
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 As SqlParameter = New SqlParameter("@ID_ESTUDIANTE", encuesta.ID_ESTUDIANTE)
        Dim param2 As SqlParameter = New SqlParameter("@ID_CATED_CURSO", encuesta.ID_CATED_CURSO)
        'Dim param3 As SqlParameter = New SqlParameter("@PREGUNTA1", encuesta.PREGUNTA1)
        'Dim param4 As SqlParameter = New SqlParameter("@PREGUNTA2", encuesta.PREGUNTA2)
        'Dim param5 As SqlParameter = New SqlParameter("@PREGUNTA3", encuesta.PREGUNTA3)
        'Dim param6 As SqlParameter = New SqlParameter("@PREGUNTA4", encuesta.PREGUNTA4)
        'Dim param7 As SqlParameter = New SqlParameter("@PREGUNTA5", encuesta.PREGUNTA5)
        'Dim param8 As SqlParameter = New SqlParameter("@PREGUNTA6", encuesta.PREGUNTA6)
        Dim param9 As SqlParameter = New SqlParameter("@TOTAL", encuesta.TOTAL)
        Dim param10 As SqlParameter = New SqlParameter("@OBSERVACIONES", encuesta.OBSERVACIONES)
        'Dim param11 As SqlParameter = New SqlParameter("@FECHA", encuesta.FECHA)

        parameters.Add(param1)
        parameters.Add(param2)
        'parameters.Add(param3)
        'parameters.Add(param4)
        'parameters.Add(param5)
        'parameters.Add(param6)
        'parameters.Add(param7)
        'parameters.Add(param8)
        parameters.Add(param9)
        parameters.Add(param10)
        'parameters.Add(param11)

        Dim result As Integer = 0
        Dim encuestaId As Long
        Try
            conn.Open()
            Dim sql = "   INSERT INTO [ENCUESTA] (ID_ESTUDIANTE,ID_CATED_CURSO,TOTAL,OBSERVACIONES,FECHA) "
            sql = sql & " VALUES(@ID_ESTUDIANTE,@ID_CATED_CURSO,@TOTAL,@OBSERVACIONES,GETDATE())"
            result = ConexionUtil.CreateCommand(sql, conn, parameters)

            sql = " SELECT ID FROM ENCUESTA WHERE ID = (SELECT MAX(ID) FROM ENCUESTA) "
            encuestaId = ConexionUtil.CreateCommandCount(sql, conn, New List(Of SqlParameter))
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try
        Return encuestaId
    End Function

    Public Sub CrearEstudiante(carnet As String, nombre As String, ciclo As Int32, carrera As Long)
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 As SqlParameter = New SqlParameter("@carnet", carnet)
        Dim param2 As SqlParameter = New SqlParameter("@nombre", nombre)
        Dim param3 As SqlParameter = New SqlParameter("@ciclo", ciclo)
        Dim param4 As SqlParameter = New SqlParameter("@carrera", carrera)

        parameters.Add(param1)
        parameters.Add(param2)
        parameters.Add(param3)
        parameters.Add(param4)

        Dim result As Integer = 0
        Try
            conn.Open()
            Dim sql = "   INSERT INTO [ESTUDIANTE] (CARNET,NOMBRE,CICLO,ID_CARRERA) "
            sql = sql & " VALUES(@carnet,@nombre,@ciclo,@carrera)"
            result = ConexionUtil.CreateCommand(sql, conn, parameters)
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try
    End Sub

    Public Function GetListaCarreras() As List(Of Dictionary(Of String, String))
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim listaCarreras As List(Of Dictionary(Of String, String)) = New List(Of Dictionary(Of String, String))
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Try
            conn.Open()
            Dim sql = " SELECT ID, NOMBRE FROM CARRERA ORDER BY ID "
            Dim read As SqlDataReader = ConexionUtil.CreateCommandRead(sql, conn, parameters)
            If read.HasRows Then
                Do While read.Read
                    Dim row As Dictionary(Of String, String) = New Dictionary(Of String, String)
                    row.Add("ID", read.GetInt64(0).ToString)
                    row.Add("DESC", read.GetString(1))
                    listaCarreras.Add(row)
                Loop
            End If
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try
        Return listaCarreras
    End Function

    Public Function GetListaCursosByCarrera(ByVal CarreraId As Long) As List(Of Dictionary(Of String, String))
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim listaCarreras As List(Of Dictionary(Of String, String)) = New List(Of Dictionary(Of String, String))
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)
        parameters.Add(New SqlParameter("@ID_CARRERA", CarreraId))
        Try
            conn.Open()
            Dim sql = " SELECT ID, NOMBRE FROM CURSO WHERE ID_CARRERA = @ID_CARRERA ORDER BY ID "
            Dim read As SqlDataReader = ConexionUtil.CreateCommandRead(sql, conn, parameters)
            If read.HasRows Then
                Do While read.Read
                    Dim row As Dictionary(Of String, String) = New Dictionary(Of String, String)
                    row.Add("ID", read.GetInt64(0).ToString)
                    row.Add("DESC", read.GetString(1))
                    listaCarreras.Add(row)
                Loop
            End If
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try
        Return listaCarreras
    End Function

    Public Function GetListaCatedraticosByCurso(ByVal CursoId As Long) As List(Of Dictionary(Of String, String))
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim lista As List(Of Dictionary(Of String, String)) = New List(Of Dictionary(Of String, String))
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)
        parameters.Add(New SqlParameter("@ID_CURSO", CursoId))
        Try
            conn.Open()
            Dim sql As String = " select b.id, b.nombre, a.seccion from catedratico_curso as a " &
                                " inner join catedratico as b on (a.id_catedratico = b.id) " &
                                " where a.id_curso = @ID_CURSO "
            Dim read As SqlDataReader = ConexionUtil.CreateCommandRead(sql, conn, parameters)
            If read.HasRows Then
                Do While read.Read
                    Dim row As Dictionary(Of String, String) = New Dictionary(Of String, String)
                    row.Add("ID", read.GetInt64(0).ToString)
                    row.Add("DESC", read.GetString(1))
                    row.Add("SECCION", read.GetString(2))
                    lista.Add(row)
                Loop
            End If
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try
        Return lista
    End Function

    Public Function GetDataEncuestaByCurso(ByVal CursoId As Long, ByRef CatedraticoId As Long, ByVal IgnoreDate As Boolean, ByVal Fecha As String) As List(Of Dictionary(Of String, String))
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim lista As List(Of Dictionary(Of String, String)) = New List(Of Dictionary(Of String, String))
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)
        parameters.Add(New SqlParameter("@ID_CURSO", CursoId))
        parameters.Add(New SqlParameter("@ID_CATEDRATICO", CatedraticoId))
        If Not IgnoreDate Then
            parameters.Add(New SqlParameter("@FECHA", Fecha))
        End If
        Try
            conn.Open()
            Dim sql As String = " select x.seccion, avg((total*100) /(cant*4)), count(*) as cant from " &
                        " (select b.seccion, a.total, (select count(*) from encuesta_detalle where id_encuesta = a.id) cant " &
                        " from encuesta as a  " &
                        " inner join catedratico_curso as b on (a.id_cated_curso = b.id) " &
                        " where b.id_catedratico = @ID_CATEDRATICO " &
                        " and b.id_curso = @ID_CURSO "
            If Not IgnoreDate Then
                sql = sql & " CONVERT(varchar(10), a.[fecha], 103) = @FECHA "
            End If
            sql = sql & " ) as x " &
                        " where x.cant > 0 " &
                        " group by x.seccion, x.cant " &
                        " order by avg((total*100) /(cant*4)) desc "
            Dim read As SqlDataReader = ConexionUtil.CreateCommandRead(sql, conn, parameters)
            If read.HasRows Then
                Do While read.Read
                    Dim row As Dictionary(Of String, String) = New Dictionary(Of String, String)
                    row.Add("SECCION", read.GetString(0))
                    row.Add("PROMEDIO", read.GetInt32(1).ToString)
                    row.Add("CANTIDAD", read.GetInt32(2).ToString)
                    lista.Add(row)
                Loop
            End If
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try
        Return lista
    End Function

    Public Function GetCatedraticoCurso(ID_CAT_CURSO As Long) As Dictionary(Of String, Object)
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 = New SqlParameter("@ID_CAT_CURSO", ID_CAT_CURSO)

        parameters.Add(param1)
        Dim result As Dictionary(Of String, Object) = New Dictionary(Of String, Object)
        Try
            conn.Open()
            Dim sSql As String = " select b.nombre as catedratico, c.nombre as curso from catedratico_curso as a "
            sSql &= " inner join catedratico as b on (a.id_catedratico = b.id) "
            sSql &= " inner join curso as c on (a.id_curso = c.id) where a.id = @ID_CAT_CURSO"

            Dim reader As SqlDataReader = ConexionUtil.CreateCommandRead(sSql, conn, parameters)
            Do While reader.Read()
                result.Add("CATEDRATICO", reader.GetString(0))
                result.Add("CURSO", reader.GetString(1))
            Loop
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try

        Return result
    End Function

    Public Sub CrearEncuestaDetalle(ID_ENCUESTA As Long, ID_PREGUNTA As Long, VALOR As Integer)
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 As SqlParameter = New SqlParameter("@ID_ENCUESTA", ID_ENCUESTA)
        Dim param2 As SqlParameter = New SqlParameter("@ID_PREGUNTA", ID_PREGUNTA)
        Dim param3 As SqlParameter = New SqlParameter("@VALOR", VALOR)

        parameters.Add(param1)
        parameters.Add(param2)
        parameters.Add(param3)

        Dim result As Integer = 0
        Try
            conn.Open()
            Dim sql = "   INSERT INTO [ENCUESTA_DETALLE] (ID_ENCUESTA,ID_PREGUNTA,VALOR) "
            sql = sql & " VALUES(@ID_ENCUESTA,@ID_PREGUNTA,@VALOR)"
            result = ConexionUtil.CreateCommand(sql, conn, parameters)

        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try

    End Sub
End Class
