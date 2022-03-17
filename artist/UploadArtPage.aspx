<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UploadArtPage.aspx.cs" Inherits="WebApplication.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 506px;
        }
        .auto-style2 {
            width: 506px;
            height: 47px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    //content here
    <h1>Upload Art Page</h1>
    
    <table>
        <tr>
            <td class="auto-style1">Art Image</td>            
        </tr>
        <tr>
            <td style="margin-left: 80px" class="auto-style1"><asp:FileUpload ID="art_image_upload" runat="server" /></td>            
        </tr>
           
        <tr>
            <td class="auto-style1">Art Name</td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:TextBox ID="art_name" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">Art Price</td>
        </tr>
        <tr>
            <td class="auto-style2"><asp:TextBox ID="art_price" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Art Quantity</td>
        </tr>
        <tr>
            <td><asp:TextBox ID="art_quantity" runat="server" MaxLength="3" OnTextChanged="art_quantity_TextChanged"></asp:TextBox><br />
                <asp:Label ID="art_quantity_warning_text" runat="server" Text=""></asp:Label></td>                
            
                
                
        </tr>
        <tr>
            <td class="auto-style1">Art Categories</td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
        </tr>
        <tr><td></td></tr>
        <tr>
            <td>
                <asp:Button ID="button_submit_art" runat="server" Text="Submit" /></td>
        </tr>
    </table>
        
</asp:Content>
