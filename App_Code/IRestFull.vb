Imports System.ServiceModel

' NOTE: If you change the class name "IRestFull" here, you must also update the reference to "IRestFull" in Web.config.
<ServiceContract()> _
Public Interface IRestFull

    <OperationContract()> _
    Sub DoWork()

End Interface
