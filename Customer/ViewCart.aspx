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

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
        <HeaderTemplate>

        </HeaderTemplate>
        <ItemTemplate>
            <table id="cart">
                <tr>
                    <td>
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' style="display: none;"></asp:Label>
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
                        <%# Eval("qty") %>
                    </td>
                    <td>
                        <asp:Label ID="lblTotal" runat="server" Text='<%#(calculateTotal((Eval("price")).ToString(), (Eval("qty")).ToString())) %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="del" runat="server" Text="Remove" CommandName="del" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>

    <div style="text-align:center;margin:0 auto">
    <asp:Label ID="Label1" runat="server" ></asp:Label>
</div>
  <div style="text-align:right;padding:20px">
      Total : <asp:Label ID="lblCartTotal" runat="server"></asp:Label>
      <br />

  </div>
    <div style="padding:30px;text-align:right;">
        <asp:Button ID="checkout" runat="server" Text="Checkout" OnClick="checkout_Click" />
    </div>
     
  

    
    </asp:Content>
