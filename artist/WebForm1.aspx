<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    //content here
    <h1>Upload Art Page</h1>
    <table>
        <tr>
            <td>Art Image</td>            
        </tr>
        <tr>
            <td style="margin-left: 80px"><asp:FileUpload ID="art_image_upload" runat="server" /></td>            
        </tr>
           
        <tr>
            <td>Art Name</td>
        </tr>
        <tr>
            <td><asp:TextBox ID="art_name" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Art Price</td>
        </tr>
        <tr>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
    </table>
</asp:Content>
