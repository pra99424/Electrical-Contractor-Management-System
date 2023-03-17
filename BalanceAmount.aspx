
<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" 
CodeFile="BalanceAmount.aspx.cs" Inherits="BalanceAmount" Title="BalanceAmount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--<script>

    $(function () {
        $('#<%=txtPaymentDate.ClientID %>').keypress(function (event) { event.preventDefault(); });
        //$('#<%=txtPaymentDate.ClientID %>').keypress(function (event) { event.preventDefault(); });


        $('#<%=txtPaymentDate.ClientID %>').datepicker({ dateFormat: 'yy-mm-dd' });
        //$('#<%=txtPaymentDate.ClientID %>').datepicker({ dateFormat: 'yy-mm-dd' });
    });
</script>--%>

    
        <div align="center"  >
            <table  cellspacing="10" width="100%">
                <tr>
                    <td colspan="2">
                    <h1>View Balance Amount</h1>
                    </td>
                </tr>
<%--                <tr>
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
                </tr>--%>
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
                        <td><h1>Balance Amount(Rs.) :
                        <asp:Label ID="lblBalanceAmount" runat="server"  ></asp:Label></h1></td>
                    <td>
                   
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hf" runat="server" />
        </div>
    
</asp:Content>