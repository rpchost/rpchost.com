Imports System.ServiceModel

' NOTE: If you change the class name "IService" here, you must also update the reference to "IService" in Web.config.
<ServiceContract()> _
Public Interface IService

    <OperationContract()> _
    Sub DoWork()

End Interface
