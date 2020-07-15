Imports System.Data.OleDb
Imports System.Drawing


Namespace rpchost


    Partial Class FundamentalAlerts
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub


        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Dim conn As cs_Connection
        Dim opExec As cs_Operation
        Dim objrow As TableRow
        Dim objcell As TableCell
        Dim objlink As HyperLink
        Dim objImage As System.Web.UI.WebControls.Image

        Private strActual As String
        Private strLessThan As String
        Private strgreaterThan As String
        Private strLessThanDo As String
        Private strgreaterThanDo As String
        Private strTradablePair As String
        Private isMainReport As String
        Private strCons As String
        Private strSignal As String
        Private strID, strMainID As Integer
        Private intTargetTechnicalSignal As Integer
        Private strReportTime As String
        Private strMainReportCame As String
        Private strAction As String
        Private strLastGBP As String
        Private isSignalSent As Boolean

        Dim isTrigerHit As Boolean
        Dim isReportBetter As String
        Dim isReportWorse As String


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

            'If IsNothing(Session("UsrName")) = True Or Session("UsrName") = "" Then
            '    AlertBtn_Click("End Session")
            '    Response.Redirect("RequireRegistration.aspx")
            'End If

            opExec = New cs_Operation
            Dim reader As OleDbDataReader = opExec.rdGetReader("select * from ReportAnalysis where isTradable=yes and Actual <> '' order by ID ASC")
            Try

                objrow = New TableRow

                objcell = New TableCell
                objcell.Text = ""
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("10")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                objcell = New TableCell
                objcell.Text = "Report"
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("240")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                objcell = New TableCell
                objcell.Text = "Act."
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("50")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                objcell = New TableCell
                objcell.Text = "Release"
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("90")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                objcell = New TableCell
                objcell.Text = "Pair"
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("80")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                objcell = New TableCell
                objcell.Text = "Signal"
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("280")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                objcell = New TableCell
                objcell.Text = ""
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("30")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                objcell = New TableCell
                objcell.Text = "Comments"
                objcell.BackColor = Color.Maroon
                objcell.ForeColor = Color.White
                objcell.Width = Unit.Parse("220")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                tbl.Controls.Add(objrow)

                objrow = New TableRow
                objcell = New TableCell
                objcell.Text = ""
                objcell.Height = Unit.Parse("20")
                objcell.CssClass = "BlackTextBold"
                objrow.Controls.Add(objcell)

                tbl.Controls.Add(objrow)

                If reader.HasRows = True Then
                    While reader.Read

                        objrow = New TableRow
                        objcell = New TableCell
                        objImage = New System.Web.UI.WebControls.Image
                        objcell.Width = Unit.Parse("10")
                        objcell.VerticalAlign = VerticalAlign.Top
                        If UCase(reader("isMain")) = "TRUE" Then
                            intTargetTechnicalSignal = reader("TargetTechnicalSignal")
                            strMainReportCame = IIf(IsDBNull(reader("ReportCame")), "", reader("ReportCame"))
                            strLastGBP = reader("LastRateGBP")
                            strReportTime = reader("TimeRelease")
                            isSignalSent = reader("SignalSent")
                            strMainID = reader("ID")

                            objImage.ImageUrl = "http://www.rpchost.com/picture/trade.gif" 'Server.MapPath("picture/trade.gif")
                            objcell.Controls.Add(objImage)
                        Else
                            objcell.Text = ""
                        End If

                        objrow.Controls.Add(objcell)

                        objcell = New TableCell
                        objcell.Text = reader("ReportName")
                        objcell.VerticalAlign = VerticalAlign.Top
                        objcell.CssClass = "BlackSmallText"
                        objrow.Controls.Add(objcell)

                        objcell = New TableCell
                        objcell.Text = reader("Actual")
                        objcell.VerticalAlign = VerticalAlign.Top
                        strActual = reader("Actual")
                        objcell.CssClass = "BlackSmallText"
                        objrow.Controls.Add(objcell)

                        objcell = New TableCell
                        objcell.Text = System.String.Format("{0: hh:mm:ss tt}", Convert.ToDateTime(reader("TimeSignalRelease")))
                        objcell.VerticalAlign = VerticalAlign.Top
                        objcell.CssClass = "BlackSmallText"
                        objrow.Controls.Add(objcell)

                        strLessThan = reader("LessThan")
                        strgreaterThan = reader("GreaterThan")
                        strLessThanDo = reader("LessThanDo")
                        strgreaterThanDo = reader("GreaterThanDo")
                        strTradablePair = reader("TradingPair")
                        isMainReport = reader("isMain")
                        strCons = reader("Consensus")
                        strID = reader("ID")

                        objcell = New TableCell
                        objcell.Text = reader("TradingPair")
                        objcell.VerticalAlign = VerticalAlign.Top
                        objcell.CssClass = "BlacknormalText"
                        objrow.Controls.Add(objcell)

                        objcell = New TableCell
                        strSignal = IIf(IsDBNull(reader("Signal")), "", reader("Signal"))
                        objcell.Text = "<b>" & strSignal & "</b>"
                        objcell.VerticalAlign = VerticalAlign.Top
                        objcell.CssClass = "BlackSmallText8"
                        objrow.Controls.Add(objcell)

                        objcell = New TableCell
                        objcell.VerticalAlign = VerticalAlign.Top
                        objImage = New System.Web.UI.WebControls.Image

                        If IsDBNull(reader("ReportCame")) = False Then
                            'If UCase(reader("ReportCame")) = "ISBETTER" Then
                            '    objImage.ImageUrl = "http://www.rpchost.com/picture/up.gif" 'Server.MapPath("picture/up.gif")
                            'ElseIf UCase(reader("ReportCame")) = "ISWORSE" Then
                            '    objImage.ImageUrl = "http://www.rpchost.com/picture/down.gif" 'Server.MapPath("picture/down.gif")
                            'Else
                            '    objImage.ImageUrl = "http://www.rpchost.com/picture/flat.gif" 'Server.MapPath("picture/flat.gif")
                            'End If

                            If UCase(reader("ReportCame")) = "ISBETTER" And UCase(strgreaterThanDo) = "BUY" Then
                                objImage.ImageUrl = "http://www.rpchost.com/picture/up.gif"
                            ElseIf UCase(reader("ReportCame")) = "ISBETTER" And UCase(strgreaterThanDo) = "SELL" Then
                                objImage.ImageUrl = "http://www.rpchost.com/picture/down.gif"
                            ElseIf UCase(reader("ReportCame")) = "ISWORSE" And UCase(strLessThanDo) = "SELL" Then
                                objImage.ImageUrl = "http://www.rpchost.com/picture/down.gif"
                            ElseIf UCase(reader("ReportCame")) = "ISWORSE" And UCase(strLessThanDo) = "BUY" Then
                                objImage.ImageUrl = "http://www.rpchost.com/picture/up.gif"
                            Else
                                objImage.ImageUrl = "http://www.rpchost.com/picture/flat.gif"
                            End If

                        Else
                            objImage.ImageUrl = "http://www.rpchost.com/picture/flat.gif"
                        End If

                        objcell.Controls.Add(objImage)
                        objrow.Controls.Add(objcell)

                        objcell = New TableCell
                        objcell.VerticalAlign = VerticalAlign.Top
                        objcell.Text = IIf(IsDBNull(reader("Comments")), "", reader("Comments"))
                        objcell.CssClass = "BlackSmallText"
                        objrow.Controls.Add(objcell)

                        tbl.Controls.Add(objrow)

                    End While

                Else
                    objrow = New TableRow
                    objcell = New TableCell
                    objcell.Text = "No Available Signals"
                    objcell.CssClass = "BlackTextBold"
                    objcell.ColumnSpan = 3
                    objrow.Controls.Add(objcell)
                    tbl.Controls.Add(objrow)
                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                opExec.closeConnection()
            End Try

        End Sub

    End Class

End Namespace
