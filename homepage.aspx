<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="0" RepeatColumns="3" style="margin:0 auto" >
        <ItemTemplate>
            <div style="padding:10px;justify-content:center">
                <table style="text-align:center;padding:10px;outline:solid black 1px;height:600px;">
                    <tr>
                        <td style="width:350px;height:350px"> 
                           <asp:Image ID="Image1" runat="server" style="max-width:300px;max-height:300px" src='<%# Eval("imgPath") %>' />
                        </td>
                        <tr>
                           <td style="max-width:300px;overflow-wrap: break-word;">
                            <b>
                               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Customer/ViewArtDetails.aspx?Id=" + Eval("Id") %>'><%# Eval("name") %>
                               </asp:HyperLink>
                            </b>
                         </td>
                        </tr>
                        <tr>
                            <td>
                            <p>
                                RM <%# Eval("price") %>
                            </p>
                        </td>
                        </tr>              
                    </tr>
                </table>
            </div>
        </ItemTemplate>
       
        
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [imgPath], [price], [qty], [Id] FROM [art]"></asp:SqlDataSource>
</asp:Content>
