<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="WebApplication.Customer.wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #wl td{
            border: black 2px solid;
            padding : 10px 20px;
        }
        #cart{
            border-collapse:collapse;
        }
    </style>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table id="wl">
                <tr>
                    <td>
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Expr1") %>' style="display: none;"></asp:Label>

                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imgPath") %>' style="max-width: 300px; max-height: 300px" />
                    </td>
                    <td>
                        <b><%# Eval("name") %> </b>
                    </td>
                    <td>
                        <b>
                            <asp:Label ID="lblPricehd" runat="server" Text='<%# Eval("price") %>'>
                            </asp:Label>
                        </b>
                    </td>
                    <td>
                        <asp:Button ID="rmWishlist" runat="server" Text="Remove" CommandName="remove" />
                    </td>
                    </table>
        </ItemTemplate>
    </asp:DataList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
    
</asp:Content>
