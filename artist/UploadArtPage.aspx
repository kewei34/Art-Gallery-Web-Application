<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UploadArtPage.aspx.cs" Inherits="WebApplication.artist.UploadArtPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 506px;
            font-weight:bold;
            text-align:center;
        }
        .auto-style2 {
            width: 506px;
            height: 47px;
            border:outset;
            text-align:center;
        }

        .button{
            width:80px;
            height:50px; 
            text-align:center;
        }
        .specialtr{
            background-color:ivory;
            border: black 2px solid;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 style="text-align:center;">🖌️Upload New Art</h1>
    
    <table border="1" style="border: black 2px solid;border-collapse:collapse; text-align:center;margin:0px auto;background-color:white;">
        <tr class="specialtr">
            <td class="auto-style1">Art Image</td>            
        </tr>
        <tr>
            <td style="margin-left: 80px" class="auto-style1"><asp:FileUpload ID="art_image_upload" runat="server" accept=".png,.jpg,.jpeg" /></td>            
        </tr>
           
        <tr class="specialtr">
            <td class="auto-style1">Art Name</td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:TextBox ID="art_name" runat="server" MaxLength="99"></asp:TextBox></td>
        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Art Price</td>
        </tr>
        <tr>
            <td class="auto-style2"><asp:TextBox ID="art_price" runat="server" MaxLength="20"></asp:TextBox></td>
        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Art Quantity</td>
        </tr>
        <tr >
            <td class="auto-style2"><asp:TextBox ID="art_quantity" runat="server" MaxLength="3" OnTextChanged="art_quantity_TextChanged"></asp:TextBox><br />
                 <asp:Label ID="art_quantity_warning_text" runat="server" Text=""></asp:Label>

            </td>  
        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Art Description</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="art_desc" runat="server" Height="300px" Width="600px" Font-Size="14pt" TextMode="MultiLine" style="resize:none"></asp:TextBox><br />
            </td>
            
        </tr>      
        
        <tr>
            <td style="text-align:center">
                <asp:Button ID="button_submit_art" runat="server" style="width:100px;height:50px;text-align:center;font-weight:bold;" Text="Submit" OnClick="button_submit_art_Click" /></td>
        </tr>
    </table>
        
</asp:Content>
