
<%@ Page Language="C#" MasterPageFile="~/JuniorMaster.master" AutoEventWireup="true" 
CodeFile="AddTaskElement.aspx.cs" Inherits="AddTaskElement" Title="Add Task Element" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
        


    
        <div align="center"  >
            <table  cellspacing="10" >
                
                <tr>
                    <td colspan="3">
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True"  width="100%" 
                            AllowSorting="True"  >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                              <asp:BoundField DataField="Username" HeaderText="Username" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:BoundField DataField="LocationUrl" HeaderText="LocationUrl" />
                                <asp:BoundField DataField="EndDate" HeaderText="EndDate" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                 
                                 
                                <asp:TemplateField HeaderText="Add Task Element">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnEditTaskElement" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="lbtnEditTaskElement_Command" >Add Element</asp:LinkButton>
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
                    <td colspan="3">
                        <h1>Adding Task Element</h1>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblCategories0" runat="server" Text="Task Id"></asp:Label></td>
                    <td >
                        <asp:Label ID="lblTaskId" runat="server"></asp:Label></td>
                    <td >
                        &nbsp;</td>
                </tr>
               
                <tr>
                    <td >
                        <asp:Label ID="lblCategories" runat="server" Text="Name Of Component"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtNameOfComponent" runat="server" Width="230px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label2" runat="server" Text="Quantity"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtQuantity" runat="server" Width="230px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label3" runat="server" Text="Specification"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtSpecification" runat="server" Width="230px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>
                <%--<tr>
                    <td >
                        <asp:Label ID="Label4" Visible="false" runat="server" Text="Priority"></asp:Label></td>
                    <td >
                        <asp:DropDownList Visible="false" ID="DropDownList1" runat="server">
                            <asp:ListItem>high</asp:ListItem>
                            <asp:ListItem>medium</asp:ListItem>
                            <asp:ListItem>low</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                    <td >
                        </td>
                </tr>--%>
                 <%--<tr>
                    <td >
                        <asp:Label ID="Label2" runat="server" Visible="false" Text="Important Notes"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="TextBox1" Visible="false" runat="server" TextMode="MultiLine" Width="230px"></asp:TextBox></td>
                    <td >
                    </td>
                </tr>--%>
               <%-- <tr>
                    <td >
                        <asp:Label ID="Label3" runat="server" Visible="false" Text="File Location"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="TextBox2" runat="server" Visible="false" TextMode="MultiLine" Width="260px" Height="75px"></asp:TextBox></td>
                    <td >
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
                    <td colspan="3" >
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" width="100%"
                            AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging" 
                            onrowdatabound="GridView_RowDataBound">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                              <asp:BoundField DataField="NameOfComponent" HeaderText="NameOfComponent" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Specification" HeaderText="Specification" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" />
                                <asp:BoundField DataField="TaskId" HeaderText="TaskId" />
                                 
                                 
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
            <asp:HiddenField ID="hfTaskId" runat="server" />
        </div>
    
        
    
</asp:Content>