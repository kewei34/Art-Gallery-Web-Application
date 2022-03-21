<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
        .auto-style2 {
            height: 26px;
        }
    </style>
</head>
<body>
    
    <table>
        
        <tr>
            <td>Name:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Student Id:</td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </tr>
        <tr>
            <td>Registered Date</td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Your Course</td>
            <td class="auto-style1">
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td class="auto-style2">
                <asp:RadioButton ID="RadioButton1" runat="server" text="Male" GroupName="gender"/>
                <asp:RadioButton ID="RadioButton2" runat="server" text="Female" GroupName="gender"/>
            </td>
        </tr>
    </table>
</body>
</html>
