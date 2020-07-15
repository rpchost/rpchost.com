Imports System.Data.OleDb

Imports System.Data
Imports rpchost


Partial Class SignalsManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnGet_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGet.Click

        Dim opExec As New cs_Operation
        
        Dim strMarquee As String = ""
        Dim strStatus As String = ""

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Signal where ID = " & txtID.Text)
        Try

            If reader.HasRows = True Then

                reader.Read()

                txtSignal.Text = reader("Signal")
                txtStatus.Text = reader("Status")
                txtOpen.Text = reader("dtDateSignal")
                txtClose.Text = IIf(IsDBNull(reader("dtDateClose")), "", reader("dtDateClose"))
                txtEntry.Text = reader("Entry")
                txtSL.Text = reader("SL")
                txtTarget.Text = reader("Target")
                txtProfit.Text = reader("Profit")


            End If


        Catch ex As Exception

        Finally
            opExec.closeConnection()
            reader.Close()
        End Try
    End Sub

    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEdit.Click

        Dim opExec As New cs_Operation

        opExec.ExecuteSql("update Signal set Signal = '" & txtSignal.Text & "',Status = '" & txtStatus.Text & "' , dtDateSignal = '" & txtOpen.Text & "',dtDateClose = '" & txtClose.Text & "',Entry = '" & txtEntry.Text & "',SL = '" & txtSL.Text & "',Target = '" & txtTarget.Text & "' ,Profit = '" & txtProfit.Text & "' where ID =" & txtID.Text)
    End Sub
End Class
