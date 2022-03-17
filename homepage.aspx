<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" BorderStyle="Groove" CellPadding="0" RepeatColumns="3">
        <ItemTemplate>
            <div>
                <table style="text-align:center;padding:10px">
                    <tr>
                        <td> 
                           <asp:Image ID="Image1" runat="server" style="max-width:300px;max-height:300px" src='<%# Eval("imgPath") %>' />
                        </td>
                        <tr>
                           <td>
                            <b>
                               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ViewArtDetails.aspx?Id=" + Eval("Id") %>'><%# Eval("name") %>
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
