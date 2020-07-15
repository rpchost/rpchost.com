Imports System.Data.OleDb

Namespace Rpchost

    Partial Class StrategyManager
        Inherits System.Web.UI.Page

        Dim conn As cs_Connection
        Dim opExec As cs_Operation

        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

            If txtID.Text <> "" Then

                Dim sqlParam As String

                Try

                    opExec = New cs_Operation

                    sqlParam = "update Strategy set StrategyLink ='" & Request("txtStrategyLink") & "' ,DateIssued = '" & Request("txtDateIssued") & "',StrategyText = '" & Request("txtStrategyText") & "',StrategyVideo = '" & Request("txtStrategyVideo") & "', Field3 = '" & Request("txtURL") & "' where ID = " & Request("txtID")
                    opExec.ExecuteSql(sqlParam)

                Catch ex As Exception
                    Response.Write(ex.Message)
                Finally
                    opExec.closeConnection()
                End Try

            End If
        End Sub

        Protected Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtID.TextChanged
            
        End Sub

        Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

            If txtDateIssued.Text <> "" And txtStrategyLink.Text <> "" And txtStrategyText.Text <> "" And txtStrategyVideo.Text <> "" Then

                Dim sqlParam As String

                Try

                    opExec = New cs_Operation

                    sqlParam = "insert into Strategy (StrategyLink,DateIssued,StrategyText,StrategyVideo,Field3) values ('" & Request("txtStrategyLink") & "' , '" & Request("txtDateIssued") & "', '" & Request("txtStrategyText") & "', '" & Request("txtStrategyVideo") & "', '" & Request("txtURL") & "') "
                    opExec.ExecuteSql(sqlParam)

                Catch ex As Exception
                    Response.Write(ex.Message)
                Finally
                    opExec.closeConnection()
                End Try

            End If

        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        End Sub

        Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
            Try
                Dim sqlParam As String
                opExec = New cs_Operation

                sqlParam = "delete from Strategy where ID=" & txtID.Text
                opExec.ExecuteSql(sqlParam)

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        End Sub

        Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
            opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Strategy where ID = " & Request("txtID"))
            Try

                reader.Read()
                If reader.HasRows = True Then
                    txtStrategyLink.Text = reader("StrategyLink")
                    txtDateIssued.Text = reader("DateIssued")
                    txtStrategyText.Text = reader("StrategyText")
                    txtStrategyVideo.Text = reader("StrategyVideo")
                    txtURL.Text = reader("Field3")
                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            End Try
        End Sub
    End Class

End Namespace