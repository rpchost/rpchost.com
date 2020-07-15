Imports System.Data.OleDb
Imports rpchost

Partial Class TestSignals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sqlTotal As String = "select * from Table1 where Field1 ='" & Request.QueryString("Code") & "' "
        Dim opExec As cs_Operation
        opExec = New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader(sqlTotal)
        While reader.Read()

            lblCode.Text = reader("ID")
            lblDate.Text = System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Now))
            lblExpiryDate.Text = System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(reader("Field3")))
            lblMess.Text = reader("Field4")

        End While
        opExec.closeConnection()
    End Sub
End Class
