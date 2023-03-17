
<%@ Page Language="C#" MasterPageFile="~/SeniorMaster.master" AutoEventWireup="true" 
CodeFile="TaskList_SE.aspx.cs" Inherits="TaskList_SE" Title="TaskList_SE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
        <div align="center"  >
            <table  cellspacing="10" width="100%">
               <tr>
                    <td >
                        <h1>New Task List</h1>
                    </td>
                </tr>
                <tr>
                    <td >
                      <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True"  width="100%"
                            AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging" 
                            onrowdatabound="GridView_RowDataBound">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                              <asp:BoundField DataField="Username" HeaderText="Username" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:BoundField DataField="LocationUrl" HeaderText="LocationUrl" />
                                <asp:BoundField DataField="EndDate" HeaderText="EndDate" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                 
                                 
                                <asp:TemplateField HeaderText="Update Status">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnEdit" runat="server" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="lnkbtnEdit_Command">In Progress</asp:LinkButton>
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
               <tr>
                    <td >
                        <h1>In Progress Task List</h1>
                    </td>
                </tr> 
                <tr>
                    <td >
                      <asp:GridView ID="GridViewInProgress" runat="server" AutoGenerateColumns="False" CellPadding="4"
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
                                 
                                 
                                <asp:TemplateField HeaderText="Update Status">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnInprogress" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="lbtnInprogress_Command">Task Completed</asp:LinkButton>
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
                 <tr>
                    <td >
                        <h1>Completed Task List</h1>
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
            </table>

            <asp:HiddenField ID="hf" runat="server" />
        </div>
    
</asp:Content>