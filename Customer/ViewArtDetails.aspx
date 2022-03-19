<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewArtDetails.aspx.cs" Inherits="WebApplication.Customer.ViewArtDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="text-align:center;">Art Details</h1>

    <table border="1" style="text-align: center; border-collapse:collapse; margin:0px auto;border-style:dashed;">
        <tr>
            <td rowspan="4" colspan="2">
                <asp:Image ID="dp_artImg" runat="server" style="max-width: 500px; max-height: 500px;box-shadow: 5px 5px 5px #ccc;" />
            </td>
            <td>
                <div style="width: 500px; font-size:30px;">
                    <b>
                        <asp:Label ID="dp_artName" runat="server" style="overflow-wrap: break-word;"></asp:Label></b>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="dp_artPrice" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="dp_qty" runat="server" TextMode="Number" min="1" step="1" Text="1" AutoPostBack="True"></asp:TextBox>
                <asp:Button ID="addCart" runat="server" Text="Add To Cart" OnClick="addCart_Click" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="wishlist" runat="server" Text="Add To Wishlist" OnClick="wishlist_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <br /><br /><br />
                <asp:Label ID="dp_artDesc" runat="server" ></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
