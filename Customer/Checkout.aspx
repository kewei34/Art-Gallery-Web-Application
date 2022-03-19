<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication.Customer.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text=" Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="437px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Address :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="208px" Width="444px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               <b>Total to Pay : </b>
            </td>
            <td>
            <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align:center;">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Pay Now" />
            </td>
        </tr>
    </table>
    


</asp:Content>
