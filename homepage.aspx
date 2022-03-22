<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
        .table1 tr, .table td{
            background-color:white;
            /*background-image:url("css_image/flower_bg.jpg");*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center;">🎨Welcome To Our Art Gallery🖼️</h1>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="0" RepeatColumns="3" style="margin:0 auto; background-color:antiquewhite;" >
        <ItemTemplate>
            <div style="padding:10px;justify-content:center">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Customer/ViewArtDetails.aspx?Id=" + Eval("Id") %>' >
                <table class ="table1" style="text-align:center;outline:solid black 2px;height:450px;max-height:450px;">
                    <tr>
                        <td style="width:350px;height:350px;background-color:ivory;"> 
                            
                           <asp:Image ID="Image1" runat="server" style="width:300px; height:250px;max-width:300px;max-height:250px;box-shadow:5px 5px 5px #ccc;" src='<%# Eval("imgPath") %>' />
                        </td>
                        <tr>
                           <td style="max-width:300px;height:140px; max-height:140px;overflow-wrap: break-word;background-color:ivory;">
                               <p style="margin-top:-20px;font-family:Arial, Helvetica, sans-serif">
                           <b><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Customer/ViewArtDetails.aspx?Id=" + Eval("Id") %>' ><%# Eval("name") %>
                               </asp:HyperLink>
                            </b></p>
                         </td>
                        </tr>
                        <tr>
                            <td style="background-color:ivory;">
                            <p style="margin-top:-10px;font-weight:bold;">
                                RM <%# Eval("price") %>
                            </p>
                        </td>
                        </tr>              
                    </tr>
                </table></asp:HyperLink>
            </div>
        </ItemTemplate>
       
        
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [imgPath], [price], [qty], [Id] FROM [art]"></asp:SqlDataSource>
</asp:Content>
