<%@ Page Theme="theme" Language="VB" AutoEventWireup="false" CodeFile="AdvertiseAndroid.aspx.vb" Inherits="AdvertiseAndroid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>
    <form id="form1" runat="server">
   
  
   <TABLE WIDTH="100%"  height=100% BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor=black >
												
												
													<TR>
														<TD class=GreenText align=center colspan=3 >
															&nbsp;&nbsp;
												<%--Advertise in this application and let thousands of users see your banner			--%>
															ADVERTISE IN THIS APPLICATION AND LET THOUSANDS OF USERS SEE YOUR BANNER DAILY
															<br>
															ONE BANNER COSTS $1500 / YEAR
															
															<br><br>
															</TD>
														<td></td>
													</TR>
													
													<TR>
														<TD class=WhiteText   height=30 valign=top>
															&nbsp;&nbsp;
												            NAME
												            
												            												            <asp:textbox id="txtName" Width="140px" CssClass="inputtext" Runat="server"></asp:textbox>
															
															</TD>
															
															<TD class=WhiteText   height=30 valign=top>
															<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" Width="7px" ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
												            </TD>
														
													</TR>
													
													<TR>
														<TD class=WhiteText   height=30 valign=top>
															&nbsp;&nbsp;
												            EMAIL
												            
												             <asp:textbox id="txtEmail" Width="140px" CssClass="inputtext" Runat="server"></asp:textbox>
															</TD>
															
															<TD class=WhiteText   height=30 valign=top>
															
												           <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" Width="7px" ErrorMessage="*" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
															</TD>
														
													</TR>
													
													<TR>
														<TD class=WhiteText   height=30 valign=top>
															&nbsp;&nbsp;
												            ANY QUESTION ABOUT THE ADVERTISEMENT
												            
												            <br>
												            <asp:textbox id="txtQuestion" Width="340px" Height=100 CssClass="inputtext" Runat="server"></asp:textbox>
															</TD>
															
															<TD class=WhiteText height=30 valign=top>
															&nbsp;&nbsp;
												            
															</TD>
														
													</TR>
													
													
													<TR>
														<TD class=WhiteText  height=30  align=center colspan=2>
															&nbsp;&nbsp;
												            
												            <asp:Button id="btnSubmit" Width=400 CssClass=INPUTTEXTbtn Runat="server" Text="SUBMIT AND WE WILL CONTACT YOU VERY SOON" 
                                                                ></asp:Button>
												            
															</TD>
															
															<TD class=WhiteText height=30 valign=bottom>
															&nbsp;&nbsp;
												            
															</TD>
														
													</TR>
													
													
													
        
        
        
   </table>
   
    </form>
</body>
</html>
