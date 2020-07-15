<%@ Page Theme="theme" Language="VB" AutoEventWireup="false" CodeFile="RegisterAndroid.aspx.vb" Inherits="RegisterAndroid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<link rel="stylesheet" type="text/css" href="StyleSheet.css" />

    <title></title>
</head>
<body topmargin=0 leftmargin=0>
    <form id="form1" runat="server">
   	<!-- Content goes here -->
												<TABLE WIDTH="100%" height=100% BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor=black>
												
												
													<TR>
														<TD  colspan=3 height=30 valign=bottom>
															&nbsp;&nbsp;
															<asp:label id="lblMess" runat="server" CssClass=RednormalText><font face=arial color=red></font></asp:label></TD>
														
													</TR>
													
													
													<TR>
														<TD >
															<asp:label id="Label4" runat="server" CssClass =WhiteText>DEVICE ID</asp:label></TD>
														<TD>
															<asp:textbox id="txtDeviceID" Width="170px" CssClass="inputtext" Runat="server"></asp:textbox></TD>
														<TD >
														</TD>
													</TR>
													
													<TR>
														<TD align=left >
															<asp:label id="Label1" runat="server" CssClass="WhiteText" Width=100>FIRST NAME</asp:label></TD>
														<TD>
															<asp:textbox id="txtFirst" Width="170px" CssClass="inputtext" Runat="server"></asp:textbox></TD>
														<TD >
															<asp:RequiredFieldValidator id="RequiredFieldValidator1" CssClass=RednormalText runat="server" ErrorMessage="Required" ControlToValidate="txtFirst"></asp:RequiredFieldValidator></TD>
													</TR>
													<TR>
														<TD align=left>
															<asp:label id="Label2" runat="server" CssClass="WhiteText">LAST NAME</asp:label></TD>
														
														
														<TD>
														
														<table>
														<tr>
														<td>
														
															<asp:textbox id="txtLast" Width="60px" CssClass="inputtext" Runat="server"></asp:textbox>
															</TD>
														</td>
														
														<td class=WhiteText>
														
														Postal
															
														</td>
														
														<td>
														
														<asp:textbox id="txtPostal" Width="51px" CssClass="inputtext" Runat="server"></asp:textbox>
														
															</TD>
															
														
														</tr>
														</table>
															
														
															</TD>
															
															<td>
															<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ErrorMessage="Required" CssClass=RednormalText ControlToValidate="txtPostal"></asp:RequiredFieldValidator>	
															<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ErrorMessage="Required" CssClass=RednormalText ControlToValidate="txtLast"></asp:RequiredFieldValidator>
															</td>
													</TR>
													
												
													<TR>
														<TD align=left>
															<asp:Label id="Label5" runat="server" CssClass="WhiteText">COUNTRY</asp:Label></TD>
														<TD >
														
														<table>
														<tr>
														<td>
														
															<asp:dropdownlist id="ddlCountry" Width="70px" CssClass="inputtext" Runat="server">
																
																
										<asp:ListItem Value="0" Selected="True">-- Select Country --</asp:ListItem>
										<asp:ListItem value="800">Australia</asp:ListItem>
<asp:ListItem value="404">Canada</asp:ListItem>
<asp:ListItem value="1">France</asp:ListItem>
<asp:ListItem value="4">Germany</asp:ListItem>
<asp:ListItem value="732">Japan</asp:ListItem>
<asp:ListItem value="3">Netherlands</asp:ListItem>
<asp:ListItem value="39">Switzerland</asp:ListItem>
<asp:ListItem value="6">United Kingdom</asp:ListItem>
<asp:ListItem value="400">USA</asp:ListItem>
<asp:ListItem value="-1">------- All countries -------</asp:ListItem>
<asp:ListItem value="660">Afghanistan</asp:ListItem>
<asp:ListItem value="33">Åland Islands</asp:ListItem>
<asp:ListItem value="70">Albania</asp:ListItem>
<asp:ListItem value="208">Algeria</asp:ListItem>
<asp:ListItem value="810">American Samoa</asp:ListItem>
<asp:ListItem value="43">Andorra</asp:ListItem>
<asp:ListItem value="330">Angola</asp:ListItem>
<asp:ListItem value="446">Anguilla</asp:ListItem>
<asp:ListItem value="891">Antarctica</asp:ListItem>
<asp:ListItem value="459">Antigua and Barbuda</asp:ListItem>
<asp:ListItem value="528">Argentina</asp:ListItem>
<asp:ListItem value="77">Armenia</asp:ListItem>
<asp:ListItem value="474">Aruba</asp:ListItem>
<asp:ListItem value="800">Australia</asp:ListItem>
<asp:ListItem value="38">Austria</asp:ListItem>
<asp:ListItem value="78">Azerbaijan</asp:ListItem>
<asp:ListItem value="453">Bahamas</asp:ListItem>
<asp:ListItem value="640">Bahrain</asp:ListItem>
<asp:ListItem value="666">Bangladesh</asp:ListItem>
<asp:ListItem value="469">Barbados</asp:ListItem>
<asp:ListItem value="73">Belarus</asp:ListItem>
<asp:ListItem value="102">Belgium</asp:ListItem>
<asp:ListItem value="421">Belize</asp:ListItem>
<asp:ListItem value="284">Benin</asp:ListItem>
<asp:ListItem value="413">Bermuda</asp:ListItem>
<asp:ListItem value="675">Bhutan</asp:ListItem>
<asp:ListItem value="516">Bolivia</asp:ListItem>
<asp:ListItem value="953">Bonaire, Saint Eustatius and Saba</asp:ListItem>
<asp:ListItem value="93">Bosnia and Herzegovina</asp:ListItem>
<asp:ListItem value="391">Botswana</asp:ListItem>
<asp:ListItem value="892">Bouvet Island</asp:ListItem>
<asp:ListItem value="508">Brazil</asp:ListItem>
<asp:ListItem value="357">British Indian Ocean Territory</asp:ListItem>
<asp:ListItem value="703">Brunei Darussalam</asp:ListItem>
<asp:ListItem value="68">Bulgaria</asp:ListItem>
<asp:ListItem value="236">Burkina Faso</asp:ListItem>
<asp:ListItem value="328">Burundi</asp:ListItem>
<asp:ListItem value="696">Cambodia</asp:ListItem>
<asp:ListItem value="302">Cameroon</asp:ListItem>
<asp:ListItem value="404">Canada</asp:ListItem>
<asp:ListItem value="21">Canary Islands</asp:ListItem>
<asp:ListItem value="247">Cape Verde</asp:ListItem>
<asp:ListItem value="463">Cayman Islands</asp:ListItem>
<asp:ListItem value="306">Central African Republic</asp:ListItem>
<asp:ListItem value="22">Ceuta</asp:ListItem>
<asp:ListItem value="244">Chad</asp:ListItem>
<asp:ListItem value="512">Chile</asp:ListItem>
<asp:ListItem value="720">China</asp:ListItem>
<asp:ListItem value="834">Christmas Island</asp:ListItem>
<asp:ListItem value="833">Cocos (Keeling) Islands</asp:ListItem>
<asp:ListItem value="480">Colombia</asp:ListItem>
<asp:ListItem value="375">Comoros</asp:ListItem>
<asp:ListItem value="322">Congo, Dem. Republic</asp:ListItem>
<asp:ListItem value="318">Congo, Republic</asp:ListItem>
<asp:ListItem value="837">Cook Islands</asp:ListItem>
<asp:ListItem value="436">Costa Rica</asp:ListItem>
<asp:ListItem value="272">Cote d'Ivoire</asp:ListItem>
<asp:ListItem value="92">Croatia</asp:ListItem>
<asp:ListItem value="952">Curaçao</asp:ListItem>
<asp:ListItem value="600">Cyprus</asp:ListItem>
<asp:ListItem value="61">Czech Republic</asp:ListItem>
<asp:ListItem value="8">Denmark</asp:ListItem>
<asp:ListItem value="338">Djibouti</asp:ListItem>
<asp:ListItem value="460">Dominica</asp:ListItem>
<asp:ListItem value="456">Dominican Republic</asp:ListItem>
<asp:ListItem value="626">East-Timor</asp:ListItem>
<asp:ListItem value="500">Ecuador</asp:ListItem>
<asp:ListItem value="220">Egypt</asp:ListItem>
<asp:ListItem value="428">El Salvador</asp:ListItem>
<asp:ListItem value="310">Equatorial Guinea</asp:ListItem>
<asp:ListItem value="336">Eritrea</asp:ListItem>
<asp:ListItem value="53">Estonia</asp:ListItem>
<asp:ListItem value="334">Ethiopia</asp:ListItem>
<asp:ListItem value="529">Falkland Islands</asp:ListItem>
<asp:ListItem value="25">Faroe Islands</asp:ListItem>
<asp:ListItem value="815">Fiji</asp:ListItem>
<asp:ListItem value="32">Finland</asp:ListItem>
<asp:ListItem value="1">France</asp:ListItem>
<asp:ListItem value="496">French Guiana</asp:ListItem>
<asp:ListItem value="822">French Polynesia</asp:ListItem>
<asp:ListItem value="894">French Southern Territories</asp:ListItem>
<asp:ListItem value="314">Gabon</asp:ListItem>
<asp:ListItem value="252">Gambia</asp:ListItem>
<asp:ListItem value="76">Georgia</asp:ListItem>
<asp:ListItem value="4">Germany</asp:ListItem>
<asp:ListItem value="276">Ghana</asp:ListItem>
<asp:ListItem value="44">Gibraltar</asp:ListItem>
<asp:ListItem value="9">Greece</asp:ListItem>
<asp:ListItem value="406">Greenland</asp:ListItem>
<asp:ListItem value="473">Grenada</asp:ListItem>
<asp:ListItem value="458">Guadeloupe</asp:ListItem>
<asp:ListItem value="831">Guam</asp:ListItem>
<asp:ListItem value="416">Guatemala</asp:ListItem>
<asp:ListItem value="87">Guernsey</asp:ListItem>
<asp:ListItem value="260">Guinea</asp:ListItem>
<asp:ListItem value="257">Guinea-Bissau</asp:ListItem>
<asp:ListItem value="488">Guyana</asp:ListItem>
<asp:ListItem value="452">Haiti</asp:ListItem>
<asp:ListItem value="835">Heard Island and McDonald Islands</asp:ListItem>
<asp:ListItem value="424">Honduras</asp:ListItem>
<asp:ListItem value="740">Hong Kong</asp:ListItem>
<asp:ListItem value="64">Hungary</asp:ListItem>
<asp:ListItem value="24">Iceland</asp:ListItem>
<asp:ListItem value="664">India</asp:ListItem>
<asp:ListItem value="700">Indonesia</asp:ListItem>
<asp:ListItem value="7">Ireland</asp:ListItem>
<asp:ListItem value="86">Isle Of Man</asp:ListItem>
<asp:ListItem value="624">Israel</asp:ListItem>
<asp:ListItem value="5">Italy</asp:ListItem>
<asp:ListItem value="464">Jamaica</asp:ListItem>
<asp:ListItem value="732">Japan</asp:ListItem>
<asp:ListItem value="88">Jersey</asp:ListItem>
<asp:ListItem value="628">Jordan</asp:ListItem>
<asp:ListItem value="79">Kazakhstan</asp:ListItem>
<asp:ListItem value="346">Kenya</asp:ListItem>
<asp:ListItem value="812">Kiribati</asp:ListItem>
<asp:ListItem value="728">Korea, South</asp:ListItem>
<asp:ListItem value="636">Kuwait</asp:ListItem>
<asp:ListItem value="83">Kyrgyzstan</asp:ListItem>
<asp:ListItem value="684">Laos</asp:ListItem>
<asp:ListItem value="54">Latvia</asp:ListItem>
<asp:ListItem value="604">Lebanon</asp:ListItem>
<asp:ListItem value="395">Lesotho</asp:ListItem>
<asp:ListItem value="268">Liberia</asp:ListItem>
<asp:ListItem value="37">Liechtenstein</asp:ListItem>
<asp:ListItem value="55">Lithuania</asp:ListItem>
<asp:ListItem value="104">Luxembourg</asp:ListItem>
<asp:ListItem value="743">Macau</asp:ListItem>
<asp:ListItem value="96">Macedonia (Former Yugoslav Republic)</asp:ListItem>
<asp:ListItem value="370">Madagascar</asp:ListItem>
<asp:ListItem value="386">Malawi</asp:ListItem>
<asp:ListItem value="701">Malaysia</asp:ListItem>
<asp:ListItem value="667">Maldives</asp:ListItem>
<asp:ListItem value="232">Mali</asp:ListItem>
<asp:ListItem value="46">Malta</asp:ListItem>
<asp:ListItem value="824">Marshall Islands</asp:ListItem>
<asp:ListItem value="462">Martinique</asp:ListItem>
<asp:ListItem value="228">Mauritania</asp:ListItem>
<asp:ListItem value="373">Mauritius</asp:ListItem>
<asp:ListItem value="377">Mayotte</asp:ListItem>
<asp:ListItem value="23">Melilla</asp:ListItem>
<asp:ListItem value="412">Mexico</asp:ListItem>
<asp:ListItem value="823">Micronesia</asp:ListItem>
<asp:ListItem value="74">Moldova</asp:ListItem>
<asp:ListItem value="95">Monaco</asp:ListItem>
<asp:ListItem value="716">Mongolia</asp:ListItem>
<asp:ListItem value="99">Montenegro</asp:ListItem>
<asp:ListItem value="470">Montserrat</asp:ListItem>
<asp:ListItem value="204">Morocco</asp:ListItem>
<asp:ListItem value="366">Mozambique</asp:ListItem>
<asp:ListItem value="676">Myanmar</asp:ListItem>
<asp:ListItem value="389">Namibia</asp:ListItem>
<asp:ListItem value="803">Nauru</asp:ListItem>
<asp:ListItem value="672">Nepal</asp:ListItem>
<asp:ListItem value="3">Netherlands</asp:ListItem>
<asp:ListItem value="809">New Caledonia</asp:ListItem>
<asp:ListItem value="804">New Zealand</asp:ListItem>
<asp:ListItem value="432">Nicaragua</asp:ListItem>
<asp:ListItem value="240">Niger</asp:ListItem>
<asp:ListItem value="288">Nigeria</asp:ListItem>
<asp:ListItem value="838">Niue</asp:ListItem>
<asp:ListItem value="836">Norfolk Island</asp:ListItem>
<asp:ListItem value="820">Northern Mariana Islands</asp:ListItem>
<asp:ListItem value="28">Norway</asp:ListItem>
<asp:ListItem value="649">Oman</asp:ListItem>
<asp:ListItem value="662">Pakistan</asp:ListItem>
<asp:ListItem value="825">Palau</asp:ListItem>
<asp:ListItem value="625">Palestinian Territory</asp:ListItem>
<asp:ListItem value="442">Panama</asp:ListItem>
<asp:ListItem value="801">Papua New Guinea</asp:ListItem>
<asp:ListItem value="520">Paraguay</asp:ListItem>
<asp:ListItem value="504">Peru</asp:ListItem>
<asp:ListItem value="708">Philippines</asp:ListItem>
<asp:ListItem value="813">Pitcairn Islands</asp:ListItem>
<asp:ListItem value="60">Poland</asp:ListItem>
<asp:ListItem value="10">Portugal</asp:ListItem>
<asp:ListItem value="444">Puerto Rico</asp:ListItem>
<asp:ListItem value="644">Qatar</asp:ListItem>
<asp:ListItem value="372">Reunion</asp:ListItem>
<asp:ListItem value="66">Romania</asp:ListItem>
<asp:ListItem value="75">Russian Federation</asp:ListItem>
<asp:ListItem value="324">Rwanda</asp:ListItem>
<asp:ListItem value="476">Saint-Barthélemy</asp:ListItem>
<asp:ListItem value="475">Saint-Martin</asp:ListItem>
<asp:ListItem value="819">Samoa</asp:ListItem>
<asp:ListItem value="47">San Marino</asp:ListItem>
<asp:ListItem value="311">Sao Tome and Principe</asp:ListItem>
<asp:ListItem value="632">Saudi Arabia</asp:ListItem>
<asp:ListItem value="248">Senegal</asp:ListItem>
<asp:ListItem value="98">Serbia</asp:ListItem>
<asp:ListItem value="355">Seychelles</asp:ListItem>
<asp:ListItem value="264">Sierra Leone</asp:ListItem>
<asp:ListItem value="706">Singapore</asp:ListItem>
<asp:ListItem value="951">Sint Maarten</asp:ListItem>
<asp:ListItem value="63">Slovakia</asp:ListItem>
<asp:ListItem value="91">Slovenia</asp:ListItem>
<asp:ListItem value="806">Solomon Islands</asp:ListItem>
<asp:ListItem value="342">Somalia</asp:ListItem>
<asp:ListItem value="388">South Africa</asp:ListItem>
<asp:ListItem value="893">South Georgia and Sandwich Islands</asp:ListItem>
<asp:ListItem value="11">Spain</asp:ListItem>
<asp:ListItem value="669">Sri Lanka</asp:ListItem>
<asp:ListItem value="329">St. Helena</asp:ListItem>
<asp:ListItem value="449">St. Kitts and Nevis</asp:ListItem>
<asp:ListItem value="465">St. Lucia</asp:ListItem>
<asp:ListItem value="408">St. Pierre and Miquelon</asp:ListItem>
<asp:ListItem value="467">St. Vincent and the Grenadines</asp:ListItem>
<asp:ListItem value="492">Suriname</asp:ListItem>
<asp:ListItem value="27">Svalbard</asp:ListItem>
<asp:ListItem value="393">Swaziland</asp:ListItem>
<asp:ListItem value="30">Sweden</asp:ListItem>
<asp:ListItem value="39">Switzerland</asp:ListItem>
<asp:ListItem value="736">Taiwan</asp:ListItem>
<asp:ListItem value="82">Tajikistan</asp:ListItem>
<asp:ListItem value="352">Tanzania</asp:ListItem>
<asp:ListItem value="680">Thailand</asp:ListItem>
<asp:ListItem value="280">Togo</asp:ListItem>
<asp:ListItem value="839">Tokelau</asp:ListItem>
<asp:ListItem value="817">Tonga</asp:ListItem>
<asp:ListItem value="472">Trinidad and Tobago</asp:ListItem>
<asp:ListItem value="212">Tunisia</asp:ListItem>
<asp:ListItem value="52">Turkey</asp:ListItem>
<asp:ListItem value="80">Turkmenistan</asp:ListItem>
<asp:ListItem value="454">Turks and Caicos Islands</asp:ListItem>
<asp:ListItem value="807">Tuvalu</asp:ListItem>
<asp:ListItem value="350">Uganda</asp:ListItem>
<asp:ListItem value="72">Ukraine</asp:ListItem>
<asp:ListItem value="647">United Arab Emirates</asp:ListItem>
<asp:ListItem value="6">United Kingdom</asp:ListItem>
<asp:ListItem value="524">Uruguay</asp:ListItem>
<asp:ListItem value="400">USA</asp:ListItem>
<asp:ListItem value="832">US Minor Outlying Islands</asp:ListItem>
<asp:ListItem value="81">Uzbekistan</asp:ListItem>
<asp:ListItem value="816">Vanuatu</asp:ListItem>
<asp:ListItem value="45">Vatican City State</asp:ListItem>
<asp:ListItem value="484">Venezuela</asp:ListItem>
<asp:ListItem value="690">Viet Nam</asp:ListItem>
<asp:ListItem value="468">Virgin Islands (British)</asp:ListItem>
<asp:ListItem value="457">Virgin Islands (U.S.)</asp:ListItem>
<asp:ListItem value="811">Wallis and Futuna</asp:ListItem>
<asp:ListItem value="201">Western Sahara</asp:ListItem>
<asp:ListItem value="653">Yemen</asp:ListItem>
<asp:ListItem value="378">Zambia</asp:ListItem>
<asp:ListItem value="382">Zimbabwe</asp:ListItem>


															</asp:dropdownlist>
														
														</td>
														
														<td Class="WhiteText" >City</td>
														<td> <asp:textbox id="txtCity" Width="62px" CssClass="inputtext" Runat="server"></asp:textbox> 
														
														</td>
														<td></td>
														
														</tr>
														</table>	
															
														</TD>
														<TD ><asp:RequiredFieldValidator id="RequiredFieldValidator2" CssClass=RednormalText runat="server" ErrorMessage="Required" ControlToValidate="txtCity"></asp:RequiredFieldValidator></TD>
													</TR>
													
													<TR>
														<TD align=left>
															<asp:label id="Label3" runat="server" CssClass="WhiteText">EMAIL</asp:label></TD>
														<TD style="WIDTH: 40px">
															<asp:textbox id="txtEmail" Width="170px" CssClass="inputtext" Runat="server"></asp:textbox></TD>
															<TD >
															<asp:RequiredFieldValidator id="RequiredFieldValidator3" CssClass=RednormalText runat="server" ErrorMessage="Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></TD>
														
													</TR>
													
													
													<TR>
														<TD >
															<asp:label id="Label8" runat="server" CssClass="WhiteText">PASSWORD</asp:label></TD>
														<TD >
															<asp:textbox id="txtPass" Width="170px" CssClass="inputtext"  Runat="server" MaxLength="10"></asp:textbox></TD>
														<TD >
															<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" CssClass=RednormalText ErrorMessage="Required" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
														</TD>
													</TR>
													
														<TR>
														<TD  colspan=3 class=GreenText height=40>
														
														BEFORE YOU MAKE THE PAYMENET PLEASE FILL THIS FORM. MONTHLY MEMBERSHIP $75 / MONTH.
														<%--&nbsp;YEARLY MEMBERSHIP : $75 / YEAR<br><br>
														PAY THRU OUR PARTNER SHAREIT.COM <br> <font face=arial color=red>HIGHLY SECURE PAYMENT</font>
														--%>
														</TD>
													</TR>
													
													<TR>
														<TD height="40"  colspan=3>
														<asp:Button id="btnSubmit" CssClass=INPUTTEXTbtn Runat="server" Height=40 Text="EDIT YOUR DATA" 
                                                                Width="100%"></asp:Button>
														</TD>
														
														
													</TR>
													<TR>
														<TD class="style1"></TD>
														<TD style="WIDTH: 40px"></TD>
														<TD style="WIDTH: 5px">
														</TD>
													</TR>
													
																									
													
												</TABLE> <!-- End Content -->
    </form>
</body>
</html>
