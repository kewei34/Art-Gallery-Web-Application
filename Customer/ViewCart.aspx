<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="WebApplication.Customer.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
        #cart td{
            border: black 2px solid;
            padding : 10px 20px;
            
        }
        #cart{
            border-collapse:collapse;
            margin-bottom:-22px;
            background-color:white;
        }
        #cart2 td{
            border: black 2px solid;
            padding : 10px 20px;
        }
        #cart2{
            border-collapse:collapse;
            margin-bottom:-22px;
            background-color:ivory;
        }
    </style>

</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1 style="text-align:center;">🛍️My Cart</h1>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" style="margin:0px auto; background-color:antiquewhite;">

        <HeaderTemplate>
            <table id="cart2">
                <tr style="font-weight:bold;">
                    <td style="width:300px;max-width:300px;overflow-wrap: break-word; text-align:center;">Artwork Preview</td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">Art Name</td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">Art Price</td>
                    <td style="width:90px;max-width:90px;overflow-wrap: break-word; text-align:center;">Art Quantity</td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">Total Amount</td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">Remove From Cart</td>
                    
                </tr>
                </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table id="cart">              
                <tr>
                    <td style="width:300px;max-width:300px;overflow-wrap: break-word; text-align:center;">
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' style="display: none;"></asp:Label>
                         <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Customer/ViewArtDetails.aspx?Id=" + Eval("artId") %>'>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imgPath") %>' style="width:300px;max-width: 300px;  height:250px;max-height: 250px;box-shadow:5px 5px 5px #ccc;" /></asp:HyperLink>
                    </td>
                    <td style="width:100px;max-width:100px;max-height: 250px;overflow-wrap: break-word; text-align:center;"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Customer/ViewArtDetails.aspx?Id=" + Eval("artId") %>'>
                        <b><%# Eval("name") %> </b></asp:HyperLink>
                    </td>
                    <td style="width:100px;max-width:100px;max-height: 250px;overflow-wrap: break-word; text-align:center;">
                        <b>
                            <asp:Label runat="server" Text="RM "></asp:Label>
                            <asp:Label ID="lblPricehd" runat="server" Text='<%# Eval("price") %>'>
                            </asp:Label>
                        </b>
                    </td>
                    <td style="width:90px;max-width:90px;max-height: 250px;overflow-wrap: break-word; text-align:center;">
                        <b><%# Eval("qty") %></b>
                    </td>
                    <td style="width:100px;max-width:100px;max-height: 250px;overflow-wrap: break-word; text-align:center;">
                        <b> <asp:Label ID="lblTotal" runat="server" Text='<%#(calculateTotal((Eval("price")).ToString(), (Eval("qty")).ToString())) %>'></asp:Label></b>
                    </td>
                    <td style="width:100px;max-width:100px;overflow-wrap: break-word; text-align:center;">
                        <b><asp:Button ID="del" runat="server" Text="Remove" style="font-weight:600;" CommandName="del" /></b>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>


    <div style="text-align:center;margin:0 auto; margin-top:50px;">
    <asp:Label ID="Label1" runat="server" ></asp:Label>
</div>
  <div style="text-align:right;padding:100px;font-weight:bold;margin-top:-50px;">
      <span style="font-size:30px;"><asp:Label ID="showTotal" runat="server" Text="Total : RM"></asp:Label>
      <asp:Label ID="lblCartTotal" style="visibility:visible;" runat="server"></asp:Label>
      <br /></span>

      <div style="padding:10px;text-align:right;">
        <asp:Button ID="checkout" runat="server" Text="Checkout" OnClick="checkout_Click" style="width:160px;font-weight:bold;"/>
    </div>

  </div>
    
     
  

    
    </asp:Content>
