<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UploadArtPage.aspx.cs" Inherits="WebApplication.artist.UploadArtPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 506px;
            font-weight:bold;
            text-align:center;
        }
        .auto-style2 {
            width: 506px;
            height: 47px;
            border:outset;
            text-align:center;
        }

        .button{
            width:80px;
            height:50px; 
            text-align:center;
        }
        .specialtr{
            background-color:ivory;
            border: black 2px solid;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 style="text-align:center;">🖌️Upload New Art</h1>
    
    <table border="1" style="border: black 2px solid;border-collapse:collapse; text-align:center;margin:0px auto;background-color:white;">
        <tr class="specialtr">
            <td class="auto-style1">Art Image </td>            
        </tr>
        <tr>
            <td style="margin-left: 80px" class="auto-style1"><asp:FileUpload ID="art_image_upload" runat="server" accept=".png,.jpg,.jpeg" /><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="art_image_upload" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="Please upload a photo!"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Only photo in jpeg, jpg and png is allowed." ControlToValidate="art_image_upload" CssClass="error" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG|)$" ValidationGroup="upload"></asp:RegularExpressionValidator></td>            
        </tr>
           
        <tr class="specialtr">
            <td class="auto-style1">Art Name</td>
            
        </tr>
        <tr>
            <td class="auto-style1"><asp:TextBox ID="art_name" runat="server" MaxLength="99"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="art_name" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="Please enter your art name!"></asp:RequiredFieldValidator>  </td>
            

        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Art Price</td>
        </tr>
        <tr>
            <td class="auto-style2"><asp:Label  runat="server" Text="RM: "></asp:Label><asp:TextBox ID="art_price" runat="server" MaxLength="13"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="art_price" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="Please enter your art price!" Font-Bold="True" CssClass="error"></asp:RequiredFieldValidator><br /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter decimal value for art price! &lt;br/&gt; Example: RM99.99" ControlToValidate="art_price" CssClass="error" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="\d{1,9}(?:[.,]\d{3})*(?:[.,]\d{2})" SetFocusOnError="True" ValidationGroup="upload"></asp:RegularExpressionValidator><br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please enter price between RM1-RM1000000000." CssClass="error" MaximumValue="1000000000.00" MinimumValue="1.00" Type="Double" ValidationGroup="upload" ControlToValidate="art_price" Font-Bold="True" ForeColor="Red"></asp:RangeValidator></td>
        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Art Quantity</td>
        </tr>
        <tr >
            <td class="auto-style2"><asp:TextBox ID="art_quantity" runat="server" MaxLength="4" OnTextChanged="art_quantity_TextChanged"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="art_quantity" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="Please enter your art quantity!" Font-Bold="True"></asp:RequiredFieldValidator><br /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter integer for art quantity!" ControlToValidate="art_quantity" CssClass="error" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="\d+" SetFocusOnError="True" ValidationGroup="upload"></asp:RegularExpressionValidator><br /><asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Please enter value between 1 and 1000 only." CssClass="error" Font-Bold="True" ForeColor="Red" MaximumValue="1000" MinimumValue="1" ValidationGroup="upload" Type="Integer" ControlToValidate="art_quantity"></asp:RangeValidator>
                 <asp:Label ID="art_quantity_warning_text" runat="server" Text=""><br /></asp:Label>

            </td>  
        </tr>
        <tr class="specialtr">
            <td class="auto-style1">Art Description</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="art_desc" runat="server" Height="300px" Width="600px" Font-Size="14pt" TextMode="MultiLine" style="resize:none"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="art_desc" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="upload" ErrorMessage="Please enter your art description!" Font-Bold="True"></asp:RequiredFieldValidator>
            </td>
            
        </tr>      
        
        <tr>
            <td style="text-align:center">
                <asp:Button ID="button_submit_art" runat="server" style="width:100px;height:50px;text-align:center;font-weight:bold;" Text="Submit" OnClick="button_submit_art_Click"  ValidationGroup="upload" /></td>
        </tr>
    </table>
        
</asp:Content>
