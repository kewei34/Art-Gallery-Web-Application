<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication.Customer.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <h1 style="text-align:center;">💵Checkout</h1>
    <table border="1" style="border-collapse:collapse; margin:0px auto;border: black 2px solid;padding:20px;background-color:ivory; ">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text=" Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="name1" runat="server" Width="437px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Address :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="address1" runat="server" Height="208px" Width="444px" TextMode="MultiLine" style="resize:none" Font-Size="14pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               <b>Total to Pay : </b>
            </td>
            <td style="font-weight:600;">
            <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align:center;">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-weight:600;padding:5px;"  Text="Pay Now" />
            </td>
        </tr>
    </table>
    <br />
    


</asp:Content>
