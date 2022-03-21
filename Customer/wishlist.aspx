<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="WebApplication.Customer.wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        *{
            margin:0px auto;
        }
        #wl td{
            border: black 2px solid;
            padding : 10px 20px;
        }
        #cart{
            border-collapse:collapse;
        }
    </style>
    
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" >
        

        <ItemTemplate>
            <table id="wl" style="margin:0px auto;" >
                <tr style="font-weight:bold;">
                    <td style="width:300px;max-width:300px;overflow-wrap: break-word; text-align:center;">Artwork Preview</td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">Art Name</td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">Art Price</td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">Remove From Wishlist</td>
                    
                </tr>
                <tr>
                    <td style="width:300px;max-width:300px;">
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Expr1") %>' style="display: none;"></asp:Label>

                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imgPath") %>' style="width:300px;height:250px;max-width: 300px;  max-height: 300px;box-shadow:5px 5px 5px #ccc;" />
                    </td>
                    <td style="width:100px;max-width:100px;overflow-wrap:break-word;text-align:center;">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Customer/ViewArtDetails.aspx?Id=" + Eval("Id") %>'><%# Eval("name") %></asp:HyperLink>
                        
                    </td>
                    <td style="width:100px;max-width:100px;overflow-wrap:break-word">
                        <b>
                            <asp:Label runat="server" Text="RM "></asp:Label>
                            <asp:Label ID="lblPricehd" runat="server" Text='<%# Eval("price") %>'>
                            </asp:Label>
                        </b>
                    </td>
                    <td style="width:100px;max-width:100px;overflow-wrap:break-word">
                        <asp:Button ID="rmWishlist" runat="server" Text="Remove" CommandName="remove" />
                    </td>
                    </table>
        </ItemTemplate>
    </asp:DataList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
    
</asp:Content>
