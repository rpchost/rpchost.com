<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReviewsBackend.aspx.vb" Inherits="ReviewsBackend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <LINK rel="stylesheet" type="text/css" href="StyleSheet.css">
    
</head>
<body>
    <form id="form1" runat="server">
      <table border=0>
           
           
            <tr>
            <td  ></TD>
             <td align=left class=BlackTextBold>MANAGE REVIEWS</TD>
           </tr>
           <tr>
            <td height=70></TD>
             <td></TD>
           </tr>
           
           
           <tr>
            <td Class=head09>User Name</TD>
             <td><asp:TextBox runat=server ID=txtUserName Height=20 CssClass=INPUTTEXT ></asp:TextBox></TD>
           </tr>
           
           <tr>
            <td width=250 Class=head09>Date</TD>
             <td width=200 ><asp:TextBox runat=server ID=txtDate Height=20 CssClass=INPUTTEXT></asp:TextBox></TD>
           </tr>
           
            <tr>
            <td Class=head09> Review </TD>
             <td><asp:TextBox runat=server ID=txtReview Enabled=true TextMode=MultiLine Width=400 Height=150 MaxLength=300 CssClass=INPUTTEXT_12></asp:TextBox></TD>
           </tr>
           
            <tr>
            <td align=center > <asp:button runat=server ID=btnSubmit Enabled=true CssClass=INPUTBUTTON Height=25 Text="Post Review"></asp:button> &nbsp;&nbsp;&nbsp;&nbsp; <asp:button runat=server ID=btnMain Enabled=true CssClass=INPUTBUTTON Height=25 Text="MAIN"></asp:button> </TD>
             <td Class=RednormalTextBold> <asp:label runat=server ID=lblMess Text=""></asp:label> </TD>
           </tr>
                                                                                                 
           
           <tr>
            <td align=center height=100 > </TD>
             <td Class=RednormalTextBold> </TD>
           </tr>
                     
                     
           
            <tr>
                                                                        <td colspan=3>
                                                                                   
                                                                                    
                                                                                    
                                                                                     <table border=0 width=100%>
                                                                                       <tr>
                                                                                       <td>
                                                                                       
                                                                                                <asp:GridView ID="grdReviews" runat="server" DataKeyNames="ID" HeaderStyle-BackColor=Silver RowStyle-BackColor="#F8F7F7" AutoGenerateColumns="False" HeaderStyle-CssClass="head01" RowStyle-CssClass=head01_9 DataSourceID="AccessDataSource1" Width=100% >
                                                                                                                 <Columns>
                                                                                                                     <asp:BoundField DataField="ID" HeaderText="Review ID" HeaderStyle-Width=80
                                                                                                                          SortExpression="ID" ItemStyle-HorizontalAlign=Center />
                                                                                                                     <asp:BoundField DataField="UserName" HeaderText="User Name" HeaderStyle-Width=150 ItemStyle-HorizontalAlign=Center SortExpression="UserName" />
                                                                                                                          <asp:BoundField DataField="ReviewDate" HeaderStyle-Width=200 ItemStyle-HorizontalAlign=Center HeaderText="Review Date" 
                                                                                                                         SortExpression="ReviewDate" />
                                                                                                                         
                                                                                                                          <asp:BoundField DataField="Review" ItemStyle-Width=500 ItemStyle-HorizontalAlign=Left ItemStyle-CssClass=head01_9_normal HeaderText="Review" 
                                                                                                                         SortExpression="Review" />
                                                                                                                         
                                                                                                                            <asp:BoundField DataField="Moderated" ItemStyle-Width=500 ItemStyle-HorizontalAlign=Left ItemStyle-CssClass=head01_9_normal HeaderText="Moderated" 
                                                                                                                         SortExpression="Moderated" />
                                                                                                                      
                                                                                                                        <asp:CommandField ShowEditButton="True" />    
                                                                                                                         <asp:CommandField ShowDeleteButton="True" />    
                                                                                                                    
                                                                                                                 </Columns>
                                                                                                 </asp:GridView>
                                                                                                 <asp:AccessDataSource ID="AccessDataSource1" runat="server"   SelectCommand="Select * from Reviews order by ReviewDate desc "
                                                                                                    DataFile="~/DB/db_maindata.mdb" DeleteCommand="Delete from Reviews where ID=?" UpdateCommand="update [Reviews] set [Moderated] = 'yes' where ID = ?" >
                                                                                                 </asp:AccessDataSource>
                                                                                       
                                                                                       </td>
                                                                                       </tr>
                                                                                       
                                                                                      
                                                                                       
																	                 </table>
																	                 
																	               
                                                                                    
                                                                        </TD>
                                                                        </tr>
                                                                        
                                                                        
         </table>
    </form>
</body>
</html>
