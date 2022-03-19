<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="WebApplication.ManageAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        *{
            margin:0px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblId" runat="server" Text="" style="visibility:hidden;"></asp:Label>
    <table border="1" style="border-collapse:separate; text-align:center;margin:0px auto;width:700px;overflow-wrap:break-word; max-width:700px;">
               
        <tr>
            <td><b><asp:Label runat="server" Text="User Name "></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td>
                <asp:Label ID="user_name" runat="server" Text=""></asp:Label>
                </td>
        </tr>
        <tr>
            <td><b><asp:Label runat="server" Text="E-mail"></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td>
                <asp:Label ID="user_email" runat="server" Text=""></asp:Label>
                </td>
        </tr>
        <tr >
            <td><b><asp:Label runat="server" Text="Password "></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td><asp:ChangePassword ID="ChangePassword1" runat="server" ContinueButtonText="Back To Hompage" ContinueDestinationPageUrl="~/homepage.aspx"></asp:ChangePassword></td>
        </tr>
  
        
    </table>
</asp:Content>