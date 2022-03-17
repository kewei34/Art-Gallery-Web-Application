<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApplication.Customer.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table><tr><td>
        <asp:Label ID="payment_status_label" runat="server" Text="Your payment is sucessful. Ridirecting you back to homepage now..."></asp:Label></td></tr></table>
</asp:Content>
