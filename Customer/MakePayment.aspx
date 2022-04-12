<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MakePayment.aspx.cs" Inherits="WebApplication.Customer.MakePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
      <style type="text/css">
        .auto-style1 {
            width: 506px;
            font-weight: bold;
            text-align: center;
        }

        .auto-style2 {
            width: 506px;
            height: 47px;
            border: outset;
            text-align: center;
        }

        .button {
            width: 80px;
            height: 50px;
            text-align: center;
        }

        .specialtr {
            background-color: ivory;
            border: black 2px solid;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 style="text-align: center;">💳Credit/Debit Card Payment</h1>

    <table border="1" style="border: black 2px solid; border-collapse: collapse; text-align: center; margin: 0px auto; background-color: white;">
        <tr>
            <td class="auto-style1">Total to Pay</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Credit Card No.</td>

        </tr>
        <tr>
            <td class="auto-style1">
                <asp:TextBox ID="credit_card_no" runat="server" MaxLength="16" style="text-align:center;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="credit_card_no" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="&lt;br /&gt;Please enter your credit/debit card no.!" Font-Bold="True"></asp:RequiredFieldValidator>
               
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="&lt;br&gt;Please enter digits only and <br> the first digit must be more than 0" CssClass="error" Display="Dynamic" EnableClientScript="True" Font-Bold="True" SetFocusOnError="True" ValidationGroup="upload" ValidationExpression="^[1-9][0-9]{15}$" ControlToValidate="credit_card_no"></asp:RegularExpressionValidator>
            </td>


        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Expiry Date</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="expiry_date" runat="server" MaxLength="2" style="text-align:center; width:70px;"></asp:TextBox> /
                <asp:TextBox ID="expiry_date2" runat="server" MaxLength="2" style="text-align:center;width:70px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="expiry_date" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="&lt;br /&gt;Please enter the month!" Font-Bold="True" CssClass="error"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="expiry_date" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="&lt;br /&gt;Please enter the year!" Font-Bold="True" CssClass="error"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="<br> Please enter value between 1-12 for month" CssClass="error" ControlToValidate="expiry_date" Display="Dynamic" Font-Bold="True" MinimumValue="1" MaximumValue="12" ValidationGroup="upload" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="<br> Please enter value between 22-29 for year" CssClass="error" ControlToValidate="expiry_date2" Display="Dynamic" Font-Bold="True" MinimumValue="22" MaximumValue="29" ValidationGroup="upload" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                
                
        </tr>
        <tr class="specialtr">
            <td class="auto-style1">CVV</td></tr>
            <tr><td><asp:TextBox ID="cvv" runat="server" MaxLength="3" style="text-align:center;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cvv" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="<br>Please enter the CVV!" Font-Bold="True" CssClass="error"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="<br> Please enter integer only!" CssClass="error" ControlToValidate="cvv" Display="Dynamic" Font-Bold="True" MinimumValue="100" MaximumValue="999" ValidationGroup="upload" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>

                </td></tr>
        
        <tr>
            <td style="text-align: center">
                <asp:Button ID="button_submit_art" runat="server" Style="width: 100px; height: 50px; text-align: center; font-weight: bold;" Text="Submit" ValidationGroup="upload" OnClick="button_submit_art_Click" /></td>
        </tr>
    </table>
</asp:Content>
