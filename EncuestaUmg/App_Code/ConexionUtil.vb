Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration

Public Module ConexionUtil
    Private connection As SqlConnection
    Private connectionString As String = ConfigurationManager.ConnectionStrings("connStr").ToString()

    Public Function GetConnection() As SqlConnection
        If connection Is Nothing Then
            connection = New SqlConnection(connectionString)
        End If
        Return connection
    End Function

    Public Function CreateCommand(queryString As String, ByRef connection As SqlConnection, parameters As List(Of SqlParameter)) As Integer
        Try
            Dim command As New SqlCommand(queryString, connection)

            For Each parameter In parameters
                command.Parameters.Add(parameter)
            Next
            Return command.ExecuteNonQuery
        Catch ex As Exception
            Console.Write(ex.StackTrace)
            Throw New Exception("No fue posible realizar la transaccion, Msg: " & ex.Message)
        End Try
    End Function

    Public Function CreateCommandRead(queryString As String, ByRef connection As SqlConnection, parameters As List(Of SqlParameter)) As SqlDataReader
        Try
            Dim command As New SqlCommand(queryString, connection)

            For Each parameter In parameters
                command.Parameters.Add(parameter)
            Next
            Return command.ExecuteReader
        Catch ex As Exception
            Console.Write(ex.StackTrace)
            Throw New Exception("No fue posible realizar la transaccion, Msg: " & ex.Message)
        End Try
    End Function

    Public Function CreateCommandCount(queryString As String, ByRef connection As SqlConnection, parameters As List(Of SqlParameter)) As Int32
        Try
            Dim command As New SqlCommand(queryString, connection)

            For Each parameter In parameters
                command.Parameters.Add(parameter)
            Next
            Return command.ExecuteScalar
        Catch ex As Exception
            Console.Write(ex.StackTrace)
            Throw New Exception("No fue posible realizar la transaccion, Msg: " & ex.Message)
        End Try
    End Function

End Module

