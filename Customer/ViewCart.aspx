<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="WebApplication.Customer.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #cart td{
            border: black 2px solid;
            padding : 10px 20px;
        }
        #cart{
            border-collapse:collapse;
        }
    </style>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <table id="cart">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imgPath") %>' style="max-width: 300px; max-height: 300px" />
                    </td>
                    <td>
                        <b><%# Eval("name") %></b>
                    </td>
                    <td>
                        <b>
                            <asp:Label ID="lblPricehd" runat="server" Text='<%# Eval("price") %>'>
                            </asp:Label>
                        </b>
                    </td>
                    <td>
                        <%# Eval("qty") %>
                    </td>
                    <td>
                        <asp:Label ID="lblTotal" runat="server" Text='<%#(calculateTotal((Eval("price")).ToString(), (Eval("qty")).ToString())) %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT art.name, art.price, art.imgPath, cart.qty FROM art INNER JOIN cart ON art.Id = cart.itemId"></asp:SqlDataSource>
    </asp:Content>
