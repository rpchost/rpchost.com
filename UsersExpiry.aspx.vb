Imports System.Data
Imports System.Data.OleDb


Namespace rpchost


Partial Class UsersExpiry
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Button1 As System.Web.UI.WebControls.Button
    Protected WithEvents btnMain As System.Web.UI.WebControls.Button


    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Dim connstr As String '= "Provider=Microsoft.Jet.OLEDB.4.0;data source= c:/inetpub/wwwroot/Gynecology/Database/mainData.mdb"

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If IsNothing(Session("usr")) = True Then
            Response.Redirect("loginbackend.aspx")
        End If

        Dim connect As New cs_Connection
        connstr = connect.conn
        'Put user code to initialize the page here
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub

    Sub BindGrid()
        Dim cnn As New OleDbConnection(connstr)
        Dim da As New OleDbDataAdapter("select ID,FirstName,LastName,Email,Country,isMember,Status,DateLastPayment,[Level] from MembersForex where Status = 'M' and DATEDIFF('d', DateLastPayment, Now())>30", cnn)
        Dim ds As New DataSet
        da.Fill(ds, "MembersForex")
        DataGrid1.DataSource = ds
        DataGrid1.DataBind()


        Dim da1 As New OleDbDataAdapter("select ID,FirstName,LastName,Email,Country,isMember,Status,DateLastPayment,[Level] from MembersForex where Status = 'S'", cnn)
        Dim ds1 As New DataSet
        da1.Fill(ds1, "MembersForex")
        Datagrid2.DataSource = ds1
        Datagrid2.DataBind()

        Dim da2 As New OleDbDataAdapter("select ID,FirstName,LastName,Email,Country,isMember,Status,DateLastPayment,[Level] from MembersForex where Status = 'M' and DATEDIFF('d', DateLastPayment, Now())<=30", cnn)
        Dim ds2 As New DataSet
        da2.Fill(ds2, "MembersForex")
        Datagrid3.DataSource = ds2
        Datagrid3.DataBind()


    End Sub

    Private Sub DataGrid1_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles DataGrid1.EditCommand

        Dim strEmpId As String
        Dim strLastName As String
        Dim strFirstName As String
        strEmpId = e.Item.Cells(0).Text
        Dim t1 As TextBox = e.Item.FindControl("textbox1")
        Dim t2 As TextBox = e.Item.FindControl("textbox3")
        Dim cnn As New OleDbConnection(connstr)
        cnn.Open()
        Dim cmd As New OleDbCommand("Update membersforex Set Status ='S' Where [ID]=" & e.Item.Cells(0).Text, cnn)
        cmd.ExecuteNonQuery()
        cnn.Close()
        DataGrid1.EditItemIndex = -1
        DataGrid1.ShowFooter = True
        BindGrid()
        
    End Sub

    Private Sub DataGrid1_CancelCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles DataGrid1.CancelCommand
        DataGrid1.EditItemIndex = -1
        DataGrid1.ShowFooter = True
        BindGrid()
    End Sub

    Private Sub DataGrid1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles DataGrid1.ItemCommand
        If e.CommandName = "Insert" Then
            Response.Write("<script language=javascript>")
            Response.Write("window.open('AntGestPop.aspx?PatientID=" & Session("PatientID") & "&AntID=-1','CustomPopUp','width=700, height=450, menubar=no, resizable=no,scroller=yes,left=200,top=150')")
            Response.Write("</script>")
        End If
    End Sub

    Private Sub DataGrid1_UpdateCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles DataGrid1.UpdateCommand
        Dim strEmpId As String
        Dim strLastName As String
        Dim strFirstName As String
        strEmpId = e.Item.Cells(0).Text
        Dim t1 As TextBox = e.Item.FindControl("textbox1")
        Dim t2 As TextBox = e.Item.FindControl("textbox3")
        Dim cnn As New OleDbConnection(connstr)
        cnn.Open()
        Dim cmd As New OleDbCommand("Update membersforex Set Status ='S' Where [ID]=" & e.Item.Cells(0).Text, cnn)
        cmd.ExecuteNonQuery()
        cnn.Close()
        DataGrid1.EditItemIndex = -1
        DataGrid1.ShowFooter = True
        BindGrid()
    End Sub

    Private Sub DataGrid1_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles DataGrid1.DeleteCommand
        Dim strEmpId As String
        strEmpId = e.Item.Cells(0).Text
        Dim cnn As New OleDbConnection(connstr)
        cnn.Open()
        Dim cmd As New OleDbCommand("Delete From News Where [ID]=" & e.Item.Cells(0).Text, cnn)
        cmd.ExecuteNonQuery()
        cnn.Close()
        'DataGrid1.EditItemIndex = -1
        If DataGrid1.Items.Count = 1 Then
            ' DataGrid1.CurrentPageIndex = DataGrid1.CurrentPageIndex - 1
        End If
        BindGrid()
    End Sub

    Private Sub DataGrid1_PageIndexChanged(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridPageChangedEventArgs) Handles DataGrid1.PageIndexChanged
        If e.NewPageIndex >= 0 Then
            DataGrid1.CurrentPageIndex = e.NewPageIndex
            BindGrid()
        End If
    End Sub

    Private Sub DataGrid2_PageIndexChanged(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridPageChangedEventArgs) Handles Datagrid2.PageIndexChanged
        If e.NewPageIndex >= 0 Then
            Datagrid2.CurrentPageIndex = e.NewPageIndex
            BindGrid()
        End If
    End Sub

    Private Sub DataGrid3_PageIndexChanged(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridPageChangedEventArgs) Handles Datagrid3.PageIndexChanged
        If e.NewPageIndex >= 0 Then
            Datagrid3.CurrentPageIndex = e.NewPageIndex
            BindGrid()
        End If
    End Sub

    Private Sub DataGrid1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DataGrid1.SelectedIndexChanged

    End Sub

    Private Sub DataGrid1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles DataGrid1.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Or _
        e.Item.ItemType = ListItemType.AlternatingItem Then
            '---------------------------------------------------         
            ' Add the OnMouseOver and OnMouseOut method to the Row of DataGrid         
            '---------------------------------------------------         
            e.Item.Attributes.Add("onmouseover", "this.style.backgroundColor='Silver'")
            e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor='white'")
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("loginBackend.aspx")
    End Sub

    Private Sub btnMain_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnMain.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("Backend/backend.aspx")
    End Sub
End Class

End Namespace
