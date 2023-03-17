
<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" 
CodeFile="UserTaskStatus.aspx.cs" Inherits="UserTaskStatus" Title="UserTaskStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
        <div align="center"  >
            <table  cellspacing="10" width="100%">
               
                 <tr>
                    <td >
                        <h1>Task List</h1>
                    </td>
                </tr> 
                <tr>
                    <td >
                      <asp:GridView ID="GridViewCompleted" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True"  width="100%"
                            AllowSorting="True" >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                              <asp:BoundField DataField="Username" HeaderText="Username" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:BoundField DataField="LocationUrl" HeaderText="LocationUrl" />
                                <asp:BoundField DataField="EndDate" HeaderText="EndDate" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                               
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