<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error404.aspx.cs" Inherits="WebApplication.error404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:ivory;">
    <form id="form1" runat="server">
        <div style="text-align:center;font-weight:bold;background-color:antiquewhite;">
            <h1 style="margin-top:200px;">Error 404: Page Not Found</h1>
            <h2>Why dont come to have a look at our homepage?</h2>
            <asp:Button ID="Button1" runat="server" Text="Button" style="width:150px;height:50px;font-size:30px;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;background-color:burlywood;" OnClick="Button1_Click"/></div>
    </form>
</body>
</html>
