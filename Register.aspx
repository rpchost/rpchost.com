<%@ Page Language="vb" AutoEventWireup="false" Inherits="Register" CodeFile="Register.aspx.vb" %>
<%@ register tagprefix="uc1" tagname="right" src="headers/rightheader.ascx"%>
<%@ register tagprefix="uc2" tagname="right" src="headers/upperheader.ascx"%>
<%@ register tagprefix="uc4" tagname="right" src="headers/headerbutton.ascx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
	
	<link rel="icon" 
      type="image/png" 
      href="favicon.ico"/>
      
		<title>Cryptocurrency trading | Buy and Sell Bitcoin | Online forex trading</title>
   		
		<META NAME="AREA" CONTENT="Forex Finance">
		<META HTTP-EQUIV="AUDIENCE" CONTENT="General">
		<META NAME="SUBJECT" CONTENT="Forex Signals, forecasts and analysis">
		<META NAME="PLACENAME" CONTENT="Forex Traders Heaven">
		<META NAME="CREATOR" CONTENT="Rpchost.com">
		<META HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="COPYRIGHT" CONTENT="Rpchost.com">
		<META NAME="DESCRIPTION" CONTENT="The best cryptocurrency trading online, Buy and Sell your Bitcoin in a fast, secure and easy way">
		<META NAME="KEYWORDS" CONTENT="Buy, Cryptocurrency, Bitcoin">
		<META NAME="ABSTRACT" CONTENT="The best cryptocurrency trading online, Buy and Sell your Bitcoin in a fast, secure and easy way">
		<META name="robots" content="index, follow">
		<META NAME="AUTHOR" CONTENT="Rpchost.com">
		
		
		<script language="javascript" >

		    function ClientValidate(sender, args)     
    {
        if (args.Value == "0" || args.Value == "-1")
               args.IsValid=false;     
         else     
               args.IsValid=true;     
    }
    
    </script>
    
    
	    <style type="text/css">
            .style2
            {
                height: 31px;
                width: 50px;
            }
            .style3
            {
                height: 33px;
                width: 50px;
            }
            .style4
            {
                height: 30px;
                width: 50px;
            }
            .style6
            {
                height: 36px;
                width: 50px;
            }
            .style7
            {
                width: 50px;
            }
        </style>
	</HEAD>
	<body leftMargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE borderColor="#3366CC" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="0">
				<TR>
					<TD width="100%" colSpan="3">

					</TD>
				</TR>
				<TR>
					<TD colSpan="3"></TD>
				</TR>
				<TR>
					<TD vAlign="top" height="100%">
						<table cellSpacing="0" cellPadding="0" height="100%">
							<tr>
								<td>
									<uc1:right runat="server" id="RightHeader"></uc1:right>
								</td>
							</tr>
						</table>
					</TD>
					<TD vAlign="top" width="100%" height="100%">
						<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td vAlign="top">
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<TD align=left bgcolor="#3366cc">
												<uc4:right runat="server" id="headerbutton"></uc4:right>
											</TD>
										</TR>
										
										<TR><td height=1></td></tr>
										
										<TR>
														<td Width="100%" Class="inputtitletext" valign=middle Height="25">
																		<!-- Content goes here -->
																		 <asp:Label runat=server ID="lblBTC" CssClass="head00_8_5"></asp:Label>
																	
																	
																	</td>
													</TR>
													
									</TABLE>
								</td>
							</tr>
							<TR>
								<td height="2"></td>
							</TR>
							<tr>
								<td align="left" colSpan="4">
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" height="100%">
										<tr>
											<td>
												<!-- Content goes here -->
												<TABLE WIDTH="100%" BORDER="0" CELLSPACING="00" CELLPADDING="0">
													
													<tr>
																	<td class="head05" height=150 width="100%" colspan=3 align=center>
																	           
        																	          REGISTER </TD>
																	              
															                  </TD>
																</tr>
													
													<TR>
														<TD Width=180>&nbsp;
															<asp:label id="Label1" runat="server" CssClass="head09" >First name</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtFirst" Width="200px" CssClass="inputtext" Runat="server" MaxLength=50></asp:textbox></TD>
														<TD style="WIDTH: 5px; HEIGHT: 31px">
															<asp:RequiredFieldValidator id="RequiredFieldValidator1"  runat="server" ErrorMessage="*" ControlToValidate="txtFirst"></asp:RequiredFieldValidator></TD>
													</TR>
													<TR>
														<TD class="style2">&nbsp;
															<asp:label id="Label2" runat="server" CssClass="head09">Last name</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtLast" Width="200px" CssClass="inputtext" Runat="server" MaxLength=50> </asp:textbox></TD>
														<TD style="WIDTH: 5px; HEIGHT: 31px">
															<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" Width="7px" ErrorMessage="*" ControlToValidate="txtLast"></asp:RequiredFieldValidator></TD>
													</TR>
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="Label3" runat="server" CssClass="head09">Email</asp:label> </TD>
														<TD height=30>
															<asp:textbox id="txtEmail" Width="200px" CssClass="inputtext" Runat="server" MaxLength=50></asp:textbox>
															
															</TD>
														<TD style="WIDTH: 5px">
															<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" Width="7px" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
															<asp:CompareValidator id="CompareValidator2" runat="server" ControlToCompare="txtEmail" 
																Font-Names="Arial" ErrorMessage="Not Equivalent Emails" ControlToValidate="txtConfirmEmail" Width="157px"></asp:CompareValidator></TD>
													</TR>
													
													
													
													
													<TR>
													
														<TD class="style3">&nbsp;
															<asp:Label id="Label4" runat="server" CssClass="head09">Confirm Email</asp:Label></TD>
														<TD height=30>
															<asp:textbox id="txtConfirmEmail" Width="200px" CssClass="inputtext" Runat="server" MaxLength=50></asp:textbox></TD>
														<TD style="WIDTH: 5px; HEIGHT: 33px">
															<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" Width="7px" ControlToValidate="txtConfirmEmail"
																ErrorMessage="*"></asp:RequiredFieldValidator></TD>
													</TR>
													
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="Label6" runat="server" CssClass="head09">Mobile Phone</asp:label> </TD>
														<TD height=30>
																												
														<asp:dropdownlist id="ddlCountryCodes" autopostback=true Width="50" CssClass="inputtext" Runat="server"/>
														
														/
															
															<asp:textbox id="txtPhone" Width="138" CssClass="inputtext" Runat="server" MaxLength=50></asp:textbox>
															
															</TD>
														<TD style="WIDTH: 5px">
															<asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server" Width="7px" ErrorMessage="*" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
															</TD>
													</TR>
													
													<TR>
														<TD class="style4">&nbsp;
															<asp:Label id="Label5" runat="server" CssClass="head09">Country</asp:Label></TD>
														<TD height=30>
															
															
															<asp:dropdownlist id="ddlCountry" Width="200px" CssClass="inputtext" Runat="server">
																
																
									<asp:ListItem Value="-1" Selected="True">-- Select Country --</asp:ListItem>
										
<asp:ListItem value="Afghanistan">Afghanistan</asp:ListItem>
<asp:ListItem value="?land Islands">?land Islands</asp:ListItem>
<asp:ListItem value="Albania">Albania</asp:ListItem>
<asp:ListItem value="Algeria">Algeria</asp:ListItem>
<asp:ListItem value="American Samoa">American Samoa</asp:ListItem>
<asp:ListItem value="Andorra">Andorra</asp:ListItem>
<asp:ListItem value="Angola">Angola</asp:ListItem>
<asp:ListItem value="Anguilla">Anguilla</asp:ListItem>
<asp:ListItem value="Antarctica">Antarctica</asp:ListItem>
<asp:ListItem value="Antigua and Barbuda">Antigua and Barbuda</asp:ListItem>
<asp:ListItem value="Argentina">Argentina</asp:ListItem>
<asp:ListItem value="Armenia">Armenia</asp:ListItem>
<asp:ListItem value="Aruba">Aruba</asp:ListItem>
<asp:ListItem value="Australia">Australia</asp:ListItem>
<asp:ListItem value="Austria">Austria</asp:ListItem>
<asp:ListItem value="Azerbaijan">Azerbaijan</asp:ListItem>
<asp:ListItem value="Bahamas">Bahamas</asp:ListItem>
<asp:ListItem value="Bahrain">Bahrain</asp:ListItem>
<asp:ListItem value="Bangladesh">Bangladesh</asp:ListItem>
<asp:ListItem value="Barbados">Barbados</asp:ListItem>
<asp:ListItem value="Belarus">Belarus</asp:ListItem>
<asp:ListItem value="Belgium">Belgium</asp:ListItem>
<asp:ListItem value="Belize">Belize</asp:ListItem>
<asp:ListItem value="Benin">Benin</asp:ListItem>
<asp:ListItem value="Bermuda">Bermuda</asp:ListItem>
<asp:ListItem value="Bhutan">Bhutan</asp:ListItem>
<asp:ListItem value="Bolivia">Bolivia</asp:ListItem>
<asp:ListItem value="Bonaire">Bonaire</asp:ListItem>
<asp:ListItem value="Bosnia and Herzegovina">Bosnia and Herzegovina</asp:ListItem>
<asp:ListItem value="Botswana">Botswana</asp:ListItem>
<asp:ListItem value="Bouvet Island">Bouvet Island</asp:ListItem>
<asp:ListItem value="Brazil">Brazil</asp:ListItem>
<asp:ListItem value="British Indian Ocean Territory">British Indian Ocean Territory</asp:ListItem>
<asp:ListItem value="Brunei Darussalam">Brunei Darussalam</asp:ListItem>
<asp:ListItem value="Bulgaria">Bulgaria</asp:ListItem>
<asp:ListItem value="Burkina Faso">Burkina Faso</asp:ListItem>
<asp:ListItem value="Burundi">Burundi</asp:ListItem>
<asp:ListItem value="Cambodia">Cambodia</asp:ListItem>
<asp:ListItem value="Cameroon">Cameroon</asp:ListItem>
<asp:ListItem value="Canada">Canada</asp:ListItem>
<asp:ListItem value="Canary Islands">Canary Islands</asp:ListItem>
<asp:ListItem value="Cape Verde">Cape Verde</asp:ListItem>
<asp:ListItem value="Cayman Islands">Cayman Islands</asp:ListItem>
<asp:ListItem value="Central African Republic">Central African Republic</asp:ListItem>
<asp:ListItem value="Ceuta">Ceuta</asp:ListItem>
<asp:ListItem value="Chad">Chad</asp:ListItem>
<asp:ListItem value="Chile">Chile</asp:ListItem>
<asp:ListItem value="China">China</asp:ListItem>
<asp:ListItem value="Christmas Island">Christmas Island</asp:ListItem>
<asp:ListItem value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</asp:ListItem>
<asp:ListItem value="Colombia">Colombia</asp:ListItem>
<asp:ListItem value="Comoros">Comoros</asp:ListItem>
<asp:ListItem value="Congo, Dem. Republic">Congo, Dem. Republic</asp:ListItem>
<asp:ListItem value="Congo, Republic">Congo, Republic</asp:ListItem>
<asp:ListItem value="Cook Islands">Cook Islands</asp:ListItem>
<asp:ListItem value="Costa Rica">Costa Rica</asp:ListItem>
<asp:ListItem value="Cote d'Ivoire">Cote d'Ivoire</asp:ListItem>
<asp:ListItem value="Croatia">Croatia</asp:ListItem>
<asp:ListItem value="Cura?ao">Cura?ao</asp:ListItem>
<asp:ListItem value="Cyprus">Cyprus</asp:ListItem>
<asp:ListItem value="Czech Republic">Czech Republic</asp:ListItem>
<asp:ListItem value="Denmark">Denmark</asp:ListItem>
<asp:ListItem value="Djibouti">Djibouti</asp:ListItem>
<asp:ListItem value="Dominica">Dominica</asp:ListItem>
<asp:ListItem value="Dominican Republic">Dominican Republic</asp:ListItem>
<asp:ListItem value="East-Timor">East-Timor</asp:ListItem>
<asp:ListItem value="Ecuador">Ecuador</asp:ListItem>
<asp:ListItem value="Egypt">Egypt</asp:ListItem>
<asp:ListItem value="El Salvador">El Salvador</asp:ListItem>
<asp:ListItem value="Equatorial Guinea">Equatorial Guinea</asp:ListItem>
<asp:ListItem value="Eritrea">Eritrea</asp:ListItem>
<asp:ListItem value="Estonia">Estonia</asp:ListItem>
<asp:ListItem value="Ethiopia">Ethiopia</asp:ListItem>
<asp:ListItem value="Falkland Islands">Falkland Islands</asp:ListItem>
<asp:ListItem value="Faroe Islands">Faroe Islands</asp:ListItem>
<asp:ListItem value="Fiji">Fiji</asp:ListItem>
<asp:ListItem value="Finland">Finland</asp:ListItem>
<asp:ListItem value="France">France</asp:ListItem>
<asp:ListItem value="French Guiana">French Guiana</asp:ListItem>
<asp:ListItem value="French Polynesia">French Polynesia</asp:ListItem>
<asp:ListItem value="French Southern Territories">French Southern Territories</asp:ListItem>
<asp:ListItem value="Gabon">Gabon</asp:ListItem>
<asp:ListItem value="Gambia">Gambia</asp:ListItem>
<asp:ListItem value="Georgia">Georgia</asp:ListItem>
<asp:ListItem value="Germany">Germany</asp:ListItem>
<asp:ListItem value="Ghana">Ghana</asp:ListItem>
<asp:ListItem value="Gibraltar">Gibraltar</asp:ListItem>
<asp:ListItem value="Greece">Greece</asp:ListItem>
<asp:ListItem value="Greenland">Greenland</asp:ListItem>
<asp:ListItem value="Grenada">Grenada</asp:ListItem>
<asp:ListItem value="Guadeloupe">Guadeloupe</asp:ListItem>
<asp:ListItem value="Guam">Guam</asp:ListItem>
<asp:ListItem value="Guatemala">Guatemala</asp:ListItem>
<asp:ListItem value="Guernsey">Guernsey</asp:ListItem>
<asp:ListItem value="Guinea">Guinea</asp:ListItem>
<asp:ListItem value="Guinea-Bissau">Guinea-Bissau</asp:ListItem>
<asp:ListItem value="Guyana">Guyana</asp:ListItem>
<asp:ListItem value="Haiti">Haiti</asp:ListItem>
<asp:ListItem value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</asp:ListItem>
<asp:ListItem value="Honduras">Honduras</asp:ListItem>
<asp:ListItem value="Hong Kong">Hong Kong</asp:ListItem>
<asp:ListItem value="Hungary">Hungary</asp:ListItem>
<asp:ListItem value="Iceland">Iceland</asp:ListItem>
<asp:ListItem value="India">India</asp:ListItem>
<asp:ListItem value="Indonesia">Indonesia</asp:ListItem>
<asp:ListItem value="Ireland">Ireland</asp:ListItem>
<asp:ListItem value="Isle Of Man">Isle Of Man</asp:ListItem>
<asp:ListItem value="Italy">Italy</asp:ListItem>
<asp:ListItem value="Jamaica">Jamaica</asp:ListItem>
<asp:ListItem value="Japan">Japan</asp:ListItem>
<asp:ListItem value="Jersey">Jersey</asp:ListItem>
<asp:ListItem value="Jordan">Jordan</asp:ListItem>
<asp:ListItem value="Kazakhstan">Kazakhstan</asp:ListItem>
<asp:ListItem value="Kenya">Kenya</asp:ListItem>
<asp:ListItem value="Kiribati">Kiribati</asp:ListItem>
<asp:ListItem value="Korea, South">Korea, South</asp:ListItem>
<asp:ListItem value="Kuwait">Kuwait</asp:ListItem>
<asp:ListItem value="Kyrgyzstan">Kyrgyzstan</asp:ListItem>
<asp:ListItem value="Laos">Laos</asp:ListItem>
<asp:ListItem value="Latvia">Latvia</asp:ListItem>
<asp:ListItem value="Lebanon">Lebanon</asp:ListItem>
<asp:ListItem value="Lesotho">Lesotho</asp:ListItem>
<asp:ListItem value="Liberia">Liberia</asp:ListItem>
<asp:ListItem value="Liechtenstein">Liechtenstein</asp:ListItem>
<asp:ListItem value="Lithuania">Lithuania</asp:ListItem>
<asp:ListItem value="Luxembourg">Luxembourg</asp:ListItem>
<asp:ListItem value="Macau">Macau</asp:ListItem>
<asp:ListItem value="Macedonia">Macedonia</asp:ListItem>
<asp:ListItem value="Madagascar">Madagascar</asp:ListItem>
<asp:ListItem value="Malawi">Malawi</asp:ListItem>
<asp:ListItem value="Malaysia">Malaysia</asp:ListItem>
<asp:ListItem value="Maldives">Maldives</asp:ListItem>
<asp:ListItem value="Mali">Mali</asp:ListItem>
<asp:ListItem value="Malta">Malta</asp:ListItem>
<asp:ListItem value="Marshall Islands">Marshall Islands</asp:ListItem>
<asp:ListItem value="Martinique">Martinique</asp:ListItem>
<asp:ListItem value="Mauritania">Mauritania</asp:ListItem>
<asp:ListItem value="Mauritius">Mauritius</asp:ListItem>
<asp:ListItem value="Mayotte">Mayotte</asp:ListItem>
<asp:ListItem value="Melilla">Melilla</asp:ListItem>
<asp:ListItem value="Mexico">Mexico</asp:ListItem>
<asp:ListItem value="Micronesia">Micronesia</asp:ListItem>
<asp:ListItem value="Moldova">Moldova</asp:ListItem>
<asp:ListItem value="Monaco">Monaco</asp:ListItem>
<asp:ListItem value="Mongolia">Mongolia</asp:ListItem>
<asp:ListItem value="Montenegro">Montenegro</asp:ListItem>
<asp:ListItem value="Montserrat">Montserrat</asp:ListItem>
<asp:ListItem value="Morocco">Morocco</asp:ListItem>
<asp:ListItem value="Mozambique">Mozambique</asp:ListItem>
<asp:ListItem value="Myanmar">Myanmar</asp:ListItem>
<asp:ListItem value="Namibia">Namibia</asp:ListItem>
<asp:ListItem value="Nauru">Nauru</asp:ListItem>
<asp:ListItem value="Nepal">Nepal</asp:ListItem>
<asp:ListItem value="Netherlands">Netherlands</asp:ListItem>
<asp:ListItem value="New Caledonia">New Caledonia</asp:ListItem>
<asp:ListItem value="New Zealand">New Zealand</asp:ListItem>
<asp:ListItem value="Nicaragua">Nicaragua</asp:ListItem>
<asp:ListItem value="Niger">Niger</asp:ListItem>
<asp:ListItem value="Nigeria">Nigeria</asp:ListItem>
<asp:ListItem value="Niue">Niue</asp:ListItem>
<asp:ListItem value="Norfolk Island">Norfolk Island</asp:ListItem>
<asp:ListItem value="Northern Mariana Islands">Northern Mariana Islands</asp:ListItem>
<asp:ListItem value="Norway">Norway</asp:ListItem>
<asp:ListItem value="Oman">Oman</asp:ListItem>
<asp:ListItem value="Pakistan">Pakistan</asp:ListItem>
<asp:ListItem value="Palau">Palau</asp:ListItem>
<asp:ListItem value="Palestinian Territory">Palestinian Territory</asp:ListItem>
<asp:ListItem value="Panama">Panama</asp:ListItem>
<asp:ListItem value="Papua New Guinea">Papua New Guinea</asp:ListItem>
<asp:ListItem value="Paraguay">Paraguay</asp:ListItem>
<asp:ListItem value="Peru">Peru</asp:ListItem>
<asp:ListItem value="Philippines">Philippines</asp:ListItem>
<asp:ListItem value="Pitcairn Islands">Pitcairn Islands</asp:ListItem>
<asp:ListItem value="Poland">Poland</asp:ListItem>
<asp:ListItem value="Portugal">Portugal</asp:ListItem>
<asp:ListItem value="Puerto Rico">Puerto Rico</asp:ListItem>
<asp:ListItem value="Qatar">Qatar</asp:ListItem>
<asp:ListItem value="Reunion">Reunion</asp:ListItem>
<asp:ListItem value="Romania">Romania</asp:ListItem>
<asp:ListItem value="Russian Federation">Russian Federation</asp:ListItem>
<asp:ListItem value="Rwanda">Rwanda</asp:ListItem>
<asp:ListItem value="Saint-Barth?lemy">Saint-Barth?lemy</asp:ListItem>
<asp:ListItem value="Saint-Martin">Saint-Martin</asp:ListItem>
<asp:ListItem value="Samoa">Samoa</asp:ListItem>
<asp:ListItem value="San Marino">San Marino</asp:ListItem>
<asp:ListItem value="Sao Tome and Principe">Sao Tome and Principe</asp:ListItem>
<asp:ListItem value="Saudi Arabia">Saudi Arabia</asp:ListItem>
<asp:ListItem value="Senegal">Senegal</asp:ListItem>
<asp:ListItem value="Serbia">Serbia</asp:ListItem>
<asp:ListItem value="Seychelles">Seychelles</asp:ListItem>
<asp:ListItem value="Sierra Leone">Sierra Leone</asp:ListItem>
<asp:ListItem value="Singapore">Singapore</asp:ListItem>
<asp:ListItem value="Sint Maarten">Sint Maarten</asp:ListItem>
<asp:ListItem value="Slovakia">Slovakia</asp:ListItem>
<asp:ListItem value="Slovenia">Slovenia</asp:ListItem>
<asp:ListItem value="Solomon Islands">Solomon Islands</asp:ListItem>
<asp:ListItem value="Somalia">Somalia</asp:ListItem>
<asp:ListItem value="South Africa">South Africa</asp:ListItem>
<asp:ListItem value="South Georgia and Sandwich Islands">South Georgia and Sandwich Islands</asp:ListItem>
<asp:ListItem value="Spain">Spain</asp:ListItem>
<asp:ListItem value="Sri Lanka">Sri Lanka</asp:ListItem>
<asp:ListItem value="St. Helena">St. Helena</asp:ListItem>
<asp:ListItem value="St. Kitts and Nevis">St. Kitts and Nevis</asp:ListItem>
<asp:ListItem value="St. Lucia">St. Lucia</asp:ListItem>
<asp:ListItem value="St. Pierre and Miquelon">St. Pierre and Miquelon</asp:ListItem>
<asp:ListItem value="St. Vincent and the Grenadines">St. Vincent and the Grenadines</asp:ListItem>
<asp:ListItem value="Suriname">Suriname</asp:ListItem>
<asp:ListItem value="Svalbard">Svalbard</asp:ListItem>
<asp:ListItem value="Swaziland">Swaziland</asp:ListItem>
<asp:ListItem value="Sweden">Sweden</asp:ListItem>
<asp:ListItem value="Switzerland">Switzerland</asp:ListItem>
<asp:ListItem value="Taiwan">Taiwan</asp:ListItem>
<asp:ListItem value="Tajikistan">Tajikistan</asp:ListItem>
<asp:ListItem value="Tanzania">Tanzania</asp:ListItem>
<asp:ListItem value="Thailand">Thailand</asp:ListItem>
<asp:ListItem value="Togo">Togo</asp:ListItem>
<asp:ListItem value="Tokelau">Tokelau</asp:ListItem>
<asp:ListItem value="Tonga">Tonga</asp:ListItem>
<asp:ListItem value="Trinidad and Tobago">Trinidad and Tobago</asp:ListItem>
<asp:ListItem value="Tunisia">Tunisia</asp:ListItem>
<asp:ListItem value="Turkey">Turkey</asp:ListItem>
<asp:ListItem value="Turkmenistan">Turkmenistan</asp:ListItem>
<asp:ListItem value="Turks and Caicos Islands">Turks and Caicos Islands</asp:ListItem>
<asp:ListItem value="Tuvalu">Tuvalu</asp:ListItem>
<asp:ListItem value="Uganda">Uganda</asp:ListItem>
<asp:ListItem value="Ukraine">Ukraine</asp:ListItem>
<asp:ListItem value="United Arab Emirates">United Arab Emirates</asp:ListItem>
<asp:ListItem value="United Kingdom">United Kingdom</asp:ListItem>
<asp:ListItem value="Uruguay">Uruguay</asp:ListItem>
<asp:ListItem value="USA">USA</asp:ListItem>
<asp:ListItem value="US Minor Outlying Islands">US Minor Outlying Islands</asp:ListItem>
<asp:ListItem value="Uzbekistan">Uzbekistan</asp:ListItem>
<asp:ListItem value="Vanuatu">Vanuatu</asp:ListItem>
<asp:ListItem value="Vatican City State">Vatican City State</asp:ListItem>
<asp:ListItem value="Venezuela">Venezuela</asp:ListItem>
<asp:ListItem value="Viet Nam">Viet Nam</asp:ListItem>
<asp:ListItem value="Virgin Islands (British)">Virgin Islands (British)</asp:ListItem>
<asp:ListItem value="Virgin Islands (U.S.)">Virgin Islands (U.S.)</asp:ListItem>
<asp:ListItem value="Wallis and Futuna">Wallis and Futuna</asp:ListItem>
<asp:ListItem value="Western Sahara">Western Sahara</asp:ListItem>
<asp:ListItem value="Yemen">Yemen</asp:ListItem>
<asp:ListItem value="Zambia">Zambia</asp:ListItem>
<asp:ListItem value="Zimbabwe">Zimbabwe</asp:ListItem>



															</asp:dropdownlist>
															
															                                      
															</TD>
														<TD style="WIDTH: 5px; HEIGHT: 30px">
														<asp:CustomValidator id="CustomValidator1"
                                                                ControlToValidate="ddlCountry"
                                                                ClientValidationFunction="ClientValidate"
                                                                Display="Static"
                                                                ErrorMessage="*"
                                                                runat="server" />
														</TD>
													</TR>
													
													<TR>
														<TD class="style6">&nbsp;
															<asp:label id="Label8" runat="server" CssClass="head09">Password</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtPass" TextMode=Password Width="200px" CssClass="inputtext" Runat="server" MaxLength="10"></asp:textbox>
															&nbsp;<asp:Image ID="Image1" ToolTip="Password must not contain spaces; Alphnumeric characters allowed; minimum 6 characters; maximum 10 characters" imageUrl ="picture/exclamation.jpg" runat=server  />
															</TD>
														<TD style="WIDTH: 5px; HEIGHT: 36px">
															<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" Width="7px" ErrorMessage="*" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
														</TD>
													</TR>
													<TR>
														<TD class="style7">&nbsp;
															<asp:label id="Label9" runat="server" CssClass="head09">Confirm Password</asp:label></TD>
														<TD height=30>
															<asp:textbox id="txtConfirmPass" TextMode=Password Width="200px" CssClass="inputtext" Runat="server" MaxLength="10"></asp:textbox></TD>
														<TD >
														<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"  ErrorMessage="*" ControlToValidate="txtConfirmPass"></asp:RequiredFieldValidator>
															<asp:CompareValidator id="CompareValidator3" runat="server" ControlToCompare="txtPass" 
																Font-Names="Arial" ErrorMessage="Not Equivalent Pwd" ControlToValidate="txtConfirmPass" Width="156px"></asp:CompareValidator>
															
														</TD>
													</TR>
													<TR>
														<TD height="130" class="style7"></TD>
														<TD >
															<asp:Button id="btnSubmit" CssClass="inputtextbtn" Runat="server" Text="REGISTER" 
                                                                Width="128px" Height=30></asp:Button></TD>
														<TD style="WIDTH: 5px">
														</TD>
													</TR>
													
													<TR>
														<TD class="style7"></TD>
														<TD >
														<asp:Label runat=server ID=lblMess CssClass=RednormalTextBold></asp:Label>
														</TD>
														<TD style="WIDTH: 5px">
														</TD>
													</TR>
													
													<%--<TR>
														<TD style="WIDTH: 475px" colspan="3">&nbsp;
															<asp:Label id="Label10" runat="server" Width="800" CssClass=RedTextBold> When you register, you will get a userID and password to access our <a href=FreeForexSignal.aspx title="Free Forex Signals">Free Forex Signals</a>, and you can make a payment and get access to the full membership and to the Forex signals <a href=Login.aspx>CONTROL PANEL</a> plus you can download the <a href="https://play.google.com/store/apps/details?id=com.RPCHOST.rpc">RPCHOST.COM FXAS SYSTEM </a> application in your ANDROID and get instant signals with sound alert. Plus you can <a href="issueIndicator.aspx">download Rpchost_Renko </a> expert advisor </asp:Label></TD>
														<TD style="WIDTH: 139px"></TD>
														<TD style="WIDTH: 5px">
														</TD>
													</TR>--%>
													
													
														<TR>
														<TD colspan="3" height=20>&nbsp;
															</TD>
														<TD ></TD>
														<TD >
														</TD>
													</TR>
																									
													
												</TABLE> <!-- End Content -->
											</td>
										</tr>
										
										   <tr>
                                                                              <td align="center">
                                                                                 <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 728x90, created 11/9/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-6183127703818516"
     data-ad-slot="8323926968"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script></td>
                                                                              </tr>


                            <tr>
                                                                              <td align="center">
                                                                                 <script type="text/javascript">
	atOptions = {
		'key' : '10b7f767e2a3a6373ac4b54d0ba8bef4',
		'format' : 'iframe',
		'height' : 60,
		'width' : 468,
		'params' : {}
	};
	document.write('<scr' + 'ipt type="text/javascript" src="http' + (location.protocol === 'https:' ? 's' : '') + '://www.hiprofitnetworks.com/10b7f767e2a3a6373ac4b54d0ba8bef4/invoke.js"></scr' + 'ipt>');
</script></td>
                                                                              </tr>
										
										
									</TABLE>
								</td>
							</tr>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			</TD></TR></TABLE>
		</form> </TD></TR>
		<!-- Start of eWebCounter Code -->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript" src="eWebCounter.js" ></script>
		<!-- End of eWebCounter Code -->
	</body>
</HTML>
