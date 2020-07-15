Imports rpchost
Imports System.Data.OleDb
Imports System.Data

Partial Class FXAS_Traders
    Inherits System.Web.UI.Page

    Dim rd As OleDbDataReader
    Dim opExec As New cs_Operation

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Timer1.Enabled = False
        Timer1.Interval = 1000

        'If Not IsPostBack Then


        '    Dim opExec As New cs_Operation


        '    Dim reader As OleDbDataReader = opExec.rdGetReader("select * from TraderRanking ")
        '    Try

        '        If reader.HasRows = True Then

        '            GridView1.DataSource = reader
        '            GridView1.DataBind()

        '        End If

        '    Catch ex As Exception
        '        Response.Write(ex.Message)
        '    Finally
        '        opExec.closeConnection()
        '        ' reader.Close()
        '    End Try

        'End If

    End Sub

    Private Function GetSignals(ByVal TraderID As String) As OleDbDataReader
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from TraderSignals where TraderID ='" & TraderID & "' ")
       
        If reader.HasRows = True Then
            rd = reader
        End If

        Return rd
    End Function

    Protected Sub Timer1_Tick()

        Dim opExec As New cs_Operation


        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from TraderRanking ")
        Try

            If reader.HasRows = True Then

                GridView1.DataSource = reader
                GridView1.DataBind()

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            reader.Close()
        End Try

    End Sub


    Protected Sub OnRowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim TraderID As String = GridView1.DataKeys(e.Row.RowIndex).Value.ToString()
            Dim gvSignals As GridView = TryCast(e.Row.FindControl("gvSignals"), GridView)
            gvSignals.DataSource = GetSignals(TraderID)
            gvSignals.DataBind()
            opExec.closeConnection()
        End If
    End Sub


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        'Dim opExec As New cs_Operation


        'Dim reader As OleDbDataReader = opExec.rdGetReader("select * from TraderSignals where TraderID= "&e.)
        'Try

        '    If reader.HasRows = True Then

        '        GridView1.DataSource = reader
        '        GridView1.DataBind()

        '    End If

        'Catch ex As Exception
        '    Response.Write(ex.Message)
        'Finally
        '    opExec.closeConnection()
        '    reader.Close()
        'End Try
    End Sub
End Class
