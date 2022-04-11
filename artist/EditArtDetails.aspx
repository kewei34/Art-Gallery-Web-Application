<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditArtDetails.aspx.cs" Inherits="WebApplication.artist.EditArtPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .noborder{
            background-color:ivory;
            border: black 2px solid;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center;">🌄Edit My Art</h1>
    <asp:Label ID="lblId" runat="server" Text="" style="visibility:hidden;"></asp:Label>
    <table border="1" style="border: black 2px solid;border-collapse:collapse; text-align:center;margin:0px auto;background-color:white;width:550px;">
        <tr class="noborder">
            <td><b><asp:Label runat="server" Text="Current Art Preview :"></asp:Label></b></td>
        </tr>
        <tr >
            <td>
                <asp:Image ID="art_image" alt="Art Image" style="width:200px;height:150px;" runat="server" /></td>
        </tr>
        <tr >
            <td><asp:FileUpload ID="art_image_upload" runat="server" accept=".png,.jpg,.jpeg" />
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="art_image_upload" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="<br />Please upload a photo!" CssClass="error" Font-Bold="True"></asp:RequiredFieldValidator>
               
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="<br />Only photo in jpeg, jpg and png is allowed." ControlToValidate="art_image_upload" CssClass="error" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG|)$" ValidationGroup="upload"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="noborder">
            <td><b><asp:Label runat="server" Text="Art Name: "></asp:Label></b></td>
        </tr>
        
        <tr >
            <td><asp:TextBox ID="art_name" MaxLength="99" style="width:300px;box-sizing: border-box; text-align:center;" runat="server"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="art_name" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="<br />Please enter your art name!" CssClass="error" Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="noborder">
            <td><b><asp:Label runat="server" Text="Art Price: " ></asp:Label></b></td>
        </tr>
        <tr >
            <td><asp:Label  runat="server" Text="RM: "></asp:Label> <asp:TextBox ID="art_price" runat="server" MaxLength="13"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="art_price" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="<br />Please enter your art price!" Font-Bold="True" CssClass="error"></asp:RequiredFieldValidator>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<br />Please enter decimal value for art price! <br/> Example: RM 99.99 " ControlToValidate="art_price" CssClass="error" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="\d{1,9}(?:[.,]\d{3})*(?:[.,]\d{2})" SetFocusOnError="True" ValidationGroup="upload"></asp:RegularExpressionValidator>
                
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="<br />Please enter price between RM1-RM1000000000." CssClass="error" MaximumValue="1000000000.00" MinimumValue="1.00" Type="Double" ValidationGroup="upload" ControlToValidate="art_price" Font-Bold="True" ForeColor="Red"></asp:RangeValidator></td>
        </tr>

        <tr class="noborder">
            <td><b><asp:Label runat="server" Text="Art Quantity: " ></asp:Label></b></td>
        </tr>
        <tr>
            <td><asp:TextBox ID="art_qty" style="width:300px;box-sizing: border-box;text-align:center;" runat="server" MaxLength="4"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="art_qty" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="<br />Please enter your art quantity!" Font-Bold="True"></asp:RequiredFieldValidator>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<br />Please enter integer for art quantity!" ControlToValidate="art_qty" CssClass="error" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="\d+" SetFocusOnError="True" ValidationGroup="upload"></asp:RegularExpressionValidator>
                
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="<br />Please enter value between 1 and 1000 only." CssClass="error" Font-Bold="True" ForeColor="Red" MaximumValue="1000" MinimumValue="1" ValidationGroup="upload" Type="Integer" ControlToValidate="art_qty"></asp:RangeValidator></td>
        </tr>

        <tr class="noborder">
            <td><b><asp:Label runat="server" Text="Art Description: "></asp:Label></b></td>
        </tr>
        <tr>
            <td><asp:TextBox ID="art_description" style="box-sizing: border-box;overflow-wrap: break-word;resize:none" runat="server" Font-Size="14pt" Height="286px" TextMode="MultiLine" Width="415px" MaxLength="500"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="art_description" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="<br />Please enter your art description!" Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    <table border="0" style="margin:0px auto;text-align:center;">
        <tr>
            <td><asp:Button ID="button_edit" runat="server" Text="Edit" style="width:80px;height:50px; margin-right:20px;" OnClick="button_edit_Click" ValidationGroup="upload"/>
                <asp:Button ID="button_back" runat="server" Text="Back"
                    style="width:80px;height:50px;" OnClick="button_back_Click" />

            </td>
            
        </tr>
    </table>
</asp:Content>
