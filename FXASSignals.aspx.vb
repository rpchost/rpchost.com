Imports System.Data.OleDb
Imports rpchost


Class FXASSignals
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents btnPips As System.Web.UI.WebControls.Button



    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Public Sub AlertBtn_Click(ByVal msg As String)

        Dim message As String = msg
        Dim alertScript As String
        alertScript = "<script language=JavaScript>"
        alertScript += "alert('" + message + "');window.close();"
        alertScript += "</script" + ">"

        If (IsClientScriptBlockRegistered("alert") = False) Then
            Me.RegisterClientScriptBlock("alert", alertScript)
        End If

    End Sub

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

      

        lblMem.Text = "Welcome &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "


    End Sub



 

    Private Sub btnPips_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPips.Click
        Dim sqlTotal As String = "select sum(profit) as total from signal where year(dtdatesignal) = '" & Year(Now) & "' and month(dtdatesignal) = '" & Month(Now) & "' and day(dtdatesignal) <= '" & Day(Now) & "'"
        Dim opExec As cs_Operation
        opExec = New cs_Operation
        Dim readerTotal As OleDbDataReader = opExec.rdGetReader(sqlTotal)
        While readerTotal.Read()
            btnPips.Text = readerTotal("total")
        End While
        opExec.closeConnection()
    End Sub
End Class


