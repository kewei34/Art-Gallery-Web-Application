<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error500.aspx.cs" Inherits="WebApplication.ErrorFile.error500" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:ivory;">
    <form id="form1" runat="server">
        <div style="text-align:center;font-weight:bold;background-color:antiquewhite;">
            <h1 style="margin-top:200px;">Error 500: Server Error</h1>
            <h2>Please wait while our professional team is fixing the error for you.</h2>
            <h2>If the problem persists after 1 hour, feel free to email us at <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="mailto:artgallery@gmail.com?subject=The%20subject%20of%20the%20mail">artgallery@gmail.com</asp:HyperLink>.Thank you for you patience.</h2>
        </div>
    </form>
</body>
</html>
