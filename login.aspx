<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="masterPage.css" rel="stylesheet" />
    <title>Login</title>
<style>
*{
margin:0px auto;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center;margin-top:60px;">
            <h1>Welcome To The Secret Garden !</h1>
        </div>

        <div style="margin-top:30px;">
            <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" TextLayout="TextOnTop" DestinationPageUrl="~/homepage.aspx" RememberMeSet="True" RememberMeText="Remember me" Width="466px">
                <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            </asp:Login>
        </div>
        <br />

        <div style="text-align:center;">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/register.aspx">Create a new account</asp:HyperLink>
        </div>
    </form>
</body>
</html>
