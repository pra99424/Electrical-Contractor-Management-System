
<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" 
CodeFile="IncomeExpence.aspx.cs" Inherits="IncomeExpence" Title="IncomeExpence" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script>

    $(function () {
        $('#<%=txtPaymentDate.ClientID %>').keypress(function (event) { event.preventDefault(); });
        //$('#<%=txtPaymentDate.ClientID %>').keypress(function (event) { event.preventDefault(); });


        $('#<%=txtPaymentDate.ClientID %>').datepicker({ dateFormat: 'yy-mm-dd' });
        //$('#<%=txtPaymentDate.ClientID %>').datepicker({ dateFormat: 'yy-mm-dd' });
    });
</script>

    
        <div align="center"  >
            <table  cellspacing="10" width="100%">
                <tr>
                    <td colspan="2">
                    <h1>Income & Expence</h1>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label2" runat="server" Text="Payment Type"></asp:Label></td>
                    <td >
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Income</asp:ListItem>
                            <asp:ListItem>Expence</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblCategories" runat="server" Text="Amount"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtAmount" runat="server" Width="230px"></asp:TextBox></td>
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
                <tr>
                    <td >
                        <asp:Label ID="LblDescription" runat="server" Text="Description"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="260px" Height="75px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>
               <%-- <tr>
                    <td >
                        <asp:Label ID="Label3" runat="server" Visible="false" Text="File Location"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="TextBox2" runat="server" Visible="false" TextMode="MultiLine" Width="260px" Height="75px"></asp:TextBox></td>
                    <td >
                        </td>
                </tr>--%>
                <tr>
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="Payment Date"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="txtPaymentDate" runat="server" Width="230px"></asp:TextBox></td>
                    <td >
                    </td>
                </tr>
                
                <tr>
                    <td style=" height: 62px;" colspan="3">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Height="30px" OnClick="btnSave_Click" Width="150px" ValidationGroup="g" />
                        <asp:Button ID="btnClear" runat="server" Height="30px" OnClick="btnClear_Click" Text="Clear"
                            Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" >
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" 
                            AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging" 
                            onrowdatabound="GridView_RowDataBound" Width="100%">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="Name" />
                                 <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                 <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" />
                                 
                                 
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