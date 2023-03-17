<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="RegistrationDetails.aspx.cs" 
Inherits="RegistrationDetails" Title="Registration Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <table width="100%">    
                <tr>
                    <td colspan="3" >
                        <asp:GridView ID="GvRegistrationDetails"  runat="server" AutoGenerateColumns="False" CellPadding="4" Width="100%"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("ImagePath") %>'
                                            Width="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                <asp:BoundField DataField="Initial" HeaderText="Initial" />
                                       <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="EmailId" HeaderText="EmailId" />
                                       <asp:BoundField DataField="Address" HeaderText="Address" />
                                
                                       <asp:BoundField DataField="UserName" HeaderText="UserName" />
                                <asp:BoundField DataField="Password" HeaderText="Password" />
                                 
                                <%--<asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnEdit" runat="server" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="lnkbtnEdit_Command">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="lnkbtnDelete_Command">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        
    <div align="center" style= "width:1300px; " >
          
            
            <asp:HiddenField ID="hf" runat="server" />
        </div>
    
</asp:Content>

