Imports System.Data.OleDb
Imports System.Data
Imports rpchost
Imports System.Drawing
Imports System.Net
Imports System.IO
Imports System.Text

Imports OpenQA.Selenium
Imports OpenQA.Selenium.Chrome
Imports OpenQA.Selenium.Support.UI



Public Class FXASRUNZULUTRADE
    Inherits System.Web.UI.Page

    Dim isLogged As Boolean

    Dim core As FXCore.CoreAut
    Shared desk As FXCore.TradeDeskAut
    Shared DeskBack As FXCore.TradeDeskAut

    Dim oAccountsTable As FXCore.TableAut
    Dim oOffersTable As FXCore.TableAut
    Dim oTradesTable As FXCore.TableAut
    Dim oClosedTradesTable As FXCore.TableAut

    Dim account As String
    Dim instrument As String
    Dim rate As Double
    Dim min_amount As Double
    Dim trade As Object
    Dim di As Object

    Dim str1, str2, str3 As String

    Shared num As Integer


    Const tblOffers As String = "Offers"
    Const tblAccounts As String = "Accounts"
    Const tblTrades As String = "trades"

    Dim miniaccount As Object ' Variable which declares an account mini
    Shared mult As Double ' Lot multiplier for trades
    Shared multLot As Double
    Dim maxtrade As Object ' maxtrade for server
    Dim minTrail As Object ' minimum trailing stop for server
    Dim maxTrail As Object ' maximum trailing stop for server
    Dim iSubID As Integer ' This is for events but is not cur rently used

    Dim strSignal As String
    Shared i As Integer

    Shared LoginCompleted As Boolean

    Shared OrderStat As String

    Shared CurrencySignals As String

    Public Const strLocation As String = "C:\Zulutrade\Files"
    Public Shared strSignalsLocation As String = "C:\Program Files (x86)\MetaTrader - AAAFx\MQL4\Files\Signals.txt"
    Dim TableSignal As String = "Signal"



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Try


        '    If ((Hour(Now) = "20" And Minute(Now) = "00") Or (Hour(Now) = "23" And Minute(Now) = "45") Or (Hour(Now) = "3" And Minute(Now) = "45") Or (Hour(Now) = "5" And Minute(Now) = "15") Or (Hour(Now) = "7" And Minute(Now) = "15") Or (Hour(Now) = "9" And Minute(Now) = "15") Or (Hour(Now) = "14" And Minute(Now) = "15")) Then

        '        Response.Write("<script language=JavaScript>")
        '        Response.Write("window.opener='x';")
        '        Response.Write("window.close();")
        '        Response.Write("</script" + ">")

        '    End If

        txtPassword.Attributes.Add("value", "3681")
        txtRpcPwd.Attributes.Add("value", "jijo1136")

        '    If (Page.IsPostBack = False) Then
        '        cmdLogin_Click(sender, e)
        '    End If


        '    If (DeskBack.IsLoggedIn = True) Then
        '        pn.Enabled = True
        '        pn.UpdateAfterCallBack = True

        '        If (txtFrom.Text = "From Date" And txtTo.Text = "To Date") Then

        '            txtFrom.Text = Now.ToShortDateString
        '            txtTo.Text = Now.ToShortDateString

        '            txtFrom.UpdateAfterCallBack = True
        '            txtTo.UpdateAfterCallBack = True

        '        End If

        '        If (txtFrom.Text = "" And txtTo.Text = "") Then

        '            txtFrom.Text = "From Date"
        '            txtTo.Text = "To Date"

        '            txtFrom.UpdateAfterCallBack = True
        '            txtTo.UpdateAfterCallBack = True

        '        End If

        '        If Not (String.IsNullOrEmpty(txtPassword.Text)) Then
        '            txtPassword.Attributes.Add("value", txtPassword.Text)
        '        End If
        '        If Not (String.IsNullOrEmpty(txtRpcPwd.Text)) Then
        '            txtRpcPwd.Attributes.Add("value", txtRpcPwd.Text)
        '        End If

        '    End If

        '    SetEur()


        'Catch ex As NullReferenceException

        '    txtFrom.Text = "From Date"
        '    txtTo.Text = "To Date"

        '    txtFrom.UpdateAfterCallBack = True
        '    txtTo.UpdateAfterCallBack = True

        '    pn.Enabled = False
        '    pn.UpdateAfterCallBack = True
        'End Try

    End Sub


    Public Sub SetEur()

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Host")
        Try

            If reader.HasRows = True Then

                reader.Read()
                If reader("EUR") = "STOP" Then
                    btnStop.Text = "STOP"
                Else
                    btnStop.Text = "START"
                End If

                If reader("GBP") = "STOP" Then
                    btnGBP.Text = "STOP"
                Else
                    btnGBP.Text = "START"
                End If

                If reader("JPY") = "STOP" Then
                    btnJpy.Text = "STOP"
                Else
                    btnJpy.Text = "START"
                End If

            End If



        Catch ex As Exception

        Finally

            reader.Close()
        End Try

    End Sub


    Public Sub SetGbp()

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Host")
        Try

            If reader.HasRows = True Then

                reader.Read()
                If reader("GBP") = "STOP" Then
                    btnGBP.Text = "STOP"
                Else
                    btnGBP.Text = "START"
                End If

            End If

        Catch ex As Exception

        Finally

            reader.Close()
        End Try

    End Sub

    Public Sub SetJpy()

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from Host")
        Try

            If reader.HasRows = True Then

                reader.Read()
                If reader("JPY") = "STOP" Then
                    btnJpy.Text = "STOP"
                Else
                    btnJpy.Text = "START"
                End If



            End If



        Catch ex As Exception

        Finally

            reader.Close()
        End Try

    End Sub


    Public Function Marquee() As String

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from News")
        Try

            If reader.HasRows = True Then

                While reader.Read()
                    strMarquee = strMarquee & " - " & reader("Description")
                End While

            End If

            Return strMarquee

        Catch ex As Exception

        Finally

            reader.Close()
        End Try

    End Function


    Private Function GetAccount() As Boolean

        'If (txtRpcUserID.Text = "" And txtRpcPwd.Text = "") Then

        Dim opExec As New cs_Operation
        opExec = New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from AccountInfo where userID = '" & txtUserName.Text & "' and Pwd = '" & txtPassword.Text & "' ")
        Try

            If reader.HasRows = True Then
                Return True
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            reader.Close()
        End Try

        'End If

    End Function


    Private Function GetRpcInfo() As Boolean

        'If (txtRpcUserID.Text = "" And txtRpcPwd.Text = "") Then

        Dim opExec As New cs_Operation
        opExec = New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from MembersForex where ID = " & txtRpcUserID.Text & " and Pwd = '" & txtRpcPwd.Text & "' ")
        Try

            If reader.HasRows = True Then
                Return True
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()

        End Try

        'End If

    End Function


    Protected Sub cmdLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogin.Click

        cmdLogin.Enabled = False
        cmdLogin.UpdateAfterCallBack = True
        cmdLogin.DataBind()


        If (GetRpcInfo() = True) Then


            If Login((Me.txtUserName.Text), (Me.txtPassword.Text), "http://www.fxcorporate.com/Hosts.jsp", (Me.cmbConnection.Text), desk) = False Then
                lblMess.Text = "Failed to Login to FXCM account."
                lblMess.UpdateAfterCallBack = True
                lblMess.DataBind()

            Else
                isLogged = True
                Timer1.Enabled = True

                lblClosedPos.Visible = True
                lblOpenPos.Visible = True

                If (GetAuto() = "false") Then
                    Auto.Text = "Auto Trading is OFF"
                    Auto.BackColor = Color.Maroon
                    Auto.UpdateAfterCallBack = True
                    Auto.DataBind()

                Else

                    Auto.Text = "Auto Trading is ON"
                    Auto.BackColor = Color.Green
                    Auto.UpdateAfterCallBack = True
                    Auto.DataBind()
                End If


                If (GetAccount() = False) Then

                    Dim opExec As New cs_Operation
                    opExec.ExecuteSql("Insert into AccountInfo ([UserID],[Pwd], [Connection], RpcUserID,RpcPwd,FstLogIn,LoggedIn) values ('" & txtUserName.Text & "','" & txtPassword.Text & "','" & cmbConnection.Text & "','" & txtRpcUserID.Text & "','" & txtRpcPwd.Text & "','" & Now & "','ON')")
                    opExec.closeConnection()
                End If


            End If



            'Disable and enable boxes after login

            Me.txtUserName.Enabled = False
            Me.txtPassword.Enabled = False
            Me.txtRpcUserID.Enabled = False
            Me.txtRpcPwd.Enabled = False
            Me.cmbConnection.Enabled = False

            Me.cmdLogOut.Enabled = True
            Me.cmbAccount.Enabled = True
            Me.cmbAmountK.Enabled = True


            'txtFrom.Text = Now.ToShortDateString
            'txtTo.Text = Now.ToShortDateString
            'Button1.Visible = True
            'Button2.Visible = True

            'txtFrom.Visible = True
            'txtTo.Visible = True
            'cmdLogin0.Visible = True

            'txtFrom.UpdateAfterCallBack = True
            'txtTo.UpdateAfterCallBack = True
            'Button1.UpdateAfterCallBack = True
            'Button2.UpdateAfterCallBack = True



            pn.Enabled = True

            LoginCompleted = True


        Else

            lblMess.Text = "Wrong Rpchost.com UserID or Password, You have to register on Rpchost.com before Logging in."
            lblMess.UpdateAfterCallBack = True
            lblMess.DataBind()

        End If


    End Sub



    Sub SetCurrencyRates()


        Try

            Dim oRow As Object

            oRow = DeskBack.FindRowInTable("Offers", "Instrument", "GBP/USD")

            btnGBPBuy.Text = "BUY " & "[" & Math.Round(oRow.Bid, 4) & "]"
            btnGBPSell.Text = "SELL " & "[" & Math.Round(oRow.Ask, 4) & "]"

            oRow = DeskBack.FindRowInTable("Offers", "Instrument", "EUR/USD")

            btnEurBuy.Text = "BUY " & "[" & Math.Round(oRow.Bid, 4) & "]"
            btnEurSell.Text = "SELL " & "[" & Math.Round(oRow.Ask, 4) & "]"


            If (OrderStat = "EurBuy") Then
                txtEurSL.Text = (Math.Round(oRow.Bid, 4) * 10000 - 5) / 10000
                txtEurLimit.Text = (Math.Round(oRow.Bid, 4) * 10000 + 5) / 10000
            End If
            If (OrderStat = "EurSell") Then
                txtEurSL.Text = (Math.Round(oRow.Ask, 4) * 10000 + 5) / 10000
                txtEurLimit.Text = (Math.Round(oRow.Ask, 4) * 10000 - 5) / 10000
            End If

            If (OrderStat = "") Then


                txtEurSL.Visible = False
                txtEurLimit.Visible = False
                btnSetEur.Visible = False

                txtEurSL.UpdateAfterCallBack = True
                txtEurLimit.UpdateAfterCallBack = True
                btnSetEur.UpdateAfterCallBack = True
            End If


        Catch ex As Exception
            Response.Write("Error while setting rates " & ex.Message)
        End Try


    End Sub



    Protected Sub TriggerTrading()

        Try


            Selenium()

            If (btnStop.Text = "STOP") Then EURUSD() '  EURUSD trading
            If (btnGBP.Text = "STOP") Then GBPUSD() '   GBPUSD trading
            EURGBP()
            'GBPJPY()
            AUDUSD()
            USDJPY()
            'EURAUD()
            NZDUSD()
            EURJPY()

            'MECANIQUE DATA

            'Try

            '    Dim wprxStock As New WebProxy("cid-isa-1.customs.gov.lb:8080", True)

            '    wprxStock.Credentials = CredentialCache.DefaultCredentials

            '    Dim now As DateTime = DateTime.Now
            '    Dim format As String = "M d HH:mm yy"
            '    now.ToString(format)
            '    Dim Inspection As New com.rpchost.www.grabdata
            '    Inspection.Proxy = wprxStock


            '    If ((now.Hour() >= 7) And now.Hour <= 17 And (now.Minute = "00" Or now.Minute = "01")) Then
            '        Inspection.EditInspectionAlert("Alert5", "OPEN")
            '    ElseIf ((now.Hour() < 7 Or now.Hour > 17) And (now.Minute = "00" Or now.Minute = "01")) Then
            '        Inspection.EditInspectionAlert("Alert5", "CLOSE")
            '        Inspection.EditInspectionAlert("Alert3", "NO TRAFFIC")
            '        Inspection.EditInspectionAlert("Alert4", "0 Minutes")
            '    End If

            '    If ((now.Hour() >= 7) And now.Hour <= 10 And (now.Minute = "00" Or now.Minute = "01")) Then
            '        Inspection.EditInspectionAlert("Alert3", "MEDIUM TRAFFIC")
            '        Inspection.EditInspectionAlert("Alert4", "50 Minutes")
            '    ElseIf ((now.Hour() >= 11) And now.Hour <= 13 And (now.Minute = "00" Or now.Minute = "01")) Then
            '        Inspection.EditInspectionAlert("Alert3", "LOW TRAFFIC")
            '        Inspection.EditInspectionAlert("Alert4", "40 Minutes")
            '    ElseIf ((now.Hour() >= 14) And now.Hour <= 17 And (now.Minute = "00" Or now.Minute = "01")) Then
            '        Inspection.EditInspectionAlert("Alert3", "LOW TRAFFIC")
            '        Inspection.EditInspectionAlert("Alert4", "40 Minutes")

            '    End If
            '    Inspection.Dispose()

            'Catch ex As Exception

            'End Try

        Catch ex As Exception

            Response.Write("ERROR " + ex.Message)
            'Login((Me.txtUserName.Text), (Me.txtPassword.Text), "http://www.fxcorporate.com", (Me.cmbConnection.Text), desk)

        End Try

    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick

        TriggerTrading()

    End Sub



    Sub updateAccount()


        Dim strEURBuySell, strEURSignals As String
        Dim strGBPBuySell, strGBPSignals As String

        strEURBuySell = Text2String(strLocation + "\BuySellEU.txt")
        strEURSignals = Text2String(strLocation + "\SignalsEU.txt")

        strGBPBuySell = Text2String(strLocation + "\BuySellGS.txt")
        strGBPSignals = Text2String(strLocation + "\SignalsGS.txt")


        Dim opExec As New cs_Operation


        If isAccountExist() Then

            opExec.ExecuteSql("update AccountInfo set BuySellGU = '" & strGBPBuySell & "',SignalsGU = '" & strGBPSignals & "',Signals = '" & strEURSignals & "',BuySell = '" & strEURBuySell & "' where [UserID]='" & txtUserName.Text & "' and Pwd ='" & txtPassword.Text & "' ")

        Else

            opExec.ExecuteSql("insert into AccountInfo (BuySellGU,SignalsGU,Signals,BuySell,[UserID],Pwd) values ('" & strGBPBuySell & "','" & strGBPSignals & "','" & strEURSignals & "','" & strEURBuySell & "' ,'" & txtUserName.Text & "' ,'" & txtPassword.Text & "') ")

        End If


        opExec.closeConnection()

    End Sub

    Function isAccountExist() As Boolean

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from AccountInfo where UserID = '" & txtUserName.Text & "' and Pwd = '" & txtPassword.Text & "'")
        Try

            If reader.HasRows = True Then

                Return True

            End If


        Catch ex As Exception

        Finally
            opExec.closeConnection()
            reader.Close()
        End Try

    End Function


    Sub updateData()

        txtOpenedPips.Text = getOpenedPips()
        txtOpenedPips.UpdateAfterCallBack = True
        txtOpenedPips.DataBind()

        txtClosedPips.Text = getClosedPips()
        txtClosedPips.UpdateAfterCallBack = True
        txtClosedPips.DataBind()

        oAccountsTable = DeskBack.FindMainTable(tblAccounts)

        For Each oRow In oAccountsTable.Rows
            'If oRow.AccountName = Me.cmbAccount.Text Then
            Me.cmbAccount.Items.Add(oRow.AccountName)
            oEquity.Text = Format(System.Math.Round(oRow.Equity, 2), "$#,##0.00").ToString()
            oBalance.Text = Format(System.Math.Round(oRow.Balance, 2), "$#,##0.00")
            oUsableMr.Text = Format(System.Math.Round(oRow.UsableMargin, 2), "$#,##0.00")
            Exit For
            'End If
        Next oRow

        oEquity.UpdateAfterCallBack = True
        oEquity.DataBind()


        oBalance.UpdateAfterCallBack = True
        oBalance.DataBind()


        oUsableMr.UpdateAfterCallBack = True
        oUsableMr.DataBind()

        cmbAccount.UpdateAfterCallBack = True
        cmbAccount.DataBind()

        cmdLogin.Enabled = False
        cmdLogin.UpdateAfterCallBack = True
        cmdLogin.DataBind()

        lblMess.Text = Marquee()
        lblMess.ForeColor = Color.Green
        lblMess.UpdateAfterCallBack = True
        lblMess.DataBind()

        Synchronize()

    End Sub


    Function isTradeExist(ByVal BS As String, ByVal Instrument As String) As Boolean

        Try


            Dim oRow As Object
            oTradesTable = DeskBack.FindMainTable("Trades")
            For Each oRow In oTradesTable.Rows


                If (oRow.BS = BS And oRow.Instrument = Instrument) Then
                    Return True
                    Exit For
                End If

            Next

        Catch ex As Exception
            Response.Write("Error isTradeExist")
        End Try


    End Function

    Sub ExecuteSignal(ByVal strSignal As String)

        Dim opExec As New cs_Operation

        Dim strNow As String
        strNow = CStr(Now)

        Dim arrSignal() As String

        arrSignal = strSignal.Split("+")
        Dim strType As String = arrSignal(0)
        Dim strCurrency As String = arrSignal(1)
        Dim strDate As String = arrSignal(2)
        Dim strRate As String = arrSignal(3)
        Dim strSL As String = arrSignal(4)
        Dim strTarget As String = arrSignal(5)
        Dim strProfit As String = arrSignal(6)
        Dim strLots As String = arrSignal(7).Trim

        Dim strSignalLabel As String = strType + " " + strCurrency + " at " + strRate + " , target = " + strTarget + " , SL = " + strSL + " , AmountK = " + strLots

        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from " + TableSignal + " where  Curr = '" & strCurrency & "' and Entry = '" & strRate & "' and dtDate = '" & strDate & "' ")
        Try

            If reader.HasRows = False Then
                opExec.ExecuteSql("insert into " + TableSignal + " (Signal,Status,dtDateSignal,dtdate,Entry,SL,Target,curr,Profit,AmountK) values ('" & strSignalLabel & "','T','" & strNow & "','" & strDate & "','" & strRate & "','" & strSL & "','" & strTarget & "','" & strCurrency & "','" & strProfit & "','" & strLots & "')")

                UpdateIndicatorUsers(strType.Trim(), strCurrency.Replace("/", ""), strRate, strSL, strTarget, strLots, strDate, "P")


               

            Else
                opExec.ExecuteSql("update " + TableSignal + " set Profit = " + strProfit + " where dtdate = '" & strDate & "' and curr = '" & strCurrency & "' and Entry = '" & strRate & "' ")

              
            End If


        Catch ex As Exception
            opExec.closeConnection()
            reader.Close()
        Finally
            opExec.closeConnection()
            reader.Close()
        End Try

    End Sub

    

    Sub CloseSignal(ByVal arrSignal() As String, ByVal curr As String)

        Dim opExec As New cs_Operation

        Dim strNow As String
        strNow = CStr(Now)

        Dim i As Integer = 0

        Dim strDate As String = ""
        Dim strCurr As String = ""
        Dim strRate As String = ""
        Dim strLots As String = ""

        Dim arrSig() As String
        Dim SignalFound As Boolean = False
        Dim reader As OleDbDataReader

        If (curr = "EURUSD") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and (curr = 'EUR/USD')  ")
        End If
        If (curr = "GBPUSD") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and (curr = 'GBP/USD')  ")
        End If
        If (curr = "GBPJPY") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and curr = 'GBP/JPY' ")
        End If
        If (curr = "EURGBP") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and curr = 'EUR/GBP' ")
        End If
        If (curr = "AUDUSD") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and curr = 'AUD/USD' ")
        End If
        If (curr = "EURAUD") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and curr = 'EUR/AUD' ")
        End If
        If (curr = "USDJPY") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and curr = 'USD/JPY' ")
        End If
        If (curr = "EURJPY") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and curr = 'EUR/JPY' ")
        End If
        If (curr = "NZDUSD") Then
            reader = opExec.rdGetReader("select * from " + TableSignal + " where status = 'T' and curr = 'NZD/USD' ")
        End If
        Try

            If reader.HasRows Then

                While reader.Read

                    SignalFound = False
                    i = 0
                    While (i < arrSignal.GetUpperBound(0))

                        arrSig = arrSignal(i).Split("+")
                        strDate = arrSig(2)
                        strCurr = arrSig(1)
                        strRate = arrSig(3)
                        strLots = arrSig(7).Trim()

                        If (reader("dtDate") = strDate And reader("Entry") = strRate And reader("Curr") = strCurr) Then
                            SignalFound = True
                            Exit While
                        Else
                            SignalFound = False
                        End If


                        i = i + 1

                    End While

                    If (SignalFound.Equals(False) Or arrSignal(0).Equals("")) Then
                        opExec.ExecuteSql("update " + TableSignal + " set Status='C', dtDateClose = '" & strNow & "' where dtDate = '" & reader("dtDate") & "'  and curr = '" & reader("Curr") & "' and Entry = '" & reader("Entry") & "'  and AmountK = '" & reader("AmountK") & "' ")


                        ' close here in Signals.txt
                     
                        UpdateIndicatorUsers(reader("Signal").Substring(0, 4).trim(), reader("Curr"), reader("Entry"), reader("SL"), reader("Target"), reader("AmountK"), reader("dtDate"), "C")

                    End If

                End While

            End If

        Catch ex As Exception

            Response.Write(ex.Message)

        Finally
            opExec.closeConnection()
            reader.Close()
        End Try

    End Sub


    Sub Selenium()

        Dim driver As New ChromeDriver()

        Dim ChromeService = ChromeDriverService.CreateDefaultService()
        ChromeService.SuppressInitialDiagnosticInformation = True

      
        'NZDUSD and GBPUSD and AUDUSD
        Using (ChromeService)
            ChromeService.Start()

            Dim point As New Point(-2000, 0)

            driver.Manage().Window().Position = point

            driver.Navigate().GoToUrl("https://www.zulutrade.com/trader/192668")
            Dim demoDiv As IWebElement = driver.FindElement(By.Id("open-positions"))
            Dim res As String = driver.ExecuteScript("return arguments[0].innerHTML", demoDiv).ToString()



            ' NZDUSD Trading
            Dim stringSeparators As String() = New String() {"NZD/USD"}
            Dim stringSeparatorsInfoDark As String() = New String() {"icon icon-info-dark trade-info"}
            stringSeparators = res.Split(stringSeparators, StringSplitOptions.None)

            Dim i As Integer = 1

            File.Delete("C:\Zulutrade\Files\SignalsNU.txt")
 
            While (i <= stringSeparators.GetUpperBound(0))
                stringSeparatorsInfoDark = stringSeparators(i).Split(stringSeparatorsInfoDark, StringSplitOptions.None)
                InsertIntoFile(stringSeparatorsInfoDark(0), "NZD/USD")
                i = i + 1
            End While

            ' End NZDUSD


            ' GBPUSD Trading
            Dim stringSeparatorsGBP As String() = New String() {"GBP/USD"}
            Dim stringSeparatorsInfoDarkGBP As String() = New String() {"icon icon-info-dark trade-info"}
            stringSeparatorsGBP = res.Split(stringSeparatorsGBP, StringSplitOptions.None)

            Dim j As Integer = 1

            File.Delete("C:\Zulutrade\Files\SignalsGU.txt")

            While (j <= stringSeparatorsGBP.GetUpperBound(0))
                stringSeparatorsInfoDarkGBP = stringSeparatorsGBP(j).Split(stringSeparatorsInfoDarkGBP, StringSplitOptions.None)
                InsertIntoFile(stringSeparatorsInfoDarkGBP(0), "GBP/USD")
                j = j + 1
            End While

            ' End GBPUSD



            ' AUDUSD Trading
            Dim stringSeparatorsUSDJPY As String() = New String() {"AUD/USD"}
            Dim stringSeparatorsInfoDarkUSDJPY As String() = New String() {"icon icon-info-dark trade-info"}
            stringSeparatorsUSDJPY = res.Split(stringSeparatorsUSDJPY, StringSplitOptions.None)

            Dim k As Integer = 1
            File.Delete("C:\Zulutrade\Files\SignalsAU.txt")

            While (k <= stringSeparatorsUSDJPY.GetUpperBound(0))
                stringSeparatorsInfoDarkUSDJPY = stringSeparatorsUSDJPY(k).Split(stringSeparatorsInfoDarkUSDJPY, StringSplitOptions.None)
                InsertIntoFile(stringSeparatorsInfoDarkUSDJPY(0), "AUD/USD")
                k = k + 1
            End While

            driver.Quit()


        End Using



        driver = New ChromeDriver()

        'EUR/GBP
        Using (ChromeService)
            ChromeService.Start()

            Dim point As New Point(-2000, 0)

            driver.Manage().Window().Position = point

            driver.Navigate().GoToUrl("https://www.zulutrade.com/trader/151784")
            Dim demoDiv As IWebElement = driver.FindElement(By.Id("open-positions"))
            Dim res As String = driver.ExecuteScript("return arguments[0].innerHTML", demoDiv).ToString()

            ' EURGBP Trading
            Dim stringSeparatorsEURGBP As String() = New String() {"EUR/GBP"}
            Dim stringSeparatorsInfoDarkEURGBP As String() = New String() {"icon icon-info-dark trade-info"}
            stringSeparatorsEURGBP = res.Split(stringSeparatorsEURGBP, StringSplitOptions.None)

            Dim eg As Integer = 1
            'If (stringSeparatorsEURGBP.GetUpperBound(0) > 0) Then
            File.Delete("C:\Zulutrade\Files\SignalsEG.txt")
            'End If


            While (eg <= stringSeparatorsEURGBP.GetUpperBound(0))
                stringSeparatorsInfoDarkEURGBP = stringSeparatorsEURGBP(eg).Split(stringSeparatorsInfoDarkEURGBP, StringSplitOptions.None)
                InsertIntoFile(stringSeparatorsInfoDarkEURGBP(0), "EUR/GBP")
                eg = eg + 1
            End While


            driver.Quit()
        End Using


        driver = New ChromeDriver()

        'EUR/USD
        Using (ChromeService)
            ChromeService.Start()

            Dim point As New Point(-2000, 0)

            driver.Manage().Window().Position = point

            driver.Navigate().GoToUrl("https://www.zulutrade.com/trader/207637")
            Dim demoDiv As IWebElement = driver.FindElement(By.Id("open-positions"))
            Dim res As String = driver.ExecuteScript("return arguments[0].innerHTML", demoDiv).ToString()

            ' EURUSD Trading
            Dim stringSeparatorsEURGBP As String() = New String() {"EUR/USD"}
            Dim stringSeparatorsInfoDarkEURGBP As String() = New String() {"icon icon-info-dark trade-info"}
            stringSeparatorsEURGBP = res.Split(stringSeparatorsEURGBP, StringSplitOptions.None)

            Dim eg As Integer = 1
            'If (stringSeparatorsEURGBP.GetUpperBound(0) > 0) Then
            File.Delete("C:\Zulutrade\Files\SignalsEU.txt")
            'End If


            While (eg <= stringSeparatorsEURGBP.GetUpperBound(0))
                stringSeparatorsInfoDarkEURGBP = stringSeparatorsEURGBP(eg).Split(stringSeparatorsInfoDarkEURGBP, StringSplitOptions.None)
                InsertIntoFile(stringSeparatorsInfoDarkEURGBP(0), "EUR/USD")
                eg = eg + 1
            End While

            driver.Quit()
        End Using


        driver = New ChromeDriver()

        'EUR/JPY
        Using (ChromeService)
            ChromeService.Start()

            Dim point As New Point(-2000, 0)

            driver.Manage().Window().Position = point

            driver.Navigate().GoToUrl("https://www.zulutrade.com/trader/264822")
            Dim demoDiv As IWebElement = driver.FindElement(By.Id("open-positions"))
            Dim res As String = driver.ExecuteScript("return arguments[0].innerHTML", demoDiv).ToString()

            Dim stringSeparatorsGBPJPY As String() = New String() {"EUR/JPY"}
            Dim stringSeparatorsInfoDarkGBPJPY As String() = New String() {"icon icon-info-dark trade-info"}
            stringSeparatorsGBPJPY = res.Split(stringSeparatorsGBPJPY, StringSplitOptions.None)

            Dim eg As Integer = 1
            'If (stringSeparatorsGBPJPY.GetUpperBound(0) > 0) Then
            File.Delete("C:\Zulutrade\Files\SignalsEJ.txt")
            'End If


            While (eg <= stringSeparatorsGBPJPY.GetUpperBound(0))
                stringSeparatorsInfoDarkGBPJPY = stringSeparatorsGBPJPY(eg).Split(stringSeparatorsInfoDarkGBPJPY, StringSplitOptions.None)
                InsertIntoFile(stringSeparatorsInfoDarkGBPJPY(0), "EUR/JPY")
                eg = eg + 1
            End While

            driver.Quit()
        End Using

        driver = New ChromeDriver()
        'USD/JPY
        Using (ChromeService)
            ChromeService.Start()

            Dim point As New Point(-2000, 0)

            driver.Manage().Window().Position = point

            driver.Navigate().GoToUrl("https://www.zulutrade.com/trader/153125")
            Dim demoDiv As IWebElement = driver.FindElement(By.Id("open-positions"))
            Dim res As String = driver.ExecuteScript("return arguments[0].innerHTML", demoDiv).ToString()

            ' USDJPY Trading
            Dim stringSeparators As String() = New String() {"USD/JPY"}
            Dim stringSeparatorsInfoDark As String() = New String() {"icon icon-info-dark trade-info"}
            stringSeparators = res.Split(stringSeparators, StringSplitOptions.None)

            Dim i As Integer = 1

            'If (stringSeparators.GetUpperBound(0) > 0) Then
            File.Delete("C:\Zulutrade\Files\SignalsUJ.txt")
            'End If


            While (i <= stringSeparators.GetUpperBound(0))
                stringSeparatorsInfoDark = stringSeparators(i).Split(stringSeparatorsInfoDark, StringSplitOptions.None)
                InsertIntoFile(stringSeparatorsInfoDark(0), "USD/JPY")
                i = i + 1
            End While

            ' End USDJPY
            driver.Quit()
        End Using


        'driver = New ChromeDriver()
        'EUR/AUD
        'Using (ChromeService)
        '    ChromeService.Start()

        '    Dim point As New Point(-2000, 0)

        '    driver.Manage().Window().Position = point

        '    driver.Navigate().GoToUrl("https://www.zulutrade.com/trader/267116")
        '    Dim demoDiv As IWebElement = driver.FindElement(By.Id("open-positions"))
        '    Dim res As String = driver.ExecuteScript("return arguments[0].innerHTML", demoDiv).ToString()

        '    Dim stringSeparatorsEURAUD As String() = New String() {"GBP/JPY"}
        '    Dim stringSeparatorsInfoDarkEURAUD As String() = New String() {"icon icon-info-dark trade-info"}
        '    stringSeparatorsEURAUD = res.Split(stringSeparatorsEURAUD, StringSplitOptions.None)

        '    Dim eg As Integer = 1

        '    'If (stringSeparatorsEURAUD.GetUpperBound(0) > 0) Then
        '    File.Delete("C:\Zulutrade\Files\SignalsEA.txt")
        '    'End If

        '    While (eg <= stringSeparatorsEURAUD.GetUpperBound(0))
        '        stringSeparatorsInfoDarkEURAUD = stringSeparatorsEURAUD(eg).Split(stringSeparatorsInfoDarkEURAUD, StringSplitOptions.None)
        '        InsertIntoFile(stringSeparatorsInfoDarkEURAUD(0), "AUD/USD")
        '        eg = eg + 1
        '    End While


        'End Using

        driver.Quit()

    End Sub



    Sub InsertIntoFile(ByVal signal As String, ByVal Curr As String)

        Dim stringSeparators As String() = New String() {"</td><td class="""">"}
        stringSeparators = signal.Split(stringSeparators, StringSplitOptions.None)

        Dim strType As String = ""
        If (stringSeparators(1).Equals("شراء") Or stringSeparators(1).Equals("BUY")) Then strType = "Buy"
        If (stringSeparators(1).Equals("بيع") Or stringSeparators(1).Equals("SELL")) Then strType = "Sell"

        Dim stringProfit As String() = New String() {"</td><td class=""c"}

        stringProfit = stringSeparators(7).Split(stringProfit, StringSplitOptions.None)

        Dim stringProfit1 As String() = New String() {">"}
        stringProfit1 = stringProfit(1).Split(stringProfit1, StringSplitOptions.None)

        Dim stringProfit2 As String() = New String() {"<"}
        stringProfit1 = stringProfit1(1).Split(stringProfit2, StringSplitOptions.None)

        Dim strSignal As String = strType + "+" + Curr + "+" + stringSeparators(3) + "+" + stringSeparators(4) + "+" + stringSeparators(5) + "+" + stringSeparators(6) + "+" + stringProfit1(0) + "+" + stringSeparators(2) + " * "

        If (Curr = "EUR/USD") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsEU.txt", strSignal)
        End If
        If (Curr = "GBP/USD") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsGU.txt", strSignal)
        End If
        If (Curr = "EUR/GBP") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsEG.txt", strSignal)
        End If
        If (Curr = "GBP/JPY") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsGJ.txt", strSignal)
        End If
        If (Curr = "AUD/USD") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsAU.txt", strSignal)
        End If
        If (Curr = "EUR/AUD") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsEA.txt", strSignal)
        End If
        If (Curr = "USD/JPY") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsUJ.txt", strSignal)
        End If
        If (Curr = "NZD/USD") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsNU.txt", strSignal)
        End If
        If (Curr = "EUR/JPY") Then
            File.AppendAllText("C:\Zulutrade\Files\SignalsEJ.txt", strSignal)
        End If

    End Sub


    Sub EURUSD()

        strSignal = Text2String(strLocation + "\SignalsEU.txt")

        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "EURUSD", "", "", "", "", "", "C")
            strSignal = ""

        Else


            Dim arr() As String
            Dim arrSignal() As String = {""}

            If strSignal <> "" Then

                arr = Split(strSignal, "-")

                arrSignal = strSignal.Split("*")


                Dim ii As Integer = 0

                While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                    ExecuteSignal(arrSignal(ii))
                    ii = ii + 1
                End While

                ii = 0

            End If

            CloseSignal(arrSignal, "EURUSD")

        End If

    End Sub


    Sub EURAUD()

        strSignal = Text2String(strLocation + "\SignalsEA.txt")

        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "AUDUSD", "", "", "", "", "", "C")
            strSignal = ""

        Else

            Dim arr() As String
            Dim arrSignal() As String = {""}

            If strSignal <> "" Then

                arr = Split(strSignal, "-")

                arrSignal = strSignal.Split("*")


                Dim ii As Integer = 0

                While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                    ExecuteSignal(arrSignal(ii))
                    ii = ii + 1
                End While

                ii = 0

            End If

            CloseSignal(arrSignal, "EURAUD")

        End If

    End Sub

    Sub AUDUSD()

        strSignal = Text2String(strLocation + "\SignalsAU.txt")

        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "AUDUSD", "", "", "", "", "", "C")
            strSignal = ""

        Else

            Dim arr() As String
            Dim arrSignal() As String = {""}

            If strSignal <> "" Then

                arr = Split(strSignal, "-")

                arrSignal = strSignal.Split("*")


                Dim ii As Integer = 0

                While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                    ExecuteSignal(arrSignal(ii))
                    ii = ii + 1
                End While

                ii = 0

            End If
            CloseSignal(arrSignal, "AUDUSD")

        End If

    End Sub


    Sub NZDUSD()

        strSignal = Text2String(strLocation + "\SignalsNU.txt")

        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "NZDUSD", "", "", "", "", "", "C")
            strSignal = ""

        Else

            Dim arr() As String
            Dim arrSignal() As String = {""}

            If strSignal <> "" Then

                arr = Split(strSignal, "-")

                arrSignal = strSignal.Split("*")


                Dim ii As Integer = 0

                While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                    ExecuteSignal(arrSignal(ii))
                    ii = ii + 1
                End While

                ii = 0

            End If
            CloseSignal(arrSignal, "NZDUSD")

        End If

    End Sub

    Sub GBPJPY()

        strSignal = Text2String(strLocation + "\SignalsGJ.txt")

        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "GBPJPY", "", "", "", "", "", "C")
            strSignal = ""

        Else

            Dim arr() As String
            Dim arrSignal() As String = {""}

            If strSignal <> "" Then

                arr = Split(strSignal, "-")

                arrSignal = strSignal.Split("*")


                Dim ii As Integer = 0

                While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                    ExecuteSignal(arrSignal(ii))
                    ii = ii + 1
                End While

                ii = 0

            End If

            CloseSignal(arrSignal, "GBPJPY")

        End If

    End Sub

    Sub GBPUSD()

        strSignal = Text2String(strLocation + "\SignalsGU.txt")


        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "GBPUSD", "", "", "", "", "", "C")
            strSignal = ""

        Else

            Dim arr() As String
            Dim arrSignal() As String = {""}

            If strSignal <> "" Then
                arr = Split(strSignal, "-")

                arrSignal = strSignal.Split("*")
                Dim ii As Integer = 0

                While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                    ExecuteSignal(arrSignal(ii))
                    ii = ii + 1
                End While
                ii = 0
            End If

            CloseSignal(arrSignal, "GBPUSD")


        End If

    End Sub


    Sub EURGBP()

        strSignal = Text2String(strLocation + "\SignalsEG.txt")
        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "EURGBP", "", "", "", "", "", "C")
            strSignal = ""
        End If


        Dim arr() As String
        Dim arrSignal() As String = {""}

        If strSignal <> "" Then
            arr = Split(strSignal, "-")

            arrSignal = strSignal.Split("*")
            Dim ii As Integer = 0

            While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                ExecuteSignal(arrSignal(ii))
                ii = ii + 1
            End While
            ii = 0
        End If

        CloseSignal(arrSignal, "EURGBP")

        'SynchronizeWithZulu()

    End Sub

    Sub EURJPY()

        strSignal = Text2String(strLocation + "\SignalsEJ.txt")
        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "EURJPY", "", "", "", "", "", "C")
            strSignal = ""
        End If


        Dim arr() As String
        Dim arrSignal() As String = {""}

        If strSignal <> "" Then
            arr = Split(strSignal, "-")

            arrSignal = strSignal.Split("*")
            Dim ii As Integer = 0

            While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                ExecuteSignal(arrSignal(ii))
                ii = ii + 1
            End While
            ii = 0
        End If

        CloseSignal(arrSignal, "EURJPY")

        'SynchronizeWithZulu()

    End Sub

    Sub SynchronizeWithZulu()


        Dim opExec As New cs_Operation


        Dim strNow As String
        strNow = CStr(Now)

        Dim t1 As New DataTable("Trades")
        Dim newrow As DataRow

        Dim strMarquee As String = ""
        Dim strStatus As String = ""



        Dim newCell As New Data.DataColumn()



        newCell = New Data.DataColumn()
        newCell.ColumnName = "Signal"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Curr"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Status"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Entry"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "dtDateSignal"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "dtDateClose"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "dtDate"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "SL"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Target"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Profit"
        t1.Columns.Add(newCell)


        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from " + TableSignal + " ")
        Try

            If reader.HasRows = True Then

                While reader.Read()

                    newrow = t1.NewRow()

                    newrow("Signal") = reader("Signal")
                    newrow("Curr") = reader("Curr")
                    newrow("Entry") = reader("Entry")
                    newrow("Status") = reader("Status")
                    newrow("dtDateSignal") = reader("dtDateSignal")
                    newrow("dtDateClose") = reader("dtDateClose")
                    newrow("dtDate") = reader("dtDate")

                    newrow("SL") = reader("SL")
                    newrow("Target") = reader("Target")

                    newrow("Profit") = reader("Profit")

                    t1.Rows.Add(newrow)

                End While

                Dim wprxStock As New WebProxy("cid-isa-1.customs.gov.lb:8080", True)

                wprxStock.Credentials = CredentialCache.DefaultCredentials




                Dim dd As New com.rpchost.www.grabdata
                dd.Proxy = wprxStock

                'Dim dd As New grabdata
                Dim bb As Boolean = dd.SetZulutradeOpenTrades(t1)

            End If


        Catch ex As Exception

        Finally
            opExec.closeConnection()
            reader.Close()
        End Try


    End Sub

   

    Sub USDJPY()

        strSignal = Text2String(strLocation + "\SignalsUJ.txt")

        If (strSignal = Nothing) Then
            UpdateIndicatorUsers("", "USDJPY", "", "", "", "", "", "C")
            strSignal = ""

        Else

            Dim arr() As String
            Dim arrSignal() As String = {""}

            If strSignal <> "" Then

                arr = Split(strSignal, "-")

                arrSignal = strSignal.Split("*")


                Dim ii As Integer = 0

                While (ii <= arrSignal.GetUpperBound(0) And arrSignal(ii).Trim() <> "")
                    ExecuteSignal(arrSignal(ii))
                    ii = ii + 1
                End While

                ii = 0

            End If

            CloseSignal(arrSignal, "USDJPY")

        End If

    End Sub

    Private Function UpdateIndicatorUsers(ByVal BuySell As String, ByVal Currency As String, ByVal Rate As String, ByVal SL As String, ByVal Target As String, ByVal Lots As String, ByVal dtDate As String, ByVal Flag As String) As Boolean

        Dim strSignal As String = BuySell + "," + Currency.Replace("/", "") + "," + Flag + "," + Rate + "," + SL + "," + Target + "," + Lots + "," + dtDate
        Dim writeSignal As New WriteSignals


        Dim i As Integer
        Dim Lines() As String
        Dim Line1 As String

        Dim path As String = strSignalsLocation


        If (Flag = "P") Then
            strSignal = strSignal + ",*"
            writeSignal.WriteFile(strSignal)
        End If

        If (Flag = "C") Then
            Lines = File.ReadAllLines(path)


            For Each Line As String In Lines
                If strSignal.Equals("," + Currency.Replace(" / ", "") + ",C,,,,,") = True Then

                    Line1 = Line.Replace(Currency + ",P", Currency + ",C")
                    Line1 = Line.Replace(Currency + ",E", Currency + ",C")
                    If (Line <> Line1) Then
                        'writeSignal.WriteFile(Line1)
                        File.WriteAllText(path, Line1)
                    End If
                    Line1 = ""
                    Exit For

                Else
                    Dim strSignalReplace As String = BuySell + "," + Currency.Replace("/", "") + ",P," + Rate + "," + SL + "," + Target + "," + Lots + "," + dtDate

                    Line1 = Line.Replace(strSignalReplace, strSignal)

                    strSignalReplace = BuySell + "," + Currency.Replace("/", "") + ",E," + Rate + "," + SL + "," + Target + "," + Lots + "," + dtDate
                    Line1 = Line.Replace(strSignalReplace, strSignal)

                    If (Line <> Line1) Then
                        ' writeSignal.WriteFile(Line1)
                        File.WriteAllText(path, Line1)
                    End If
                    Line1 = ""

                    Exit For
                End If

            Next

        End If

        'UpdateIndicatorUsersLocally(BuySell, Currency)
        Dim strReadAll As String = File.ReadAllText(path)

        lblMess.Text = strReadAll.Replace("*", "      ")



    End Function

    Public Function UpdateIndicatorUsersLocally(ByVal BuySell As String, ByVal Currency As String) As String
        Try
            Dim opExec As New rpchost.cs_Operation
            If (Currency = "EURUSD") Then opExec.ExecuteSql("update [Indicator] set [CodeEURUSD] = '" & BuySell & "' ")
            If (Currency = "GBPUSD") Then opExec.ExecuteSql("update [Indicator] set [CodeGBPUSD] = '" & BuySell & "' ")
            If (Currency = "EURGBP") Then opExec.ExecuteSql("update [Indicator] set [CodeEURGBP] = '" & BuySell & "' ")
            If (Currency = "GBPJPY") Then opExec.ExecuteSql("update [Indicator] set [CodeGBPJPY] = '" & BuySell & "' ")
            If (Currency = "AUDUSD") Then opExec.ExecuteSql("update [Indicator] set [CodeAUDUSD] = '" & BuySell & "' ")
            If (Currency = "EURAUD") Then opExec.ExecuteSql("update [Indicator] set [CodeEURAUD] = '" & BuySell & "' ")
            If (Currency = "USDJPY") Then opExec.ExecuteSql("update [Indicator] set [CodeUSDJPY] = '" & BuySell & "' ")
            opExec.closeConnection()

            File.WriteAllText(strSignalsLocation, WriteSignalsToFile())

            Return True
        Catch ex As Exception

            HttpContext.Current.Response.Write(ex.Message)

        Finally
            'opExec.closeConnection()
            Dispose()
        End Try


    End Function


    Private Function WriteSignalsToFile() As String

        Dim opExec As New rpchost.cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("SELECT * FROM [Indicator]  ")
        Dim Code As String = ""

        Try

            If reader.HasRows = True Then
                reader.Read()


                Return " :: " & IIf(IsDBNull(System.String.Format("{0: dd/MM/yyyy HH:mm}", Convert.ToDateTime(Now))), "", System.String.Format("{0: dd/MM/yyyy HH:mm}", Convert.ToDateTime(Now))) & " -" & IIf(IsDBNull(reader("DateExpire")), "", System.String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(reader("DateExpire")))) & " - " & IIf(IsDBNull(reader("Mess")), "", reader("Mess")) & " - EUR=" & reader("CodeEURUSD") & " - GBP=" & reader("CodeGBPUSD") & " - JPY=" & reader("CodeUSDJPY") & " - EURGBP=" & reader("CodeEURGBP") & " - GBPJPY=" & reader("CodeGBPJPY") & " - AUDUSD=" & reader("CodeAUDUSD") & " - EURAUD=" & reader("CodeEURAUD") & " - USDJPY=" & reader("CodeUSDJPY") & " :: "


            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            opExec.closeConnection()
            Dispose()
        End Try

    End Function


    Private Function Login(ByRef sUserName As Object, ByRef sPassword As Object, ByRef sHostsPath As Object, ByRef sTrading As Object, ByRef oTradeDesk As Object) As Boolean

        Try

            Login = False

            core = New FXCore.CoreAut()
            desk = core.CreateTradeDesk("trader")

            Try


                Call desk.Login(sUserName, sPassword, sHostsPath, sTrading)

            Catch ex As Exception
                If (txtUserName.Text <> "" Or txtPassword.Text <> "") Then
                    lblMess.Text = ex.Message
                    lblMess.UpdateAfterCallBack = True
                    lblMess.DataBind()
                    Exit Function
                End If
            End Try

            Login = True



            Dim oRow As Object


            oAccountsTable = desk.FindMainTable(tblAccounts)

            oOffersTable = desk.FindMainTable("Offers")
            account = oAccountsTable.CellValue(1, "AccountID")
            min_amount = oAccountsTable.CellValue(1, "BaseUnitSize")

            Dim c As Short
            Dim offset As Object


            For Each oRow In oAccountsTable.Rows
                Me.cmbAccount.Items.Add((oRow.AccountName))
            Next oRow

            For Each oRow In oOffersTable.Rows

                If oRow.ContractSize <> 1 Then

                    If oRow.ContractSize > 11000 Then
                        miniaccount = False
                        mult = 100
                    Else
                        miniaccount = True
                        mult = 10

                    End If
                Else
                    If desk.GetSystemProperty("COND_DIST") = 10000 Then
                        miniaccount = True
                    Else
                        miniaccount = False
                    End If

                    mult = 1 / 1000
                End If

            Next oRow

            PopulateAmount()

            'multLot = mult
            DeskBack = desk

            cmbAmountK.UpdateAfterCallBack = True
            cmbAmountK.DataBind()


        Catch ex As Exception
            Response.Write("Login Error " & ex.Message)
        End Try

        Call Updater()



    End Function

    Private Sub PopulateAmount()

        Dim c As Short
        Dim offset As Object


        Me.cmbAmountK.Items.Clear()

        c = 1
        'Adds the amounts for the AmountK field
        'UPGRADE_WARNING: Couldn't resolve default property of object mult. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
        If mult > 1 Then

            Do Until c > 10
                'UPGRADE_WARNING: Couldn't resolve default property of object mult. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
                Me.cmbAmountK.Items.Insert(c - 1, CStr(c * mult))
                c = c + 1

            Loop

            'TONI ACCOUNT
            'Call cmbAmountK.AddItem(5, 0)

        Else

            'UPGRADE_WARNING: Couldn't resolve default property of object miniaccount. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
            If miniaccount = True Then
                'UPGRADE_WARNING: Couldn't resolve default property of object offset. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
                offset = 10000
            Else
                'UPGRADE_WARNING: Couldn't resolve default property of object offset. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
                offset = 100000
            End If

            Do Until c > 10
                'UPGRADE_WARNING: Couldn't resolve default property of object offset. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
                'UPGRADE_WARNING: Couldn't resolve default property of object mult. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
                Me.cmbAmountK.Items.Insert(c - 1, CStr(c * (mult * offset)))
                c = c + 1
            Loop

            'TONI ACCOUNT
            'Call cmbAmountK.AddItem(5, 0)

        End If

        multLot = mult


        cmbAmountK.UpdateAfterCallBack = True
        cmbAmountK.DataBind()

    End Sub

    Private Sub Updater()



        Dim iRow, oRow, amount As Object

        oAccountsTable = desk.FindMainTable(tblAccounts)
        oOffersTable = desk.FindMainTable(tblOffers)
        oClosedTradesTable = desk.FindMainTable("closed trades")
        amount = 0


        Dim res As Integer

        Dim data As New DataSet
        Dim t1 As New DataTable("ClosedTrades")

        Dim newrow As DataRow
        Dim newCell As New Data.DataColumn()


        oClosedTradesTable = desk.FindMainTable("Closed Trades")

        newCell = New Data.DataColumn()
        newCell.ColumnName = "TradeID"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Instrument"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Amount"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "S/B"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Open"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Close"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Stop"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "Limit"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "PL"
        t1.Columns.Add(newCell)


        newCell = New Data.DataColumn()
        newCell.ColumnName = "GrossPL"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "OpenTime"
        t1.Columns.Add(newCell)

        newCell = New Data.DataColumn()
        newCell.ColumnName = "ClosedTime"
        t1.Columns.Add(newCell)


        For Each oRow In oClosedTradesTable.Rows

            newrow = t1.NewRow()

            newrow("TradeID") = oRow.TradeID
            newrow("Instrument") = oRow.Instrument
            newrow("Amount") = oRow.AmountK
            newrow("S/B") = oRow.BS
            newrow("Open") = oRow.Open
            newrow("Close") = oRow.Close
            newrow("OpenTime") = oRow.OpenTime
            newrow("ClosedTime") = oRow.CloseTime

            newrow("PL") = oRow.PL
            newrow("GrossPL") = oRow.GrossPL

            res = res + oRow.PL

            t1.Rows.Add(newrow)

        Next


        data.Tables.Add(t1)
        GridView2.DataSource = data
        GridView2.DataBind()


    End Sub

    Private Function getOpenedPips() As Short


        Try

            Dim oTable, oRow, oCell, acct As Object
            Dim sumPips As Short
            Dim isEURExist As Boolean
            Dim isGBPExist As Boolean


            Dim i, j As Integer

            Dim data As New DataSet

            Dim t1 As New DataTable("Trades")

            Dim newrow As DataRow
            Dim newCell As New Data.DataColumn()

            oClosedTradesTable = DeskBack.FindMainTable("Trades")

            newCell = New Data.DataColumn()
            newCell.ColumnName = "TradeID"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Instrument"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Amount"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "S/B"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Open"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Close"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Stop"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Limit"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "PL"
            t1.Columns.Add(newCell)


            newCell = New Data.DataColumn()
            newCell.ColumnName = "GrossPL"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Time"
            t1.Columns.Add(newCell)



            For Each oRow In oClosedTradesTable.Rows

                newrow = t1.NewRow()

                newrow("TradeID") = oRow.TradeID
                newrow("Instrument") = oRow.Instrument
                newrow("Amount") = oRow.AmountK
                newrow("S/B") = oRow.BS
                newrow("Open") = oRow.Open
                newrow("Close") = oRow.Close
                newrow("Stop") = oRow.Stop
                newrow("Limit") = oRow.Limit
                newrow("PL") = oRow.PL
                newrow("GrossPL") = Convert.ToDouble(oRow.GrossPL)
                newrow("Time") = oRow.Time

                sumPips = sumPips + CShort(oRow.PL)

                t1.Rows.Add(newrow)

            Next

            data.Tables.Add(t1)
            GridView1.DataSource = data
            GridView1.DataBind()

            If (t1.Rows.Count > 0) Then
                deleteAll.Visible = True
            Else
                deleteAll.Visible = False
            End If

            deleteAll.UpdateAfterCallBack = True

            deleteAll.DataBind()

            getOpenedPips = sumPips

        Catch ex As Exception
            getOpenedPips = 0
        End Try


    End Function

    Private Function getClosedPips() As Short


        Try

            Dim sumPips As Integer

            oClosedTradesTable = DeskBack.FindMainTable("Closed Trades")

            For Each oRow In oClosedTradesTable.Rows

                sumPips = sumPips + CShort(oRow.PL)

            Next

            getClosedPips = sumPips

        Catch ex As Exception
            getClosedPips = 0
        End Try


    End Function

    Protected Sub cmdLogOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogOut.Click

        Try


            If DeskBack.IsLoggedIn() Then

                LoginCompleted = False
                Call DeskBack.Logout()

                Response.Redirect("fxas.aspx")

            End If

        Catch ex As Exception

        End Try

    End Sub

    Public Function Text2String(ByRef strPath As String) As String
        On Error GoTo ErrTrap
        Dim intFileNumber As Short


        'UPGRADE_WARNING: Dir has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
        If Dir(strPath) = "" Then Exit Function
        intFileNumber = FreeFile()
        FileOpen(intFileNumber, strPath, OpenMode.Input)

        Text2String = InputString(intFileNumber, LOF(intFileNumber))
ErrTrap:
        FileClose(intFileNumber)
    End Function

    Private Sub clearBuySell()

        Dim sFileText As String
        Dim iFileNo As Short
        iFileNo = FreeFile()
        'open the file for writing
        'Open App.Path + "\experts\files\BuySellEU.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
        FileOpen(iFileNo, strLocation + "\BuySellEU.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"


        PrintLine(iFileNo, "") 'blank line
        FileClose(iFileNo)

    End Sub

    Private Sub clearBuySellUJ()

        Dim sFileText As String
        Dim iFileNo As Short
        iFileNo = FreeFile()
        'open the file for writing
        'Open App.Path + "\experts\files\BuySellEU.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
        FileOpen(iFileNo, strLocation + "\BuySellUJ.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"


        PrintLine(iFileNo, "") 'blank line
        FileClose(iFileNo)

    End Sub

    Private Sub clearBuySellEJ()

        Dim sFileText As String
        Dim iFileNo As Short
        iFileNo = FreeFile()
        'open the file for writing
        'Open App.Path + "\experts\files\BuySellEU.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
        FileOpen(iFileNo, strLocation + "\BuySellEJ.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"


        PrintLine(iFileNo, "") 'blank line
        FileClose(iFileNo)

    End Sub

    Private Sub clearBuySellGU()

        Try


            Dim sFileText As String
            Dim iFileNo As Short
            iFileNo = FreeFile()
            'open the file for writing
            'Open App.Path + "\experts\files\BuySellGS.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
            FileOpen(iFileNo, strLocation + "\BuySellGS.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"

            PrintLine(iFileNo, "") 'blank line
            FileClose(iFileNo)

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub

    Private Sub clearFile()

        Dim sFileText As String
        Dim iFileNo As Short
        iFileNo = FreeFile()
        'open the file for writing
        ' Open App.Path + "\experts\files\SignalsEU.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
        FileOpen(iFileNo, strLocation + "\SignalsEU.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
        'Open "C:\SignalsEU.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"

        PrintLine(iFileNo, "") 'blank line
        FileClose(iFileNo)

    End Sub

    Private Sub clearFileUJ()

        Dim sFileText As String
        Dim iFileNo As Short
        iFileNo = FreeFile()
        'open the file for writing
        ' Open App.Path + "\experts\files\SignalsEU.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
        FileOpen(iFileNo, strLocation + "\SignalsUJ.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
        'Open "C:\SignalsEU.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"

        PrintLine(iFileNo, "") 'blank line
        FileClose(iFileNo)

    End Sub

    Private Sub clearFileGU()

        Try


            Dim sFileText As String
            Dim iFileNo As Short
            iFileNo = FreeFile()
            'open the file for writing
            'Open App.Path + "\experts\files\SignalsGS.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
            FileOpen(iFileNo, strLocation + "\SignalsEU.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
            'Open "C:\SignalsGS.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"


            PrintLine(iFileNo, "") 'blank line
            FileClose(iFileNo)

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub

    Private Sub clearFileEJ()

        Try


            Dim sFileText As String
            Dim iFileNo As Short
            iFileNo = FreeFile()
            'open the file for writing
            'Open App.Path + "\experts\files\SignalsGS.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
            FileOpen(iFileNo, strLocation + "\SignalsEJ.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
            'Open "C:\SignalsGS.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"


            PrintLine(iFileNo, "") 'blank line
            FileClose(iFileNo)

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub

    Private Sub clearFileEG()

        Try


            Dim sFileText As String
            Dim iFileNo As Short
            iFileNo = FreeFile()
            'open the file for writing
            'Open App.Path + "\experts\files\SignalsGS.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
            FileOpen(iFileNo, strLocation + "\SignalsEG.txt", OpenMode.Output) 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"
            'Open "C:\SignalsGS.txt" For Output As #iFileNo 'please note, if this file already exists it will be overwritten!       'write some example text to the file  Print #iFileNo, "first line of text"  Print #iFileNo, "   second line of text"


            PrintLine(iFileNo, "") 'blank line
            FileClose(iFileNo)

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub

    Private Function OpenTrade(ByVal Direction As String, ByVal stopP As Double, ByVal LimitP As Double, ByVal instrument As String, ByVal min_amount As Double, ByVal rate As Double, ByVal trade As Object, ByVal di As Object) As Boolean



        Dim Trail, lots As Double
        Dim QuoteID, OrderID, Dealer As Object
        Dim oRow As Object
        Dim acct As Double
        Dim isBuy As Boolean


        Try


            'Checks whether its a buy or sell
            If Direction = "Long" Then
                isBuy = True

            Else
                isBuy = False
            End If

            Try
                lots = Me.cmbAmountK.Text / multLot
            Catch ex As Exception
                lots = Request("cmbAmountK") / multLot
            End Try


            oRow = DeskBack.FindRowInTable("offers", "Instrument", instrument)

            If (Direction = "Short") Then
                rate = oRow.Bid
            Else
                rate = oRow.Ask
            End If
            QuoteID = oRow.QuoteID

            oRow = DeskBack.FindRowInTable("accounts", "AccountName", Me.cmbAccount.Text)

            acct = oRow.AccountID


            'Place Market Order

            'DeskBack.OpenTrade(acct, instrument, isBuy, CLng(lots), rate, QuoteID, 0, stopP, LimitP, Trail, OrderID, Dealer)
            DeskBack.OpenTrade(acct, instrument, isBuy, CLng(lots), rate, QuoteID, 0, stopP, LimitP, 0, OrderID, Dealer)



            If (instrument = "GBPUSD" Or instrument = "GBP/USD") Then
                clearFileGU()
            ElseIf (instrument = "EURUSD" Or instrument = "EUR/USD") Then
                clearFile()
            ElseIf (instrument = "EURJPY" Or instrument = "EUR/JPY") Then
                clearFileEJ()
            ElseIf (instrument = "USDJPY" Or instrument = "USD/JPY") Then
                clearFileUJ()
            End If

            OpenTrade = True

            Synchronize()



            GridView1.UpdateAfterCallBack = True

            GridView1.DataBind()



        Catch ex As Exception
            OpenTrade = False

            lblMess.Text = ex.Message

            lblMess.UpdateAfterCallBack = True
            lblMess.DataBind()
        End Try


    End Function

    Function GetOffer(ByVal isBuy As Boolean, ByVal sInstrument As String, ByRef QuoteID As Double) As Double


        Try


            Dim oRow As Object


            GetOffer = -1

            oRow = desk.FindRowInTable("offers", "Instrument", sInstrument)
            If isBuy Then
                GetOffer = oRow.Ask
            Else
                GetOffer = oRow.Bid
            End If
            QuoteID = oRow.QuoteID


        Catch ex As Exception
            GetOffer = -1
        End Try


    End Function

    Private Sub CloseTrade(ByRef strTradeID As String, ByRef strBuySell As String, ByRef strCurr As String)

        Dim isBuy, Limit, Stops, Trail, lots As Object
        Dim QuoteID, Rate, Dealer As Object
        Dim oRow As Object
        Dim acct As Object


        Try

            Limit = 0

            If strBuySell = "B" Then
                isBuy = True
            Else
                isBuy = False
            End If

            Dim itMarket As Short

            If (strCurr = "EURJPY" Or strCurr = "EUR/JPY") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "EUR/JPY") : itMarket = 6
            End If
            If (strCurr = "EURCHF" Or strCurr = "EUR/CHF") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "EUR/CHF") : itMarket = 6
            End If
            If (strCurr = "GBPJPY" Or strCurr = "GBP/JPY") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "GBP/JPY") : itMarket = 15
            End If
            If (strCurr = "AUDUSD" Or strCurr = "AUD/USD") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "AUD/USD") : itMarket = 6
            End If
            If (strCurr = "USDCAD" Or strCurr = "USD/CAD") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "USD/CAD") : itMarket = 6
            End If
            If (strCurr = "GBPUSD" Or strCurr = "GBP/USD") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "GBP/USD") : itMarket = 6
            End If
            If (strCurr = "EURUSD" Or strCurr = "EUR/USD") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "EUR/USD") : itMarket = 6
            End If
            If (strCurr = "USDJPY" Or strCurr = "USD/JPY") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "USD/JPY") : itMarket = 6
            End If
            If (strCurr = "NZDUSD" Or strCurr = "NZD/USD") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "NZD/USD") : itMarket = 6
            End If
            If (strCurr = "EURJPY" Or strCurr = "EUR/JPY") Then
                Rate = GetOfferByCurrency(isBuy, strCurr, QuoteID, "EUR/JPY") : itMarket = 6
            End If
            oRow = DeskBack.FindRowInTable("accounts", "AccountName", Me.cmbAccount.Text)

            acct = oRow.AccountID
            oRow = DeskBack.FindRowInTable("trades", "TradeID", strTradeID)

            lots = oRow.AmountK / multLot

            Dim ss As String
            ss = oRow.OpenOrderID

            DeskBack.CloseTrade(strTradeID, CLng(lots), Rate, QuoteID, itMarket, ss, Dealer)


            Synchronize()


        Catch ex As Exception

            lblMess.Text = ex.Message

            lblMess.UpdateAfterCallBack = True
            lblMess.DataBind()

        End Try



    End Sub

    Public Function GetOfferByCurrency(ByRef isBuy As Object, ByRef sInstrument As Object, ByRef QuoteID As Object, ByRef strCurr As Object) As Object
        Static oRow As Object

        Try


            GetOfferByCurrency = -1

            oRow = DeskBack.FindRowInTable("offers", "Instrument", strCurr)
            If isBuy Then
                GetOfferByCurrency = oRow.Ask
            Else
                GetOfferByCurrency = oRow.Bid
            End If
            QuoteID = oRow.QuoteID

            If Err.Number Then
                Exit Function
            End If


        Catch ex As Exception

        End Try


    End Function

    Protected Sub Synchronize()

        Dim dd As com.rpchost.www.grabdata
        dd = Nothing


        Try

            Dim oTable, oRow, oCell, acct As Object
            Dim sumPips As Short
            Dim isEURExist As Boolean
            Dim isGBPExist As Boolean

            Dim i, j As Integer


            Dim data As New DataSet


            Dim t1 As New DataTable("Trades")

            Dim newrow As DataRow
            Dim newCell As New Data.DataColumn()

            oClosedTradesTable = DeskBack.FindMainTable("Trades")

            newCell = New Data.DataColumn()
            newCell.ColumnName = "TradeID"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Instrument"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Amount"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "S/B"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Open"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Close"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Stop"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Limit"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "PL"
            t1.Columns.Add(newCell)


            newCell = New Data.DataColumn()
            newCell.ColumnName = "GrossPL"
            t1.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Time"
            t1.Columns.Add(newCell)

            For Each oRow In oClosedTradesTable.Rows

                newrow = t1.NewRow()

                newrow("TradeID") = oRow.TradeID
                newrow("Instrument") = oRow.Instrument
                newrow("Amount") = oRow.AmountK
                newrow("S/B") = oRow.BS
                newrow("Open") = oRow.Open
                newrow("Close") = oRow.Close
                newrow("Stop") = oRow.Stop
                newrow("Limit") = oRow.Limit
                newrow("PL") = oRow.PL
                newrow("GrossPL") = Convert.ToDouble(oRow.GrossPL)
                newrow("Time") = oRow.Time

                t1.Rows.Add(newrow)

            Next

            GridView1.UpdateAfterCallBack = True
            data.Tables.Add(t1)
            GridView1.DataSource = data
            GridView1.DataBind()

            dd = New com.rpchost.www.grabdata
            Dim Localdd As New grabdata

            Dim t2 As New DataTable
            oClosedTradesTable = DeskBack.FindMainTable("Closed Trades")

            newCell = New Data.DataColumn()
            newCell.ColumnName = "TradeID"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Instrument"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Amount"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "S/B"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Open"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Close"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Stop"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Limit"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "PL"
            t2.Columns.Add(newCell)


            newCell = New Data.DataColumn()
            newCell.ColumnName = "GrossPL"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "OpenTime"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "ClosedTime"
            t2.Columns.Add(newCell)

            newCell = New Data.DataColumn()
            newCell.ColumnName = "Profit"
            t2.Columns.Add(newCell)



            Dim wprxStock As New WebProxy("cid-isa-1.customs.gov.lb:8080", True)


            wprxStock.Credentials = CredentialCache.DefaultCredentials
            dd.Proxy = wprxStock



            For Each oRow In oClosedTradesTable.Rows

                newrow = t2.NewRow()

                newrow("TradeID") = oRow.TradeID
                newrow("Instrument") = oRow.Instrument
                newrow("Amount") = oRow.AmountK
                newrow("S/B") = oRow.BS
                newrow("Open") = oRow.Open
                newrow("Close") = oRow.Close
                newrow("OpenTime") = oRow.OpenTime
                newrow("ClosedTime") = oRow.CloseTime

                newrow("PL") = oRow.PL
                newrow("GrossPL") = oRow.GrossPL

                newrow("Profit") = oRow.PL

                dd.SetClosedTrades(oRow.TradeID, oRow.CloseTime, oRow.PL, oRow.Instrument)
                'dd.SetClosedTrades(t2)
                Localdd.SetClosedTrades(oRow.TradeID, oRow.CloseTime, oRow.PL, oRow.Instrument)


                t2.Rows.Add(newrow)

            Next

            data.Tables.Clear()

            data.Tables.Add(t2)
            GridView2.DataSource = data

            GridView2.DataBind()
            GridView2.Visible = True

            dd.SetOpenTrades(t1)
            Localdd.SetOpenTrades(t1)

            'dd.DisposeConnection()

        Catch ex As Exception

            'dd.DisposeConnection()
            Timer1.Enabled = True
            Timer1.StartTimer()

        End Try


    End Sub


    Protected Sub DD()

        Dim lbl As LinkButton = GridView1.Rows(1).Cells(1).FindControl("LinkClose")
        lbl.Text = "Closing"
        GridView1.UpdateAfterCallBack = True
        'GridView1.DataBind()

    End Sub


    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand

        Dim ss As String


        If (e.CommandName = "Select") Then



            Dim selectRow As GridViewRow = GridView1.SelectedRow


            Dim row As GridViewRow
            row = ((e.CommandSource).NamingContainer)

            ss = row.RowIndex


            Dim lbl As Button = GridView1.Rows(ss).Cells(1).FindControl("deleteButton")
            lbl.Text = "Closing"
            lbl.Enabled = False
            lbl.ForeColor = Color.Red


            GridView1.UpdateAfterCallBack = True

            str1 = GridView1.Rows(ss).Cells(1).Text
            str2 = GridView1.Rows(ss).Cells(4).Text
            str3 = GridView1.Rows(ss).Cells(2).Text


            Dim EUR As System.Threading.Thread = New Threading.Thread(AddressOf CloseThread)
            EUR.Start()

        End If
    End Sub

    Protected Sub CloseThread()

        CloseTrade(str1, str2, str3)

        Synchronize()

    End Sub




    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating


        GridView1.Rows(1).Cells(1).Text = "Closing"
        GridView1.Rows(1).Cells(1).CssClass = "RedTextBold"

        GridView1.UpdateAfterCallBack = True
        GridView1.PostCallBackFunction = "RefreshMap"
        GridView1.DataBind()


    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        'LoginCompleted = False

    End Sub



    Protected Sub deleteAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles deleteAll.Click

        Try


            deleteAll.Text = "Closing"
            deleteAll.Enabled = False

            deleteAll.UpdateAfterCallBack = True


            Dim oRow As Object
            Dim opExec As New cs_Operation

            oTradesTable = DeskBack.FindMainTable("Trades")
            For Each oRow In oTradesTable.Rows
                CloseTrade(oRow.TradeID, oRow.BS, oRow.Instrument)
            Next

            deleteAll.Text = "Close All Opened Positions"
            deleteAll.Enabled = True
            deleteAll.UpdateAfterCallBack = True


        Catch ex As Exception
            deleteAll.Text = "Close All Opened Positions"
            deleteAll.Enabled = True
            deleteAll.UpdateAfterCallBack = True

        End Try

    End Sub



    Protected Sub btnEurBuy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEurBuy.Click


        txtEurLimit.Visible = True
        txtEurSL.Visible = True
        btnSetEur.Visible = True
        btnSetEur.Enabled = True

        txtEurLimit.UpdateAfterCallBack = True
        txtEurSL.UpdateAfterCallBack = True
        btnSetEur.UpdateAfterCallBack = True

        pn.UpdateAfterCallBack = True
        pn.DataBind()

        Dim oRow As Object
        oRow = DeskBack.FindRowInTable("Offers", "Instrument", "EUR/USD")


        txtEurSL.Text = (Math.Round(oRow.Bid, 4) * 10000 - 15) / 10000
        txtEurLimit.Text = (Math.Round(oRow.Bid, 4) * 10000 + 10) / 10000

        OrderStat = "EurBuy"

    End Sub

    Protected Sub btnEurSell_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEurSell.Click
        txtEurLimit.Visible = True
        txtEurSL.Visible = True
        btnSetEur.Visible = True
        btnSetEur.Enabled = True

        txtEurLimit.UpdateAfterCallBack = True
        txtEurSL.UpdateAfterCallBack = True
        btnSetEur.UpdateAfterCallBack = True

        pn.UpdateAfterCallBack = True
        pn.DataBind()

        Dim oRow As Object
        oRow = DeskBack.FindRowInTable("Offers", "Instrument", "EUR/USD")


        txtEurSL.Text = (Math.Round(oRow.Ask, 4) * 10000 + 5) / 10000
        txtEurLimit.Text = (Math.Round(oRow.Ask, 4) * 10000 - 5) / 10000


        OrderStat = "EurSell"

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGBPBuy.Click
        txtGBPLimit.Visible = True
        txtGBPSL.Visible = True
        btnSetGBP.Visible = True
        btnSetGBP.Enabled = True

        txtGBPLimit.UpdateAfterCallBack = True
        txtGBPSL.UpdateAfterCallBack = True
        btnSetGBP.UpdateAfterCallBack = True

        pn.UpdateAfterCallBack = True
        pn.DataBind()

        Dim oRow As Object
        oRow = DeskBack.FindRowInTable("Offers", "Instrument", "GBP/USD")


        txtGBPSL.Text = (Math.Round(oRow.Bid, 4) * 10000 + 5) / 10000
        txtGBPLimit.Text = (Math.Round(oRow.Bid, 4) * 10000 - 5) / 10000

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGBPSell.Click
        txtGBPLimit.Visible = True
        txtGBPSL.Visible = True
        btnSetGBP.Visible = True
        btnSetGBP.Enabled = True

        txtGBPLimit.UpdateAfterCallBack = True
        txtGBPSL.UpdateAfterCallBack = True
        btnSetGBP.UpdateAfterCallBack = True

        pn.UpdateAfterCallBack = True
        pn.DataBind()

        Dim oRow As Object
        oRow = DeskBack.FindRowInTable("Offers", "Instrument", "GBP/USD")


        txtGBPSL.Text = (Math.Round(oRow.Ask, 4) * 10000 + 15) / 10000
        txtGBPLimit.Text = (Math.Round(oRow.Ask, 4) * 10000 - 10) / 10000

    End Sub



    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        txtCADLimit.Visible = True
        txtCADSL.Visible = True
        btnSetCAD.Visible = True
    End Sub


    Protected Sub btnSetEur_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSetEur.Click

        btnSetEur.Enabled = False
        btnSetEur.UpdateAfterCallBack = True


        If (txtEurSL.Text < txtEurLimit.Text) Then
            If (OpenTrade("Long", txtEurSL.Text, txtEurLimit.Text, "EUR/USD", min_amount, (txtEurSL.Text * 10000 + 10) / 10000, trade, di) = False) Then
                Response.Write("Failed to create a EURUSD trade")
            Else
                OrderStat = ""
                txtEurSL.Visible = False
                txtEurLimit.Visible = False
                btnSetEur.Visible = False

                txtEurSL.UpdateAfterCallBack = True
                txtEurLimit.UpdateAfterCallBack = True
                btnSetEur.UpdateAfterCallBack = True

                pn.UpdateAfterCallBack = True
                pn.DataBind()
            End If
        End If

        If (txtEurSL.Text > txtEurLimit.Text) Then
            If (OpenTrade("Short", txtEurSL.Text, txtEurLimit.Text, "EUR/USD", min_amount, (txtEurSL.Text * 10000 + 10) / 10000, trade, di) = False) Then
                Response.Write("Failed to create a EURUSD trade")
            Else
                OrderStat = "EurSell"
            End If
        End If


        OrderStat = ""

    End Sub



    Public Function GetAuto() As Boolean

        Dim strMarquee As String = ""

        Dim opExec As New cs_Operation
        Dim reader As OleDbDataReader = opExec.rdGetReader("select * from AccountInfo where userID = '" & txtUserName.Text & "' ")
        Try

            If reader.HasRows = True Then

                reader.Read()

                Return reader("AutoTrading")

            End If
            Return "true"

        Catch ex As Exception

        Finally
            opExec.closeConnection()
            reader.Close()
        End Try

    End Function

    Protected Sub Auto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Auto.Click


        Try


            If (DeskBack.IsLoggedIn) Then


                If Auto.Text = "Auto Trading is ON" Then
                    Auto.Text = "Auto Trading is OFF"
                    Auto.BackColor = Color.Maroon
                    Auto.UpdateAfterCallBack = True
                    Auto.DataBind()
                ElseIf Auto.Text = "Auto Trading is OFF" Then
                    Auto.Text = "Auto Trading is ON"
                    Auto.BackColor = Color.Green
                    Auto.UpdateAfterCallBack = True
                    Auto.DataBind()
                End If


                If (Auto.BackColor = Color.Green) Then
                    Dim opExec As New cs_Operation
                    opExec.ExecuteSql("update AccountInfo set AutoTrading = 'true' where UserID = '" & txtUserName.Text & "' ")
                    opExec.closeConnection()
                End If
                If (Auto.BackColor = Color.Maroon) Then
                    Dim opExec As New cs_Operation
                    opExec.ExecuteSql("update AccountInfo set AutoTrading = 'false' where UserID = '" & txtUserName.Text & "' ")
                    opExec.closeConnection()
                End If

            End If

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub cmdLogin0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogin0.Click
        Dim oRow As Object
        Dim acct As Double
        Dim strReportURL As String

        Try


            oRow = DeskBack.FindRowInTable("accounts", "AccountName", cmbAccount.Text)
            acct = oRow.AccountID
            strReportURL = DeskBack.GetReportURL(CLng(acct), Request("txtFrom"), Request("txtTo"), "HTML", "", 0)

            'System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "OpenWindow", strReportURL, True)
            'ClientScript.RegisterStartupScript("PopupScript", strReportURL)

            'cmdLogin0.Attributes.Add("onClick", "javascript:" + strReportURL)

            Response.Write("<script language=javascript>")
            Response.Write("window.open ('" & strReportURL & "', 'CustomPopUp', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width='+(screen.width-20)+', height='+(screen.height-80)+', top=5, left=5');")
            'Response.Write("return false;")
            Response.Write("</script>")

            ' cmdLogin0.UpdateAfterCallBack = True

            'Response.Redirect(strReportURL)
        Catch ex As Exception

            Response.Write("<script language=javascript>")
            Response.Write("alert('You have to login first');")
            Response.Write("</script>")

        End Try

    End Sub



    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Calendar1.Visible = True
        Calendar1.UpdateAfterCallBack = True

    End Sub

    Protected Sub Button2_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Calendar2.Visible = True
        Calendar2.UpdateAfterCallBack = True

    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Calendar1.Visible = False
        Calendar1.UpdateAfterCallBack = True
        txtFrom.Text = Calendar1.SelectedDate
        txtFrom.UpdateAfterCallBack = True

    End Sub

    Protected Sub Calendar2_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar2.SelectionChanged
        Calendar2.Visible = False
        Calendar2.UpdateAfterCallBack = True
        txtTo.Text = Calendar2.SelectedDate
        txtTo.UpdateAfterCallBack = True

    End Sub


    Protected Sub btnStop_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStop.Click
        Dim opExec As New cs_Operation

        If (btnStop.Text = "STOP") Then
            opExec.ExecuteSql("update host set EUR = 'START'")
            btnStop.Text = "START"

        ElseIf (btnStop.Text = "START") Then
            opExec.ExecuteSql("update host set EUR = 'STOP'")
            btnStop.Text = "STOP"
        End If

        opExec.closeConnection()
    End Sub

    Protected Sub btnGBP_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGBP.Click
        Dim opExec As New cs_Operation

        If (btnGBP.Text = "STOP") Then
            opExec.ExecuteSql("update host set GBP = 'START'")
            btnStop.Text = "START"

        ElseIf (btnGBP.Text = "START") Then
            opExec.ExecuteSql("update host set GBP = 'STOP'")
            btnStop.Text = "STOP"
        End If

        opExec.closeConnection()
    End Sub

    Protected Sub btnJpy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJpy.Click
        Dim opExec As New cs_Operation

        If (btnJpy.Text = "STOP") Then
            opExec.ExecuteSql("update host set JPY = 'START'")
            btnJpy.Text = "START"

        ElseIf (btnJpy.Text = "START") Then
            opExec.ExecuteSql("update host set JPY = 'STOP'")
            btnJpy.Text = "STOP"
        End If

        opExec.closeConnection()
    End Sub

    Protected Sub btnJPYSell_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJPYSell.Click
        txtJPYLimit.Visible = True
        txtJPYSL.Visible = True
        btnSetJPY.Visible = True
        btnSetJPY.Enabled = True

        txtJPYLimit.UpdateAfterCallBack = True
        txtJPYSL.UpdateAfterCallBack = True
        btnSetJPY.UpdateAfterCallBack = True

        pn.UpdateAfterCallBack = True
        pn.DataBind()

        Dim oRow As Object
        oRow = DeskBack.FindRowInTable("Offers", "Instrument", "USD/JPY")


        txtJPYSL.Text = (Math.Round(oRow.Ask, 4) * 10000 + 15) / 10000
        txtJPYLimit.Text = (Math.Round(oRow.Ask, 4) * 10000 - 10) / 10000
    End Sub

    Protected Sub btnJPYBuy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJPYBuy.Click
        txtJPYLimit.Visible = True
        txtJPYSL.Visible = True
        btnSetJPY.Visible = True
        btnSetJPY.Enabled = True

        txtJPYLimit.UpdateAfterCallBack = True
        txtJPYSL.UpdateAfterCallBack = True
        btnSetJPY.UpdateAfterCallBack = True

        pn.UpdateAfterCallBack = True
        pn.DataBind()

        Dim oRow As Object
        oRow = DeskBack.FindRowInTable("Offers", "Instrument", "USD/JPY")


        txtJPYSL.Text = (Math.Round(oRow.Bid, 4) * 10000 + 5) / 10000
        txtJPYLimit.Text = (Math.Round(oRow.Bid, 4) * 10000 - 5) / 10000
    End Sub


    Protected Sub cmdSync_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdSync.Click
        TriggerTrading()
    End Sub

    
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click


        Dim key As String = "Opener"

        If (num = 0) Then
            OpenNewWindow(Me, "https://www.zulutrade.com/trader/192668", key + num.ToString())
            num = num + 1
        End If
        If (num = 1) Then
            OpenNewWindow(Me, "https://www.zulutrade.com/trader/151784", key + num.ToString())
            num = num + 1
        End If
        If (num = 2) Then
            OpenNewWindow(Me, "https://www.zulutrade.com/trader/207637", key + num.ToString())
            num = num + 1
        End If
        If (num = 3) Then
            OpenNewWindow(Me, "https://www.zulutrade.com/trader/264822", key + num.ToString())
            num = num + 1
        End If
        If (num = 4) Then
            OpenNewWindow(Me, "https://www.zulutrade.com/trader/153125", key + num.ToString())
            num = num + 1
        End If

        num = 0


        ' Page.ClientScript.RegisterStartupScript(Me.GetType(), "OpenWindow", "window.open('https://www.zulutrade.com/trader/192668'','_newtab');", True)
        ' Page.ClientScript.RegisterStartupScript(Me.GetType(), "OpenWindow", "window.open('https://www.zulutrade.com/trader/151784','_newtab');", True)
        ' Page.ClientScript.RegisterStartupScript(Me.GetType(), "OpenWindow", "window.open('https://www.zulutrade.com/trader/207637','_newtab');", True)
        ' Page.ClientScript.RegisterStartupScript(Me.GetType(), "OpenWindow", "window.open('https://www.zulutrade.com/trader/264822','_newtab');", True)
        ' Page.ClientScript.RegisterStartupScript(Me.GetType(), "OpenWindow", "window.open('https://www.zulutrade.com/trader/153125','_newtab');", True)
    End Sub


    Protected Sub OpenNewWindow(ByVal page As System.Web.UI.Page, ByVal fullUrl As String, ByVal key As String)
        Dim script As String = "window.open('" + fullUrl + "', '" + key + "', 'status=1,location=1,menubar=1,resizable=1,toolbar=1,scrollbars=1,titlebar=1');"
        page.ClientScript.RegisterClientScriptBlock(page.GetType(), key, script, True)
    End Sub

      



End Class
