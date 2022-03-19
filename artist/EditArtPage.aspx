<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditArtPage.aspx.cs" Inherits="WebApplication.artist.EditArtDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #art_image.hover {
            -ms-transform: scale(1.2); /* IE 9 */
            -webkit-transform: scale(1.2); /* Safari 3-8 */
            transform: scale(1.2);
        }
    </style>
    <script>
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to delete the art?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }

        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="1" style="margin:0px auto; border-collapse:collapse;">
        <tr>
                    <td style="width:40px;max-width:40px;overflow-wrap: break-word; text-align:center;">No.</td>
                    <td style="width:165px;max-width:165px;overflow-wrap: break-word; text-align:center;">Artwork Preview</td>
                    <td style="width:140px;max-width:140px;overflow-wrap: break-word; text-align:center;">Art Name</td>
                    <td style="width:150px;max-width:150px;overflow-wrap: break-word; text-align:center;">Art Price</td>
                    <td style="width:130px;max-width:130px;overflow-wrap: break-word; text-align:center;">Art Quantity</td>
                    <td style="width:270px;max-width:270px;overflow-wrap: break-word; text-align:center;">Art Description</td>
                    <td style="width:150px;max-width:150px;overflow-wrap: break-word; text-align:center;">Edit / Delete</td>
                </tr>    
        </table>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" style="margin:0px auto;" OnItemCommand="DataList1_ItemCommand">
        
        <ItemTemplate>
            <table border="1" style="border-collapse:collapse; box-shadow: 1px 1px;">    
                                        
                <tr style="margin: 0px auto;">
                    <td style="width:40px;max-width:40px;overflow-wrap: break-word;"><asp:Label ID="art_no" runat="server" Text="."></asp:Label></td>
                    <td style="width:165px;max-width:165px;overflow-wrap: break-word; text-align:center;">
                    <asp:Image ID="art_image" runat="server" src='<%# Eval("imgPath") %>' style="width:140px;max-width:140px;overflow-wrap: break-word;"/></td>
                    <td style="width:140px;max-width:140px;overflow-wrap: break-word;">
                        <asp:Label ID="art_name" runat="server" Text='<%# Eval("name") %>'></asp:Label></td>
                    <td style="width:150px;max-width:150px;overflow-wrap: break-word;">
                        <asp:Label ID="art_price" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </td>
                    <td style="width:130px;max-width:130px;overflow-wrap: break-word;">
                        <asp:Label ID="art_qty" runat="server" Text='<%# Eval("qty") %>'></asp:Label></td>
                    <td style="width:270px;max-width:270px;overflow-wrap: break-word;">
                        <asp:Label ID="art_description" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                    </td>
                    <td style="width:150px;max-width:150px;overflow-wrap: break-word;">
                        <asp:Button ID="button_art_edit" runat="server" Text="Edit" style="width:60px;height:40px;" CommandName="edit"/>     
                        <asp:Label runat="server" Text=" "></asp:Label>
                        <asp:Button ID="button_art_delete" runat="server" Text="Delete" style="width: 80px; height: 40px;"  OnClientClick="Confirm()" CommandName="delete" />
                        <asp:Label ID="lblId" runat="server" style="visibility:hidden;" Text='<%# Eval("Id") %>' ></asp:Label>                        
                               </td>
                </tr>
                 </table> 
            
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [art]"></asp:SqlDataSource>
</asp:Content>
