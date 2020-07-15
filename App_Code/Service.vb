' NOTE: If you change the class name "Service" here, you must also update the reference to "Service" in Web.config and in the associated .svc file.
Public Class Service
    Implements IService

    Public Sub DoWork() Implements IService.DoWork
    End Sub

End Class
