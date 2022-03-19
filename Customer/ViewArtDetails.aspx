<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewArtDetails.aspx.cs" Inherits="WebApplication.Customer.ViewArtDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="text-align: center;">
        <tr>
            <td rowspan="4" colspan="2">
                <asp:Image ID="dp_artImg" runat="server" Style="max-width: 500px; max-height: 500px" />
            </td>
            <td>
                <div style="width: 500px;">
                    <b>
                        <asp:Label ID="dp_artName" runat="server" Style="overflow-wrap: break-word;"></asp:Label></b>
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
            <td colspan="2">
                <br /><br /><br />
                <asp:Label ID="dp_artDesc" runat="server" ></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
