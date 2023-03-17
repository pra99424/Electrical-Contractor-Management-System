
<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" 
CodeFile="UserTaskElement.aspx.cs" Inherits="UserTaskElement" Title="UserTaskElement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
        <div align="center"  >
            <table  cellspacing="10" width="100%">
               
                 <tr>
                    <td >
                        <h1>User Task Element</h1>
                    </td>
                </tr> 
                <tr>
                    <td >
                      <asp:GridView ID="GridViewCompleted" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True"  width="100%"
                            AllowSorting="True" >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                             <asp:BoundField DataField="NameOfComponent" HeaderText="NameOfComponent" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Specification" HeaderText="Specification" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" />
                                <asp:BoundField DataField="TaskId" HeaderText="TaskId" />
                               <asp:TemplateField HeaderText="Pay">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnEdit" runat="server" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="lnkbtnEdit_Command">Pay</asp:LinkButton>
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
           

            <asp:HiddenField ID="hf" runat="server" />
        </div>
    
</asp:Content>