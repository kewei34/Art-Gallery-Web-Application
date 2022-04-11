<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="WebApplication.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" AllowPaging="True" style="margin:0 auto;width:1200px">
        <Columns>
            <asp:BoundField DataField="orderId" HeaderText="orderId" SortExpression="orderId" />
            <asp:BoundField DataField="date" HeaderText="Order Date" />
            <asp:ImageField DataImageUrlField="imgPath" HeaderText="Image" ControlStyle-Width="200px">
<ControlStyle Width="200px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="artName" HeaderText="artName" SortExpression="artName" />
            <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
            <asp:BoundField DataField="artPrice" HeaderText="artPrice" SortExpression="artPrice" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
</asp:Content>
