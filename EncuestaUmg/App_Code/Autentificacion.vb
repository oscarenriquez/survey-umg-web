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

    Public Function ConsultaEstudiante(carnet As String) As Dictionary(Of String, Long)
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 = New SqlParameter("@carnet", carnet)

        parameters.Add(param1)
        Dim result As Dictionary(Of String, Long) = New Dictionary(Of String, Long)
        Try
            conn.Open()

            Dim reader As SqlDataReader = ConexionUtil.CreateCommandRead("SELECT ID, ID_CARRERA FROM [ESTUDIANTE] WHERE LOWER(CARNET) = @carnet ", conn, parameters)
            Do While reader.Read()
                result.Add("ID", reader.GetInt64(0))
                result.Add("ID_CARRERA", reader.GetInt64(1))
            Loop
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try

        Return result
    End Function

    Public Sub CrearEncuesta(encuesta As Encuesta)
        Dim conn As SqlConnection = ConexionUtil.GetConnection
        Dim parameters As List(Of SqlParameter) = New List(Of SqlParameter)

        Dim param1 As SqlParameter = New SqlParameter("@ID_ESTUDIANTE", encuesta.ID_ESTUDIANTE)
        Dim param2 As SqlParameter = New SqlParameter("@ID_CATED_CURSO", encuesta.ID_CATED_CURSO)
        Dim param3 As SqlParameter = New SqlParameter("@PREGUNTA1", encuesta.PREGUNTA1)
        Dim param4 As SqlParameter = New SqlParameter("@PREGUNTA2", encuesta.PREGUNTA2)
        Dim param5 As SqlParameter = New SqlParameter("@PREGUNTA3", encuesta.PREGUNTA3)
        Dim param6 As SqlParameter = New SqlParameter("@PREGUNTA4", encuesta.PREGUNTA4)
        Dim param7 As SqlParameter = New SqlParameter("@PREGUNTA5", encuesta.PREGUNTA5)
        Dim param8 As SqlParameter = New SqlParameter("@PREGUNTA6", encuesta.PREGUNTA6)
        Dim param9 As SqlParameter = New SqlParameter("@TOTAL", encuesta.TOTAL)
        Dim param10 As SqlParameter = New SqlParameter("@OBSERVACIONES", encuesta.OBSERVACIONES)
        'Dim param11 As SqlParameter = New SqlParameter("@FECHA", encuesta.FECHA)

        parameters.Add(param1)
        parameters.Add(param2)
        parameters.Add(param3)
        parameters.Add(param4)
        parameters.Add(param5)
        parameters.Add(param6)
        parameters.Add(param7)
        parameters.Add(param8)
        parameters.Add(param9)
        parameters.Add(param10)
        'parameters.Add(param11)

        Dim result As Integer = 0
        Try
            conn.Open()
            Dim sql = "   INSERT INTO [ENCUESTA] (ID_ESTUDIANTE,ID_CATED_CURSO,PREGUNTA1,PREGUNTA2,PREGUNTA3,PREGUNTA4,PREGUNTA5,PREGUNTA6,TOTAL,OBSERVACIONES,FECHA) "
            sql = sql & " VALUES(@ID_ESTUDIANTE,@ID_CATED_CURSO,@PREGUNTA1,@PREGUNTA2,@PREGUNTA3,@PREGUNTA4,@PREGUNTA5,@PREGUNTA6,@TOTAL,@OBSERVACIONES,GETDATE())"
            result = ConexionUtil.CreateCommand(sql, conn, parameters)
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            conn.Close()
        End Try
    End Sub

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
End Class
