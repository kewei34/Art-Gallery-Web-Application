<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewArtDetails.aspx.cs" Inherits="WebApplication.Customer.ViewArtDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="text-align:center;">🎨Art Details</h1>

    <table border="1" style="text-align: center; border-collapse:collapse; margin:0px auto;border: black 2px solid;background-color:ivory;width:1000px;max-width:1000px;">
        <tr>
            <td rowspan="4" colspan="2">
                <asp:Image ID="dp_artImg" runat="server" style="width:350px;height:300px; max-width: 350px; max-height: 300px;box-shadow: 5px 5px 5px #ccc;" />
            </td>
            <td style="text-align:center;">
                <div style="width: 500px; font-size:30px;text-align:center;margin:0px auto;">                   
                        <asp:Label ID="dp_artName" runat="server" style="overflow-wrap: break-word;font-weight:bold;text-align:center;"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td style="font-weight:bold;text-align:center;">
                <asp:Label ID="dp_artPrice" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="dp_qty" runat="server" TextMode="Number" min="1" step="1" style="text-align:center;">1</asp:TextBox>
                <asp:Button ID="addCart" runat="server" Text="Add To Cart" OnClick="addCart_Click" />
                <br /><br />
                <asp:Label ID="stock" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                <asp:Label ID="maxReach" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="wishlist" runat="server" Text="Add To Wishlist" OnClick="wishlist_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="overflow-wrap:break-word; width:1000px;max-width:1000px;padding:28px;">
                
                <asp:Label ID="dp_artDesc" runat="server" ></asp:Label>
                
            </td>
        </tr>
    </table>
</asp:Content>
