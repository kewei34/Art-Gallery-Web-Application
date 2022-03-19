<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditArtDetails.aspx.cs" Inherits="WebApplication.artist.EditArtPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .noborder{
            border:outset;

        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" style="margin:0px auto;">
    <asp:Label ID="lblId" runat="server" Text="" style="visibility:hidden;"></asp:Label>
    <table border="1" style="border-collapse:separate; text-align:center;margin:0px auto;">
        <tr>
            <td><b><asp:Label runat="server" Text="Art Preview: "></asp:Label></b></td>
        </tr>
        <tr class="noborder">
            <td>
                <asp:Image ID="art_image" alt="Art Image" style="width:200px;height:150px;" runat="server" /></td>
        </tr>
        <tr class="noborder">
            <td><asp:FileUpload ID="art_image_upload" runat="server" accept=".png,.jpg,.jpeg" /></td>
        </tr>
        <tr>
            <td><b><asp:Label runat="server" Text="Art Name: "></asp:Label></b></td>
        </tr>
        
        <tr class="noborder">
            <td><asp:TextBox ID="art_name" style="width:300px;box-sizing: border-box; text-align:center;" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><b><asp:Label runat="server" Text="Art Price: "></asp:Label></b></td>
        </tr>
        <tr class="noborder">
            <td><asp:Label  runat="server" Text="RM: "></asp:Label> <asp:TextBox ID="art_price" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><b><asp:Label runat="server" Text="Art Quantity: "></asp:Label></b></td>
        </tr>
        <tr class="noborder">
            <td><asp:TextBox ID="art_qty" style="width:300px;box-sizing: border-box;text-align:center;" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><b><asp:Label runat="server" Text="Art Description: "></asp:Label></b></td>
        </tr>
        <tr class="noborder">
            <td><asp:TextBox ID="art_description" style="width:300px;height:200px;box-sizing: border-box;overflow-wrap: break-word;" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <table border="0" style="margin:0px auto;text-align:center;">
        <tr>
            <td><asp:Button ID="button_edit" runat="server" Text="Edit" style="width:80px;height:50px; margin-right:20px;" OnClick="button_edit_Click"/>
                <asp:Button ID="button_back" runat="server" Text="Back"
                    style="width:80px;height:50px;" OnClick="button_back_Click"/>

            </td>
            
        </tr>
    </table>
</asp:Content>
