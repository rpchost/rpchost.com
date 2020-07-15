<!-- #include file="HexGadgets.inc.vbs.asp" -->
<!-- #include file="HexDns.inc.vbs.asp" -->
<!-- #include file="HexTcpQuery.inc.vbs.asp" -->
<!-- #include file="Whois.inc.vbs.asp" -->
<!-- #include file="UtilityVars.inc.vbs.asp" -->
<%
'// Domain Check engine
'// version 2006-07-17
'// 
'// Checks the availability of any domain name
'// under any TLD.
'//
'// Use with Utility.inc.vbs.asp
'//
'// Inputs:
'//
'// HexGadgets (components) required:
'//   - HexDns
'//   - HexTcpQuery (for Whois.inc.vbs.asp)
'// Info: http://www.HexGadgets.com/
'// Download: http://www.hexillion.com/download/HexGadgets.exe
'//
'// Other dependencies:
'//   - HexGadgets.inc.vbs.asp
'//   - HexDns.inc.vbs.asp
'//   - Whois.inc.vbs.asp
'//   - UtilityVars.inc.vbs.asp
'//   - VBScript 5.0 or later
'//     Get the latest at http://msdn.microsoft.com/scripting/
'//
'// History:
'// 2006-07-17  Switched back to using standard (local) DNS servers
'// 2003-09-01  Fixed: Whois server response wasn't HTML-encoded
'// 2003-04-15  Added DNS test and combined conclusion
'// 2001-05-06  Created (rewrite of original AspCheckDomain)
'//
'// Copyright 2001-2006 Hexillion Technologies. All rights reserved.
'// 
'// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
'// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
'// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND/OR
'// FITNESS FOR A PARTICULAR PURPOSE.

class DomainCheck

	property Get Name()
		Name = "Domain Check"
	end property
	
	property Get Desc()
		Desc = "See if a domain is available"
	end property
	
	property Get ViewSourceURL()
		ViewSourceURL = "http://www.hexillion.com/samples/view_src.asp?name=DomainCheck.inc.vbs.asp"
	end property
	
	property Get DownloadSourceURL()
		DownloadSourceURL = "http://www.hexillion.com/samples/#DomainCheck"
	end property
	
	private m_oDns       '// HexDns.Connection object
	private m_oLkup      '// HexDns.Lookup object
	private m_oWhois     '// Whois object
	private m_lDnsErr    '// HexDns license error
	private m_lTcpqErr   '// HexTcpQuery license error
	
	private m_sDomain    '// Domain to check
	private m_lAddr      '// IP addr derived from input addr
	private m_sTLD       '// TLD from domain
	private m_sRoot      '// Section of domain for use in queries
	
	Private Sub Class_Initialize()
		'// Create objects
		set m_oDns = Server.CreateObject( "HexDns.Connection" )
		set m_oLkup = Server.CreateObject( "HexDns.Lookup" )
		set m_oWhois = new Whois
		
		'// Save license error codes
		m_lDnsErr = m_oDns.Error
		m_lTcpqErr = m_oWhois.Error
						
		'// Leave other members uninitialized
		'// to indicate input has not been processed

		'// Initialize display strings
		HexDnsInit		
	end sub


	Private Sub Class_Terminate()
		set m_oWhois = nothing
		set m_oLkup = nothing
		set m_oDns = nothing
	end sub


	Sub WriteForm()
		'// Check for form input, set defaults
		m_sDomain = GetVar( m_sDomain, "domain",  c_varDomain,        null )
		m_sDomain = GetVar( m_sDomain, c_varNone, c_varDerivedDomain, "internet.co.uk" )

		WriteLn "<form method=""POST"" action=""" & request( "SCRIPT_NAME" ) & """>"
		WriteLn "<table cellpadding=""5"" cellspacing=""0"" border=""0"">"
		WriteLn "	<tr>"
		WriteLn "		<td>www.</td>"
		WriteLn "		<td class=""bugfix""><input type=""text"" name=""domain"" size=""25"" value=""" & server.HTMLEncode( m_sDomain ) & """></td>"
		WriteLn "		<td><input border=""0"" src=""btn_go.gif"" name=""go"" type=""image"" width=""35"" height=""21"" align=""absmiddle""></td>"
		WriteLn "	</tr>"
		WriteLn "</table>"
		WriteLn "</form>"
	end sub
	
	
	sub WriteOutput()
		if "" <> request( "domain" ) then DoCheckDomain
		
		'// Main work is put off in separate routine
		'// so "exit sub" statements won't skip the following
		WriteLicenseWarning "HexTcpQuery",   m_oWhois.TcpQueryObj, m_lTcpqErr
		WriteLicenseWarning "HexDns",        m_oDns,  m_lDnsErr
	end sub
	
	'// Use this method to check domains from your own code.
	'// It returns a DomainCheckResult object (defined below).
	function Check( sDomain )
		'// Condition input
		'// May want to check for "http://" or "www" here
		sDomain = trim( sDomain )
		
		dim iWhoisResult, iDnsResult, iConclusion, sComment
		
		'// Use dictionaries for function outputs
		dim WhoisOut, DnsOut
		set WhoisOut = server.CreateObject( "Scripting.Dictionary" )
		set DnsOut = server.CreateObject( "Scripting.Dictionary" )

		'// Do tests
		iDnsResult = DoDnsTest( sDomain, DnsOut )
		iWhoisResult = DoWhoisTest( sDomain, WhoisOut )
		
		if resultTaken = iDnsResult or resultTaken = iWhoisResult then
			iConclusion = resultTaken
			sComment = "The domain has been registered. However, the registrant may offer it for sale."
			
		elseif resultAvailable = iWhoisResult or resultAvailable = iDnsResult then
			iConclusion = resultAvailable
			sComment = "The domain appears to be available for registration.<p>It's possible you won't be able to register the domain because it is:</p>" & _
			           "<ul>" & _
			           "<li>Disallowed for some reason (too short, too long, invalid characters, etc.)</li>" & vbcrlf & _
			           "<li>In the middle of the registration process</li>" & vbcrlf & _
			           "<li>Already registered but ""on hold"" for non-payment</li>" & vbcrlf & _
			           "<li>Already registered but not listed or used</li>" & vbcrlf & _
			           "<li>Already registered but not visible due to DNS misconfiguration</li>" & vbcrlf & _
			           "</ul><p>You will need to check with your domain registrar for the final word.</p>"
					
		else
			iConclusion = resultInconclusive
			sComment = "Could not determine the domain's status."
		end if
		
		'// Build result object
		dim result
		set result = new DomainCheckResult
		result.DnsResult = iDnsResult
		result.DnsComment = DnsOut( "sComment" )
		result.WhoisResult = iWhoisResult
		result.WhoisComment = WhoisOut( "sComment" )
		result.WhoisText = WhoisOut( "sWhoisText" )
		result.ConclusionResult = iConclusion
		result.ConclusionComment = sComment
		
		set Check = result
	end function
	
	
	private sub DoCheckDomain
	
		'// Condition input
		'// May want to check for "http://" or "www" here
		m_sDomain = trim( m_sDomain )
		
	    '// Set cookie
	    InitCookieVars
		SetVar c_varDomain, m_sDomain
		
		'// Tell user we're working on it		
		Response.Write "<p>Checking domain availability...</p>"
		Response.Flush
		
		'// Do the tests
		dim oResult
		set oResult = Check( m_sDomain )
				
		'// Print results
		Response.Write "<h3>Results</h3>"
		Response.Write "<table cellpadding=""5"" cellspacing=""0"" border=""0"">"
		Response.Write "<tr><td align=""right"" valign=""top"">from DNS:</td><td>"
		select case oResult.DnsResult
			case resultInconclusive
				Response.Write "<b>Inconclusive</b>. "
				Response.Write oResult.DnsComment
			case resultAvailable
				Response.Write "<b>Available</b>. "
			case resultTaken
				Response.Write "<b>Taken</b>. "
		end select
		Response.Write "</td></tr>"
		Response.Write "<tr><td align=""right"" valign=""top"">from Whois:</td><td>"
		select case oResult.WhoisResult
			case resultInconclusive
				Response.Write "<b>Inconclusive</b>. "
				Response.Write oResult.WhoisComment
			case resultAvailable
				Response.Write "<b>Available</b>. "
			case resultTaken
				Response.Write "<b>Taken</b>. "
		end select
		Response.Write "</td></tr>"
		Response.Write "</td></tr>"
		Response.Write "<tr><td align=""right"" valign=""top"">conclusion:</td><td>"
		select case oResult.ConclusionResult
			case resultInconclusive
				Response.Write "<b>Inconclusive</b>. "
			case resultAvailable
				Response.Write "<b><font color=""green"">Available</font></b>. "
			case resultTaken
				Response.Write "<b><font color=""red"">Taken</font></b>. "
		end select
		Response.Write oResult.ConclusionComment
		
		'// If there might be a web site...
		if resultTaken = oResult.ConclusionResult and resultAvailable <> oResult.DnsResult then
			'// Provide a link
			'Response.Write "<br>Web site: <a href=""http://www." & m_sDomain & """>www</a>.<a href=""http://" & m_sDomain & """>" & m_sDomain & "</a>"
			Response.Write "<p>Web site: <a href=""http://www." & m_sDomain & "/"">http://www." & m_sDomain & "/</a></p>"
		end if
		
		Response.Write "</td></tr>"
		Response.Write "</table>"
		
		'// If there's Whois output...
		if len( oResult.WhoisText ) then
			'// Display it
			Response.Write "<h3>Whois output</h3><pre>"
			Response.Write Server.HTMLEncode( oResult.WhoisText ) & "</pre>"
		end if	
	end sub


	private function DoWhoisTest( sDomain, WhoisOut )
		WhoisOut( "sWhoisText" ) = ""
		WhoisOut( "lError" ) = 0
		WhoisOut( "sComment" ) = ""
		WhoisOut( "sRegistrarServer" ) = ""
		WhoisOut( "sWhoisServer" ) = ""
		
		'// Find the Whois server for the domain
		dim sServer
		sServer = m_oWhois.GetServer( sDomain )
		if 0 = len( sServer ) then
			DoWhoisTest = resultInconclusive
			WhoisOut( "lError" ) = m_oWhois.Error
			WhoisOut( "sComment" ) = m_oWhois.ErrorString
			exit function
		end if
		WhoisOut( "sWhoisServer" ) = sServer
		
		'// Get the IP address for the server
		dim lAddr
		lAddr = m_oLkup.LookUp( sServer )
		
		'// If no IP addr...
		if 0 = lAddr then
			DoWhoisTest = resultInconclusive
			WhoisOut( "lError" ) = m_oLkup.Error
			WhoisOut( "sComment" ) = "DNS lookup for <span class=""ipaddr"">" & _
			           Server.HTMLEncode( sServer ) & _
			           "</span> failed: <b>" & _
			           GetDnsErrorString( m_oLkup.Error ) & "</b>"
			exit function
		end if
		
		'// Build query string
		dim bInternic, sQuery, sResponse
		sQuery = sDomain
		bInternic = m_oWhois.IsInternicDom( sDomain )
		if bInternic then sQuery = "dom " & sQuery
		
		'// Query the server
		sResponse = m_oWhois.Query( lAddr, sQuery )
		WhoisOut( "sWhoisText" ) = sResponse
		
		'// Try to interpret the result
		'// If it's an InterNIC domain...
		if bInternic then
			
			'// Interpretation is straightforward
			if instr( 1, sResponse, "Whois Server:" ) then
				DoWhoisTest = resultTaken
				WhoisOut( "sComment" ) = "The domain has definitely been registered. " & _
				                "However, the registrant may be offering it for sale."
				
			elseif instr( 1, sResponse, "No match" ) then
				DoWhoisTest = resultAvailable
				
			else
				DoWhoisTest = resultInconclusive
				if m_oWhois.Error then
					WhoisOut( "lError" ) = m_oWhois.Error
					WhoisOut( "sComment" ) = m_oWhois.ErrorString
				else
					WhoisOut( "sComment" ) = "Could not interpret Whois results. Consult the DNS results or look for Whois output below."
				end if
			end if
			
		else
			'// Non-Internic domains are harder because the whois
			'// output varies all over the map. We'll just have
			'// to make some educated guesses.
			dim aNegPhrases, aPosPhrases
			aNegPhrases = Array( _
			                     "no match", _
			                     "no entries", _
			                     "not found", _
			                     "no data", _
			                     "no such domain", _
			                     "not a registered", _
			                     "no encontr", _
			                     "do not have an entry", _
			                     "no entry", _
			                     "no relevent", _
			                     "no existe", _
			                     "nomatch", _
			                     "220 Available", _
			                     "no information" _
			                   )
			                     
			aPosPhrases = Array( _
			                     "Organization:", _
			                     "Name server:", _
			                     "Name servers listed", _
			                     "nserver", _
			                     "record last updated", _
			                     "Registrant:", _
			                     "[Registrant]", _
			                     "registrant_contact", _
			                     "admin-c", _
			                     "tech-c", _
			                     "domainname.name:", _
			                     "Technical Contact", _
			                     "Contacto Tecnico", _
			                     "Creation Date:", _
			                     "Domain information" _
			                   )
			
			
			if PhraseMatch( sResponse, aPosPhrases ) then
				DoWhoisTest = resultTaken
				WhoisOut( "sComment" ) = "The domain is taken"
			
			elseif PhraseMatch( sResponse, aNegPhrases ) then
				DoWhoisTest = resultAvailable
				
			else
				DoWhoisTest = resultInconclusive
				if m_oWhois.Error then
					WhoisOut( "lError" ) = m_oWhois.Error
					WhoisOut( "sComment" ) = "Whois query failed: <b>" & m_oWhois.ErrorString & "</b>"
				else
					WhoisOut( "sComment" ) = "Could not interpret the Whois output. Consult the DNS results or look for the Whois output below."
				end if
			end if
			
		end if
		
	end function


	'// Find one of an array of phrases in a string
	private function PhraseMatch( s, aPhrases )
		PhraseMatch = false
		dim sPhrase
		for each sPhrase in aPhrases
			if instr( 1, s, sPhrase, vbTextCompare ) then
				PhraseMatch = true
				exit for
			end if
		next
	end function


	private function DoDnsTest( sDomain, DnsOut )
		DnsOut( "lError" ) = 0
		DnsOut( "sComment" ) = ""

		'// Check for default server
		if 0 = m_oDns.RemoteAddr then
			DoDnsTest = resultInconclusive
			DnsOut( "sComment" ) = "Could not perform DNS test because HexDns " & _
			                        "does not have a DNS server address. " & _
			                        "You can specify DNS servers in " & _
			                        "the Windows TCP/IP properties or set the " & _
			                        "HexDns Connection.RemoteAddr property " & _
			                        "directly."
			exit function
		end if
		
		dim aServers, sServer, oResponse
		
		'// Uncomment this to use some DNS servers
		'// that recognize "alternative" TLDs in addition
		'// to the standard TLDs.
'		aServers = Array( m_oLkup.StringToAddr( "192.147.236.1" ),  _
'		                  m_oLkup.StringToAddr( "204.80.125.130" ), _
'		                  m_oLkup.StringToAddr( "199.166.31.3" ) )

		set aServers = m_oDns.ServerAddrs

		'// Tune down the timeout a bit	                 
		m_oDns.Timeout = 4000

		'// Loop through the servers		                 
		for each sServer in aServers
	
			'// Set current server address
			m_oDns.RemoteAddr = sServer
	
			'// Query for records
			Set oResponse = m_oDns.Query( sDomain, hexDnsTypeNS  )
			
			'// If there was a communication error...
			if hexDnsErrSuccess <> m_oDns.Error then
				'// Do nothing
				'// Fall through and try next server
			
			'// Else if there was an error from the server...
			elseif hexDnsMsgRcodeSuccess <> oResponse.ResponseCode then
			
				'// If it was a domain-not-found error...
				if hexDnsMsgRcodeNameError = oResponse.ResponseCode then
					'// The domain is available
					DoDnsTest = resultAvailable
					
				else
					'// Something else went wrong
					DnsOut( "sComment" ) = "DNS server returned an error: <b>" & GetMsgRcodeString( oResponse.ResponseCode ) & "</b>"
					DoDnsTest = resultInconclusive
					
				end if
				
				'// We're finished
				exit for
				
			else
				'// No errors, so domain was found
				
				'// Did we receive any nameservers?
				'// Scan answer records
				dim lIndex, oRec, bFound
				lIndex = oResponse.AnswerRecords.Count
				do while lIndex > 0
					if hexDnsTypeNS = oResponse.AnswerRecords( lIndex ).Type then
						bFound = true
						exit do
					end if
					lIndex = lIndex - 1
				loop

				if not bFound then
					'// Scan authority records
					lIndex = oResponse.AuthRecords.Count
					do while lIndex > 0
						if hexDnsTypeNS = oResponse.AuthRecords( lIndex ).Type then
							bFound = true
							exit do
						end if
						lIndex = lIndex - 1
					loop
				end if
				
				'// If we didn't get any nameservers...
				if not bFound then
					
					'// The domain must be available
					'// We probably didn't get a domain-not-found error because
					'// the TLD nameserver has a wildcard A record that points
					'// to the registration web site.
					DoDnsTest = resultAvailable
					
				else
					'// The domain is taken
					DoDnsTest = resultTaken
				end if
							
				'// We're finished		
				exit for

			end if
		next
	
		'// If we've finished looping through the servers
		'// and still have an error...
		if hexDnsErrSuccess <> m_oDns.Error then
			DnsOut( "sComment" ) = "DNS query failed: <b>" & GetDnsErrorString( m_oDns.Error ) & "</b>"
			DnsOut( "lError" ) = m_oDns.Error
			DoDnsTest = resultInconclusive
		end if

	end function

	private sub WriteLn( s )
		Response.Write s & vbcrlf
	end sub

end class


'// Result codes
const resultInconclusive = 0
const resultAvailable = 1
const resultTaken = 2

'// Class for holding results. Used as return value of DomainCheck.Check
class DomainCheckResult

	private m_iDnsResult            '// Result code from DNS check
	private m_sDnsComment           '// Comment from DNS check
	private m_iWhoisResult          '// Result code from Whois check
	private m_sWhoisComment         '// Comment from Whois check
	private m_sWhoisText            '// Raw output (if any) from Whois server
	private m_iConclusionResult     '// Final conclusion drawn from DNS and Whois checks
	private m_sConclusionComment    '// Final conclusion comment
	
	public property Get DnsResult()
		DnsResult = m_iDnsResult
	end property
	
	public property Let DnsResult( value )
		m_iDnsResult = value
	end property
	
	public property Get DnsComment()
		DnsComment = m_sDnsComment
	end property
	
	public property Let DnsComment( value )
		m_sDnsComment = value
	end property
	
	public property Get WhoisResult()
		WhoisResult = m_iWhoisResult
	end property
	
	public property Let WhoisResult( value )
		m_iWhoisResult = value
	end property
	
	public property Get WhoisComment()
		WhoisComment = m_sWhoisComment
	end property
	
	public property Let WhoisComment( value )
		m_sWhoisComment = value
	end property
	
	public property Get WhoisText()
		WhoisText = m_sWhoisText
	end property
	
	public property Let WhoisText( value )
		m_sWhoisText = value
	end property
	
	public property Get ConclusionResult()
		ConclusionResult = m_iConclusionResult
	end property
	
	public property Let ConclusionResult( value )
		m_iConclusionResult = value
	end property
	
	public property Get ConclusionComment()
		ConclusionComment = m_sConclusionComment
	end property
	
	public property Let ConclusionComment( value )
		m_sConclusionComment = value
	end property
	
end class
%>