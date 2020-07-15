Imports System.Data.OleDb

Partial Class ManageTransferToOtherUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("USR")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If
    End Sub

  
    
    Protected Sub grdTransfers_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdTransfers.RowUpdating
        Dim UsdAmount As String = DirectCast(grdTransfers.Rows(e.RowIndex).FindControl("UsdAmount"), TextBox).Text
        Dim BtcAmount As String = DirectCast(grdTransfers.Rows(e.RowIndex).FindControl("BtcAmount"), TextBox).Text
        Dim DoneByAdmin As Boolean = DirectCast(grdTransfers.Rows(e.RowIndex).FindControl("DoneByAdmin"), CheckBox).Checked
        Dim ID As String = DirectCast(grdTransfers.Rows(e.RowIndex).FindControl("ID"), TextBox).Text
        Dim UserID As String = DirectCast(grdTransfers.Rows(e.RowIndex).FindControl("UserID"), TextBox).Text
        Dim ToUserID As String = DirectCast(grdTransfers.Rows(e.RowIndex).FindControl("ToUserID"), TextBox).Text

        If (UsdAmount.Trim = "") Then
            UsdAmount = 0
        End If
        If (BtcAmount.Trim = "") Then
            BtcAmount = 0
        End If

        'Dim opExec As New rpchost.cs_Operation
        'opExec.ExecuteSql("update Transfer set UsdAmount = " & UsdAmount & " ,BtcAmount = " & BtcAmount & ",DoneByAdmin = " & DoneByAdmin & " where ID = " & ID)
        'opExec.closeConnection()

        txtUserID.Text = UserID
        txtToUserID.Text = ToUserID

    End Sub
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Dim opExec As New rpchost.cs_Operation

        Dim UsdTransfer As Double
        Dim BtcTransfer As Double

        If (Request("txtUserID").Trim = "" Or Not IsNumeric(Request("txtUserID").Trim)) Then
            Return
        End If

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Transfer where UserID = " & Request("txtUserID").Trim & " and DoneByAdmin = false ")
        Try
            If reader.HasRows = True Then

                While reader.Read()

                    If (Not IsDBNull(reader("UsdAmount"))) Then
                        If (reader("UsdAmount") > 0) Then
                            UsdTransfer = reader("UsdAmount")
                        End If
                    End If
                    If (Not IsDBNull(reader("BtcAmount"))) Then
                        If (reader("BtcAmount") > 0) Then
                            BtcTransfer = reader("BtcAmount")
                        End If
                    End If

                End While

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try

        setUserAccountRecord(Request("txtToUserID").Trim)

        Dim opExec1 As New rpchost.cs_Operation
        opExec1.ExecuteSql("update account set BalanceUSD = BalanceUSD + " & UsdTransfer & ",BalanceBTC = BalanceBTC + " & BtcTransfer & " where userID = " & Request("txtToUserID").Trim & " ")
        opExec1.closeConnection()

        Dim opExec3 As New rpchost.cs_Operation
        opExec3.ExecuteSql("update account set BalanceUSD = BalanceUSD - " & UsdTransfer & ",BalanceBTC = BalanceBTC - " & BtcTransfer & " where userID = " & Request("txtUserID").Trim & " ")
        opExec3.closeConnection()

        Dim opExec4 As New rpchost.cs_Operation
        opExec4.ExecuteSql("update Transfer set DoneByAdmin=true where userID = " & Request("txtUserID").Trim & " and ToUserID= " & Request("txtToUserID").Trim & " ")
        opExec4.closeConnection()

        Response.Redirect("ManageTransferToOtherUsers.aspx")

    End Sub

    Protected Sub setUserAccountRecord(ByVal UserID As Integer)
        If (Not isUserHasAccountRecord(UserID)) Then

            Dim opExec As New rpchost.cs_Operation
            opExec.ExecuteSql("insert into account(UserID,BalanceUSD,BalanceBTC) values (" & UserID & ",0,0) ")
            opExec.closeConnection()

        End If
    End Sub

    Protected Function isUserHasAccountRecord(ByVal UserID As Integer) As Boolean
        Dim opExec As New rpchost.cs_Operation

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from account where UserID = " & UserID & " ")
        Try

            If reader.HasRows = True Then

                Return True

            Else

                Return False

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
        End Try
    End Function

  

    Protected Sub btnMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub
End Class

