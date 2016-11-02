Imports System.Data.OleDb
Imports ConexionUtil

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Label1_Load(sender As Object, e As EventArgs) Handles Label1.Load
        Dim connection As OleDbConnection = ConexionUtil.GetConnection
        Dim sbSql As String = "SELECT id, login, password FROM usuarios;"
        Dim parameters As List(Of OleDbParameter) = New List(Of OleDbParameter)

        Try
            connection.Open()
            Dim reader = ConexionUtil.CreateCommandRead(sbSql, connection, parameters)
            If reader.HasRows Then
                Do While reader.Read
                    Console.WriteLine("id: " & reader.GetInt64(0) & ", login " & reader.GetString(1))
                Loop
            End If

            reader.Close()
        Catch ex As Exception
            Console.WriteLine(ex.StackTrace)
            Throw New Exception("CarreraADO, " & ex.Message)
        Finally
            If (connection IsNot Nothing) Then
                connection.Close()
            End If
        End Try

    End Sub
End Class
