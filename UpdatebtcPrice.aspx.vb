Imports OpenQA.Selenium.Chrome
Imports OpenQA.Selenium

Partial Class UpdatebtcPrice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnViewHtml.Attributes.Add("onClick", "javascript:getHtml()")
    End Sub

  
End Class
