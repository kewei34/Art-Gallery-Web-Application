<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApplication.Customer.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 style="text-align:center;">💹Payment</h1>
    <br />
    <div style="text-align:center;font-size:40px;">
       <b><asp:Label ID="payment_status_label" runat="server" Text="Your payment is successful ! "> </asp:Label></b>
        <br />
        <div style="padding:30px">

<asp:Button ID="Button1" runat="server" Text="Back To Homepage" OnClick="Button1_Click" style="font-weight:600;padding:8px;" />
        </div>
        
    </div>
</asp:Content>
