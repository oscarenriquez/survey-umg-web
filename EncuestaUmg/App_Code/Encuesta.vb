Imports Microsoft.VisualBasic

Public Class Encuesta
    Private m_ID_ESTUDIANTE As Int64
    Private m_ID_CATED_CURSO As Int64
    Private m_PREGUNTA1 As Int32
    Private m_PREGUNTA2 As Int32
    Private m_PREGUNTA3 As Int32
    Private m_PREGUNTA4 As Int32
    Private m_PREGUNTA5 As Int32
    Private m_PREGUNTA6 As Int32
    Private m_TOTAL As Int32
    Private m_OBSERVACIONES As String
    Private m_FECHA As DateTime

    Public Property ID_ESTUDIANTE As Long
        Get
            Return m_ID_ESTUDIANTE
        End Get
        Set(value As Long)
            m_ID_ESTUDIANTE = value
        End Set
    End Property

    Public Property ID_CATED_CURSO As Long
        Get
            Return m_ID_CATED_CURSO
        End Get
        Set(value As Long)
            m_ID_CATED_CURSO = value
        End Set
    End Property

    Public Property PREGUNTA1 As Integer
        Get
            Return m_PREGUNTA1
        End Get
        Set(value As Integer)
            m_PREGUNTA1 = value
        End Set
    End Property

    Public Property PREGUNTA2 As Integer
        Get
            Return m_PREGUNTA2
        End Get
        Set(value As Integer)
            m_PREGUNTA2 = value
        End Set
    End Property

    Public Property PREGUNTA3 As Integer
        Get
            Return m_PREGUNTA3
        End Get
        Set(value As Integer)
            m_PREGUNTA3 = value
        End Set
    End Property

    Public Property PREGUNTA4 As Integer
        Get
            Return m_PREGUNTA4
        End Get
        Set(value As Integer)
            m_PREGUNTA4 = value
        End Set
    End Property

    Public Property PREGUNTA5 As Integer
        Get
            Return m_PREGUNTA5
        End Get
        Set(value As Integer)
            m_PREGUNTA5 = value
        End Set
    End Property

    Public Property PREGUNTA6 As Integer
        Get
            Return m_PREGUNTA6
        End Get
        Set(value As Integer)
            m_PREGUNTA6 = value
        End Set
    End Property

    Public Property TOTAL As Integer
        Get
            Return m_TOTAL
        End Get
        Set(value As Integer)
            m_TOTAL = value
        End Set
    End Property

    Public Property OBSERVACIONES As String
        Get
            Return m_OBSERVACIONES
        End Get
        Set(value As String)
            m_OBSERVACIONES = value
        End Set
    End Property

    Public Property FECHA As Date
        Get
            Return m_FECHA
        End Get
        Set(value As Date)
            m_FECHA = value
        End Set
    End Property
End Class
