<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApplication.Customer.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 style="text-align:center;">💹Payment</h1>
    <br />
    <div style="text-align:center;font-size:40px;">
       <asp:Label ID="payment_status_label" runat="server" Text="Your payment is successful !<br /> Your order summary had been sent to your email."> </asp:Label>
        <br />

        <h3>
            <asp:Label ID="orderidlbl" runat="server" Text="Label"></asp:Label>
        </h3>

        <div style="padding:30px;text-align:center">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="margin:0 auto;width:1200px">
                <Columns>
                    <asp:ImageField DataImageUrlField="imgPath" HeaderText="Image"><ControlStyle Width="200px"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="artName" HeaderText="artName" SortExpression="artName" />
                    <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                    <asp:BoundField DataField="artPrice" HeaderText="artPrice" SortExpression="artPrice" />
                    <asp:TemplateField HeaderText="Total">
                       
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"><%# Convert.ToInt32(Eval("artPrice"))*Convert.ToDecimal(Eval("qty"))%></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [orderDetail] WHERE ([orderId] = @orderId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="orderId" QueryStringField="orderId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br /><br />
<asp:Button ID="Button1" runat="server" Text="Back To Homepage" OnClick="Button1_Click" style="font-weight:600;padding:8px;" />

        </div>
        
    </div>
</asp:Content>
