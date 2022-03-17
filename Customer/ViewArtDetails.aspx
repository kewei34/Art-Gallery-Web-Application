<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewArtDetails.aspx.cs" Inherits="WebApplication.Customer.ViewArtDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td colspan="2">
                <asp:Image ID="Image1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="dp_artName" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="dp_artPrice" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="addCart" runat="server" Text="Add To Cart" />
            </td>
            <td>
                <asp:Button ID="wishlist" runat="server" Text="Add To Wishlist" />
            </td>
        </tr>
    </table>
</asp:Content>
