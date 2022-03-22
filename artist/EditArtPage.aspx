<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditArtPage.aspx.cs" Inherits="WebApplication.artist.EditArtDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #table1 td{
            border: black 2px solid;
            padding : 10px 20px;
            
        }
        #table1{
            border-collapse:collapse;
            margin:0px auto;
            margin-bottom:-22px;
            background-color:white;
        }
        #table2 td{
            border: black 2px solid;
            padding : 10px 20px;
        }
        #table2{
            border-collapse:collapse;
            background-color:ivory;
            margin:0px auto;
            margin-bottom:-22px;
            border-collapse:collapse;
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
    <div style="text-align:right;margin: 50px auto;width:95%">
        <asp:Button ID="addArtBtn" runat="server" Text="Add New Art" OnClick="addArtBtn_Click" />
    </div>
    
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" style="margin:0px auto;" OnItemCommand="DataList1_ItemCommand">
        <HeaderTemplate>
            <table id="table2" >
        <tr>
                    
                    <td style="width:165px;max-width:165px;overflow-wrap: break-word; text-align:center;">Artwork Preview</td>
                    <td style="width:140px;max-width:140px;overflow-wrap: break-word; text-align:center;">Art Name</td>
                    <td style="width:150px;max-width:150px;overflow-wrap: break-word; text-align:center;">Art Price</td>
                    <td style="width:130px;max-width:130px;overflow-wrap: break-word; text-align:center;">Art Quantity</td>
                    <td style="width:270px;max-width:270px;overflow-wrap: break-word; text-align:center;">Art Description</td>
                    <td style="width:150px;max-width:150px;overflow-wrap: break-word; text-align:center;">Edit / Delete</td>
                </tr>    
        </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table id="table1" >    
                                        
                <tr >
                   
                    <td style="width:165px;max-width:165px;overflow-wrap: break-word; text-align:center;">
                    <asp:Image ID="art_image" runat="server" src='<%# Eval("imgPath") %>' style="width:160px;max-width:160px;padding:0px;"/></td>
                    <td style="width:140px;max-width:140px;overflow-wrap: break-word;text-align:center">
                        <asp:Label ID="art_name" runat="server" Text='<%# Eval("name") %>'></asp:Label></td>
                    <td style="width:150px;max-width:150px;overflow-wrap: break-word;text-align:center">
                        <asp:Label runat="server" Text="RM "></asp:Label>
                        <asp:Label ID="art_price" runat="server" Text='<%# Eval("price") %>' style="text-align:center;"></asp:Label>
                    </td>
                    <td style="width:130px;max-width:130px;overflow-wrap: break-word;text-align:center;">
                        <asp:Label ID="art_qty" runat="server" Text='<%# Eval("qty") %>'></asp:Label></td>
                    <td style="width:270px;max-width:270px;overflow-wrap: break-word;">
                        <asp:Label ID="art_description" runat="server" style="width:270px;max-width:270px;overflow-wrap: break-word;" Text='<%# Eval("description") %>'></asp:Label>
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
