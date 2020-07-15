Imports System.Data.OleDb


Namespace rpchost

    Partial Class getRpchostInfo
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation


        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


            opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from [MembersForex] where ID=" & Request.QueryString("userID") & " and Pwd='" & Request.QueryString("pwd") & "'")
            Try
                If reader.HasRows = True Then

                    reader.Read()
                    lblMess.Text = reader("ID") & "" & reader("pwd")

                    lblMess.Text = "HERE-" + lblMess.Text + "-End"
                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
                reader.Close()
            End Try
        End Sub

      

    End Class

End Namespace