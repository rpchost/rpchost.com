
Partial Class FreeHistorySignals
    Inherits System.Web.UI.Page




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ss As New grabdata 'com.rpchost.www.grabdata()
        Dim Signals As String = ss.SelectTable("TradesHistory", "TrText", "TrSignal='1'")
        lblData.Text = Signals

    End Sub
End Class
