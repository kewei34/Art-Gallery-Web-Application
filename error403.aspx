<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error403.aspx.cs" Inherits="WebApplication.ErrorFile.error403" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:ivory;">
    <form id="form1" runat="server">
        
           <div style="text-align:center;font-weight:bold;background-color:antiquewhite;">
            <h1 style="margin-top:200px;">Error 403: Page Forbidden</h1>
            <h2>Seems like you have lost in our website, 
                </h2>
               <h2>Press the button to back to our homepage.</h2>
            <asp:Button ID="Button1" runat="server" Text="Button" style="width:150px;height:50px;font-size:30px;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;background-color:burlywood;"/>
        </div>
    </form>
</body>
</html>
