
<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" 
CodeFile="AddTask.aspx.cs" Inherits="AddTask" Title="Add Task" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
        <div align="center"  >
            <table  cellspacing="10" >
                <tr>
                    <td colspan="2">
                        <h1>Adding Task</h1>
                    </td>
                </tr>
                
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:DropDownList ID="cboCategory" runat="server">
                            
                            <asp:ListItem>Servicing</asp:ListItem>
                            <asp:ListItem>Reconstructing</asp:ListItem>
                            <asp:ListItem>Repairing</asp:ListItem>
                            <asp:ListItem>Constructing</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                             
                        </asp:DropDownList></td>
                    <td style="width: 100px">
                        </td>
                </tr>
               
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lblCategories" runat="server" Text="Location Url"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtLocationUrl" runat="server" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label2" runat="server" Text="End Date"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtEndDate" runat="server" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtAddress" runat="server" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>
                <%--<tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label4" Visible="false" runat="server" Text="Priority"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:DropDownList Visible="false" ID="DropDownList1" runat="server">
                            <asp:ListItem>high</asp:ListItem>
                            <asp:ListItem>medium</asp:ListItem>
                            <asp:ListItem>low</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                    <td style="width: 100px">
                        </td>
                </tr>--%>
                 <%--<tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label2" runat="server" Visible="false" Text="Important Notes"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox1" Visible="false" runat="server" TextMode="MultiLine" Width="230px"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>--%>
               <%-- <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label3" runat="server" Visible="false" Text="File Location"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox2" runat="server" Visible="false" TextMode="MultiLine" Width="260px" Height="75px"></asp:TextBox></td>
                    <td style="width: 100px">
                        </td>
                </tr>--%>
                
                <tr>
                    <td style="width: 100px; height: 62px;" colspan="3">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Height="30px" OnClick="btnSave_Click" Width="150px" ValidationGroup="g" />
                        <asp:Button ID="btnClear" runat="server" Height="30px" OnClick="btnClear_Click" Text="Clear"
                            Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="width: 100px">
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" 
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
                                 
                                 
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnEdit" runat="server" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="lnkbtnEdit_Command">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
            <asp:HiddenField ID="hf" runat="server" />
        </div>
    
</asp:Content>