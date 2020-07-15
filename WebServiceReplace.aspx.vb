Imports System.Data

Partial Class WebServiceReplace
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString("SetCloseTrades") = "true") Then
            Dim conn As New rpchost.cs_Operation
            conn.openConnection()

            Dim Signal As String = ""

            conn.ExecuteSql("update Signal set [Status]='C',isFixed=yes,dtDateClose = '" & Request.QueryString("dtDate") & "',[profit] = " & Request.QueryString("profit") & " where TradeID = '" & Request.QueryString("TradeID") & "' ")

            conn.closeConnection()
        End If



        If (Request.QueryString("SetOpenTrades") = "true") Then


            Dim conn As New rpchost.cs_Operation


            Dim Signal As String = ""

         
          
            conn.openConnection()
            conn.ExecuteSql("insert into Signal ([Signal],[Status],dtDateSignal,[Entry],[SL],[Target],curr,TradeID,isFreeSIgnal,isFixed) values ('" & Request.QueryString("Signal") & "','T','" & Request.QueryString("Time") & "','" & Request.QueryString("Open") & "','" & Request.QueryString("Stop") & "','" & Request.QueryString("Limit") & "','" & Request.QueryString("Instrument") & "','" & Request.QueryString("TradeID") & "',yes,yes)")
            conn.closeConnection()


           

        End If

    End Sub
End Class
