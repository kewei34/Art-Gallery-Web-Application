<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="WebApplication.ManageAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        *{
            margin:0px auto; 
        }
        .title{
            background-color:ivory;
            border: black 2px solid;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center;">🧑My Profile👧</h1><br />
    <asp:Label ID="lblId" runat="server" Text="" style="visibility:hidden;"></asp:Label>
    <asp:Label ID="newR" runat="server" Text="" style="visibility:hidden;"></asp:Label>
    <table style="border-collapse:collapse; border: black 2px solid; text-align:center;margin:0px auto;width:700px;overflow-wrap:break-word; max-width:700px;background-color:white;">
               
        <tr class="title">
            <td><b><asp:Label runat="server" Text="User Name "></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td>
                <asp:Label ID="user_name" runat="server" Text=""></asp:Label>
                
                </td>
        </tr>
        <tr class="title">
            <td><b><asp:Label runat="server" Text="E-mail"></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td>
                <asp:Label ID="user_email" runat="server" ></asp:Label>
                </td>
        </tr>
         <tr class="title">
            <td><b><asp:Label runat="server" Text="Name"></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td>
                <asp:TextBox ID="user_realname" runat="server" style="text-align:center;"></asp:TextBox>
                <asp:Button ID="editRealname" runat="server" Text="Update" ValidationGroup="realname_edit" OnClick="editRealname_Click"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<br /> Please enter your name！" ControlToValidate="user_realname" ValidationGroup="realname_edit" CssClass="error" Display="Dynamic" Font-Bold="True" EnableTheming="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<br/> Please enter alphabets only!" ControlToValidate="user_realname" CssClass="error" Font-Bold="True" ForeColor="Red" ValidationGroup="realname_edit" Display="Dynamic" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s'/]+$"></asp:RegularExpressionValidator>
                </td>
        </tr>
         <tr class="title">
            <td><b><asp:Label runat="server" Text="Gender"></asp:Label></b></td>
        </tr>
        <tr id="gender_row_none" style="border:outset;" >
            <td >                
                <asp:RadioButtonList ID="user_gender" runat="server" style="text-align:center; width:100%;">
                    <asp:ListItem Value="M">Male 👨</asp:ListItem>
                    <asp:ListItem Value="F">Female 👧</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="editGender" runat="server" Text="Update" ValidationGroup="gender_edit" />            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="&lt;br/&gt; Please choose your gender!" ControlToValidate="user_gender" CssClass="error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="gender_edit" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>    
               
                </td>
        </tr>
        <tr id="gender_row_with_value" style="border:outset;" >
            <td >  
                <asp:Label ID="gender_value" runat="server" Text="Male 👨"></asp:Label>               
               
                </td>
        </tr>

        <tr class="title">
            <td><b><asp:Label runat="server" Text="Address"></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td>
                <asp:TextBox ID="user_address" runat="server" style="box-sizing: border-box;overflow-wrap: break-word;resize:none" Font-Size="14pt" Height="146px" TextMode="MultiLine" Width="415px"></asp:TextBox><br />
                <asp:Button ID="editAddress" runat="server" Text="Update" ValidationGroup="editAddress" OnClick="editAddress_Click" /><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please dont leave the address blank!" ControlToValidate="user_address" CssClass="error" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationGroup="editAddress"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<br/>The symbols allowed for address is &quot;#  -  ' / ,&quot; only" ControlToValidate="user_address" CssClass="error" Font-Bold="True" ForeColor="Red" ValidationGroup="realname_edit" Display="Dynamic" SetFocusOnError="True" ValidationExpression="[0-9a-zA-Z #,-/']+"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr class="title">
            <td><b><asp:Label runat="server" Text="Password "></asp:Label></b></td>
        </tr>
        <tr style="border:outset;">
            <td><asp:ChangePassword ID="ChangePassword1" runat="server" ContinueButtonText="Back To Hompage" ContinueDestinationPageUrl="~/homepage.aspx"></asp:ChangePassword></td>
        </tr>
  
        
    </table>
    <br />
    
    
</asp:Content>