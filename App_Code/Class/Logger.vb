Imports Microsoft.VisualBasic

Public Class Logger

    Public Shared Sub GenerateLog(ByVal Detail As String, ByVal dtLogged As DateTime, ByVal DetailLink As String)

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Strategy (StrategyText,DateIssued,StrategyLink) values ('" & Detail.Trim & "','" & dtLogged & "','" & DetailLink.Trim & "') ")
        opExec.closeConnection()

    End Sub

    Public Sub GenerateLog_Static(ByVal Detail As String, ByVal dtLogged As DateTime, ByVal DetailLink As String)

        Dim opExec As New rpchost.cs_Operation
        opExec.ExecuteSql("insert into Strategy (StrategyText,DateIssued,StrategyLink) values ('" & Detail.Trim & "','" & dtLogged & "','" & DetailLink.Trim & "') ")
        opExec.closeConnection()

    End Sub

    Public Shared Function GenerateTimeZon(ByVal TimeZone As String) As DateTime

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime
        timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(TimeZone) 'Ex: "Middle East Standard Time"
        dateTime = TimeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)

        Return dateTime

    End Function

    Public Shared Function GenerateTimeZone(ByVal TimeZone As String) As DateTime

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime
        timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(TimeZone) 'Ex: "Middle East Standard Time"
        dateTime = TimeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)

        Return dateTime

    End Function

    Public Function GenerateTimeZone_Static(ByVal TimeZone As String) As DateTime

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime
        timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(TimeZone) 'Ex: "Middle East Standard Time"
        dateTime = TimeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)

        Return dateTime


    End Function

    Public Function GenerateTimeZone_Static1(ByVal TimeZone As String) As DateTime

        Dim timeZoneInfo As TimeZoneInfo
        Dim dateTime As DateTime
        timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(TimeZone) 'Ex: "Middle East Standard Time"
        dateTime = TimeZoneInfo.ConvertTime(Date.Now, timeZoneInfo)

        Return dateTime


    End Function


End Class
